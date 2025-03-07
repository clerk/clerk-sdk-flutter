import 'dart:async';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:flutter/material.dart';

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
class CustomEmailSignInExample extends StatefulWidget {
  /// Constructs an instance of [CustomEmailSignInExample].
  const CustomEmailSignInExample({super.key});

  /// Path to this page.
  static const path = '/custom-email-sign-in-example';

  @override
  State<CustomEmailSignInExample> createState() =>
      _CustomEmailSignInExampleState();
}

class _CustomEmailSignInExampleState extends State<CustomEmailSignInExample> {
  final _initalized = ValueNotifier<bool>(false);
  final _loading = ValueNotifier<bool>(false);
  final _user = ValueNotifier<clerk.User?>(null);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  Future<void> _signIn() async {
    _loading.value = true;
    try {
      await _authState.attemptSignIn(
        strategy: clerk.Strategy.password,
        identifier: _emailController.text,
        password: _passwordController.text,
      );
    } finally {
      _loading.value = false;
    }
  }

  // Alwats dispose of the subscriptions and remove listeners.
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _authState.removeListener(_clerkAuthListener);
    _errorSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 16);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Custom Email Sign In'),
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
                        const Text('Sign in with email and password:'),
                        spacer,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => _signIn(),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        spacer,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            onSubmitted: (_) => _signIn(),
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        spacer,
                        ElevatedButton(
                          onPressed: () => _signIn(),
                          child: const Text('Sign In'),
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
