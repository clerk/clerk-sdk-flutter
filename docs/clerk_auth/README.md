# Clerk Auth Documentation

Welcome to the comprehensive documentation for the `clerk_auth` package. This documentation covers all public APIs and provides detailed usage examples.

## Documentation Index

### Core Classes

1. **[Auth](auth.md)** - The main authentication class
   - All authentication methods (sign in, sign up, OAuth, passkeys)
   - Session management
   - User management
   - Organization management
   - **Special focus on re-entrant methods**: `attemptSignIn()` and `attemptSignUp()`

2. **[AuthConfig](auth_config.md)** - Configuration for the Auth class
   - Required and optional parameters
   - Polling and refresh settings
   - Telemetry configuration
   - Complete configuration examples

3. **[Persistor](persistor.md)** - Persistence interface for authentication state
   - Abstract interface definition
   - Built-in implementations (`Persistor.none`, `DefaultPersistor`)
   - Custom implementation examples
   - Storage keys used by Clerk

4. **[HttpService](http_service.md)** - HTTP communication interface
   - Abstract interface definition
   - Default implementation
   - Custom implementation examples (logging, retry, mocking)
   - HTTP methods and request handling

---

## Quick Start

### Basic Setup

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // Create configuration
  final config = AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: DefaultPersistor(
      getCacheDirectory: getApplicationDocumentsDirectory,
    ),
  );
  
  // Create and initialize Auth
  final auth = Auth(config: config);
  await auth.initialize();
  
  // Use auth for authentication
  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: 'user@example.com',
    password: 'password123',
  );
  
  if (auth.isSignedIn) {
    print('Welcome, ${auth.user?.fullName}!');
  }
}
```

---

## Key Concepts

### Re-entrant Authentication Methods

The `attemptSignIn()` and `attemptSignUp()` methods are designed to be **re-entrant**, meaning they can be called multiple times with different parameters as the user progresses through the authentication flow.

**Example: Multi-step Sign In**
```dart
// Step 1: Start with email
await auth.attemptSignIn(
  strategy: Strategy.emailCode,
  identifier: 'user@example.com',
);

// Step 2: Submit verification code
await auth.attemptSignIn(
  strategy: Strategy.emailCode,
  code: '123456',
);

// Step 3: If 2FA required, submit 2FA code
if (auth.signIn?.needsSecondFactor == true) {
  await auth.attemptSignIn(
    strategy: Strategy.totp,
    code: '654321',
  );
}
```

### Transfer Flow

When using OAuth or ID token authentication, users may need to "transfer" between sign-in and sign-up flows:

```dart
// Try sign in with Apple
await auth.idTokenSignIn(
  provider: IdTokenProvider.apple,
  idToken: credential.identityToken!,
);

// If user doesn't exist, transfer to sign up
if (auth.signIn?.isTransferable == true) {
  await auth.transfer();
}
```

### State Management

The Auth class maintains state through the `Client` object:
- `client.signIn` - Active sign-in flow
- `client.signUp` - Active sign-up flow
- `client.sessions` - Active sessions
- `session.user` - Current user

---

## Common Use Cases

### Email + Password Authentication

```dart
// Sign up
await auth.attemptSignUp(
  strategy: Strategy.emailCode,
  emailAddress: 'user@example.com',
  password: 'SecurePass123!',
  passwordConfirmation: 'SecurePass123!',
  firstName: 'John',
  lastName: 'Doe',
);

// Verify email
await auth.attemptSignUp(
  strategy: Strategy.emailCode,
  code: '123456',
);

// Sign in
await auth.attemptSignIn(
  strategy: Strategy.password,
  identifier: 'user@example.com',
  password: 'SecurePass123!',
);
```

### OAuth Authentication

```dart
// Google Sign In
await auth.oauthSignIn(
  strategy: Strategy.oauthGoogle,
  redirect: Uri.parse('myapp://oauth-callback'),
);

// After redirect, complete sign in
await auth.completeOAuthSignIn(token: rotatingTokenNonce);
```

### Passkey Authentication

```dart
// Create passkey
final passkey = await auth.createPasskey();
// ... use passkey library to register ...
await auth.attemptPasskeyVerification(passkey!, credentialJson);

// Sign in with passkey
await auth.attemptSignIn(strategy: Strategy.passkey);
// ... use passkey library to authenticate ...
await auth.attemptSignIn(
  strategy: Strategy.passkey,
  passkeyCredential: credentialJson,
);
```

### Session Management

```dart
// Get session token
final token = await auth.sessionToken();
print('JWT: ${token.jwt}');

// Listen to token updates
auth.sessionTokenStream.listen((token) {
  // Update your API client with new token
});

// Switch sessions
await auth.activate(anotherSession);

// Sign out
await auth.signOut();
```

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                         Auth                            │
│  - Main authentication logic                            │
│  - State management                                     │
│  - Public API                                           │
└─────────────────┬───────────────────────────────────────┘
                  │
                  │ uses
                  │
    ┌─────────────┴─────────────┐
    │                           │
    ▼                           ▼
┌─────────────┐           ┌─────────────┐
│ AuthConfig  │           │     Api     │
│             │           │  (internal) │
└──────┬──────┘           └─────────────┘
       │
       │ contains
       │
   ┌───┴────┬──────────┐
   │        │          │
   ▼        ▼          ▼
┌──────┐ ┌────────┐ ┌─────────────┐
│Persis│ │  Http  │ │   Retry     │
│ tor  │ │Service │ │  Options    │
└──────┘ └────────┘ └─────────────┘
```

---

## Best Practices

1. **Always initialize before use**: Call `auth.initialize()` before any other operations
2. **Use appropriate persistor**: `DefaultPersistor` for production, `Persistor.none` for testing
3. **Handle errors gracefully**: Wrap auth calls in try-catch or override `handleError()`
4. **Leverage re-entrant methods**: Call `attemptSignIn()`/`attemptSignUp()` multiple times as needed
5. **Check transfer status**: After OAuth/ID token auth, check `isTransferable` and call `transfer()`
6. **Clean up resources**: Call `auth.terminate()` when disposing
7. **Monitor session tokens**: Use `sessionTokenStream` to keep tokens fresh

---

## Testing

### Unit Testing

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('sign in test', () async {
    final config = AuthConfig(
      publishableKey: 'pk_test_...',
      persistor: Persistor.none,
      sessionTokenPolling: false,
      clientRefreshPeriod: Duration.zero,
      telemetryPeriod: Duration.zero,
    );
    
    final auth = Auth(config: config);
    await auth.initialize();
    
    // Test authentication flows
    
    auth.terminate();
  });
}
```

---

## Additional Resources

- [Clerk Dashboard](https://dashboard.clerk.com/)
- [Clerk API Reference](https://clerk.com/docs/reference/backend-api)
- [Flutter SDK Guide](https://clerk.com/docs/quickstarts/flutter)
- [clerk_auth on pub.dev](https://pub.dev/packages/clerk_auth)

---

## Version

*Documentation generated for clerk_auth version 0.0.14-beta*

---

## Contributing

Found an issue or want to improve the documentation? Please open an issue or pull request on the [GitHub repository](https://github.com/clerk/clerk-sdk-flutter).

