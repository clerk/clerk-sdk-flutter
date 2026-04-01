# AuthConfig Documentation

This document provides comprehensive documentation for the `AuthConfig` class from `clerk_auth/lib/src/clerk_auth/auth_config.dart`.

## Overview

The `AuthConfig` class holds all configurable items required for the `Auth` class, with sensible defaults. It is the primary configuration object for initializing Clerk authentication in your application.

## Class Definition

```dart
class AuthConfig {
  const AuthConfig({
    required this.publishableKey,
    required this.persistor,
    this.flags = const SdkFlags(),
    this.sessionTokenPolling = true,
    this.retryOptions = const RetryOptions(),
    this.defaultSessionTokenTemplate,
    LocalesLookup? localesLookup,
    bool? isTestMode,
    String? telemetryEndpoint,
    Duration? telemetryPeriod,
    Duration? clientRefreshPeriod,
    Duration? httpConnectionTimeout,
    HttpService? httpService,
  });
}
```

---

## Required Parameters

### `publishableKey`

**Type:** `String`

The publishable key from your Clerk dashboard that identifies your auth service account.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
);
```

**Where to find it:**
1. Go to [Clerk Dashboard](https://dashboard.clerk.com/)
2. Select your application
3. Navigate to API Keys
4. Copy the "Publishable Key"

---

### `persistor`

**Type:** `Persistor`

The persistor used for storing authentication state between app sessions.

**Example:**
```dart
// Using DefaultPersistor
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: DefaultPersistor(
    getCacheDirectory: () => getApplicationDocumentsDirectory(),
  ),
);

// Using no persistence (testing only)
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: Persistor.none,
);
```

**See also:** [Persistor Documentation](persistor.md)

---

## Optional Parameters

### `flags`

**Type:** `SdkFlags`  
**Default:** `const SdkFlags()`

Flags used to affect SDK behavior. Extended by `clerk_flutter` for Flutter-specific flags.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  flags: const SdkFlags(),
);
```

---

### `sessionTokenPolling`

**Type:** `bool`  
**Default:** `true`

Whether to regularly poll for new session tokens. When enabled, the SDK automatically refreshes session tokens before they expire.

**Example:**
```dart
// Enable automatic token refresh (default)
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  sessionTokenPolling: true,
);

// Disable automatic token refresh
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  sessionTokenPolling: false,
);
```

**When to disable:**
- Testing scenarios where you want manual control
- Applications that don't need long-lived sessions

---

### `retryOptions`

**Type:** `RetryOptions`  
**Default:** `const RetryOptions()`

Options for retrying failed HTTP requests. Uses the `retry` package.

**Example:**
```dart
import 'package:retry/retry.dart';

final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  retryOptions: RetryOptions(
    maxAttempts: 5,
    delayFactor: Duration(milliseconds: 200),
    maxDelay: Duration(seconds: 10),
  ),
);
```

**RetryOptions properties:**
- `maxAttempts`: Maximum number of retry attempts (default: 8)
- `delayFactor`: Initial delay between retries (default: 200ms)
- `maxDelay`: Maximum delay between retries (default: 30s)
- `randomizationFactor`: Randomization factor for delays (default: 0.25)

---

### `defaultSessionTokenTemplate`

**Type:** `String?`  
**Default:** `null`

Default template name for session token retrieval. Useful when using custom JWT templates.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  defaultSessionTokenTemplate: 'my_custom_template',
);
```

**Use case:**
When you have custom claims or need specific JWT structure for your backend API.

---

### `localesLookup`

**Type:** `LocalesLookup` (function: `List<String> Function()`)  
**Default:** `Auth.defaultLocalesLookup` (returns `['en']`)

Function to return the current user's locale preferences for translations.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  localesLookup: () {
    // Return user's preferred locales
    return ['es', 'en']; // Spanish first, English fallback
  },
);
```

---

### `isTestMode`

**Type:** `bool`  
**Default:** `false`

Whether the SDK is running in test mode.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  isTestMode: true,
);
```

---

### `telemetryEndpoint`

**Type:** `String`  
**Default:** `'https://clerk-telemetry.com/v1/event'`

The endpoint to send telemetry data to.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  telemetryEndpoint: 'https://my-custom-telemetry.com/events',
);
```

---

### `telemetryPeriod`

**Type:** `Duration`  
**Default:** `Duration(milliseconds: 29300)` (~30 seconds)

The duration between sends of telemetry data. Set to `Duration.zero` to disable telemetry.

**Example:**
```dart
// Custom telemetry interval
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  telemetryPeriod: Duration(minutes: 1),
);

// Disable telemetry
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  telemetryPeriod: Duration.zero,
);
```

**Note:** The default is slightly offset from 30s to avoid repeated clashes with other regular tasks.

---

### `clientRefreshPeriod`

**Type:** `Duration`
**Default:** `Duration(milliseconds: 9700)` (~10 seconds)

The duration between calls to refresh the client object. Set to `Duration.zero` to disable automatic client refresh.

**Example:**
```dart
// Custom refresh interval
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  clientRefreshPeriod: Duration(seconds: 30),
);

// Disable automatic refresh
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  clientRefreshPeriod: Duration.zero,
);
```

**Note:** The default is slightly offset from 10s to avoid repeated clashes with other regular tasks.

**When to adjust:**
- Increase for battery-sensitive applications
- Decrease for applications requiring real-time updates
- Disable for complete manual control

---

### `httpConnectionTimeout`

**Type:** `Duration`
**Default:** `Duration(milliseconds: 500)`

The duration to wait for HTTP connectivity before timing out in a connectivity test.

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  httpConnectionTimeout: Duration(seconds: 2),
);
```

---

### `httpService`

**Type:** `HttpService`
**Default:** `DefaultHttpService()`

The HTTP service used to communicate with the Clerk backend.

**Example:**
```dart
// Using default HTTP service
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  httpService: DefaultHttpService(),
);

// Using custom HTTP service
class MyHttpService implements HttpService {
  // ... implement interface
}

final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
  httpService: MyHttpService(),
);
```

**See also:** [HttpService Documentation](http_service.md)

---

## Methods

### `initialize()`

Initializes the configuration by initializing the persistor and HTTP service.

```dart
Future<void> initialize()
```

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: myPersistor,
);
await config.initialize();
```

**Note:** This is typically called automatically by `Auth.initialize()`.

---

### `terminate()`

Terminates the configuration by terminating the HTTP service and persistor.

```dart
void terminate()
```

**Example:**
```dart
config.terminate();
```

**Note:** This is typically called automatically by `Auth.terminate()`.

---

## Complete Examples

### Basic Configuration

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:path_provider/path_provider.dart';

Future<AuthConfig> createBasicConfig() async {
  return AuthConfig(
    publishableKey: 'pk_test_Y2xlcmsuZXhhbXBsZS5jb20k',
    persistor: DefaultPersistor(
      getCacheDirectory: getApplicationDocumentsDirectory,
    ),
  );
}
```

### Production Configuration

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retry/retry.dart';

Future<AuthConfig> createProductionConfig() async {
  return AuthConfig(
    publishableKey: 'pk_live_...',
    persistor: DefaultPersistor(
      getCacheDirectory: getApplicationDocumentsDirectory,
    ),
    sessionTokenPolling: true,
    retryOptions: RetryOptions(
      maxAttempts: 5,
      delayFactor: Duration(milliseconds: 200),
    ),
    clientRefreshPeriod: Duration(seconds: 15),
    telemetryPeriod: Duration(seconds: 60),
  );
}
```

### Testing Configuration

```dart
import 'package:clerk_auth/clerk_auth.dart';

AuthConfig createTestConfig() {
  return AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: Persistor.none, // No persistence in tests
    isTestMode: true,
    sessionTokenPolling: false,
    clientRefreshPeriod: Duration.zero,
    telemetryPeriod: Duration.zero,
  );
}
```

### Custom Locale Configuration

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:flutter/material.dart';

AuthConfig createLocalizedConfig(BuildContext context) {
  return AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: myPersistor,
    localesLookup: () {
      final locale = Localizations.localeOf(context);
      return [locale.languageCode, 'en']; // User's locale + English fallback
    },
  );
}
```

### Performance-Optimized Configuration

```dart
import 'package:clerk_auth/clerk_auth.dart';

AuthConfig createOptimizedConfig() {
  return AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: myPersistor,
    // Reduce polling frequency for battery savings
    clientRefreshPeriod: Duration(seconds: 30),
    telemetryPeriod: Duration(minutes: 5),
    // Faster timeout for better UX
    httpConnectionTimeout: Duration(milliseconds: 300),
  );
}
```

---

## Best Practices

1. **Always use a Persistor in production**: Use `DefaultPersistor` or a custom implementation. Only use `Persistor.none` for testing.

2. **Secure your publishable key**: Store it in environment variables or secure configuration, not hardcoded in source.

3. **Adjust polling based on use case**:
   - Real-time apps: Shorter `clientRefreshPeriod`
   - Battery-sensitive apps: Longer periods or disable polling
   - Background apps: Disable polling and refresh manually

4. **Configure retry options for reliability**: Adjust based on your network conditions and user experience requirements.

5. **Use custom session token templates**: When you need specific JWT claims for your backend API.

6. **Disable telemetry in development**: Set `telemetryPeriod` to `Duration.zero` during development if desired.

7. **Test with different configurations**: Create separate configs for development, staging, and production.

---

## Related Documentation

- [Auth Documentation](auth.md)
- [Persistor Documentation](persistor.md)
- [HttpService Documentation](http_service.md)
- [Clerk Dashboard](https://dashboard.clerk.com/)

---

*Generated for clerk_auth version 0.0.14-beta*
