# Clerk SDK Documentation

Welcome to the comprehensive documentation for the Clerk SDK for Flutter and Dart.

## 📚 Documentation Structure

This documentation is organized into two main sections:

### 🎯 [clerk_auth](./clerk_auth/) - Core Dart SDK

The foundational authentication library that works with any Dart application.

**Start here if you're:**
- Building a Dart CLI application
- Integrating Clerk into a non-Flutter Dart project
- Understanding the core authentication logic
- Implementing custom UI or integrations

**Key Documentation:**
- [**Auth API**](./clerk_auth/auth.md) - Complete authentication methods (sign-in, sign-up, OAuth, passkeys, sessions, etc.)
- [**AuthConfig**](./clerk_auth/auth_config.md) - SDK configuration and initialization
- [**Persistor**](./clerk_auth/persistor.md) - Custom storage implementations
- [**HttpService**](./clerk_auth/http_service.md) - Custom HTTP client implementations

### 🎨 [clerk_flutter](./clerk_flutter/) - Flutter Widgets

Pre-built Flutter widgets and UI components for rapid integration.

**Start here if you're:**
- Building a Flutter mobile or web application
- Looking for pre-built authentication UI
- Wanting quick integration with minimal code
- Customizing the appearance of auth flows

**Key Documentation:**
- [**ClerkAuth**](./clerk_flutter/clerk_auth.md) - Root widget and state management
- [**ClerkAuthentication**](./clerk_flutter/clerk_authentication.md) - Complete pre-built auth UI
- [**ClerkUserButton**](./clerk_flutter/clerk_user_button.md) - User profile and session management
- [**ClerkAuthBuilder**](./clerk_flutter/clerk_auth_builder.md) - Custom UI with builder pattern
- [**ClerkTheme**](./clerk_flutter/clerk_theme.md) - Theming and customization

---

## 🚀 Quick Start

### For Flutter Applications

1. **Add dependencies** to your `pubspec.yaml`:
   ```yaml
   dependencies:
     clerk_flutter: ^0.0.14-beta
   ```

2. **Wrap your app** with `ClerkAuth`:
   ```dart
   MaterialApp(
     builder: ClerkAuth.materialAppBuilder(
       config: ClerkAuthConfig(
         publishableKey: 'pk_test_...',
       ),
     ),
     home: const HomePage(),
   )
   ```

3. **Use pre-built UI** or build custom:
   ```dart
   // Pre-built UI
   ClerkSignedOut(
     child: const ClerkAuthentication(),
   )
   
   // Custom UI
   ClerkAuthBuilder(
     signedInBuilder: (context, authState) {
       return Text('Welcome, ${authState.user?.fullName}!');
     },
     signedOutBuilder: (context, authState) {
       return const ClerkAuthentication();
     },
   )
   ```

📖 **[Full Flutter Guide →](./clerk_flutter/README.md)**

### For Dart Applications

1. **Add dependency** to your `pubspec.yaml`:
   ```yaml
   dependencies:
     clerk_auth: ^0.0.14-beta
   ```

2. **Initialize** the Auth instance:
   ```dart
   import 'package:clerk_auth/clerk_auth.dart';
   
   final auth = Auth(
     config: AuthConfig(publishableKey: 'pk_test_...'),
   );
   await auth.initialize();
   ```

3. **Authenticate** users:
   ```dart
   // Email + Password sign-in
   await auth.attemptSignIn(identifier: 'user@example.com');
   await auth.attemptSignIn(password: 'password123');
   
   // Check auth state
   if (auth.isSignedIn) {
     print('User: ${auth.user?.fullName}');
   }
   ```

📖 **[Full Dart Guide →](./clerk_auth/README.md)**

---

## 📖 Documentation Index

### clerk_auth (Core SDK)

| Document | Description |
|----------|-------------|
| [README](./clerk_auth/README.md) | Overview and getting started |
| [Auth](./clerk_auth/auth.md) | Complete API reference for authentication methods |
| [AuthConfig](./clerk_auth/auth_config.md) | Configuration options and initialization |
| [Persistor](./clerk_auth/persistor.md) | Storage interface for sessions and tokens |
| [HttpService](./clerk_auth/http_service.md) | HTTP client interface for custom networking |

### clerk_flutter (Flutter Widgets)

| Document | Description |
|----------|-------------|
| [README](./clerk_flutter/README.md) | Overview and getting started |
| [ClerkAuth](./clerk_flutter/clerk_auth.md) | Root widget and state management |
| [ClerkAuthBuilder](./clerk_flutter/clerk_auth_builder.md) | Builder pattern for custom UI |
| [ClerkAuthentication](./clerk_flutter/clerk_authentication.md) | Pre-built authentication UI |
| [ClerkUserButton](./clerk_flutter/clerk_user_button.md) | User profile button and menu |
| [ClerkOrganizationList](./clerk_flutter/clerk_organization_list.md) | Organization management UI |
| [ClerkSignedIn](./clerk_flutter/clerk_signed_in.md) | Conditional rendering (signed in) |
| [ClerkSignedOut](./clerk_flutter/clerk_signed_out.md) | Conditional rendering (signed out) |
| [ClerkErrorListener](./clerk_flutter/clerk_error_listener.md) | Error handling and display |
| [ClerkAuthConfig](./clerk_flutter/clerk_auth_config.md) | Flutter-specific configuration |
| [ClerkTheme](./clerk_flutter/clerk_theme.md) | Theming and customization |

---

## 🎯 Common Use Cases

### Authentication Flows

- **[Email + Password Sign-In](./clerk_auth/auth.md#email--password-sign-in)** - Traditional authentication
- **[Email Code Sign-In](./clerk_auth/auth.md#email-code-sign-in)** - Passwordless with verification code
- **[Phone Code Sign-In](./clerk_auth/auth.md#phone-code-sign-in)** - SMS-based authentication
- **[OAuth Sign-In](./clerk_auth/auth.md#oauth-sign-in)** - Social login (Google, Apple, GitHub, etc.)
- **[Passkey Authentication](./clerk_auth/auth.md#passkey-authentication)** - WebAuthn/FIDO2
- **[Multi-Factor Authentication](./clerk_auth/auth.md#multi-factor-authentication)** - 2FA with SMS or TOTP

### Session Management

- **[Session Handling](./clerk_auth/auth.md#session-management)** - Managing user sessions
- **[Multi-Session Support](./clerk_auth/auth.md#multi-session-management)** - Multiple accounts
- **[Token Management](./clerk_auth/auth.md#token-management)** - Access tokens and JWTs

### User Management

- **[User Profile](./clerk_auth/auth.md#user-management)** - Updating user information
- **[Email Management](./clerk_auth/auth.md#email-management)** - Adding/removing emails
- **[Phone Management](./clerk_auth/auth.md#phone-management)** - Adding/removing phone numbers
- **[External Accounts](./clerk_auth/auth.md#external-account-management)** - OAuth connections

### Organization Features

- **[Organization Management](./clerk_auth/auth.md#organization-management)** - Creating and managing orgs
- **[Organization Switching](./clerk_auth/auth.md#switching-organizations)** - Multi-org support
- **[Organization UI](./clerk_flutter/clerk_organization_list.md)** - Pre-built organization widgets

---

## 🔑 Key Concepts

### Re-entrant Authentication

The `attemptSignIn()` and `attemptSignUp()` methods are **re-entrant**, meaning you call them multiple times with different parameters to progress through the authentication flow:

```dart
// Step 1: Provide identifier
await auth.attemptSignIn(identifier: 'user@example.com');

// Step 2: Provide password
await auth.attemptSignIn(password: 'password123');

// Step 3: If 2FA enabled, provide code
await auth.attemptSignIn(code: '123456');
```

📖 **[Learn more about re-entrant flows →](./clerk_auth/auth.md#re-entrant-methods)**

### Transfer Flow

When using OAuth or ID token authentication, Clerk uses a "transfer flow" to securely complete authentication:

```dart
// 1. Initiate OAuth
final transfer = await auth.oauthSignIn(strategy: Strategy.oauth_google);

// 2. Open browser to transfer.authUrl

// 3. Complete after redirect
await auth.completeOAuthSignIn(transfer: transfer);
```

📖 **[Learn more about transfer flow →](./clerk_auth/auth.md#transfer-flow)**

---

## 💡 Best Practices

1. **Use environment variables** for publishable keys
2. **Handle errors** with `ClerkErrorListener` (Flutter) or try-catch blocks (Dart)
3. **Respect re-entrant flows** - call `attemptSignIn`/`attemptSignUp` multiple times
4. **Check auth state** before accessing user/session data
5. **Implement proper loading states** during authentication
6. **Test all authentication strategies** enabled in your Clerk Dashboard
7. **Customize themes** to match your brand (Flutter)

---

## 🆘 Support

- **Clerk Dashboard**: [https://dashboard.clerk.com](https://dashboard.clerk.com)
- **Clerk Documentation**: [https://clerk.com/docs](https://clerk.com/docs)
- **GitHub Issues**: Report bugs and request features

---

*Documentation generated for Clerk SDK version 0.0.14-beta*

