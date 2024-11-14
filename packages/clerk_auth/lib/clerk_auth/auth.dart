import 'dart:async';

import 'package:clerk_auth/clerk_api/clerk_api.dart';
import 'package:clerk_auth/clerk_auth.dart';

class Auth {
  static const jsVersion = '4.70.0';
  static const oauthRedirect = 'https://www.clerk.com/oauth-redirect';
  static const emailLinkRedirect = 'https://www.clerk.com';

  final Api _api;

  Auth({required String publishableKey, required String publicKey, Persistor? persistor})
      : _api = Api(publicKey: publicKey, publishableKey: publishableKey, persistor: persistor);

  /// A method to be overridden by extending subclasses to cope with updating their systems when
  /// things change
  void update() {}

  // `init` must be called before `env` or `client` are accessed
  Future<Auth> init() async {
    final [client, env] = await Future.wait([_api.createClient(), _api.environment()]);
    this.client = client as Client;
    this.env = env as Environment;
    return this;
  }

  Future<void> refreshClient() async {
    this.client = await _api.currentClient();
    update();
  }

  late Environment env;
  late Client client;

  SignIn? get signIn => client.signIn;
  SignUp? get signUp => client.signUp;
  Session? get session => client.activeSession;
  User? get user => session?.user;

  Future<ApiResponse> _housekeeping(ApiResponse resp) async {
    if (resp.client case Client client when resp.isOkay) {
      this.client = client;
    } else {
      throw AuthError(code: resp.status, message: resp.errorMessage);
    }
    return resp;
  }

  Future<void> signOut() async {
    this.client = await _api.signOut();
    update();
  }

  Future<void> deleteUser() async {
    this.client = await _api.deleteUser();
    update();
  }

  Future<void> transfer() async {
    await _api.transfer().then(_housekeeping);
    update();
  }

  Future<Client> oauthSignIn({required Strategy strategy}) async {
    // If we already have a user, can return
    if (client.user is User) return client;

    await _api.createSignIn(strategy: strategy, redirectUrl: oauthRedirect).then(_housekeeping);
    if (client.signIn case SignIn signIn) {
      await _api
          .prepareSignIn(signIn, stage: Stage.first, strategy: strategy, redirectUrl: oauthRedirect)
          .then(_housekeeping);
    }

    return client;
  }

  /// Progressive sign in
  ///
  /// Repeatedly call with updated parameters until the user is signed in.
  Future<Client> attemptSignIn({
    String? identifier,
    Strategy? strategy,
    String? password,
    String? code,
    String? token,
  }) async {
    // If we already have a user, can return
    if (client.user is User) return client;

    if (client.signIn == null && identifier is String) {
      // if a password has been presented, we can immediately attempt a sign in
      // if `password` is null it will be ignored
      await _api.createSignIn(identifier: identifier, password: password).then(_housekeeping);
    }

    if (client.user is! User) {
      switch (client.signIn) {
        case SignIn signIn when strategy?.isOauth == true:
          await _api.sendOauthToken(signIn, strategy: strategy!, token: token).then(_housekeeping);

        case SignIn signIn when strategy == Strategy.emailLink:
          await _api
              .prepareSignIn(
                signIn,
                stage: Stage.first,
                strategy: Strategy.emailLink,
                redirectUrl: emailLinkRedirect,
              )
              .then(_housekeeping);

          final signInCompleter = Completer<Client>();

          _pollForCompletion(signInCompleter, () async {
            final client = await _api.currentClient();
            return client.user is User ? client : null;
          });

          update();
          return signInCompleter.future;

        case SignIn signIn
            when signIn.status == Status.needsFirstFactor && strategy == Strategy.password:
          await _api
              .attemptSignIn(
                signIn,
                stage: Stage.first,
                strategy: Strategy.password,
                password: password,
              )
              .then(_housekeeping);

        case SignIn signIn when signIn.status.needsFactor && strategy?.requiresCode == true:
          final stage = Stage.forStatus(signIn.status);
          if (code?.isNotEmpty == true) {
            await _api
                .attemptSignIn(signIn, stage: stage, strategy: strategy!, code: code)
                .then(_housekeeping);
          } else {
            await _api.prepareSignIn(signIn, stage: stage, strategy: strategy!).then(_housekeeping);
          }

        case SignIn signIn when signIn.status.needsFactor && strategy is Strategy:
          final stage = Stage.forStatus(signIn.status);
          await _api.prepareSignIn(signIn, stage: stage, strategy: strategy).then(_housekeeping);
          await _api
              .attemptSignIn(signIn, stage: stage, strategy: strategy, code: code)
              .then(_housekeeping);
      }
    }

    update();
    return client;
  }

  Future<Client> attemptSignUp({
    Strategy? strategy,
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
    // If we already have a user, can return
    if (client.user is User) return client;

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
        case SignUp signUp when strategy?.requiresCode == true && code is String:
          await _api.attemptSignUp(signUp, strategy: strategy!, code: code).then(_housekeeping);

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
                signUp.missingFields.isEmpty &&
                strategy is Strategy:
          await _api.prepareSignUp(signUp, strategy: strategy).then(_housekeeping);
          await _api
              .attemptSignUp(signUp, strategy: strategy, code: code, signature: signature)
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

  void _pollForCompletion<T>(Completer<T> completer, Future<T?> Function() fn) async {
    while (true) {
      final expiry = (await signIn)?.firstFactorVerification?.expireAt;
      if (expiry?.isAfter(DateTime.now()) != true) {
        // return if expiry has expired or is null
        completer.completeError(AuthError(message: 'Email Link not clicked in required timeframe'));
        update();
        return;
      }

      final result = await fn.call();
      if (result is T) {
        completer.complete(result);
        update();
        return;
      }

      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
