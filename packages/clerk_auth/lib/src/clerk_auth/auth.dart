import 'dart:async';
import 'dart:io';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_api/telemetry.dart';
import 'package:clerk_auth/src/clerk_auth/auth_config.dart';
import 'package:clerk_auth/src/clerk_auth/auth_error.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/clerk_constants.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/models.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

/// [Auth] provides more abstracted access to the Clerk API.
///
/// [config]: SDK Configuration containing your publishable key.
///
/// [persistor]: an instance of a [Persistor] which will keep track of
/// tokens and expiry etc between app activations
///
/// [httpService]: an instance of [HttpService] to manage low-level
/// communications with the back end. Injected for e.g. test mocking
///
class Auth {
  /// Create an [Auth] object using appropriate Clerk credentials
  Auth({
    required this.config,
    Persistor persistor = Persistor.none,
    HttpService httpService = const DefaultHttpService(),
  })  : telemetry = Telemetry(
          config: config,
          persistor: persistor,
          httpService: httpService,
        ),
        _api = Api(
          config: config,
          persistor: persistor,
          httpService: httpService,
        );

  /// Use 'English' as the default locale
  static List<String> defaultLocalesLookup() => <String>['en'];

  /// The service to send telemetry to the back end
  final Telemetry telemetry;

  /// The configuration object
  final AuthConfig config;

  final Api _api;
  Timer? _clientTimer;

  static const _codeLength = 6;

  final _errors = StreamController<AuthError>.broadcast();

  /// Stream of errors reported by the SDK of type [AuthError]
  Stream<AuthError> get errorStream => _errors.stream;

  /// Adds [error] to [errorStream]
  void addError(AuthError error) => _errors.add(error);

  /// The [Environment] object
  ///
  /// configuration of the Clerk account - rarely changes
  ///
  late Environment env;

  /// The [Client] object
  ///
  /// The current state of authentication - changes frequently
  ///
  late Client client;

  /// The current [SignIn] object, or null
  SignIn? get signIn => client.signIn;

  /// The current [SignUp] object, or null
  SignUp? get signUp => client.signUp;

  /// The current [Session] object, or null
  Session? get session => client.activeSession;

  /// The current [User] object, or null
  User? get user => session?.user;

  /// Are we currently signed in?
  bool get isSignedIn => user != null;

  /// Are we currently signing in?
  bool get isSigningIn => signIn?.status.isActive == true;

  /// Are we currently signing up?
  bool get isSigningUp => signUp?.status.isActive == true;

  /// A method to be overridden by extension classes to cope with
  /// updating their systems when things change (e.g. the clerk_flutter
  /// ClerkAuth class)
  ///
  void update() {}

  /// Initialisation of the [Auth] object
  ///
  /// [initialize] must be called before any further use of the [Auth]
  /// object is made
  ///
  Future<void> initialize() async {
    await _api.initialize();
    final [client, env] = await Future.wait([
      _api.createClient(),
      _api.environment(),
    ]);
    this.client = client as Client;
    this.env = env as Environment;
    await telemetry.initialize(
      instanceType: this.env.display.instanceEnvironmentType,
    );
    if (config.clientRefreshPeriod.isNotZero) {
      _clientTimer = Timer.periodic(
        config.clientRefreshPeriod,
        (_) => refreshClient(),
      );
    }
  }

  /// Disposal of the [Auth] object
  ///
  /// Named [terminate] so as not to clash with [ChangeNotifier]'s [dispose]
  /// method, if that is mixed in e.g. in clerk_flutter
  ///
  void terminate() {
    _clientTimer?.cancel();
    telemetry.terminate();
    _api.terminate();
  }

  /// Refresh the current [Client]
  ///
  Future<void> refreshClient() async {
    client = await _api.currentClient();
    update();
  }

  /// Refresh the current [Environment]
  ///
  Future<void> refreshEnvironment() async {
    env = await _api.environment();
    update();
  }

  ApiResponse _housekeeping(ApiResponse resp) {
    if (resp.isError) {
      addError(
        AuthError(
          code: AuthErrorCode.serverErrorResponse,
          message: resp.errorMessage,
        ),
      );
    } else if (resp.client case Client client) {
      this.client = client;
    }
    return resp;
  }

  /// Sign out of all [Session]s and delete the current [Client]
  ///
  Future<void> signOut() async {
    client = await _api.signOut();
    update();
  }

  /// Transfer an oAuth authentication into a [User]
  ///
  Future<void> transfer() async {
    await _api.transfer().then(_housekeeping);
    update();
  }

  /// Get the current [sessionToken] for an [Organization] , or the
  /// last organization used if empty
  ///
  Future<SessionToken> sessionToken({
    Organization? organization,
    String? templateName,
  }) async {
    final org = env.organization.isEnabled
        ? organization ?? Organization.personal
        : null;
    final token = await _api.sessionToken(org, templateName);
    if (token is! SessionToken) {
      throw const AuthError(
        message: 'No session token retrieved',
        code: AuthErrorCode.noSessionTokenRetrieved,
      );
    }
    return token;
  }

  /// Prepare for sign in via an oAuth provider
  ///
  Future<void> oauthSignIn({required Strategy strategy}) async {
    await _api
        .createSignIn(
          strategy: strategy,
          redirectUrl: ClerkConstants.oauthRedirect,
        )
        .then(_housekeeping);
    if (client.signIn case SignIn signIn) {
      await _api
          .prepareSignIn(
            signIn,
            stage: Stage.first,
            strategy: strategy,
            redirectUrl: ClerkConstants.oauthRedirect,
          )
          .then(_housekeeping);
    }
    update();
  }

  /// Prepare to connect an account via an oAuth provider
  ///
  Future<void> oauthConnect({required Strategy strategy}) async {
    await _api
        .addExternalAccount(
          strategy: strategy,
          redirectUrl: ClerkConstants.oauthRedirect,
        )
        .then(_housekeeping);
    update();
  }

  /// Delete an external account
  Future<void> deleteExternalAccount({required ExternalAccount account}) async {
    await _api.deleteExternalAccount(account: account).then(_housekeeping);
    update();
  }

  /// Progressively attempt sign in
  ///
  /// Can be repeatedly called with updated parameters
  /// until the user is signed in.
  ///
  Future<void> attemptSignIn({
    required Strategy strategy,
    String? identifier,
    String? password,
    String? code,
    String? token,
    String? redirectUrl,
  }) async {
    if ((client.signIn == null ||
            client.signIn?.status == Status.needsIdentifier) &&
        identifier is String) {
      // if a password has been presented, we can immediately attempt a sign in
      // if `password` is null it will be ignored
      await _api
          .createSignIn(identifier: identifier, password: password)
          .then(_housekeeping);

      // Did we just complete sign in with password?
      if (isSignedIn) {
        return;
      }
    }

    switch (client.signIn) {
      case SignIn signIn when strategy.isOauth == true && token is String:
        await _api
            .sendOauthToken(signIn, strategy: strategy, token: token)
            .then(_housekeeping);

      case SignIn signIn
          when strategy == Strategy.emailLink && redirectUrl is String:
        await _api
            .prepareSignIn(
              signIn,
              stage: Stage.first,
              strategy: Strategy.emailLink,
              redirectUrl: redirectUrl,
            )
            .then(_housekeeping);

        final signInCompleter = Completer<void>();

        unawaited(
          _pollForCompletion().then(
            (client) {
              this.client = client;
              signInCompleter.complete();
              update();
            },
          ),
        );

        update();
        return signInCompleter.future;

      case SignIn signIn
          when (signIn.status == Status.needsFirstFactor) &&
              strategy == Strategy.password:
        await _api
            .attemptSignIn(
              signIn,
              stage: Stage.first,
              strategy: Strategy.password,
              password: password,
            )
            .then(_housekeeping);

      case SignIn signIn
          when signIn.status.needsFactor && strategy.requiresCode == true:
        final stage = Stage.forStatus(signIn.status);
        if (signIn.verificationFor(stage) is! Verification) {
          await _api
              .prepareSignIn(signIn, stage: stage, strategy: strategy)
              .then(_housekeeping);
        }
        if (client.signIn case SignIn signIn
            when signIn.verificationFor(stage) is Verification &&
                code?.length == _codeLength) {
          await _api
              .attemptSignIn(signIn,
                  stage: stage, strategy: strategy, code: code)
              .then(_housekeeping);
        }

      case SignIn signIn when signIn.status.needsFactor:
        final stage = Stage.forStatus(signIn.status);
        await _api
            .prepareSignIn(signIn, stage: stage, strategy: strategy)
            .then(_housekeeping);
        await _api
            .attemptSignIn(signIn, stage: stage, strategy: strategy, code: code)
            .then(_housekeeping);

      // No matching sign-in sequence, reset loading state
      default:
        final status = signIn?.status ?? Status.unknown;
        addError(AuthError(
          code: AuthErrorCode.signInError,
          message: 'Unsupported sign in attempt: {arg}',
          argument: status.name,
        ));
    }

    update();
  }

  /// Progressively attempt sign up
  ///
  /// Can be repeatedly called with updated parameters
  /// until the user is signed up and in.
  ///
  Future<Client> attemptSignUp({
    required Strategy strategy,
    String? firstName,
    String? lastName,
    String? username,
    String? emailAddress,
    String? phoneNumber,
    String? password,
    String? passwordConfirmation,
    String? code,
    String? token,
    String? signature,
  }) async {
    if (password != passwordConfirmation) {
      throw const AuthError(
        message: "Password and password confirmation must match",
        code: AuthErrorCode.passwordMatchError,
      );
    }

    switch (client.signUp) {
      case null:
        await _api
            .createSignUp(
              strategy: strategy,
              firstName: firstName,
              lastName: lastName,
              username: username,
              emailAddress: emailAddress,
              phoneNumber: phoneNumber,
              password: password,
              code: code,
              token: token,
            )
            .then(_housekeeping);

      case SignUp signUp when signUp.missingFields.isNotEmpty:
        await _api
            .updateSignUp(
              signUp,
              strategy: strategy,
              firstName: firstName,
              lastName: lastName,
              username: username,
              emailAddress: emailAddress,
              phoneNumber: phoneNumber,
              password: password,
              code: code,
              token: token,
            )
            .then(_housekeeping);
    }

    if (client.user is! User) {
      switch (client.signUp) {
        case SignUp signUp when strategy.requiresCode && code is String:
          await _api
              .attemptSignUp(signUp, strategy: strategy, code: code)
              .then(_housekeeping);

        case SignUp signUp
            when signUp.status == Status.missingRequirements &&
                signUp.missingFields.isEmpty &&
                signUp.unverifiedFields.isNotEmpty:
          for (final field in signUp.unverifiedFields) {
            await _api
                .prepareSignUp(signUp, strategy: Strategy.forObject(field))
                .then(_housekeeping);
          }

        case SignUp signUp
            when signUp.status == Status.missingRequirements &&
                signUp.missingFields.isEmpty:
          await _api
              .prepareSignUp(signUp, strategy: strategy)
              .then(_housekeeping);
          await _api
              .attemptSignUp(signUp,
                  strategy: strategy, code: code, signature: signature)
              .then(_housekeeping);
      }
    }

    update();
    return client;
  }

  /// Sign out of the given [Session]
  ///
  Future<void> signOutOf(Session session) async {
    await _api.signOutOf(session).then(_housekeeping);
    update();
  }

  /// Create a new [Organization]
  ///
  Future<void> createOrganizationFor(
    User user, {
    required String name,
    String? slug,
    File? image,
  }) async {
    final session = client.sessionFor(user);
    await _api.createOrganization(name, session: session).then(_housekeeping);

    user = client.refreshUser(user);
    if (user.organizationNamed(name) case Organization org) {
      if (slug?.isNotEmpty == true) {
        await _api
            .updateOrganization(org, slug: slug, session: session)
            .then(_housekeeping);
      }
      if (image case File image) {
        await _api
            .updateOrganizationLogo(org, image: image, session: session)
            .then(_housekeeping);
      }
      update();
    }
  }

  /// Activate the given [Session]
  ///
  Future<void> activate(Session session) async {
    await _api.activate(session).then(_housekeeping);
    update();
  }

  /// Update the [name] of the current [User]
  ///
  Future<void> updateUser({
    String? username,
    String? firstName,
    String? lastName,
    Map<String, dynamic>? metadata,
  }) async {
    if (user case User user) {
      final newUser = user.copyWith(
        username: username,
        firstName: firstName,
        lastName: lastName,
        unsafeMetadata: metadata,
      );
      await _api.updateUser(newUser, env.config).then(_housekeeping);
      update();
    }
  }

  /// Add an [identifier] address to the current [User]
  ///
  Future<void> addIdentifyingData(
    String identifier,
    IdentifierType type,
  ) async {
    await _api
        .addIdentifyingDataToCurrentUser(identifier, type)
        .then(_housekeeping);
    if (user?.identifierFrom(identifier) case UserIdentifyingData ident) {
      await _api.prepareIdentifyingDataVerification(ident).then(_housekeeping);
    }
    update();
  }

  /// Attempt to verify some [UserIdentifyingData]
  ///
  Future<void> verifyIdentifyingData(
    UserIdentifyingData uid,
    String code,
  ) async {
    await _api.verifyIdentifyingData(uid, code).then(_housekeeping);
    update();
  }

  /// Update the avatar of the current [User]
  ///
  Future<void> updateUserImage(File file) async {
    await _api.updateAvatar(file).then(_housekeeping);
    update();
  }

  /// Delete the avatar of the current [User]
  ///
  Future<void> deleteUserImage() async {
    await _api.deleteAvatar();
    update();
  }

  /// Update the password of the current [User]
  ///
  Future<void> updateUserPassword(
    String currentPassword,
    String newPassword, {
    bool signOut = true,
  }) async {
    await _api.updatePassword(currentPassword, newPassword, signOut);
    update();
  }

  /// Delete the password of the current [User]
  ///
  Future<void> deleteUserPassword(String currentPassword) async {
    await _api.deletePassword(currentPassword);
    update();
  }

  Future<Client> _pollForCompletion() async {
    while (true) {
      final client = await _api.currentClient();
      if (client.user is User) return client;

      final expiry = client.signIn?.firstFactorVerification?.expireAt;
      if (expiry?.isAfter(DateTime.timestamp()) != true) {
        throw const AuthError(
          message: 'Awaited user action not completed in required timeframe',
          code: AuthErrorCode.actionNotTimely,
        );
      }

      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
