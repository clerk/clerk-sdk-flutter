---
layout: default
title: Backend Integration
parent: Guides
nav_order: 7
---

# Backend Integration
{: .no_toc }

Learn how to integrate Clerk authentication with your backend services and verify session tokens.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

When building applications with Clerk, you'll often need to:

- Verify session tokens on your backend
- Access user information server-side
- Implement protected API endpoints
- Manage users from your backend

---

## Verifying Session Tokens

Session tokens are JWTs that can be verified using Clerk's public keys.

### Using Clerk Backend SDK

The recommended approach is to use Clerk's backend SDK for your server language:

**Node.js/Express:**
```javascript
import { ClerkExpressRequireAuth } from '@clerk/clerk-sdk-node';

app.get('/api/protected',
  ClerkExpressRequireAuth(),
  (req, res) => {
    const userId = req.auth.userId;
    res.json({ message: 'Protected data', userId });
  }
);
```

**Python/Flask:**
```python
from clerk_backend_api import Clerk

clerk = Clerk(bearer_auth="sk_live_xxxxx")

@app.route('/api/protected')
def protected():
    token = request.headers.get('Authorization').replace('Bearer ', '')

    try:
        session = clerk.sessions.verify_token(token)
        return {'message': 'Protected data', 'userId': session.user_id}
    except Exception as e:
        return {'error': 'Unauthorized'}, 401
```

---

## Manual JWT Verification

If you need to manually verify JWTs:

### 1. Get Clerk's Public Keys

Clerk's public keys are available at:
```
https://[your-frontend-api]/.well-known/jwks.json
```

Example:
```
https://clerk.example.com/.well-known/jwks.json
```

### 2. Verify the JWT

**Node.js Example:**
```javascript
import jwt from 'jsonwebtoken';
import jwksClient from 'jwks-rsa';

const client = jwksClient({
  jwksUri: 'https://clerk.example.com/.well-known/jwks.json'
});

function getKey(header, callback) {
  client.getSigningKey(header.kid, (err, key) => {
    const signingKey = key.publicKey || key.rsaPublicKey;
    callback(null, signingKey);
  });
}

function verifyToken(token) {
  return new Promise((resolve, reject) => {
    jwt.verify(token, getKey, {
      algorithms: ['RS256']
    }, (err, decoded) => {
      if (err) reject(err);
      else resolve(decoded);
    });
  });
}

// Usage
app.get('/api/protected', async (req, res) => {
  const token = req.headers.authorization?.replace('Bearer ', '');

  try {
    const payload = await verifyToken(token);
    res.json({ userId: payload.sub });
  } catch (err) {
    res.status(401).json({ error: 'Unauthorized' });
  }
});
```

---

## Token Claims

A verified Clerk session token contains these claims:

```json
{
  "sub": "user_2abc123",           // User ID
  "sid": "sess_xyz789",            // Session ID
  "iat": 1616239022,               // Issued at
  "exp": 1616242622,               // Expires at
  "azp": "https://example.com",    // Authorized party
  "org_id": "org_456",             // Organization ID (if applicable)
  "org_role": "admin",             // Organization role (if applicable)
  "org_permissions": ["read", "write"]  // Permissions (if applicable)
}
```

---


---

## Protecting API Endpoints

### Example: Express.js Middleware

```javascript
import { ClerkExpressRequireAuth } from '@clerk/clerk-sdk-node';

// Protect a single route
app.get('/api/user/profile',
  ClerkExpressRequireAuth(),
  (req, res) => {
    const userId = req.auth.userId;
    res.json({ userId, message: 'Protected data' });
  }
);

// Protect multiple routes
app.use('/api/admin', ClerkExpressRequireAuth());

app.get('/api/admin/users', (req, res) => {
  // Only accessible with valid session token
  res.json({ users: [] });
});
```

### Example: Python/FastAPI

```python
from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from clerk_backend_api import Clerk

app = FastAPI()
security = HTTPBearer()
clerk = Clerk(bearer_auth="sk_live_xxxxx")

async def verify_clerk_token(
    credentials: HTTPAuthorizationCredentials = Depends(security)
):
    try:
        session = clerk.sessions.verify_token(credentials.credentials)
        return session
    except Exception:
        raise HTTPException(status_code=401, detail="Unauthorized")

@app.get("/api/protected")
async def protected_route(session = Depends(verify_clerk_token)):
    return {"userId": session.user_id, "message": "Protected data"}
```

---

## Organization-Based Access Control

Verify organization membership and roles:

### Node.js Example

```javascript
import { clerkClient } from '@clerk/clerk-sdk-node';

app.get('/api/org/:orgId/data',
  ClerkExpressRequireAuth(),
  async (req, res) => {
    const { userId, orgId, orgRole } = req.auth;
    const requestedOrgId = req.params.orgId;

    // Verify user belongs to the organization
    if (orgId !== requestedOrgId) {
      return res.status(403).json({ error: 'Forbidden' });
    }

    // Check role-based permissions
    if (orgRole === 'admin') {
      // Admin-only data
      return res.json({ data: 'Admin data' });
    } else {
      // Member data
      return res.json({ data: 'Member data' });
    }
  }
);
```

### Dart Backend Example

```dart
import 'package:clerk_backend_api/clerk_backend_api.dart';
import 'package:shelf/shelf.dart';

Future<Response> handleOrgRequest(Request request) async {
  final token = request.headers['authorization']?.replaceFirst('Bearer ', '');

  if (token == null) {
    return Response.forbidden('No token provided');
  }

  try {
    // Verify token and get claims
    final session = await clerk.sessions.verifyToken(token);
    final orgId = session.organizationId;
    final orgRole = session.organizationRole;

    // Check organization access
    if (orgId != request.params['orgId']) {
      return Response.forbidden('Access denied');
    }

    // Role-based logic
    if (orgRole == 'admin') {
      return Response.ok('Admin data');
    } else {
      return Response.ok('Member data');
    }

  } catch (e) {
    return Response.forbidden('Invalid token');
  }
}
```

---

## Managing Users from Backend

Use the Clerk Backend API to manage users server-side:

### Create User

```dart
import 'package:clerk_backend_api/clerk_backend_api.dart';

final clerk = Clerk(
  security: Security(bearerAuth: 'sk_live_xxxxxxxxxxxxx'),
);

// Create a new user
final user = await clerk.users.createUser(
  request: CreateUserRequestBody(
    emailAddress: ['user@example.com'],
    password: 'securePassword123',
    firstName: 'John',
    lastName: 'Doe',
  ),
);

print('Created user: ${user.id}');
```

### Update User

```dart
// Update user metadata
final updatedUser = await clerk.users.updateUser(
  userId: 'user_123',
  request: UpdateUserRequestBody(
    publicMetadata: {
      'plan': 'premium',
      'credits': 100,
    },
  ),
);
```

### Delete User

```dart
// Delete a user
await clerk.users.deleteUser(userId: 'user_123');
```

---

## Session Management

### List User Sessions

```dart
// Get all sessions for a user
final sessions = await clerk.sessions.getSessionList(
  userId: 'user_123',
);

for (final session in sessions.data) {
  print('Session: ${session.id}');
  print('Last active: ${session.lastActiveAt}');
}
```

### Revoke Session

```dart
// Revoke a specific session
await clerk.sessions.revokeSession(sessionId: 'sess_xyz789');

// This will sign the user out of that session
```

---

## Webhooks

Clerk can send webhooks to your backend when events occur:

### Common Webhook Events

- `user.created` - New user signed up
- `user.updated` - User profile updated
- `user.deleted` - User deleted
- `session.created` - New session started
- `session.ended` - Session ended
- `organization.created` - Organization created
- `organizationMembership.created` - User joined organization

### Verifying Webhooks

```javascript
import { Webhook } from 'svix';

app.post('/api/webhooks/clerk', async (req, res) => {
  const webhookSecret = process.env.CLERK_WEBHOOK_SECRET;
  const headers = req.headers;
  const payload = req.body;

  const wh = new Webhook(webhookSecret);

  try {
    const evt = wh.verify(JSON.stringify(payload), {
      'svix-id': headers['svix-id'],
      'svix-timestamp': headers['svix-timestamp'],
      'svix-signature': headers['svix-signature'],
    });

    // Handle the event
    switch (evt.type) {
      case 'user.created':
        console.log('New user:', evt.data.id);
        break;
      case 'user.updated':
        console.log('User updated:', evt.data.id);
        break;
    }

    res.json({ received: true });
  } catch (err) {
    res.status(400).json({ error: 'Invalid signature' });
  }
});
```

---

## Best Practices

### 1. Always Verify Tokens Server-Side

```dart
// ❌ DON'T: Trust client-provided user IDs
app.get('/api/user/:userId/data', (req, res) => {
  const userId = req.params.userId; // Can be forged!
  // ...
});

// ✅ DO: Get user ID from verified token
app.get('/api/user/data',
  ClerkExpressRequireAuth(),
  (req, res) => {
    const userId = req.auth.userId; // From verified JWT
    // ...
  }
);
```

### 2. Use Secret Keys Securely

```dart
// ✅ DO: Use environment variables
final clerk = Clerk(
  security: Security(
    bearerAuth: Platform.environment['CLERK_SECRET_KEY']!,
  ),
);

// ❌ DON'T: Hardcode secret keys
final clerk = Clerk(
  security: Security(bearerAuth: 'sk_live_xxxxx'), // Never do this!
);
```

### 3. Implement Rate Limiting

```javascript
import rateLimit from 'express-rate-limit';

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});

app.use('/api/', limiter);
```

### 4. Log Security Events

```dart
void logSecurityEvent(String event, Map<String, dynamic> data) {
  print('[SECURITY] $event: ${json.encode(data)}');
  // Send to logging service (e.g., Sentry, CloudWatch)
}

// Usage
try {
  final session = await clerk.sessions.verifyToken(token);
  logSecurityEvent('token_verified', {'userId': session.userId});
} catch (e) {
  logSecurityEvent('token_verification_failed', {'error': e.toString()});
}
```

---

## Next Steps

- [Session Tokens]({{ '/guides/session-tokens' | relative_url }}) - Understanding JWT tokens
- [Organizations]({{ '/guides/organizations' | relative_url }}) - Multi-tenant access control
- [User Management]({{ '/guides/user-management' | relative_url }}) - Client-side user operations
- [Error Handling]({{ '/guides/error-handling' | relative_url }}) - Handle backend errors gracefully


## Sending Tokens from Client

### From Dart (clerk_auth)

```dart
import 'package:http/http.dart' as http;
import 'package:clerk_auth/clerk_auth.dart';

Future<void> callProtectedApi(Auth auth) async {
  final token = await auth.sessionTokenStream.first;

  if (token == null) {
    throw Exception('Not authenticated');
  }

  final response = await http.get(
    Uri.parse('https://api.example.com/protected'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  print('Response: ${response.body}');
}
```

### From Flutter (clerk_flutter)

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

class ApiService {
  Future<void> fetchData(BuildContext context) async {
    final authState = ClerkAuth.of(context);
    final token = await authState.sessionTokenStream.first;

    if (token == null) {
      throw Exception('Not authenticated');
    }

    final response = await http.get(
      Uri.parse('https://api.example.com/protected'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
```

---

## Using Clerk Backend API

For advanced backend operations, use the Clerk Backend API:

### Available Operations

- **Users**: Create, update, delete users
- **Sessions**: List, revoke sessions
- **Organizations**: Manage organizations and memberships
- **Invitations**: Send and manage invitations

### Dart Backend API Client

```dart
import 'package:clerk_backend_api/clerk_backend_api.dart';

final clerk = Clerk(
  security: Security(bearerAuth: 'sk_live_xxxxxxxxxxxxx'),
);

// Get user by ID
final user = await clerk.users.getUser(userId: 'user_123');
print('User: ${user.emailAddress}');

// List all users
final users = await clerk.users.getUserList();
for (final user in users.data) {
  print('User: ${user.emailAddress}');
}
```


