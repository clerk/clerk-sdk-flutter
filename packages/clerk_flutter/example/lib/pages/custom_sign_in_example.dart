import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

/// Example of how to use clerk auth with custom ui.
///
/// This example relies on [ValueNotifier]s to provide a simple
/// example of how to use the [ClerkAuthState] to get the current
/// user and to sign in.
///
/// The underlying thought is to use to sign in methods available on [ClerkAuthState]
/// to sign in with the various strategies available on the [Environment]. From here,
/// you can user whatever state management you like to manage the ui.
///
/// Feel free to use this as a starting point for your own custom
/// sign in flow.
@immutable
class CustomOAuthSignInExample extends StatefulWidget {
  /// Constructs an instance of [CustomOAuthSignInExample].
  const CustomOAuthSignInExample({super.key});

  /// Path to this page.
  static const path = '/custom-oauth-sign-in-example';

  @override
  State<CustomOAuthSignInExample> createState() =>
      _CustomOAuthSignInExampleState();
}

class _CustomOAuthSignInExampleState extends State<CustomOAuthSignInExample> {
  final _initalized = ValueNotifier<bool>(false);
  final _loading = ValueNotifier<bool>(false);
  final _user = ValueNotifier<clerk.User?>(null);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late final StreamSubscription<clerk.AuthError> _errorSubscription;
  late final ClerkAuthState _authState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authState = ClerkAuth.of(context);
      _user.value = _authState.user;
      _authState.addListener(_clerkAuthListener);
      _errorSubscription = _authState.errorStream.listen(_onError);
      _initalized.value = true;
    });
  }

  void _clerkAuthListener() {
    final user = _authState.user;
    _user.value = user;
  }

  void _onError(clerk.AuthError error) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(error.message),
      ),
    );
  }

  Future<void> _signIn(clerk.Strategy strategy) async {
    _loading.value = true;
    try {
      await _authState.ssoSignIn(context, strategy);
    } finally {
      _loading.value = false;
    }
  }

  Future<void> _oauthTokenGoogle() async {
    _loading.value = true;
    final google = GoogleSignIn.instance;
    await google.initialize(
      serverClientId: const String.fromEnvironment('google_client_id'),
      nonce: const Uuid().v4(),
    );
    final account = await google.authenticate(
      scopeHint: const ['openid', 'email', 'profile'],
    );
    await _authState.attemptSignIn(
      strategy: clerk.Strategy.oauthTokenGoogle,
      token: account.authentication.idToken,
    );
    _loading.value = false;
  }

  // Always dispose of the subscriptions and remove listeners.
  @override
  void dispose() {
    super.dispose();
    _authState.removeListener(_clerkAuthListener);
    _errorSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 16);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Custom Sign In'),
      ),
      body: ListenableBuilder(
        listenable: _initalized,
        builder: (context, _) {
          if (!_initalized.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ValueListenableBuilder<bool>(
            valueListenable: _loading,
            builder: (context, bool loading, child) {
              if (loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return ValueListenableBuilder<clerk.User?>(
                valueListenable: _user,
                builder: (context, clerk.User? user, child) {
                  if (user != null) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Signed in!'),
                          spacer,
                          if (user.profileImageUrl case String imageUrl) ...[
                            CircleAvatar(
                              backgroundImage: NetworkImage(imageUrl),
                              radius: 32.0,
                            ),
                            spacer,
                          ],
                          Text('Email: ${user.email}'),
                          spacer,
                          if (user.username case String username) ...[
                            Text('Username: $username'),
                            spacer,
                          ],
                          Text('First Name: ${user.firstName}'),
                          spacer,
                          Text('Last Name: ${user.lastName}'),
                          spacer,
                          ElevatedButton(
                            onPressed: () => _authState.signOut(),
                            child: const Text('Sign Out'),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Sign in with:'),
                        spacer,
                        Wrap(
                          spacing: 16.0,
                          runSpacing: 16.0,
                          children: [
                            for (final strategy in _authState.env.strategies) //
                              ElevatedButton(
                                onPressed: () => _signIn(strategy),
                                child: Text(strategy.provider ?? strategy.name),
                              ),
                            if (_authState.env.config.firstFactors
                                .contains(clerk.Strategy.oauthTokenGoogle)) //
                              ElevatedButton(
                                onPressed: _oauthTokenGoogle,
                                child: const Text('google via oauth token'),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
