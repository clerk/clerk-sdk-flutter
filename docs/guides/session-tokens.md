---
layout: default
title: Session Tokens
parent: Guides
nav_order: 5
---

# Session Tokens
{: .no_toc }

Learn how to work with JWT session tokens for authenticated API requests in your Dart and Flutter applications.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

Clerk uses JSON Web Tokens (JWTs) for session management. These tokens:

- Are automatically generated when a user signs in
- Contain user and session information
- Are cryptographically signed by Clerk
- Can be verified on your backend
- Automatically refresh to stay valid

---

## Accessing Session Tokens

### In Dart (clerk_auth)

The `clerk_auth` package provides a stream of session tokens:

```dart
import 'package:clerk_auth/clerk_auth.dart';

final auth = Auth(
  config: AuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
    persistor: DefaultPersistor(
      getCacheDirectory: () => Directory.current,
    ),
  ),
);

await auth.initialize();

// Listen to session token updates
auth.sessionTokenStream.listen((token) {
  if (token != null) {
    print('Session token: $token');
    // Use for authenticated API requests
  } else {
    print('No active session');
  }
});
```

### In Flutter (clerk_flutter)

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);

    // Access the session token stream
    return StreamBuilder<String?>(
      stream: authState.sessionTokenStream,
      builder: (context, snapshot) {
        final token = snapshot.data;

        if (token == null) {
          return Text('No session token');
        }

        return Text('Token available');
      },
    );
  }
}
```

---

## Making Authenticated API Requests

Use the session token to authenticate requests to your backend:

```dart
import 'package:http/http.dart' as http;
import 'package:clerk_auth/clerk_auth.dart';

class ApiClient {
  final Auth auth;

  ApiClient(this.auth);

  Future<http.Response> fetchUserData() async {
    // Get the current session token
    final token = await auth.sessionTokenStream.first;

    if (token == null) {
      throw Exception('No active session');
    }

    // Make authenticated request
    final response = await http.get(
      Uri.parse('https://api.example.com/user/profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    return response;
  }
}
```

---

## Session Token Polling

By default, `clerk_auth` automatically polls for fresh session tokens to ensure they remain valid.

### Enable/Disable Polling

```dart
final auth = Auth(
  config: AuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
    sessionTokenPolling: true,  // Enable (default)
    persistor: DefaultPersistor(
      getCacheDirectory: () => Directory.current,
    ),
  ),
);
```

### Why Polling?



---

## Token Claims

Common claims in a Clerk session token:

| Claim | Description |
|-------|-------------|
| `sub` | User ID (subject) |
| `sid` | Session ID |
| `iat` | Issued at timestamp |
| `exp` | Expiration timestamp |
| `azp` | Authorized party (your app URL) |
| `org_id` | Organization ID (if user has active org) |
| `org_role` | User's role in the organization |
| `org_permissions` | Array of permissions |

### Decoding Token Claims (Client-Side)

{: .warning }
> **Security Note:** Never trust client-side token decoding for authorization. Always verify tokens on your backend.

```dart
import 'dart:convert';

Map<String, dynamic> decodeJwtPayload(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid JWT');
  }

  // Decode the payload (second part)
  final payload = parts[1];
  final normalized = base64Url.normalize(payload);
  final decoded = utf8.decode(base64Url.decode(normalized));

  return json.decode(decoded);
}

// Usage
final token = await auth.sessionTokenStream.first;
if (token != null) {
  final claims = decodeJwtPayload(token);
  print('User ID: ${claims['sub']}');
  print('Expires: ${DateTime.fromMillisecondsSinceEpoch(claims['exp'] * 1000)}');
}
```

---

## Verifying Tokens on Backend

Always verify session tokens on your backend before trusting them. See the [Backend Integration](/guides/backend-integration) guide for details.

**Quick Example (Node.js):**

```javascript
import { verifyToken } from '@clerk/backend';

app.get('/api/protected', async (req, res) => {
  const token = req.headers.authorization?.replace('Bearer ', '');

  try {
    const payload = await verifyToken(token, {
      secretKey: process.env.CLERK_SECRET_KEY
    });

    res.json({ userId: payload.sub });
  } catch (err) {
    res.status(401).json({ error: 'Unauthorized' });
  }
});
```

---

## Token Expiration

Session tokens expire after a period of time (default: 1 hour). Clerk automatically handles token refresh through polling.

### Handling Expired Tokens

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<String?> getValidToken(Auth auth) async {
  final token = await auth.sessionTokenStream.first;

  if (token == null) {
    throw Exception('No active session');
  }

  // Token is automatically refreshed by Clerk
  // Just use the latest token from the stream
  return token;
}
```

---

## Best Practices

### 1. Always Use HTTPS

Session tokens should only be transmitted over HTTPS to prevent interception.

### 2. Store Tokens Securely

The `clerk_auth` package handles token storage securely. Don't store tokens in:
- Local storage (web)
- Shared preferences without encryption
- Plain text files

### 3. Verify on Backend

Never trust client-side token validation. Always verify tokens on your backend:

```dart
// ❌ DON'T: Trust client-side checks
if (decodeJwtPayload(token)['exp'] > DateTime.now()) {
  // Allow access
}

// ✅ DO: Verify on backend
final response = await http.get(
  Uri.parse('https://api.example.com/protected'),
  headers: {'Authorization': 'Bearer $token'},
);
```

### 4. Handle Token Refresh

Let Clerk handle token refresh automatically:

```dart
// ✅ DO: Use the stream
auth.sessionTokenStream.listen((token) {
  // Always get the latest valid token
  if (token != null) {
    makeApiRequest(token);
  }
});

// ❌ DON'T: Cache tokens manually
String? cachedToken;
final token = await auth.sessionTokenStream.first;
cachedToken = token; // Token might expire!
```

---

## Next Steps

- [Backend Integration]({{ '/guides/backend-integration' | relative_url }}) - Verify tokens on your backend
- [User Management]({{ '/guides/user-management' | relative_url }}) - Access user data from tokens
- [Organizations]({{ '/guides/organizations' | relative_url }}) - Work with organization claims
- [Error Handling]({{ '/guides/error-handling' | relative_url }}) - Handle token-related errors

- Session tokens expire after a period of time
- Polling ensures you always have a valid token
- Clerk automatically refreshes tokens before they expire
- No manual token refresh logic needed

---

## Token Structure

A Clerk session token is a JWT with three parts:

```
eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2VyXzEyMyIsImlhdCI6MTYxNjIzOTAyMn0.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

**Parts:**
1. **Header** - Algorithm and token type
2. **Payload** - Claims (user data, session info)
3. **Signature** - Cryptographic signature


