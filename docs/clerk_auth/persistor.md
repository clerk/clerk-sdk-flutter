# Persistor Documentation

This document provides comprehensive documentation for the `Persistor` abstract class and its implementations from `clerk_auth/lib/src/clerk_auth/persistor.dart`.

## Overview

The `Persistor` abstract class defines the persistence interface for storing authentication state between app sessions. It allows the Clerk SDK to maintain user sessions across app restarts.

## Abstract Class

```dart
abstract class Persistor {
  Future<void> initialize();
  void terminate();
  FutureOr<T?> read<T>(String key);
  FutureOr<void> write<T>(String key, T value);
  FutureOr<void> delete(String key);
}
```

---

## Methods

### `initialize()`

Initializes the persistor service. Called once when the Auth object is initialized.

```dart
Future<void> initialize()
```

**Example:**
```dart
final persistor = DefaultPersistor(
  getCacheDirectory: getApplicationDocumentsDirectory,
);
await persistor.initialize();
```

---

### `terminate()`

Terminates the persistor service. Called when the Auth object is terminated.

```dart
void terminate()
```

**Example:**
```dart
persistor.terminate();
```

---

### `read<T>()`

Reads a value from storage by key.

```dart
FutureOr<T?> read<T>(String key)
```

**Parameters:**
- `key`: The storage key to read from

**Returns:**
- The stored value of type `T`, or `null` if not found

**Example:**
```dart
final clientData = await persistor.read<Map<String, dynamic>>('client');
final envData = await persistor.read<Map<String, dynamic>>('env');
```

---

### `write<T>()`

Writes a value to storage with the given key.

```dart
FutureOr<void> write<T>(String key, T value)
```

**Parameters:**
- `key`: The storage key to write to
- `value`: The value to store

**Example:**
```dart
await persistor.write('client', clientJson);
await persistor.write('env', envJson);
```

---

### `delete()`

Deletes a value from storage by key.

```dart
FutureOr<void> delete(String key)
```

**Parameters:**
- `key`: The storage key to delete

**Example:**
```dart
await persistor.delete('client');
```

---

## Built-in Implementations

### `Persistor.none`

A no-op persistor used for testing. Does not persist any data.

**Type:** `const Persistor`

**Example:**
```dart
final config = AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: Persistor.none, // No persistence
);
```

**Use cases:**
- Unit testing
- Integration testing
- Temporary sessions that shouldn't persist

**Note:** Marked with `@visibleForTesting` - should only be used in test environments.

---

### `DefaultPersistor`

A default implementation that writes authentication state to the file system as JSON.

**Constructor:**
```dart
DefaultPersistor({
  required DirectoryGetter getCacheDirectory,
})
```

**Parameters:**
- `getCacheDirectory`: A function that returns the directory for file storage

**Example:**
```dart
import 'package:path_provider/path_provider.dart';

final persistor = DefaultPersistor(
  getCacheDirectory: getApplicationDocumentsDirectory,
);
```

**Behavior:**
- Stores all data in a single JSON file: `clerk_sdk.json`
- Writes are debounced by 600ms to avoid excessive I/O
- Automatically handles JSON encoding/decoding
- Recovers gracefully from corrupted JSON files

**File location:**
- The file is stored in the directory returned by `getCacheDirectory`
- Full path: `{cacheDirectory}/clerk_sdk.json`

---

## Custom Implementation

You can create custom persistor implementations for specific storage backends.

### Example: Shared Preferences Persistor

```dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPersistor implements Persistor {
  SharedPreferences? _prefs;
  
  @override
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  @override
  void terminate() {
    // SharedPreferences doesn't need cleanup
  }
  
  @override
  Future<T?> read<T>(String key) async {
    if (T == String) {
      return _prefs?.getString(key) as T?;
    } else if (T == int) {
      return _prefs?.getInt(key) as T?;
    } else if (T == bool) {
      return _prefs?.getBool(key) as T?;
    } else if (T == Map<String, dynamic>) {
      final jsonString = _prefs?.getString(key);
      if (jsonString != null) {
        return json.decode(jsonString) as T;
      }
    }
    return null;
  }
  
  @override
  Future<void> write<T>(String key, T value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is Map) {
      await _prefs?.setString(key, json.encode(value));
    }
  }
  
  @override
  Future<void> delete(String key) async {
    await _prefs?.remove(key);
  }
}
```

### Example: In-Memory Persistor (Testing)

```dart
class InMemoryPersistor implements Persistor {
  final _storage = <String, dynamic>{};

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {
    _storage.clear();
  }

  @override
  FutureOr<T?> read<T>(String key) {
    return _storage[key] as T?;
  }

  @override
  FutureOr<void> write<T>(String key, T value) {
    _storage[key] = value;
  }

  @override
  FutureOr<void> delete(String key) {
    _storage.remove(key);
  }
}
```

---

## Storage Keys Used by Clerk

The Clerk SDK uses the following keys for persistence:

### `$client`

Stores the current `Client` object containing:
- Sign-in state
- Sign-up state
- Active sessions
- User data

**Type:** `Map<String, dynamic>`

### `$env`

Stores the `Environment` object containing:
- Clerk account configuration
- Enabled features
- Organization settings
- User attribute settings

**Type:** `Map<String, dynamic>`

**Note:** These keys are prefixed with `$` to avoid conflicts with user data.

---

## Complete Examples

### Basic Setup with DefaultPersistor

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:path_provider/path_provider.dart';

Future<void> setupAuth() async {
  final persistor = DefaultPersistor(
    getCacheDirectory: getApplicationDocumentsDirectory,
  );

  final config = AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: persistor,
  );

  final auth = Auth(config: config);
  await auth.initialize();
}
```

### Testing Setup with No Persistence

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('auth test', () async {
    final config = AuthConfig(
      publishableKey: 'pk_test_...',
      persistor: Persistor.none, // No persistence in tests
    );

    final auth = Auth(config: config);
    await auth.initialize();

    // Test auth functionality
  });
}
```

### Custom Secure Storage Setup

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<void> setupSecureAuth() async {
  final persistor = SecureStoragePersistor();

  final config = AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: persistor,
  );

  final auth = Auth(config: config);
  await auth.initialize();
}
```

### Platform-Specific Persistor

```dart
import 'dart:io';
import 'package:clerk_auth/clerk_auth.dart';
import 'package:path_provider/path_provider.dart';

Future<Persistor> createPlatformPersistor() async {
  if (Platform.isIOS || Platform.isAndroid) {
    // Use secure storage on mobile
    return SecureStoragePersistor();
  } else {
    // Use file-based storage on desktop
    return DefaultPersistor(
      getCacheDirectory: getApplicationDocumentsDirectory,
    );
  }
}

Future<void> setupAuth() async {
  final persistor = await createPlatformPersistor();

  final config = AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: persistor,
  );

  final auth = Auth(config: config);
  await auth.initialize();
}
```

---

## Best Practices

1. **Choose the right persistor for your use case**:
   - `DefaultPersistor`: Good for most applications
   - `SecureStoragePersistor`: For sensitive data on mobile
   - `Persistor.none`: Only for testing
   - Custom implementation: For specific requirements

2. **Handle initialization properly**:
   - Always call `initialize()` before use
   - Handle initialization errors gracefully
   - Don't assume initialization is instant

3. **Clean up resources**:
   - Call `terminate()` when done
   - Clear sensitive data on logout
   - Handle app lifecycle events

4. **Error handling**:
   - Implement proper error handling in custom persistors
   - Recover gracefully from corrupted data
   - Log errors for debugging

5. **Performance considerations**:
   - Debounce writes to avoid excessive I/O
   - Use async operations for file/network storage
   - Consider caching frequently accessed data

6. **Security**:
   - Use secure storage for sensitive tokens on mobile
   - Encrypt data at rest if required
   - Clear data on logout or app uninstall

7. **Testing**:
   - Use `Persistor.none` in unit tests
   - Test custom persistors thoroughly
   - Verify data persistence across app restarts

---

## Troubleshooting

### Data Not Persisting

**Problem:** User sessions don't persist across app restarts.

**Solutions:**
- Verify `initialize()` is called before use
- Check that `write()` is completing successfully
- Ensure storage directory exists and is writable
- Check for errors in persistor implementation

### Corrupted Data

**Problem:** App crashes or fails to load persisted data.

**Solutions:**
- Implement error handling in `read()` method
- Clear corrupted data and start fresh
- Add data validation before persisting
- Use `DefaultPersistor` which handles corruption gracefully

### Performance Issues

**Problem:** App is slow due to excessive persistence operations.

**Solutions:**
- Debounce write operations (like `DefaultPersistor` does)
- Use in-memory caching
- Batch multiple writes together
- Profile to identify bottlenecks

### Platform-Specific Issues

**Problem:** Persistor works on one platform but not another.

**Solutions:**
- Use platform-specific storage APIs
- Test on all target platforms
- Handle platform differences in custom implementation
- Use conditional imports for platform-specific code

---

## Related Documentation

- [AuthConfig Documentation](auth_config.md)
- [Auth Documentation](auth.md)
- [HttpService Documentation](http_service.md)

---

## Additional Resources

- [path_provider package](https://pub.dev/packages/path_provider)
- [shared_preferences package](https://pub.dev/packages/shared_preferences)
- [flutter_secure_storage package](https://pub.dev/packages/flutter_secure_storage)

---

*Generated for clerk_auth version 0.0.14-beta*

### Example: Secure Storage Persistor

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStoragePersistor implements Persistor {
  final _storage = FlutterSecureStorage();
  
  @override
  Future<void> initialize() async {
    // No initialization needed
  }
  
  @override
  void terminate() {
    // No cleanup needed
  }
  
  @override
  Future<T?> read<T>(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    
    if (T == String) {
      return value as T;
    } else {
      return json.decode(value) as T;
    }
  }
  
  @override
  Future<void> write<T>(String key, T value) async {
    final stringValue = value is String ? value : json.encode(value);
    await _storage.write(key: key, value: stringValue);
  }
  
  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}
```


