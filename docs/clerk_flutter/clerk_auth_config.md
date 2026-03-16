# ClerkAuthConfig Documentation

The `ClerkAuthConfig` class configures the Clerk authentication system for Flutter applications.

## Overview

`ClerkAuthConfig` is a Flutter-specific wrapper around the core `clerk_auth.AuthConfig` that adds Flutter-specific configuration options like loading widgets, file caching, and localizations.

## Class Definition

```dart
class ClerkAuthConfig {
  ClerkAuthConfig({
    required this.publishableKey,
    this.loading,
    this.fileCache,
    this.localizations,
    this.telemetry = true,
    this.sdkFlags,
  });
}
```

---

## Parameters

### `publishableKey`

**Type:** `String` (required)

Your Clerk publishable key from the Clerk Dashboard.

**Example:**
```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
)
```

---

### `loading`

**Type:** `Widget?`

Widget to display while Clerk is initializing. If null, shows a default loading indicator.

**Example:**
```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  loading: const Center(
    child: CircularProgressIndicator(),
  ),
)
```

---

### `fileCache`

**Type:** `ClerkFileCache?`

Custom file cache for storing remote files (avatars, logos, etc.). If null, uses default cache.

**Example:**
```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  fileCache: MyCustomFileCache(),
)
```

---

### `localizations`

**Type:** `Map<String, ClerkSdkLocalizations>?`

Custom localizations for different locales. If null, uses default English localizations.

**Example:**
```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  localizations: {
    'en': ClerkSdkLocalizationsEn(),
    'es': MySpanishLocalizations(),
    'fr': MyFrenchLocalizations(),
  },
)
```

---

### `telemetry`

**Type:** `bool`  
**Default:** `true`

Whether to enable telemetry. Set to `false` to disable usage tracking.

**Example:**
```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  telemetry: false, // Disable telemetry
)
```

---

### `sdkFlags`

**Type:** `SdkFlags?`

Advanced SDK flags for experimental features. Generally not needed.

---

## Complete Examples

### Basic Configuration

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

### With Custom Loading Widget

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  loading: Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', width: 100),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          const Text('Loading...'),
        ],
      ),
    ),
  ),
)
```

### With Localizations

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  localizations: {
    'en': ClerkSdkLocalizationsEn(),
    'es': ClerkSdkLocalizationsEs(),
  },
)
```

### Production Configuration

```dart
ClerkAuthConfig(
  publishableKey: const String.fromEnvironment('CLERK_PUBLISHABLE_KEY'),
  telemetry: true,
  loading: const SplashScreen(),
)
```

### Development Configuration

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_...',
  telemetry: false, // Disable in development
  loading: const Center(
    child: Text('Loading Clerk...'),
  ),
)
```

---

## Environment Variables

It's recommended to use environment variables for your publishable key:

```dart
// Run with: flutter run --dart-define=CLERK_PUBLISHABLE_KEY=pk_test_...
ClerkAuthConfig(
  publishableKey: const String.fromEnvironment(
    'CLERK_PUBLISHABLE_KEY',
    defaultValue: 'pk_test_fallback',
  ),
)
```

---

## Best Practices

1. **Use environment variables**: Don't hardcode keys in source code
2. **Customize loading**: Provide a branded loading experience
3. **Enable telemetry in production**: Helps Clerk improve the SDK
4. **Disable telemetry in development**: Avoid polluting analytics
5. **Provide localizations**: Support your users' languages

---

## Related Documentation

- [ClerkAuth](clerk_auth.md)
- [AuthConfig (clerk_auth)](../clerk_auth/auth_config.md)

---

*Generated for clerk_flutter version 0.0.14-beta*

