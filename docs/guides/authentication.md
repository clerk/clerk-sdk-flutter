---
layout: default
title: Authentication
parent: Guides
nav_order: 1
---

# Authentication Flows
{: .no_toc }

Learn how to implement various authentication strategies with Clerk's Dart and Flutter SDKs.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

Clerk supports multiple authentication strategies to meet your application's needs:

- **Email & Password** - Traditional username/password authentication
- **Email Code (Passwordless)** - One-time codes sent via email
- **Phone Code (Passwordless)** - One-time codes sent via SMS
- **OAuth** - Social login with Google, GitHub, Facebook, and more
- **Multi-Factor Authentication (MFA)** - Additional security layer

---

## Email and Password Authentication

### Sign In

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<void> signInWithPassword(Auth auth, String email, String password) async {
  try {
    await auth.attemptSignIn(
      strategy: Strategy.password,
      identifier: email,
      password: password,
    );
    
    print('✅ Signed in as: ${auth.user?.emailAddress}');
  } on ClerkApiException catch (e) {
    print('❌ Sign in failed: ${e.message}');
    // Handle specific error codes
    if (e.errors.any((err) => err.code == 'form_password_incorrect')) {
      print('Incorrect password');
    }
  }
}
```

### Sign Up

```dart
Future<void> signUpWithPassword(
  Auth auth,
  String email,
  String password,
  {String? firstName, String? lastName}
) async {
  try {
    await auth.attemptSignUp(
      strategy: Strategy.password,
      identifier: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    // Check if email verification is required
    if (auth.signUp?.verification?.status == VerificationStatus.unverified) {
      print('📧 Verification email sent to $email');
      // Proceed to verification step
    } else {
      print('✅ Sign up successful!');
    }
  } on ClerkApiException catch (e) {
    print('❌ Sign up failed: ${e.message}');
  }
}
```

### Email Verification

```dart
Future<void> verifyEmail(Auth auth, String code) async {
  try {
    await auth.attemptSignUpVerification(
      strategy: Strategy.emailCode,
      code: code,
    );
    
    print('✅ Email verified! User is now signed in.');
  } on ClerkApiException catch (e) {
    print('❌ Verification failed: ${e.message}');
  }
}
```

---

## Passwordless Authentication

### Email Code (Magic Link)

```dart
Future<void> signInWithEmailCode(Auth auth, String email) async {
  try {
    // Step 1: Request the code
    await auth.attemptSignIn(
      strategy: Strategy.emailCode,
      identifier: email,
    );
    
    print('📧 Verification code sent to $email');
    
    // Step 2: User enters the code from their email
    final code = '123456'; // Get from user input
    
    await auth.attemptSignInVerification(
      strategy: Strategy.emailCode,
      code: code,
    );
    
    print('✅ Signed in successfully!');
  } on ClerkApiException catch (e) {
    print('❌ Error: ${e.message}');
  }
}
```

### Phone Code (SMS)

```dart
Future<void> signInWithPhoneCode(Auth auth, String phoneNumber) async {
  try {
    // Step 1: Request the SMS code
    await auth.attemptSignIn(
      strategy: Strategy.phoneCode,
      identifier: phoneNumber, // Format: +1234567890
    );
    
    print('📱 SMS code sent to $phoneNumber');
    
    // Step 2: User enters the code from SMS
    final code = '123456'; // Get from user input
    
    await auth.attemptSignInVerification(
      strategy: Strategy.phoneCode,
      code: code,
    );
    
    print('✅ Signed in successfully!');
  } on ClerkApiException catch (e) {
    print('❌ Error: ${e.message}');
  }
}
```

---

## OAuth Authentication

### Flutter OAuth Flow

For Flutter applications, use the built-in OAuth support:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class OAuthSignInPage extends StatelessWidget {
  const OAuthSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClerkAuthentication(),
      ),
    );
  }
}
```

The `ClerkAuthentication` widget automatically displays configured OAuth providers.

### Custom OAuth Button

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

class CustomOAuthButton extends StatelessWidget {
  const CustomOAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    
    return ElevatedButton.icon(
      icon: Icon(Icons.login),
      label: Text('Sign in with Google'),
      onPressed: () async {
        try {
          await authState.attemptSignIn(
            strategy: Strategy.oauth(OAuthProvider.google),
          );
        } catch (e) {
          print('OAuth error: $e');
        }
      },
    );
  }
}
```

### Supported OAuth Providers

Clerk supports the following OAuth providers:

- Google (`OAuthProvider.google`)
- GitHub (`OAuthProvider.github`)
- Facebook (`OAuthProvider.facebook`)
- Microsoft (`OAuthProvider.microsoft`)
- Apple (`OAuthProvider.apple`)
- Discord (`OAuthProvider.discord`)
- Twitter/X (`OAuthProvider.twitter`)
- LinkedIn (`OAuthProvider.linkedin`)
- And many more...

---

## Multi-Factor Authentication (MFA)

### Enable MFA for a User

```dart
Future<void> enableMFA(Auth auth) async {
  final user = auth.user;
  if (user == null) return;

  try {
    // Generate TOTP secret
    final totp = await user.createTOTP();
    
    print('Scan this QR code: ${totp.qrCodeUrl}');
    print('Or enter this secret: ${totp.secret}');
    
    // User scans QR code and enters verification code
    final code = '123456'; // Get from user input
    
    await totp.verify(code: code);
    
    print('✅ MFA enabled successfully!');
  } catch (e) {
    print('❌ MFA setup failed: $e');
  }
}
```

### Sign In with MFA

```dart
Future<void> signInWithMFA(Auth auth, String email, String password) async {
  try {
    // Step 1: Initial sign-in
    await auth.attemptSignIn(
      strategy: Strategy.password,
      identifier: email,
      password: password,
    );
    
    // Step 2: Check if MFA is required
    if (auth.signIn?.secondFactor?.status == VerificationStatus.unverified) {
      print('🔐 MFA code required');
      
      // User enters their TOTP code
      final mfaCode = '123456'; // Get from user input
      
      await auth.attemptSignInVerification(
        strategy: Strategy.totp,
        code: mfaCode,
      );
    }
    
    print('✅ Signed in with MFA!');
  } catch (e) {
    print('❌ Sign in failed: $e');
  }
}
```

---

## Password Reset

```dart
Future<void> resetPassword(Auth auth, String email) async {
  try {
    // Step 1: Request password reset
    await auth.resetPassword(email: email);
    
    print('📧 Password reset email sent to $email');
    
    // Step 2: User clicks link in email and enters new password
    // This typically happens in a web view or separate flow
    
  } catch (e) {
    print('❌ Password reset failed: $e');
  }
}
```

---

## Session Management

### Check Authentication Status

```dart
bool isSignedIn(Auth auth) {
  return auth.user != null;
}
```

### Get Current Session

```dart
import 'package:clerk_auth/clerk_auth.dart';

Session? getCurrentSession(Auth auth) {
  return auth.client.activeSession;
}
```

### Sign Out

```dart
Future<void> signOut(Auth auth) async {
  await auth.signOut();
  print('👋 Signed out successfully');
}
```

### Sign Out of Specific Session

```dart
Future<void> signOutOfSession(Auth auth, Session session) async {
  await auth.signOutOf(session);
  print('👋 Signed out of session: ${session.id}');
}
```

---

## Next Steps

- [User Management]({{ '/guides/user-management' | relative_url }}) - Manage user profiles and data
- [Session Tokens]({{ '/guides/session-tokens' | relative_url }}) - Work with JWT tokens
- [Error Handling]({{ '/guides/error-handling' | relative_url }}) - Handle authentication errors
- [Organizations]({{ '/guides/organizations' | relative_url }}) - Multi-tenant authentication

