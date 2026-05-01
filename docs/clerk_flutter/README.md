# Clerk Flutter Widgets Documentation

Welcome to the comprehensive documentation for the `clerk_flutter` package widgets. This documentation covers all public widgets and provides detailed usage examples.

## Documentation Index

### Core Widgets

1. **[ClerkAuth](clerk_auth.md)** - Root widget for Clerk authentication
   - Initialization and configuration
   - Access to authentication state
   - Theme and localization support

2. **[ClerkAuthBuilder](clerk_auth_builder.md)** - Conditional rendering based on auth state
   - Build different UI for signed-in vs signed-out users
   - Flexible builder pattern

3. **[ClerkSignedIn](clerk_signed_in.md)** - Show content only when signed in
   - Simple conditional widget
   - Automatic state management

4. **[ClerkSignedOut](clerk_signed_out.md)** - Show content only when signed out
   - Complement to ClerkSignedIn
   - Automatic state management

5. **[ClerkErrorListener](clerk_error_listener.md)** - Handle authentication errors
   - Automatic error display
   - Custom error handling

### Authentication Widgets

6. **[ClerkAuthentication](clerk_authentication.md)** - Complete sign-in/sign-up UI
   - Pre-built authentication flow
   - Supports all authentication strategies
   - Customizable appearance

### User Widgets

7. **[ClerkUserButton](clerk_user_button.md)** - User profile button
   - Multi-session management
   - User profile access
   - Sign-out functionality

### Organization Widgets

8. **[ClerkOrganizationList](clerk_organization_list.md)** - Organization management
   - List user's organizations
   - Switch between organizations
   - Create new organizations

### Configuration & Theming

9. **[ClerkAuthConfig](clerk_auth_config.md)** - Flutter-specific configuration
   - Localization settings
   - Deep linking support
   - Custom loading widgets

10. **[ClerkTheme](clerk_theme.md)** - Theming and styling
    - Light and dark themes
    - Custom colors and styles
    - Theme customization

---

## Quick Start

### Basic Setup

```dart
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      builder: ClerkAuth.materialAppBuilder(
        config: ClerkAuthConfig(
          publishableKey: 'pk_test_...',
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ClerkAuthBuilder(
        signedInBuilder: (context, authState) {
          return Center(
            child: Text('Welcome, ${authState.user?.fullName}!'),
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

---

## Key Concepts

### Widget Hierarchy

The typical widget hierarchy for a Clerk Flutter app:

```
MaterialApp
  └─ ClerkAuth (via builder)
      └─ ClerkErrorListener
          └─ Your App Widgets
              ├─ ClerkSignedIn
              │   └─ Protected Content
              ├─ ClerkSignedOut
              │   └─ ClerkAuthentication
              └─ ClerkAuthBuilder
                  ├─ signedInBuilder
                  └─ signedOutBuilder
```

### State Management

All Clerk widgets automatically rebuild when authentication state changes. Access the current state using:

```dart
// Get auth state with rebuild on change
final authState = ClerkAuth.of(context);

// Get auth state without rebuild
final authState = ClerkAuth.of(context, listen: false);

// Get just the user
final user = ClerkAuth.userOf(context);

// Get just the session
final session = ClerkAuth.sessionOf(context);
```

### Conditional Rendering

Three ways to conditionally render based on auth state:

**1. ClerkSignedIn / ClerkSignedOut**
```dart
Column(
  children: [
    ClerkSignedIn(
      child: Text('You are signed in!'),
    ),
    ClerkSignedOut(
      child: Text('Please sign in'),
    ),
  ],
)
```

**2. ClerkAuthBuilder**
```dart
ClerkAuthBuilder(
  signedInBuilder: (context, authState) {
    return Text('Hello, ${authState.user?.firstName}!');
  },
  signedOutBuilder: (context, authState) {
    return const ClerkAuthentication();
  },
)
```

**3. Manual Check**
```dart
final authState = ClerkAuth.of(context);
if (authState.isSignedIn) {
  return Text('Signed in');
} else {
  return Text('Signed out');
}
```

---

## Common Use Cases

### Complete Authentication Flow

```dart
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClerkAuthBuilder(
          signedInBuilder: (context, authState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${authState.user?.fullName}!'),
                const SizedBox(height: 20),
                const ClerkUserButton(),
              ],
            );
          },
          signedOutBuilder: (context, authState) {
            return const ClerkAuthentication();
          },
        ),
      ),
    );
  }
}
```

### Protected Routes

```dart
class ProtectedPage extends StatelessWidget {
  const ProtectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkSignedIn(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Protected Page'),
          actions: const [ClerkUserButton()],
        ),
        body: const Center(
          child: Text('This content is only visible to signed-in users'),
        ),
      ),
    );
  }
}
```

### Multi-Session Support

```dart
class MultiSessionExample extends StatelessWidget {
  const MultiSessionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Session'),
        actions: const [
          ClerkUserButton(
            showName: true,
          ),
        ],
      ),
      body: const Center(
        child: Text('Switch between accounts using the user button'),
      ),
    );
  }
}
```

### Organization Management

```dart
class OrganizationPage extends StatelessWidget {
  const OrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizations'),
      ),
      body: const ClerkOrganizationList(),
    );
  }
}
```

### Custom Error Handling

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ClerkAuth(
          config: ClerkAuthConfig(
            publishableKey: 'pk_test_...',
          ),
          child: ClerkErrorListener(
            handler: (context, error) {
              // Custom error handling
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text(error.message),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: child!,
          ),
        );
      },
      home: const HomePage(),
    );
  }
}
```

---

## Theming

### Using Built-in Themes

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: [ClerkThemeExtension.light],
  ),
  darkTheme: ThemeData.dark().copyWith(
    extensions: [ClerkThemeExtension.dark],
  ),
  // ... rest of app
)
```

### Custom Theme

```dart
final customTheme = ClerkThemeExtension(
  colors: ClerkThemeColors(
    background: Colors.white,
    altBackground: Colors.grey[100]!,
    borderSide: Colors.grey[300]!,
    text: Colors.black87,
    icon: Colors.grey[600]!,
    lightweightText: Colors.grey[500]!,
    error: Colors.red,
    accent: Colors.blue,
  ),
);

MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: [customTheme],
  ),
  // ... rest of app
)
```

---

## Localization

### Adding Custom Localizations

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  localizations: {
    'en': ClerkSdkLocalizationsEn(),
    'es': MySpanishLocalizations(),
  },
  fallbackLocalization: ClerkSdkLocalizationsEn(),
)
```

### Accessing Localizations

```dart
final l10ns = ClerkAuth.localizationsOf(context);
Text(l10ns.signIn);
Text(l10ns.signUp);
```

---

## Deep Linking

### Setup Deep Linking for OAuth

```dart
import 'package:app_links/app_links.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appLinks = AppLinks();
  late final Stream<Uri> _deepLinkStream;

  @override
  void initState() {
    super.initState();
    _deepLinkStream = _appLinks.uriLinkStream;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ClerkAuth(
          config: ClerkAuthConfig(
            publishableKey: 'pk_test_...',
            deepLinkStream: _deepLinkStream,
            redirectionGenerator: (context, strategy) {
              return Uri.parse('myapp://oauth-callback');
            },
          ),
          child: ClerkErrorListener(child: child!),
        );
      },
      home: const HomePage(),
    );
  }
}
```

---

## Best Practices

1. **Always wrap your app with ClerkAuth**: Use `ClerkAuth.materialAppBuilder()` or wrap manually
2. **Include ClerkErrorListener**: Place it below ClerkAuth to handle errors automatically
3. **Use conditional widgets**: Prefer `ClerkSignedIn`/`ClerkSignedOut` for simple cases
4. **Access state efficiently**: Use `listen: false` when you don't need rebuilds
5. **Customize themes**: Override `ClerkThemeExtension` to match your app's design
6. **Handle deep links**: Set up deep linking for OAuth flows
7. **Test with different states**: Test your UI in signed-in, signed-out, and loading states

---

## Testing

### Unit Testing

```dart
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows sign-in UI when signed out', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) {
          return ClerkAuth(
            config: ClerkAuthConfig(
              publishableKey: 'pk_test_...',
            ),
            child: child!,
          );
        },
        home: const Scaffold(
          body: ClerkAuthBuilder(
            signedOutBuilder: (context, authState) {
              return const Text('Sign In');
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Sign In'), findsOneWidget);
  });
}
```

---

## Additional Resources

- [Clerk Dashboard](https://dashboard.clerk.com/)
- [Clerk API Reference](https://clerk.com/docs/reference/backend-api)
- [Flutter SDK Guide](https://clerk.com/docs/quickstarts/flutter)
- [clerk_flutter on pub.dev](https://pub.dev/packages/clerk_flutter)
- [clerk_auth Documentation](../clerk_auth/README.md)

---

## Version

*Documentation generated for clerk_flutter version 0.0.14-beta*

---

## Contributing

Found an issue or want to improve the documentation? Please open an issue or pull request on the [GitHub repository](https://github.com/clerk/clerk-sdk-flutter).

