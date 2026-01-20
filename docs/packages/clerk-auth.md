---
layout: default
title: clerk_auth
parent: Packages
nav_order: 1
---

# clerk_auth Package
{: .no_toc }

The official Clerk Dart SDK for backend and CLI applications.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

The `clerk_auth` package is a pure Dart SDK that provides authentication and user management capabilities for:

- Backend Dart applications
- CLI tools
- Server-side applications
- Any Dart environment

**Package:** [clerk_auth on pub.dev](https://pub.dev/packages/clerk_auth)  
**Version:** 0.0.13-beta  
**Repository:** [GitHub](https://github.com/clerk/clerk-sdk-flutter/tree/main/packages/clerk_auth)

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  clerk_auth: ^0.0.13-beta
```

Then run:

```bash
dart pub get
```

---

## Requirements

- Dart >= 3.6.2

---

## Core Classes

### Auth

The main class for managing authentication state.

```dart
import 'package:clerk_auth/clerk_auth.dart';

final auth = Auth(
  config: AuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
    persistor: DefaultPersistor(
      getCacheDirectory: () => Directory.current,
    ),
  ),
);

await auth.initialize();
```

**Key Methods:**

| Method | Description |
|--------|-------------|
| `initialize()` | Initialize the auth system |
| `attemptSignIn()` | Start a sign-in attempt |
| `attemptSignUp()` | Start a sign-up attempt |
| `attemptSignInVerification()` | Verify a sign-in attempt |
| `attemptSignUpVerification()` | Verify a sign-up attempt |
| `signOut()` | Sign out the current user |
| `signOutOf(Session)` | Sign out of a specific session |
| `resetPassword()` | Request a password reset |
| `terminate()` | Clean up resources |

**Key Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `user` | `User?` | Current signed-in user |
| `client` | `Client` | Client object with sessions |
| `env` | `Environment` | Environment configuration |
| `sessionTokenStream` | `Stream<String?>` | Stream of session tokens |

---

### AuthConfig

Configuration for the Auth instance.

```dart
AuthConfig(
  publishableKey: 'pk_test_xxxxxxxxxxxxx',
  persistor: DefaultPersistor(
    getCacheDirectory: () => Directory.current,
  ),
  sessionTokenPolling: true,  // Enable automatic token refresh
  httpService: null,          // Optional custom HTTP service
)
```

**Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `publishableKey` | `String` | Required | Your Clerk publishable key |
| `persistor` | `Persistor` | Required | Storage mechanism for auth state |
| `sessionTokenPolling` | `bool` | `true` | Enable automatic token refresh |
| `httpService` | `HttpService?` | `null` | Custom HTTP service |

---

### User

Represents a user in your application.

```dart
final user = auth.user;

if (user != null) {
  print('User ID: ${user.id}');
  print('Email: ${user.emailAddress}');
  print('Name: ${user.firstName} ${user.lastName}');
}
```

**Key Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `id` | `String` | Unique user identifier |
| `firstName` | `String?` | First name |
| `lastName` | `String?` | Last name |
| `username` | `String?` | Username |
| `emailAddress` | `String?` | Primary email |
| `phoneNumber` | `String?` | Primary phone |
| `imageUrl` | `String?` | Profile image URL |
| `emailAddresses` | `List<EmailAddress>` | All email addresses |
| `phoneNumbers` | `List<PhoneNumber>` | All phone numbers |
| `publicMetadata` | `Map<String, dynamic>` | Public metadata |
| `unsafeMetadata` | `Map<String, dynamic>` | Unsafe metadata |

**Key Methods:**

| Method | Description |
|--------|-------------|
| `update()` | Update user profile |
| `setProfileImage()` | Upload profile image |
| `createEmailAddress()` | Add new email address |
| `createPhoneNumber()` | Add new phone number |
| `createTOTP()` | Enable MFA |

---

### Strategy

Authentication strategies supported by Clerk.

```dart
// Password authentication
Strategy.password

// Email code (passwordless)
Strategy.emailCode

// Phone code (SMS)
Strategy.phoneCode

// OAuth
Strategy.oauth(OAuthProvider.google)
Strategy.oauth(OAuthProvider.github)

// TOTP (MFA)
Strategy.totp
```

---

### Persistor

Interface for persisting authentication state.

**Built-in Persistors:**

```dart
// Default file-based persistor
DefaultPersistor(
  getCacheDirectory: () => Directory.current,
)

// No persistence (in-memory only)
Persistor.none
```

**Custom Persistor:**

```dart
class MyCustomPersistor implements Persistor {
  @override
  Future<void> write<T>(String key, T value) async {
    // Your storage logic
  }

  @override
  Future<T?> read<T>(String key) async {
    // Your retrieval logic
  }

  @override
  Future<void> delete(String key) async {
    // Your deletion logic
  }
}
```

---

## Session Token Polling

By default, `clerk_auth` automatically polls for session tokens and provides them via the `sessionTokenStream`.

### Enable/Disable Polling

```dart
final auth = Auth(
  config: AuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
    sessionTokenPolling: true,  // Enable (default)
    // sessionTokenPolling: false,  // Disable
  ),
);
```

### Listen to Session Tokens

```dart
auth.sessionTokenStream.listen((token) {
  if (token != null) {
    print('New session token: $token');
    // Use for authenticated API requests
  }
});
```

---

## Error Handling

All authentication methods can throw `ClerkApiException`:

```dart
import 'package:clerk_auth/clerk_auth.dart';

try {
  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: 'user@example.com',
    password: 'password',
  );
} on ClerkApiException catch (e) {
  print('Error: ${e.message}');
  print('Status: ${e.status}');
  
  // Check specific error codes
  for (final error in e.errors) {
    print('Code: ${error.code}');
    print('Message: ${error.message}');
  }
}
```

---

## Examples

### Complete Sign-In Flow

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
    await auth.attemptSignIn(
      strategy: Strategy.password,
      identifier: 'user@example.com',
      password: 'password',
    );

    print('✅ Signed in as: ${auth.user?.emailAddress}');
    
    // Use session token for API requests
    auth.sessionTokenStream.listen((token) {
      if (token != null) {
        // Make authenticated requests
      }
    });

  } catch (e) {
    print('❌ Sign in failed: $e');
  } finally {
    auth.terminate();
  }
}
```

---

## API Documentation

For complete API documentation, see:

- [pub.dev Documentation](https://pub.dev/documentation/clerk_auth/latest/)
- [GitHub Repository](https://github.com/clerk/clerk-sdk-flutter/tree/main/packages/clerk_auth)

---

## Next Steps

- [Dart Quickstart]({{ '/getting-started/quickstart-dart' | relative_url }})
- [Authentication Guide]({{ '/guides/authentication' | relative_url }})
- [User Management]({{ '/guides/user-management' | relative_url }})
- [Session Tokens]({{ '/guides/session-tokens' | relative_url }})

