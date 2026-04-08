# HttpService Documentation

This document provides comprehensive documentation for the `HttpService` interface and its implementations from `clerk_auth/lib/src/clerk_auth/http_service.dart`.

## Overview

The `HttpService` abstract interface defines how the Clerk SDK communicates with the Clerk backend over HTTP. It provides methods for sending requests, uploading files, and checking connectivity.

## HttpMethod Enum

```dart
enum HttpMethod {
  delete,
  get,
  patch,
  post,
  put,
}
```

**Methods:**
- `delete`: HTTP DELETE
- `get`: HTTP GET
- `patch`: HTTP PATCH
- `post`: HTTP POST
- `put`: HTTP PUT

**Properties:**
- `isGet`: Returns `true` if method is GET
- `isNotGet`: Returns `true` if method is not GET
- `toString()`: Returns uppercase method name (e.g., "GET", "POST")

**Example:**
```dart
final method = HttpMethod.post;
print(method.toString()); // "POST"
print(method.isGet); // false
print(method.isNotGet); // true
```

---

## Abstract Interface

```dart
abstract interface class HttpService {
  const HttpService();
  
  Future<void> initialize();
  void terminate();
  Future<bool> ping(Uri uri, {required Duration timeout});
  Future<http.Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  });
  Future<http.Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    http.ByteStream byteStream,
    int length,
    Map<String, String> headers,
  );
}
```

---

## Methods

### `initialize()`

Initializes the HTTP service. May be called multiple times and must handle that gracefully.

```dart
Future<void> initialize()
```

**Example:**
```dart
final httpService = DefaultHttpService();
await httpService.initialize();
```

**Note:** The default implementation is a no-op.

---

### `terminate()`

Terminates the HTTP service and cleans up resources. May be called multiple times and must handle that gracefully.

```dart
void terminate()
```

**Example:**
```dart
httpService.terminate();
```

---

### `ping()`

Checks that connectivity to an endpoint is available.

```dart
Future<bool> ping(Uri uri, {required Duration timeout})
```

**Parameters:**
- `uri`: The endpoint to ping
- `timeout`: Maximum time to wait for response

**Returns:**
- `true` if endpoint is reachable and returns 200 status
- `false` otherwise

**Example:**
```dart
final isReachable = await httpService.ping(
  Uri.parse('https://api.clerk.com'),
  timeout: Duration(seconds: 5),
);
if (isReachable) {
  print('API is reachable');
}
```

---

### `send()`

Sends an HTTP request to the backend and receives a response.

```dart
Future<http.Response> send(
  HttpMethod method,
  Uri uri, {
  Map<String, String>? headers,
  Map<String, dynamic>? params,
  String? body,
})
```

**Parameters:**
- `method`: The HTTP method to use
- `uri`: The endpoint URI
- `headers`: Optional HTTP headers
- `params`: Optional form parameters (converted to body fields)
- `body`: Optional request body (raw string)

**Returns:**
- `http.Response` from the server

**Example:**
```dart
final response = await httpService.send(
  HttpMethod.post,
  Uri.parse('https://api.clerk.com/v1/client'),
  headers: {
    'Authorization': 'Bearer token',
    'Content-Type': 'application/json',
  },
  body: jsonEncode({'key': 'value'}),
);

print('Status: ${response.statusCode}');
print('Body: ${response.body}');
```

**With params:**
```dart
final response = await httpService.send(
  HttpMethod.post,
  Uri.parse('https://api.clerk.com/v1/sign_in'),
  params: {
    'identifier': 'user@example.com',
    'password': 'password123',
  },
);
```

---

### `sendByteStream()`

Uploads a file to the backend using a multipart request.

```dart
Future<http.Response> sendByteStream(
  HttpMethod method,
  Uri uri,
  http.ByteStream byteStream,
  int length,
  Map<String, String> headers,
)
```

**Parameters:**
- `method`: The HTTP method to use
- `uri`: The endpoint URI
- `byteStream`: The file data as a byte stream
- `length`: The length of the byte stream
- `headers`: HTTP headers

**Returns:**
- `http.Response` from the server

**Example:**
```dart
import 'dart:io';
import 'package:http/http.dart' as http;

final file = File('/path/to/avatar.jpg');
final byteStream = http.ByteStream(file.openRead());
final length = await file.length();

final response = await httpService.sendByteStream(
  HttpMethod.post,
  Uri.parse('https://api.clerk.com/v1/me/profile_image'),
  byteStream,
  length,
  {
    'Authorization': 'Bearer token',
  },
);
```

---

## DefaultHttpService

The default implementation of `HttpService` using the `http` package.

### Constructor

```dart
const DefaultHttpService()
```

**Example:**
```dart
final httpService = DefaultHttpService();
```

### Behavior

- Uses a single `http.Client` instance per `DefaultHttpService` instance
- Automatically manages client lifecycle
- Cleans up client on `terminate()`
- Thread-safe client management

### Implementation Details

**Client Management:**
```dart
static final _clients = <DefaultHttpService, http.Client>{};
http.Client get _client => _clients[this] ??= http.Client();
```

**Ping Implementation:**
- Uses HTTP HEAD request
- Returns `true` only if status code is 200
- Catches all exceptions and returns `false`

**Send Implementation:**
- Creates `http.Request` with method and URI
- Adds headers if provided
- Converts params to body fields if provided
- Sets body if provided
- Sends request and converts streamed response to regular response

**SendByteStream Implementation:**
- Creates `http.MultipartRequest`
- Adds file as multipart file with field name "file"
- Uses hash code as filename
- Sends request and converts streamed response

---

## Custom Implementation

You can create custom HTTP service implementations for specific requirements.

### Example: Logging HTTP Service

```dart
class LoggingHttpService implements HttpService {
  final HttpService _delegate;
  
  LoggingHttpService(this._delegate);
  
  @override
  Future<void> initialize() => _delegate.initialize();
  
  @override
  void terminate() => _delegate.terminate();
  
  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) async {
    print('Pinging: $uri');
    final result = await _delegate.ping(uri, timeout: timeout);
    print('Ping result: $result');
    return result;
  }
  
  @override
  Future<http.Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    print('Sending $method to $uri');
    final response = await _delegate.send(
      method,
      uri,
      headers: headers,
      params: params,
      body: body,
    );
    print('Response: ${response.statusCode}');
    return response;
  }
  
  @override
  Future<http.Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    http.ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) async {
    print('Uploading file to $uri (${length} bytes)');
    final response = await _delegate.sendByteStream(
      method,
      uri,
      byteStream,
      length,
      headers,
    );
    print('Upload response: ${response.statusCode}');
    return response;
  }
}
```

### Example: Retry HTTP Service

```dart
import 'package:retry/retry.dart';

class RetryHttpService implements HttpService {
  final HttpService _delegate;
  final RetryOptions _retryOptions;

  RetryHttpService(this._delegate, {
    RetryOptions? retryOptions,
  }) : _retryOptions = retryOptions ?? const RetryOptions();

  @override
  Future<void> initialize() => _delegate.initialize();

  @override
  void terminate() => _delegate.terminate();

  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) {
    return _delegate.ping(uri, timeout: timeout);
  }

  @override
  Future<http.Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    return _retryOptions.retry(
      () => _delegate.send(
        method,
        uri,
        headers: headers,
        params: params,
        body: body,
      ),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
  }

  @override
  Future<http.Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    http.ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) async {
    return _retryOptions.retry(
      () => _delegate.sendByteStream(
        method,
        uri,
        byteStream,
        length,
        headers,
      ),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
  }
}
```

### Example: Mock HTTP Service (Testing)

```dart
class MockHttpService implements HttpService {
  final Map<String, http.Response> _mockResponses = {};
  bool _initialized = false;

  void addMockResponse(String key, http.Response response) {
    _mockResponses[key] = response;
  }

  @override
  Future<void> initialize() async {
    _initialized = true;
  }

  @override
  void terminate() {
    _initialized = false;
    _mockResponses.clear();
  }

  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) async {
    return true; // Always return true in tests
  }

  @override
  Future<http.Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    final key = '${method}_${uri.path}';
    if (_mockResponses.containsKey(key)) {
      return _mockResponses[key]!;
    }
    return http.Response('{}', 200);
  }

  @override
  Future<http.Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    http.ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) async {
    return http.Response('{"uploaded": true}', 200);
  }
}
```

---

## Complete Examples

### Basic Usage

```dart
import 'package:clerk_auth/clerk_auth.dart';

void main() async {
  final httpService = DefaultHttpService();
  await httpService.initialize();

  final config = AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: Persistor.none,
    httpService: httpService,
  );

  final auth = Auth(config: config);
  await auth.initialize();

  // Use auth...

  auth.terminate();
  httpService.terminate();
}
```

### With Logging

```dart
import 'package:clerk_auth/clerk_auth.dart';

void main() async {
  final baseService = DefaultHttpService();
  final loggingService = LoggingHttpService(baseService);
  await loggingService.initialize();

  final config = AuthConfig(
    publishableKey: 'pk_test_...',
    persistor: Persistor.none,
    httpService: loggingService,
  );

  final auth = Auth(config: config);
  await auth.initialize();

  // All HTTP requests will be logged
}
```

### Testing Setup

```dart
import 'package:clerk_auth/clerk_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('auth test with mock HTTP', () async {
    final mockHttp = MockHttpService();
    mockHttp.addMockResponse(
      'POST_/v1/client',
      http.Response('{"client": {}}', 200),
    );

    final config = AuthConfig(
      publishableKey: 'pk_test_...',
      persistor: Persistor.none,
      httpService: mockHttp,
    );

    final auth = Auth(config: config);
    await auth.initialize();

    // Test with mocked responses
  });
}
```

---

## Best Practices

1. **Use DefaultHttpService for most cases**: It's well-tested and handles common scenarios.

2. **Implement custom services for specific needs**:
   - Logging/debugging
   - Custom retry logic
   - Request/response transformation
   - Testing with mocks

3. **Handle initialization properly**:
   - Always call `initialize()` before use
   - Handle multiple initialization calls gracefully
   - Clean up in `terminate()`

4. **Manage client lifecycle**:
   - Create clients in `initialize()`
   - Close clients in `terminate()`
   - Reuse clients when possible

5. **Error handling**:
   - Catch and handle network exceptions
   - Implement retry logic for transient failures
   - Log errors for debugging

6. **Testing**:
   - Use mock implementations in tests
   - Test error scenarios
   - Verify request/response handling

7. **Performance**:
   - Reuse HTTP clients
   - Implement connection pooling
   - Set appropriate timeouts

---

## Troubleshooting

### Connection Timeouts

**Problem:** Requests timeout frequently.

**Solutions:**
- Increase `httpConnectionTimeout` in `AuthConfig`
- Check network connectivity
- Verify API endpoint is reachable
- Implement retry logic

### SSL/TLS Errors

**Problem:** Certificate verification failures.

**Solutions:**
- Ensure system certificates are up to date
- Check for man-in-the-middle proxies
- Verify API endpoint uses valid certificate
- Don't disable certificate validation in production

### Memory Leaks

**Problem:** HTTP clients not being cleaned up.

**Solutions:**
- Always call `terminate()` when done
- Ensure clients are closed properly
- Use `DefaultHttpService` which manages lifecycle
- Profile memory usage

### Request Failures

**Problem:** Requests fail with various errors.

**Solutions:**
- Check request parameters and headers
- Verify API endpoint and method
- Implement logging to debug requests
- Use retry logic for transient failures

---

## Related Documentation

- [AuthConfig Documentation](auth_config.md)
- [Auth Documentation](auth.md)
- [Persistor Documentation](persistor.md)

---

## Additional Resources

- [http package](https://pub.dev/packages/http)
- [retry package](https://pub.dev/packages/retry)
- [Clerk API Reference](https://clerk.com/docs/reference/backend-api)

---

*Generated for clerk_auth version 0.0.14-beta*



