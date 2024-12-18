import 'dart:async';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

export 'auth_error.dart';
export 'http_client.dart';
export 'persistor.dart';

/// [Auth] provides more abstracted access to the Clerk API
///
/// Requires a [publishableKey] found in the Clerk dashboard
/// for you account. Additional arguments:
///
/// [persistor]: an optional instance of a [Persistor] which will keep track of
/// tokens and expiry between app activations
///
/// [client]: an optional instance of [HttpClient] to manage low-level communications
/// with the back end. Injected for e.g. test mocking
///
/// [pollMode]: session token poll mode, default on-demand,
/// manages how to refresh the [sessionToken].
///
class Auth {
  /// Create an [Auth] object using appropriate Clerk credentials
  Auth({
    required String publishableKey,
    required Persistor persistor,
    HttpClient? client,
    SessionTokenPollMode pollMode = SessionTokenPollMode.onDemand,
  }) : _api = Api(
          publishableKey: publishableKey,
          persistor: persistor,
          client: client,
          pollMode: pollMode,
        );

  final Api _api;

  static const _codeLength = 6;

  /// JsVersion of API
  static const jsVersion = '4.70.0';

  /// default redirect URL for use with oAuth
  static const oauthRedirect = 'https://www.clerk.com/oauth-redirect';

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

  /// Are we currently signing in?
  bool get isSigningIn => signIn?.status.isActive == true;

  /// Are we currently signing up?
  bool get isSigningUp => signUp?.status.isActive == true;

  /// A method to be overridden by extension classes to cope with
  /// updating their systems when things change (e.g. the clerk_flutter
  /// [ClerkAuthProvider] class)
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
  }

  /// Disposal of the [Auth] object
  ///
  /// Named [terminate] so as not to clash with [ChangeNotifier]'s [dispose]
  /// method, if that is mixed in e.g. in clerk_flutter
  ///
  void terminate() {
    _api.terminate();
  }

  /// Refresh the current [Client]
  ///
  Future<void> refreshClient() async {
    client = await _api.currentClient();
    update();
  }

  ApiResponse _housekeeping(ApiResponse resp) {
    if (resp.client case Client client when resp.isOkay) {
      this.client = client;
    } else {
      throw AuthError(code: resp.status, message: resp.errorMessage);
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

  /// Prepare for sign in via an oAuth provider
  ///
  Future<Client> oauthSignIn({required Strategy strategy}) async {
    await _api
        .createSignIn(strategy: strategy, redirectUrl: oauthRedirect)
        .then(_housekeeping);
    if (client.signIn case SignIn signIn) {
      await _api
          .prepareSignIn(
            signIn,
            stage: Stage.first,
            strategy: strategy,
            redirectUrl: oauthRedirect,
          )
          .then(_housekeeping);
    }

    update();
    return client;
  }

  /// Progressively attempt sign in
  ///
  /// Can be repeatedly called with updated parameters
  /// until the user is signed in.
  ///
  Future<Client> attemptSignIn({
    required Strategy strategy,
    String? identifier,
    String? password,
    String? code,
    String? token,
    String? redirectUrl,
  }) async {
    if (client.signIn == null && identifier is String) {
      // if a password has been presented, we can immediately attempt a sign in
      // if `password` is null it will be ignored
      await _api
          .createSignIn(identifier: identifier, password: password)
          .then(_housekeeping);
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

        final signInCompleter = Completer<Client>();

        unawaited(
          _pollForCompletion().then(
            (client) {
              this.client = client;
              signInCompleter.complete(client);
              update();
            },
          ),
        );

        update();
        return signInCompleter.future;

      case SignIn signIn
          when signIn.status == Status.needsFirstFactor &&
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
    }

    update();
    return client;
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
      throw AuthError(message: "Password and password confirmation must match");
    }

    if (client.signUp == null) {
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
    }

    if (client.user is! User) {
      switch (client.signUp) {
        case SignUp signUp when strategy.requiresCode == true && code is String:
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

        case SignUp signUp when signUp.status == Status.missingRequirements:
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

  /// Activate the given [Session]
  ///
  Future<void> activate(Session session) async {
    await _api.activate(session).then(_housekeeping);
    update();
  }

  /// Update the [name] of the current [User]
  ///
  Future<void> updateUserName(String name) async {
    if (user case User user when name.isNotEmpty) {
      final names = name.split(' ').where((s) => s.isNotEmpty).toList();
      final lastName = names.length == 1 ? '' : names.removeLast();
      final newUser = user.copyWith(
        lastName: lastName,
        firstName: names.join(' '),
      );
      await _api.updateUser(newUser).then(_housekeeping);
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
    UserIdentifyingData ident,
    String code,
  ) async {
    await _api.verifyIdentifyingData(ident, code).then(_housekeeping);
    update();
  }

  /// Update the [avatar] of the current [User]
  ///
  Future<void> updateUserImage(File file) async {
    await _api.updateAvatar(file).then(_housekeeping);
    update();
  }

  Future<Client> _pollForCompletion() async {
    while (true) {
      final client = await _api.currentClient();
      if (client.user is User) return client;

      final expiry = client.signIn?.firstFactorVerification?.expireAt;
      if (expiry?.isAfter(DateTime.timestamp()) != true) {
        throw AuthError(
          message: 'Awaited user action not completed in required timeframe',
        );
      }

      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
