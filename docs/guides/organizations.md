---
layout: default
title: Organizations
parent: Guides
nav_order: 3
---

# Organizations
{: .no_toc }

Learn how to implement multi-tenant functionality with organizations in your Dart and Flutter applications.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

Organizations in Clerk enable you to build multi-tenant applications where users can belong to one or more organizations. Each organization can have:

- Multiple members with different roles
- Custom permissions and access control
- Organization-specific metadata
- Invitations and membership management

---

## Prerequisites

Before using organizations, you need to:

1. **Enable Organizations** in your [Clerk Dashboard](https://dashboard.clerk.com)
   - Go to your application settings
   - Navigate to **Organizations**
   - Enable the Organizations feature

2. **Configure Roles** (optional)
   - Define custom roles for your organization members
   - Set up permissions for each role

---

## Accessing Organizations

### In Dart (clerk_auth)

```dart
import 'package:clerk_auth/clerk_auth.dart';

void listUserOrganizations(Auth auth) {
  final user = auth.user;

  if (user == null) {
    print('No user signed in');
    return;
  }

  // Get all organizations the user belongs to
  final memberships = user.organizationMemberships;

  for (final membership in memberships) {
    print('Organization: ${membership.organization.name}');
    print('Role: ${membership.role}');
  }
}
```

### In Flutter (clerk_flutter)

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class OrganizationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Organizations')),
      body: const ClerkOrganizationList(),
    );
  }
}
```

---

## Organization Object

The `Organization` object contains information about an organization:

```dart
final organization = membership.organization;

print('ID: ${organization.id}');
print('Name: ${organization.name}');
print('Slug: ${organization.slug}');
print('Logo: ${organization.imageUrl}');
print('Created: ${organization.createdAt}');
```

**Key Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `id` | `String` | Unique organization identifier |
| `name` | `String` | Organization name |
| `slug` | `String` | URL-friendly identifier |
| `imageUrl` | `String?` | Organization logo URL |
| `createdAt` | `DateTime` | Creation timestamp |
| `publicMetadata` | `Map<String, dynamic>` | Public metadata |

---

## Organization Membership

The `OrganizationMembership` object represents a user's membership in an organization:

```dart
final membership = user.organizationMemberships.first;

print('Organization: ${membership.organization.name}');
print('Role: ${membership.role}');
print('Joined: ${membership.createdAt}');
```

**Key Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `id` | `String` | Membership identifier |
| `organization` | `Organization` | The organization |
| `role` | `String` | User's role in the organization |
| `createdAt` | `DateTime` | When user joined |
| `publicMetadata` | `Map<String, dynamic>` | Membership metadata |

---

## Common Organization Roles

Clerk provides default roles for organizations:

- **`admin`** - Full access to organization settings and members
- **`member`** - Standard member access

You can also define custom roles in your Clerk Dashboard with specific permissions.


---

## Switching Active Organization

Users can belong to multiple organizations. You can switch the active organization context:

### In Dart (clerk_auth)

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<void> switchOrganization(Auth auth, String organizationId) async {
  try {
    // Set the active organization
    await auth.setActiveOrganization(organizationId);

    print('Switched to organization: $organizationId');
  } catch (e) {
    print('Failed to switch organization: $e');
  }
}
```

### In Flutter (clerk_flutter)

The `ClerkOrganizationList` widget handles organization switching automatically. When a user selects an organization, it becomes the active organization.

---

## Checking Organization Membership

You can check if a user belongs to a specific organization:

```dart
bool isUserInOrganization(User user, String organizationId) {
  return user.organizationMemberships.any(
    (membership) => membership.organization.id == organizationId,
  );
}
```

Check if user has a specific role:

```dart
bool isUserAdmin(User user, String organizationId) {
  final membership = user.organizationMemberships.firstWhere(
    (m) => m.organization.id == organizationId,
    orElse: () => null,
  );

  return membership?.role == 'admin';
}
```

---

## Organization Invitations

Organizations can invite new members via email.

{: .note }
> Organization invitations are managed through the Clerk Dashboard or Backend API. The Dart/Flutter SDKs currently support viewing and accepting invitations.

### Viewing Pending Invitations

```dart
import 'package:clerk_auth/clerk_auth.dart';

void listPendingInvitations(User user) {
  // Check for pending organization invitations
  final invitations = user.organizationInvitations ?? [];

  for (final invitation in invitations) {
    print('Invited to: ${invitation.organization.name}');
    print('Role: ${invitation.role}');
    print('Invited by: ${invitation.inviterEmail}');
  }
}
```

---

## Multi-Tenant Data Isolation

When building multi-tenant applications, you'll want to scope data to the active organization:

```dart
import 'package:clerk_auth/clerk_auth.dart';

class ApiService {
  final Auth auth;

  ApiService(this.auth);

  Future<void> fetchOrganizationData() async {
    final user = auth.user;
    if (user == null) return;

    // Get the active organization
    final activeOrgId = user.activeOrganizationId;

    if (activeOrgId == null) {
      print('No active organization');
      return;
    }

    // Fetch data scoped to this organization
    final token = await auth.sessionTokenStream.first;

    // Make API request with organization context
    // The session token will include organization claims
    final response = await http.get(
      Uri.parse('https://api.example.com/org/$activeOrgId/data'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
```

---

## Session Tokens with Organization Claims

When a user has an active organization, the session token includes organization-specific claims:

```dart
import 'dart:convert';
import 'package:clerk_auth/clerk_auth.dart';

void printOrganizationClaims(Auth auth) {
  auth.sessionTokenStream.listen((token) {
    if (token == null) return;

    // Decode JWT (for demonstration - use a proper JWT library)
    final parts = token.split('.');
    if (parts.length != 3) return;

    final payload = json.decode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
    );

    print('Organization ID: ${payload['org_id']}');
    print('Organization Role: ${payload['org_role']}');
    print('Organization Permissions: ${payload['org_permissions']}');
  });
}
```

---

## Best Practices

### 1. Always Check Active Organization

```dart
Future<void> performOrganizationAction(Auth auth) async {
  final user = auth.user;

  if (user?.activeOrganizationId == null) {
    throw Exception('No active organization selected');
  }

  // Proceed with organization-scoped action
}
```

### 2. Handle Organization Switching

```dart
class OrganizationAwareWidget extends StatefulWidget {
  @override
  _OrganizationAwareWidgetState createState() =>
      _OrganizationAwareWidgetState();
}

class _OrganizationAwareWidgetState extends State<OrganizationAwareWidget> {
  String? _currentOrgId;

  @override
  void initState() {
    super.initState();
    _loadOrganizationData();
  }

  void _loadOrganizationData() {
    final authState = ClerkAuth.of(context);
    final newOrgId = authState.user?.activeOrganizationId;

    if (newOrgId != _currentOrgId) {
      setState(() {
        _currentOrgId = newOrgId;
      });
      // Reload data for new organization
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Current Org: $_currentOrgId'),
    );
  }
}
```

### 3. Validate Permissions

Always validate organization permissions on your backend, not just in the client:

```dart
// Client-side check (for UI only)
bool canEditSettings = user.organizationMemberships
    .firstWhere((m) => m.organization.id == activeOrgId)
    .role == 'admin';

// Always verify on backend before performing sensitive operations
```

---

## Next Steps

- [Authentication]({{ '/guides/authentication' | relative_url }}) - Implement authentication flows
- [User Management]({{ '/guides/user-management' | relative_url }}) - Manage user profiles
- [Session Tokens]({{ '/guides/session-tokens' | relative_url }}) - Work with JWT tokens
- [Backend Integration]({{ '/guides/backend-integration' | relative_url }}) - Verify organization claims on your backend


---

## Using ClerkOrganizationList Widget

The `ClerkOrganizationList` widget provides a pre-built UI for managing organizations:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Organizations')),
        body: const ClerkOrganizationList(),
      ),
    );
  }
}
```

Features:
- List all organizations the user belongs to
- Switch between organizations
- Create new organizations (if enabled)
- Leave organizations

