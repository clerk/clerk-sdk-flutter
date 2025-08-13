import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';

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
  Auth({required this.config});

  /// Use 'English' as the default locale
  static List<String> defaultLocalesLookup() => <String>['en'];

  /// The configuration object
  final AuthConfig config;

  /// The service to send telemetry to the back end
  late final Telemetry telemetry;

  late final Api _api;

  static const _initialisationTimeout = Duration(milliseconds: 1000);
  static const _persistenceDelay = Duration(milliseconds: 500);
  static const _refetchDelay = Duration(seconds: 10);
  static const _kClientKey = '\$client';
  static const _kEnvKey = '\$env';
  static const _codeLength = 6;

  Timer? _clientTimer;
  Timer? _persistenceTimer;
  Timer? _refetchTimer;
  Map<String, dynamic> _persistableData = {};

  /// Stream of errors reported by the SDK of type [AuthError]
  Stream<AuthError> get errorStream => _errors.stream;
  final _errors = StreamController<AuthError>.broadcast();

  /// Stream of [SessionToken]s as they renew
  Stream<SessionToken> get sessionTokenStream => _sessionTokens.stream;
  final _sessionTokens = StreamController<SessionToken>.broadcast();

  /// Adds [error] to [errorStream]
  void addError(AuthError error) => _errors.add(error);

  /// Are we not yet initialised?
  bool get isNotAvailable => env.isEmpty;

  /// The [Environment] object
  ///
  /// configuration of the Clerk account - rarely changes
  ///
  Environment get env => _env;

  set env(Environment env) {
    _env = env;
    _persistableData[_kEnvKey] = env;
    _persistenceTimer?.cancel();
    _persistenceTimer = Timer(_persistenceDelay, _persistData);
  }

  Environment _env = Environment.empty;

  /// The [Client] object
  ///
  /// The current state of authentication - changes frequently
  ///
  Client get client => _client;

  set client(Client client) {
    _client = client;
    _persistableData[_kClientKey] = client;
    _persistenceTimer?.cancel();
    _persistenceTimer = Timer(_persistenceDelay, _persistData);
  }

  Client _client = Client.empty;

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
    await config.initialize();
    telemetry = Telemetry(config: config);
    _api = Api(config: config, sessionTokenSink: _sessionTokens.sink);
    await _api.initialize();

    final (client, env) = await _fetchClientAndEnv();

    if (client.isEmpty) {
      final clientData = await config.persistor.read<String>(_kClientKey);
      if (clientData case String data) {
        _client = Client.fromJson(jsonDecode(data));
      }
    } else {
      this.client = client;
    }

    if (env.isEmpty) {
      final envData = await config.persistor.read<String>(_kEnvKey);
      if (envData case String data) {
        _env = Environment.fromJson(jsonDecode(data));
      }
    } else {
      this.env = env;
    }

    if (_client.isEmpty || _env.isEmpty) {
      _refetchTimer = Timer.periodic(_refetchDelay, _retryFetchClientAndEnv);
    }

    await telemetry.initialize(
      instanceType: env.display.instanceEnvironmentType,
    );

    if (config.clientRefreshPeriod.isNotZero) {
      _clientTimer = Timer.periodic(
        config.clientRefreshPeriod,
        (_) async {
          if (await _api.hasConnectivity()) {
            await refreshClient();
          }
        },
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
    _persistenceTimer?.cancel();
    _refetchTimer?.cancel();
    _api.terminate();
    _errors.close();
    _sessionTokens.close();
    telemetry.terminate();
    config.terminate();
  }

  Future<void> _retryFetchClientAndEnv(_) async {
    final (client, env) = await _fetchClientAndEnv();
    if (client.isNotEmpty && env.isNotEmpty) {
      this.client = client;
      this.env = env;
      _refetchTimer?.cancel();
      _refetchTimer = null;
      update();
    }
  }

  Future<(Client, Environment)> _fetchClientAndEnv() async {
    try {
      final [client, env] = await Future.wait([
        _api.createClient().timeout(_initialisationTimeout),
        _api.environment().timeout(_initialisationTimeout),
      ]);
      return (client as Client, env as Environment);
    } on Exception {
      // either get both or neither (shouldn't initialise with different
      // timestamped versions anyway)
      return (Client.empty, Environment.empty);
    }
  }

  ApiResponse _housekeeping(ApiResponse resp) {
    if (resp.isError) {
      addError(AuthError(code: resp.authErrorCode, message: resp.errorMessage));
    } else if (resp.client case Client client) {
      this.client = client;
    }
    return resp;
  }

  Future<void> _persistData() async {
    final data = _persistableData;
    _persistableData = {};

    if (_persistableData[_kClientKey] case Client client
        when client.user != null) {
      config.persistor.write(_kClientKey, jsonEncode(client));
    }

    if (data[_kEnvKey] case Environment env) {
      config.persistor.write(_kEnvKey, jsonEncode(env));
    }
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

  /// Sign out of all [Session]s and delete the current [Client]
  ///
  Future<void> signOut() async {
    client = await _api.signOut();
    await config.persistor.delete(_kClientKey);
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
  Future<void> oauthSignIn({
    required Strategy strategy,
    required Uri? redirect,
  }) async {
    final redirectUrl = redirect?.toString() ?? ClerkConstants.oauthRedirect;
    await _api
        .createSignIn(strategy: strategy, redirectUrl: redirectUrl)
        .then(_housekeeping);
    if (client.signIn case SignIn signIn) {
      await _api
          .prepareSignIn(
            signIn,
            stage: Stage.first,
            strategy: strategy,
            redirectUrl: redirectUrl,
          )
          .then(_housekeeping);
    }
    update();
  }

  /// Prepare to connect an account via an oAuth provider
  ///
  Future<void> oauthConnect({
    required Strategy strategy,
    required Uri? redirect,
  }) async {
    final redirectUrl = redirect?.toString() ?? ClerkConstants.oauthRedirect;
    await _api
        .addExternalAccount(strategy: strategy, redirectUrl: redirectUrl)
        .then(_housekeeping);
    update();
  }

  /// Delete an external account
  Future<void> deleteExternalAccount({required ExternalAccount account}) async {
    await _api.deleteExternalAccount(account: account).then(_housekeeping);
    update();
  }

  /// Initiate a password reset
  Future<void> initiatePasswordReset({
    required String identifier,
    required Strategy strategy,
  }) async {
    if (strategy.isPasswordResetter) {
      await _api
          .createSignIn(identifier: identifier, strategy: strategy)
          .then(_housekeeping);
    } else {
      addError(
        AuthError(
          code: AuthErrorCode.passwordResetStrategyError,
          message: 'Unsupported password reset strategy: {arg}',
          argument: strategy.toString(),
        ),
      );
    }
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
    if (strategy.isOauthToken) {
      if (token?.isNotEmpty == true || code?.isNotEmpty == true) {
        await _api
            .createSignIn(strategy: strategy, token: token, code: code)
            .then(_housekeeping);
        update();
      }
      return;
    }

    // Ensure we have a signIn object
    if (client.signIn == null) {
      // if password and identifier been presented, we can immediately attempt
      // a sign in;  if null they will be ignored
      await _api
          .createSignIn(identifier: identifier, password: password)
          .then(_housekeeping);
    }

    switch (client.signIn) {
      case null when client.user is User:
        // We have signed in - possibly when creating the [SignIn] above
        break;

      case SignIn signIn
          when signIn.status == Status.needsIdentifier && identifier is String:
        // if a password has been presented, we can immediately attempt a
        // sign in; if `password` is null it will be ignored
        await _api
            .createSignIn(identifier: identifier, password: password)
            .then(_housekeeping);

      case SignIn signIn when strategy.isOauth && token is String:
        await _api
            .sendOauthToken(signIn, strategy: strategy, token: token)
            .then(_housekeeping);

      case SignIn signIn
          when strategy.isPasswordResetter &&
              code is String &&
              password is String:
        await _api
            .attemptSignIn(
              signIn,
              stage: Stage.first,
              strategy: strategy,
              password: password,
              code: code,
            )
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
          when signIn.status == Status.needsFirstFactor &&
              strategy == Strategy.password &&
              password is String:
        await _api
            .attemptSignIn(
              signIn,
              stage: Stage.first,
              strategy: Strategy.password,
              password: password,
            )
            .then(_housekeeping);

      case SignIn signIn
          when signIn.status.needsFactor && strategy.requiresCode:
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
        addError(
          AuthError(
            code: AuthErrorCode.signInError,
            message: 'Unsupported sign in attempt: {arg}',
            argument: status.name,
          ),
        );
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
    bool? legalAccepted,
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
              legalAccepted: legalAccepted,
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
              legalAccepted: legalAccepted,
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
                .prepareSignUp(signUp, strategy: Strategy.forField(field))
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
  Future<void> createOrganization({
    required String name,
    String? slug,
    File? logo,
  }) async {
    await _api.createOrganization(name).then(_housekeeping);

    if (user?.organizationNamed(name) case Organization org) {
      if (slug?.isNotEmpty == true) {
        await _api
            .updateOrganization(org, slug: slug, session: session)
            .then(_housekeeping);
      }
      if (logo case File logo) {
        await _api
            .updateOrganizationLogo(org, logo: logo, session: session)
            .then(_housekeeping);
      }
    }

    update();
  }

  /// Update an [Organization]
  ///
  Future<void> updateOrganization({
    required Organization organization,
    String? name,
    File? logo,
  }) async {
    final hasName =
        name is String && name.isNotEmpty && name != organization.name;
    if (hasName || logo is File) {
      if (hasName) {
        await _api
            .updateOrganization(organization, name: name, session: session)
            .then(_housekeeping);
      }
      if (logo case File logo) {
        await _api
            .updateOrganizationLogo(organization, logo: logo, session: session)
            .then(_housekeeping);
      }
      update();
    }
  }

  /// Leave an [Organization]
  ///
  Future<bool> leaveOrganization({
    required Organization organization,
    Session? session,
  }) async {
    final result = await _api
        .leaveOrganization(organization, session: session)
        .then(_housekeeping);
    update();
    return result.isOkay;
  }

  static const _page = 20;

  /// Get all the [Organization] invitations awaiting the user
  ///
  Future<List<OrganizationInvitation>> fetchOrganizationInvitations() async {
    final invitations = <OrganizationInvitation>[];

    for (int offset = 0; true; offset += _page) {
      final response = await _api.fetchOrganizationInvitations(offset, _page);
      if (response.response?['data'] == null) {
        break;
      }

      final responseInvitations = response.response?['data'] as List<dynamic>;
      invitations.addAll(
        responseInvitations.map(OrganizationInvitation.fromJson),
      );

      if (responseInvitations.length < _page) {
        break;
      }
    }

    update();
    return invitations;
  }

  /// Get all the [Organization]'s [Domain]s
  ///
  Future<List<OrganizationDomain>> fetchOrganizationDomains({
    required Organization organization,
  }) async {
    final domains = <OrganizationDomain>[];

    for (int offset = 0; true; offset += _page) {
      final response = await _api.fetchOrganizationDomains(
        organization,
        offset,
        _page,
      );
      if (response.response?['data'] == null) {
        break;
      }

      final responseDomains = response.response?['data'] as List<dynamic>;
      domains.addAll(
        responseDomains.map(OrganizationDomain.fromJson),
      );

      if (responseDomains.length < _page) {
        break;
      }
    }

    update();
    return domains;
  }

  /// Accept an invitation to join an [Organization]
  ///
  Future<ApiResponse> acceptOrganizationInvitation(
    OrganizationInvitation invitation,
  ) async {
    return await _api
        .acceptOrganizationInvitation(invitation)
        .then(_housekeeping);
  }

  /// Create a new [Domain] within an [Organization]
  ///
  Future<void> createDomain({
    required Organization organization,
    required String name,
    required EnrollmentMode mode,
  }) async {
    final response =
        await _api.createDomain(organization, name).then(_housekeeping);
    if (mode != EnrollmentMode.manualInvitation) {
      final domainId = response.response!['id'];
      await _api
          .updateDomainEnrollmentMode(organization, domainId, mode)
          .then(_housekeeping);
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
    File? avatar,
  }) async {
    if (user case User user) {
      final needsUpdate = username != user.username ||
          firstName != user.username ||
          lastName != user.lastName ||
          metadata?.isNotEmpty == true;
      if (needsUpdate || avatar is File) {
        if (needsUpdate) {
          final newUser = user.copyWith(
            username: username,
            firstName: firstName,
            lastName: lastName,
            unsafeMetadata: metadata,
          );
          await _api.updateUser(newUser, env.config).then(_housekeeping);
        }
        if (avatar case File avatar) {
          await _api.updateAvatar(avatar).then(_housekeeping);
        }
        update();
      }
    }
  }

  /// Delete the current [User]
  ///
  Future<void> deleteUser() async {
    if (env.user.actions.deleteSelf) {
      await _api.deleteUser();
      client = await _api.currentClient();
      update();
    } else {
      addError(
        const AuthError(
          code: AuthErrorCode.cannotDeleteSelf,
          message: 'You are not authorized to delete your user',
        ),
      );
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
