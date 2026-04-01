# ClerkAuthentication Widget Documentation

The `ClerkAuthentication` widget renders a complete, pre-built UI for signing users in or up.

## Overview

`ClerkAuthentication` provides a full-featured authentication interface that includes:
- Sign-in and sign-up forms
- OAuth provider buttons
- Email/password authentication
- Phone number authentication
- Email/SMS verification codes
- Password reset
- Automatic switching between sign-in and sign-up modes

The functionality is controlled by your Clerk Dashboard settings (enabled strategies, required fields, etc.).

## Class Definition

```dart
class ClerkAuthentication extends StatefulWidget {
  const ClerkAuthentication({super.key});
}
```

---

## Features

- **Automatic mode switching**: Switches between sign-in and sign-up based on user actions
- **OAuth integration**: Displays configured OAuth providers (Google, Apple, GitHub, etc.)
- **Multi-factor authentication**: Supports 2FA when enabled
- **Responsive design**: Adapts to different screen sizes
- **Themed**: Respects `ClerkThemeExtension` from your app theme
- **Localized**: Uses `ClerkSdkLocalizations` for translations

---

## Complete Examples

### Basic Usage

```dart
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClerkSignedOut(
          child: const ClerkAuthentication(),
        ),
      ),
    );
  }
}
```

### Full-Screen Authentication

```dart
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ClerkAuthentication(),
          ),
        ),
      ),
    );
  }
}
```

### With Background

```dart
class StyledAuthPage extends StatelessWidget {
  const StyledAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade400],
          ),
        ),
        child: const Center(
          child: Card(
            margin: EdgeInsets.all(32),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: ClerkAuthentication(),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Conditional Rendering

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ClerkAuthBuilder(
        signedInBuilder: (context, authState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${authState.user?.fullName}!'),
                const SizedBox(height: 20),
                const ClerkUserButton(),
              ],
            ),
          );
        },
        signedOutBuilder: (context, authState) {
          return const Center(
            child: ClerkAuthentication(),
          );
        },
      ),
    );
  }
}
```

### In a Dialog

```dart
void showAuthDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: const ClerkAuthentication(),
      ),
    ),
  );
}
```

---

## Supported Authentication Strategies

The widget automatically displays UI for strategies enabled in your Clerk Dashboard:

**First-factor strategies:**
- Email + Password
- Email + Verification Code
- Phone + Verification Code
- Username + Password
- OAuth providers (Google, Apple, Facebook, GitHub, etc.)
- Passkeys (when supported)

**Second-factor strategies:**
- SMS Code
- TOTP (Authenticator app)
- Backup codes

---

## Customization

### Theme Customization

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: [
      ClerkThemeExtension(
        colors: ClerkThemeColors(
          background: Colors.white,
          altBackground: Colors.grey[100]!,
          borderSide: Colors.grey[300]!,
          text: Colors.black87,
          icon: Colors.grey[600]!,
          lightweightText: Colors.grey[500]!,
          error: Colors.red,
          accent: Colors.blue, // Primary button color
        ),
      ),
    ],
  ),
  // ... rest of app
)
```

### Localization

The widget uses your configured localizations:

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  localizations: {
    'en': ClerkSdkLocalizationsEn(),
    'es': MySpanishLocalizations(),
  },
)
```

---

## Behavior

### Sign-In Flow

1. User enters identifier (email/phone/username)
2. User enters password or requests verification code
3. If verification code: user enters code
4. If 2FA enabled: user completes second factor
5. User is signed in

### Sign-Up Flow

1. User enters required fields (email, password, name, etc.)
2. User verifies email/phone with code
3. User is signed up and signed in

### Mode Switching

- "Don't have an account? Sign up" link switches to sign-up
- "Already have an account? Sign in" link switches to sign-in
- Automatic switching based on auth state

---

## Best Practices

1. **Use in signed-out state**: Wrap with `ClerkSignedOut` or use in `signedOutBuilder`
2. **Provide enough space**: The widget needs vertical space; use `SingleChildScrollView` if needed
3. **Configure in Dashboard**: Enable/disable strategies in your Clerk Dashboard
4. **Test all flows**: Test sign-in, sign-up, password reset, and 2FA
5. **Handle errors**: Use `ClerkErrorListener` to display authentication errors

---

## Common Patterns

### Modal Authentication

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ClerkAuthBuilder(
          signedOutBuilder: (context, authState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.9,
                      builder: (context, scrollController) {
                        return const ClerkAuthentication();
                      },
                    ),
                  );
                },
                child: const Text('Sign In'),
              ),
            );
          },
          signedInBuilder: (context, authState) {
            return Center(
              child: Text('Welcome, ${authState.user?.fullName}!'),
            );
          },
        ),
      ),
    );
  }
}
```

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [ClerkAuthBuilder](clerk_auth_builder.md)
- [ClerkSignedOut](clerk_signed_out.md)
- [ClerkTheme](clerk_theme.md)
- [Auth (clerk_auth)](../clerk_auth/auth.md)

---

*Generated for clerk_flutter version 0.0.14-beta*

