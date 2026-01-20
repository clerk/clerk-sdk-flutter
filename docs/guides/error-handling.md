---
layout: default
title: Error Handling
parent: Guides
nav_order: 6
---

# Error Handling
{: .no_toc }

Learn how to handle authentication errors and provide great user experiences in your Dart and Flutter applications.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

Clerk provides structured error handling through the `ClerkApiException` class. All authentication operations can throw this exception when errors occur.

---

## ClerkApiException

The main exception class for Clerk API errors:

```dart
import 'package:clerk_auth/clerk_auth.dart';

try {
  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: 'user@example.com',
    password: 'wrong-password',
  );
} on ClerkApiException catch (e) {
  print('Error: ${e.message}');
  print('Status Code: ${e.status}');

  // Access individual errors
  for (final error in e.errors) {
    print('Code: ${error.code}');
    print('Message: ${error.message}');
    print('Field: ${error.meta?.paramName}');
  }
}
```

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `message` | `String` | Human-readable error message |
| `status` | `int?` | HTTP status code |
| `errors` | `List<ClerkApiError>` | Detailed error information |

---

## ClerkApiError

Individual error details:

```dart
class ClerkApiError {
  final String code;        // Error code (e.g., 'form_password_incorrect')
  final String message;     // Error message
  final String? longMessage; // Detailed explanation
  final ErrorMeta? meta;    // Additional metadata
}
```

---

## Common Error Codes

### Authentication Errors

| Code | Description | Solution |
|------|-------------|----------|
| `form_identifier_not_found` | Email/username not found | User needs to sign up |
| `form_password_incorrect` | Wrong password | Prompt user to retry or reset password |
| `form_code_incorrect` | Wrong verification code | Ask user to re-enter code |
| `verification_expired` | Verification code expired | Send new verification code |

### Validation Errors

| Code | Description | Solution |
|------|-------------|----------|
| `form_param_format_invalid` | Invalid format (e.g., email) | Validate input before submission |
| `form_password_pwned` | Password found in breach database | Require stronger password |
| `form_password_length_too_short` | Password too short | Show password requirements |

### Rate Limiting

| Code | Description | Solution |
|------|-------------|----------|
| `rate_limit_exceeded` | Too many requests | Show cooldown message |

---

## Handling Errors in Dart

### Basic Error Handling

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<void> signIn(String email, String password) async {
  try {
    await auth.attemptSignIn(
      strategy: Strategy.password,
      identifier: email,
      password: password,
    );

    print('✅ Sign in successful');

  } on ClerkApiException catch (e) {
    // Handle Clerk-specific errors
    print('❌ Sign in failed: ${e.message}');

    for (final error in e.errors) {
      if (error.code == 'form_password_incorrect') {
        print('Wrong password. Please try again.');
      } else if (error.code == 'form_identifier_not_found') {
        print('Account not found. Please sign up.');
      }
    }

  } catch (e) {
    // Handle other errors
    print('❌ Unexpected error: $e');
  }
}
```

### Field-Specific Errors

```dart
Map<String, String> getFieldErrors(ClerkApiException e) {
  final fieldErrors = <String, String>{};

  for (final error in e.errors) {
    final fieldName = error.meta?.paramName;
    if (fieldName != null) {


### Custom Error Display

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  Map<String, String> _fieldErrors = {};

  Future<void> _handleSignIn() async {
    setState(() {
      _errorMessage = null;
      _fieldErrors = {};
    });

    try {
      final authState = ClerkAuth.of(context);

      await authState.attemptSignIn(
        strategy: Strategy.password,
        identifier: _emailController.text,
        password: _passwordController.text,
      );

    } on ClerkApiException catch (e) {
      setState(() {
        _errorMessage = e.message;

        // Extract field-specific errors
        for (final error in e.errors) {
          final field = error.meta?.paramName;
          if (field != null) {
            _fieldErrors[field] = error.message;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_errorMessage != null)
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.red.shade100,
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red.shade900),
            ),
          ),

        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: _fieldErrors['identifier'],
          ),
        ),

        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: _fieldErrors['password'],
          ),
        ),

        ElevatedButton(
          onPressed: _handleSignIn,
          child: Text('Sign In'),
        ),
      ],
    );
  }
}
```

---

## Error Recovery Strategies

### Password Reset Flow

```dart
Future<void> handlePasswordError(ClerkApiException e, String identifier) async {
  for (final error in e.errors) {
    if (error.code == 'form_password_incorrect') {
      // Offer password reset
      print('Forgot your password?');

      try {
        await auth.resetPassword(identifier: identifier);
        print('Password reset email sent!');
      } catch (e) {
        print('Failed to send reset email: $e');
      }
    }
  }
}
```

### Retry with Exponential Backoff

```dart
Future<void> signInWithRetry(
  String email,
  String password, {
  int maxRetries = 3,
}) async {
  int retries = 0;

  while (retries < maxRetries) {
    try {
      await auth.attemptSignIn(
        strategy: Strategy.password,
        identifier: email,
        password: password,
      );
      return; // Success

    } on ClerkApiException catch (e) {
      // Check if error is retryable
      final isRateLimit = e.errors.any((err) =>
        err.code == 'rate_limit_exceeded'
      );

      if (isRateLimit && retries < maxRetries - 1) {
        retries++;
        final delay = Duration(seconds: pow(2, retries).toInt());
        print('Rate limited. Retrying in ${delay.inSeconds}s...');
        await Future.delayed(delay);
      } else {
        rethrow; // Not retryable or max retries reached
      }
    }
  }
}
```

---

## Logging Errors

### Development Logging

```dart
void logClerkError(ClerkApiException e) {
  print('=== Clerk API Error ===');
  print('Message: ${e.message}');
  print('Status: ${e.status}');
  print('Errors:');

  for (final error in e.errors) {
    print('  - Code: ${error.code}');
    print('    Message: ${error.message}');
    print('    Field: ${error.meta?.paramName ?? 'N/A'}');
  }

  print('=====================');
}

// Usage
try {
  await auth.attemptSignIn(/* ... */);
} on ClerkApiException catch (e) {
  logClerkError(e);
}
```

### Production Error Tracking

```dart
import 'package:sentry_flutter/sentry_flutter.dart';

try {
  await auth.attemptSignIn(/* ... */);
} on ClerkApiException catch (e, stackTrace) {
  // Log to error tracking service
  await Sentry.captureException(
    e,
    stackTrace: stackTrace,
    hint: Hint.withMap({
      'error_codes': e.errors.map((err) => err.code).toList(),
      'status': e.status,
    }),
  );

  // Show user-friendly message
  showErrorDialog(context, 'Sign in failed. Please try again.');
}
```

---

## Best Practices

### 1. Show User-Friendly Messages

```dart
String getUserFriendlyMessage(ClerkApiException e) {
  for (final error in e.errors) {
    switch (error.code) {
      case 'form_password_incorrect':
        return 'Incorrect password. Please try again.';
      case 'form_identifier_not_found':
        return 'Account not found. Please sign up.';
      case 'rate_limit_exceeded':
        return 'Too many attempts. Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
  return e.message;
}
```

### 2. Validate Before Submission

```dart
String? validateEmail(String email) {
  if (email.isEmpty) return 'Email is required';
  if (!email.contains('@')) return 'Invalid email format';
  return null;
}

String? validatePassword(String password) {
  if (password.isEmpty) return 'Password is required';
  if (password.length < 8) return 'Password must be at least 8 characters';
  return null;
}
```

### 3. Provide Clear Next Steps

```dart
void handleSignInError(ClerkApiException e, BuildContext context) {
  for (final error in e.errors) {
    if (error.code == 'form_identifier_not_found') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Account Not Found'),
          content: Text('Would you like to create an account?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      );
    }
  }
}
```

---

## Next Steps

- [Authentication]({{ '/guides/authentication' | relative_url }}) - Implement authentication flows
- [User Management]({{ '/guides/user-management' | relative_url }}) - Handle user-related errors
- [Session Tokens]({{ '/guides/session-tokens' | relative_url }}) - Handle token errors
- [Backend Integration]({{ '/guides/backend-integration' | relative_url }}) - Server-side error handling

      fieldErrors[fieldName] = error.message;
    }
  }

  return fieldErrors;
}

// Usage
try {
  await auth.attemptSignUp(/* ... */);
} on ClerkApiException catch (e) {
  final errors = getFieldErrors(e);

  if (errors.containsKey('email_address')) {
    print('Email error: ${errors['email_address']}');
  }
  if (errors.containsKey('password')) {
    print('Password error: ${errors['password']}');
  }
}
```

---

## Handling Errors in Flutter

### Using ClerkErrorListener

The `ClerkErrorListener` widget automatically displays errors:

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClerkErrorListener(
        child: YourWidget(),
      ),
    );
  }
}
```


