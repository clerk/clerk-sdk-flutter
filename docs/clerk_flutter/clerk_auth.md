# ClerkAuth Widget Documentation

The `ClerkAuth` widget is the root control widget that initializes the Clerk authentication system for your Flutter application.

## Overview

`ClerkAuth` must be placed at the root of your widget tree (or near it) to provide authentication state to all descendant widgets. It manages the `ClerkAuthState` object and makes it available throughout your app via `InheritedWidget`.

## Class Definition

```dart
class ClerkAuth extends StatefulWidget {
  const ClerkAuth({
    super.key,
    required this.child,
    ClerkAuthConfig? config,
    this.persistor,
    this.httpService,
    this.authState,
  });
}
```

---

## Constructors

### Default Constructor

```dart
const ClerkAuth({
  super.key,
  required this.child,
  ClerkAuthConfig? config,
  this.persistor,
  this.httpService,
  this.authState,
})
```

**Parameters:**
- `child`: The widget tree to wrap
- `config`: Configuration for Clerk authentication (required if `authState` is null)
- `persistor`: Optional override for the default persistor
- `httpService`: Optional override for the default HTTP service
- `authState`: Optional pre-created `ClerkAuthState` (required if `config` is null)

**Note:** You must provide either `config` OR `authState`, but not both.

---

### MaterialApp Builder

```dart
static TransitionBuilder materialAppBuilder({
  required ClerkAuthConfig config,
  Stream<Uri>? deepLinkStream,
})
```

Convenience method for use with `MaterialApp.builder`.

**Parameters:**
- `config`: Configuration for Clerk authentication
- `deepLinkStream`: Optional stream of deep links for OAuth

**Example:**
```dart
MaterialApp(
  title: 'My App',
  builder: ClerkAuth.materialAppBuilder(
    config: ClerkAuthConfig(
      publishableKey: 'pk_test_...',
    ),
  ),
  home: const HomePage(),
)
```

---

## Static Methods

### `of()`

Get the nearest `ClerkAuthState` from the widget tree.

```dart
static ClerkAuthState of(BuildContext context, {bool listen = true})
```

**Parameters:**
- `context`: The build context
- `listen`: Whether to rebuild when auth state changes (default: `true`)

**Returns:** `ClerkAuthState`

**Example:**
```dart
// With rebuild on change
final authState = ClerkAuth.of(context);

// Without rebuild
final authState = ClerkAuth.of(context, listen: false);
```

---

### `userOf()`

Get the current user from the widget tree.

```dart
static User? userOf(BuildContext context)
```

**Returns:** The current `User` or `null` if not signed in

**Example:**
```dart
final user = ClerkAuth.userOf(context);
if (user != null) {
  print('User: ${user.fullName}');
}
```

---

### `sessionOf()`

Get the current session from the widget tree.

```dart
static Session? sessionOf(BuildContext context)
```

**Returns:** The current `Session` or `null` if not signed in

**Example:**
```dart
final session = ClerkAuth.sessionOf(context);
if (session != null) {
  print('Session ID: ${session.id}');
}
```

---

### `localizationsOf()`

Get the localizations for the current locale.

```dart
static ClerkSdkLocalizations localizationsOf(BuildContext context)
```

**Returns:** `ClerkSdkLocalizations` for the current locale

**Example:**
```dart
final l10ns = ClerkAuth.localizationsOf(context);
Text(l10ns.signIn);
Text(l10ns.signUp);
```

---

### `displayConfigOf()`

Get the display configuration from the environment.

```dart
static DisplayConfig displayConfigOf(BuildContext context)
```

**Returns:** `DisplayConfig` containing application name and branding

**Example:**
```dart
final display = ClerkAuth.displayConfigOf(context);
Text('Welcome to ${display.applicationName}');
```

---

### `errorStreamOf()`

Get the stream of Clerk errors.

```dart
static Stream<ClerkError> errorStreamOf(BuildContext context)
```

**Returns:** Stream of `ClerkError` objects

**Example:**
```dart
ClerkAuth.errorStreamOf(context).listen((error) {
  print('Error: ${error.message}');
});
```

---

### `fileCacheOf()`

Get the file cache from the configuration.

```dart
static ClerkFileCache fileCacheOf(BuildContext context)
```

**Returns:** `ClerkFileCache` for caching remote files

---

### `themeExtensionOf()`

Get the Clerk theme extension from the current theme.

```dart
static ClerkThemeExtension themeExtensionOf(BuildContext context)
```

**Returns:** `ClerkThemeExtension` with colors and styles

**Example:**
```dart
final theme = ClerkAuth.themeExtensionOf(context);
Container(
  color: theme.colors.background,
  child: Text(
    'Hello',
    style: theme.styles.heading,
  ),
)
```

---

## Complete Examples

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
```

### Manual Setup

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
          child: ClerkErrorListener(child: child!),
        );
      },
      home: const HomePage(),
    );
  }
}
```

### With Custom Persistor

```dart
import 'package:clerk_auth/clerk_auth.dart' as clerk;

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
          persistor: clerk.Persistor.none, // No persistence
          child: ClerkErrorListener(child: child!),
        );
      },
      home: const HomePage(),
    );
  }
}
```

### Accessing Auth State

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get auth state with rebuild
    final authState = ClerkAuth.of(context);

    // Get user directly
    final user = ClerkAuth.userOf(context);

    // Get session directly
    final session = ClerkAuth.sessionOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(user != null ? 'Welcome ${user.firstName}' : 'Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (authState.isSignedIn)
              Text('Signed in as ${user?.emailAddress}')
            else
              const Text('Not signed in'),
            const SizedBox(height: 20),
            if (session != null)
              Text('Session expires: ${session.expireAt}'),
          ],
        ),
      ),
    );
  }
}
```

### Using Localizations

```dart
class LocalizedWidget extends StatelessWidget {
  const LocalizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);

    return Column(
      children: [
        Text(l10ns.signIn),
        Text(l10ns.signUp),
        Text(l10ns.emailAddress),
        Text(l10ns.password),
      ],
    );
  }
}
```

### Using Theme

```dart
class ThemedWidget extends StatelessWidget {
  const ThemedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ClerkAuth.themeExtensionOf(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background,
        border: Border.all(color: theme.colors.borderSide),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Heading',
            style: theme.styles.heading,
          ),
          Text(
            'Subheading',
            style: theme.styles.subheading,
          ),
          Text(
            'Body text',
            style: theme.styles.text,
          ),
        ],
      ),
    );
  }
}
```

---

## Best Practices

1. **Place ClerkAuth at the root**: Wrap your entire app or use `materialAppBuilder()`
2. **Include ClerkErrorListener**: Always include error handling below ClerkAuth
3. **Use listen: false when appropriate**: Avoid unnecessary rebuilds by setting `listen: false` when you don't need updates
4. **Access state efficiently**: Use specific getters like `userOf()` when you only need one piece of data
5. **Handle loading state**: The config's `loading` widget is shown while initializing
6. **Don't create multiple instances**: Only create one ClerkAuth widget per app

---

## Common Patterns

### Conditional Rendering Based on Auth State

```dart
class ConditionalContent extends StatelessWidget {
  const ConditionalContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);

    if (authState.isNotAvailable) {
      return const CircularProgressIndicator();
    }

    if (authState.isSignedIn) {
      return const SignedInContent();
    }

    return const SignedOutContent();
  }
}
```

### Listening to Errors

```dart
class ErrorAwareWidget extends StatefulWidget {
  const ErrorAwareWidget({super.key});

  @override
  State<ErrorAwareWidget> createState() => _ErrorAwareWidgetState();
}

class _ErrorAwareWidgetState extends State<ErrorAwareWidget> {
  StreamSubscription? _errorSub;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _errorSub?.cancel();
    _errorSub = ClerkAuth.errorStreamOf(context).listen((error) {
      // Handle error
      print('Error: ${error.message}');
    });
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

---

## Related Documentation

- [ClerkAuthConfig](clerk_auth_config.md)
- [ClerkAuthBuilder](clerk_auth_builder.md)
- [ClerkErrorListener](clerk_error_listener.md)
- [ClerkTheme](clerk_theme.md)
- [Auth (clerk_auth)](../clerk_auth/auth.md)

---

*Generated for clerk_flutter version 0.0.14-beta*

