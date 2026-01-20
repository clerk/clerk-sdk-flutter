---
layout: default
title: Dart Quickstart
parent: Getting Started
nav_order: 1
---

# Dart Quickstart
{: .no_toc }

Get started with Clerk authentication in your Dart application in minutes.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Install clerk_auth

Add `clerk_auth` to your `pubspec.yaml`:

```yaml
dependencies:
  clerk_auth: ^0.0.13-beta
```

Install the package:

```bash
dart pub get
```

---

## Set up your environment

Create a `.env` file or set environment variables with your Clerk publishable key:

```bash
CLERK_PUBLISHABLE_KEY=pk_test_xxxxxxxxxxxxx
```

{: .warning }
> Never commit your `.env` file to version control. Add it to your `.gitignore`.

---

## Initialize Clerk Auth

Create an `Auth` instance and initialize it:

```dart
import 'dart:io';
import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  // Create the Auth instance
  final auth = Auth(
    config: AuthConfig(
      publishableKey: Platform.environment['CLERK_PUBLISHABLE_KEY']!,
      persistor: DefaultPersistor(
        getCacheDirectory: () => Directory.current,
      ),
    ),
  );

  // Initialize the auth system
  await auth.initialize();

  // Your app logic here

  // Clean up when done
  auth.terminate();
}
```

---

## Sign in with email and password

```dart
import 'dart:io';
import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    config: AuthConfig(
      publishableKey: Platform.environment['CLERK_PUBLISHABLE_KEY']!,
      persistor: DefaultPersistor(
        getCacheDirectory: () => Directory.current,
      ),
    ),
  );

  await auth.initialize();

  try {
    // Attempt to sign in
    await auth.attemptSignIn(
      strategy: Strategy.password,
      identifier: 'user@example.com',
      password: 'your-password',
    );

    print('✅ Signed in as: ${auth.user?.emailAddress}');
    print('User ID: ${auth.user?.id}');
    
    // Access the current user
    final user = auth.user;
    if (user != null) {
      print('Name: ${user.firstName} ${user.lastName}');
      print('Email: ${user.emailAddress}');
    }

  } on ClerkApiException catch (e) {
    print('❌ Sign in failed: ${e.message}');
  } finally {
    auth.terminate();
  }
}
```

---

## Sign up a new user

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<void> signUpUser(Auth auth) async {
  try {
    // Start the sign-up process
    await auth.attemptSignUp(
      strategy: Strategy.password,
      identifier: 'newuser@example.com',
      password: 'secure-password',
    );

    // If email verification is required
    if (auth.signUp?.verification?.status == VerificationStatus.unverified) {
      print('📧 Verification email sent');
      
      // User enters the code from their email
      final code = '123456'; // Get this from user input
      
      await auth.attemptSignUpVerification(
        strategy: Strategy.emailCode,
        code: code,
      );
    }

    print('✅ Sign up successful!');
    print('User: ${auth.user?.emailAddress}');
    
  } on ClerkApiException catch (e) {
    print('❌ Sign up failed: ${e.message}');
  }
}
```

---

## Sign out

```dart
Future<void> signOutUser(Auth auth) async {
  await auth.signOut();
  print('👋 Signed out successfully');
}
```

---

## Access session tokens

Session tokens are automatically managed and can be accessed via a stream:

```dart
import 'dart:async';

Future<void> listenToSessionTokens(Auth auth) async {
  // Listen to session token updates
  final subscription = auth.sessionTokenStream.listen((token) {
    if (token != null) {
      print('🔑 New session token: ${token.substring(0, 20)}...');
      // Use this token for authenticated API requests
    }
  });

  // Remember to cancel the subscription when done
  await Future.delayed(Duration(seconds: 30));
  await subscription.cancel();
}
```

---

## Next steps

Now that you have basic authentication working, explore more features:

- [Authentication Strategies]({{ '/guides/authentication' | relative_url }}) - OAuth, passwordless, MFA
- [User Management]({{ '/guides/user-management' | relative_url }}) - Update profiles, manage sessions
- [Session Token Polling]({{ '/guides/session-tokens' | relative_url }}) - Configure token refresh behavior
- [Error Handling]({{ '/guides/error-handling' | relative_url }}) - Handle authentication errors gracefully

---

## Complete example

Here's a complete example with sign-up, sign-in, and sign-out:

```dart
import 'dart:io';
import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    config: AuthConfig(
      publishableKey: Platform.environment['CLERK_PUBLISHABLE_KEY']!,
      persistor: DefaultPersistor(
        getCacheDirectory: () => Directory.current,
      ),
    ),
  );

  await auth.initialize();

  try {
    // Check if already signed in
    if (auth.user != null) {
      print('Already signed in as: ${auth.user?.emailAddress}');
    } else {
      // Sign in
      await auth.attemptSignIn(
        strategy: Strategy.password,
        identifier: 'user@example.com',
        password: 'password',
      );
      print('Signed in successfully!');
    }

    // Do authenticated work
    print('User ID: ${auth.user?.id}');

    // Sign out
    await auth.signOut();
    print('Signed out');

  } catch (e) {
    print('Error: $e');
  } finally {
    auth.terminate();
  }
}
```

