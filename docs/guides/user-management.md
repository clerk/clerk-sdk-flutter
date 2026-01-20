---
layout: default
title: User Management
parent: Guides
nav_order: 2
---

# User Management
{: .no_toc }

Learn how to manage user profiles, update user information, and handle user data with Clerk's Dart and Flutter SDKs.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

The `User` object contains all account information for a user in your application. Clerk provides comprehensive APIs to:

- Access user profile data
- Update user information
- Manage email addresses and phone numbers
- Upload profile images
- Handle user metadata

---

## Accessing the Current User

### In Dart (clerk_auth)

```dart
import 'package:clerk_auth/clerk_auth.dart';

void printUserInfo(Auth auth) {
  final user = auth.user;
  
  if (user == null) {
    print('No user signed in');
    return;
  }
  
  print('User ID: ${user.id}');
  print('Email: ${user.emailAddress}');
  print('Name: ${user.firstName} ${user.lastName}');
  print('Username: ${user.username}');
  print('Profile Image: ${user.imageUrl}');
  print('Created: ${user.createdAt}');
  print('Updated: ${user.updatedAt}');
}
```

### In Flutter (clerk_flutter)

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final user = authState.user;

    if (user == null) {
      return const Text('Not signed in');
    }

    return Column(
      children: [
        if (user.imageUrl != null)
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.imageUrl!),
          ),
        Text('${user.firstName} ${user.lastName}'),
        Text(user.emailAddress ?? 'No email'),
        Text('User ID: ${user.id}'),
      ],
    );
  }
}
```

---

## User Properties

The `User` object includes the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `id` | `String` | Unique identifier for the user |
| `firstName` | `String?` | User's first name |
| `lastName` | `String?` | User's last name |
| `username` | `String?` | User's username |
| `emailAddress` | `String?` | Primary email address |
| `phoneNumber` | `String?` | Primary phone number |
| `imageUrl` | `String?` | URL to profile image |
| `hasImage` | `bool` | Whether user has uploaded an image |
| `primaryEmailAddressId` | `String?` | ID of primary email |
| `primaryPhoneNumberId` | `String?` | ID of primary phone |
| `emailAddresses` | `List<EmailAddress>` | All email addresses |
| `phoneNumbers` | `List<PhoneNumber>` | All phone numbers |
| `externalAccounts` | `List<ExternalAccount>` | Connected OAuth accounts |
| `publicMetadata` | `Map<String, dynamic>` | Public metadata |
| `privateMetadata` | `Map<String, dynamic>` | Private metadata (backend only) |
| `unsafeMetadata` | `Map<String, dynamic>` | Unsafe metadata |
| `createdAt` | `DateTime` | Account creation timestamp |
| `updatedAt` | `DateTime` | Last update timestamp |

---

## Updating User Profile

### Update Basic Information

```dart
import 'package:clerk_auth/clerk_auth.dart';

Future<void> updateUserProfile(Auth auth) async {
  final user = auth.user;
  if (user == null) return;

  try {
    await user.update(
      firstName: 'John',
      lastName: 'Doe',
      username: 'johndoe',
    );
    
    print('✅ Profile updated successfully');
  } catch (e) {
    print('❌ Update failed: $e');
  }
}
```

### Update Profile Image

```dart
import 'dart:io';
import 'package:clerk_auth/clerk_auth.dart';

Future<void> updateProfileImage(Auth auth, File imageFile) async {
  final user = auth.user;
  if (user == null) return;

  try {
    await user.setProfileImage(imageFile);
    print('✅ Profile image updated');
  } catch (e) {
    print('❌ Image upload failed: $e');
  }
}
```

### In Flutter with Image Picker

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileImageUploader extends StatelessWidget {
  const ProfileImageUploader({super.key});

  Future<void> _pickAndUploadImage(BuildContext context) async {
    final authState = ClerkAuth.of(context, listen: false);
    final user = authState.user;
    if (user == null) return;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      try {
        await user.setProfileImage(File(pickedFile.path));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile image updated!')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Upload failed: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.upload),
      label: const Text('Upload Profile Image'),
      onPressed: () => _pickAndUploadImage(context),
    );
  }
}
```

---

## Managing Email Addresses

### Add Email Address

```dart
Future<void> addEmailAddress(Auth auth, String email) async {
  final user = auth.user;
  if (user == null) return;

  try {
    final emailAddress = await user.createEmailAddress(email);
    
    print('📧 Verification email sent to $email');
    
    // User enters verification code
    final code = '123456'; // Get from user input
    
    await emailAddress.attemptVerification(code: code);
    
    print('✅ Email address verified and added');
  } catch (e) {
    print('❌ Failed to add email: $e');
  }
}
```

### Set Primary Email

```dart
Future<void> setPrimaryEmail(Auth auth, String emailAddressId) async {
  final user = auth.user;
  if (user == null) return;

  try {
    await user.update(primaryEmailAddressId: emailAddressId);
    print('✅ Primary email updated');
  } catch (e) {
    print('❌ Failed to update primary email: $e');
  }
}
```

### Remove Email Address

```dart
Future<void> removeEmailAddress(Auth auth, String emailAddressId) async {
  final user = auth.user;
  if (user == null) return;

  try {
    final emailAddress = user.emailAddresses
        .firstWhere((e) => e.id == emailAddressId);
    
    await emailAddress.destroy();
    print('✅ Email address removed');
  } catch (e) {
    print('❌ Failed to remove email: $e');
  }
}
```

---

## Managing Phone Numbers

### Add Phone Number

```dart
Future<void> addPhoneNumber(Auth auth, String phoneNumber) async {
  final user = auth.user;
  if (user == null) return;

  try {
    final phone = await user.createPhoneNumber(phoneNumber);
    
    print('📱 SMS verification sent to $phoneNumber');
    
    // User enters verification code
    final code = '123456'; // Get from user input
    
    await phone.attemptVerification(code: code);
    
    print('✅ Phone number verified and added');
  } catch (e) {
    print('❌ Failed to add phone: $e');
  }
}
```

---

## User Metadata

Clerk provides three types of metadata:

### Public Metadata
Visible to the frontend and included in session tokens.

```dart
Future<void> updatePublicMetadata(Auth auth) async {
  final user = auth.user;
  if (user == null) return;

  await user.update(
    publicMetadata: {
      'theme': 'dark',
      'language': 'en',
      'notifications': true,
    },
  );
}
```

### Unsafe Metadata
Editable by the user, visible to the frontend.

```dart
Future<void> updateUnsafeMetadata(Auth auth) async {
  final user = auth.user;
  if (user == null) return;

  await user.update(
    unsafeMetadata: {
      'preferences': {
        'newsletter': true,
        'marketing': false,
      },
    },
  );
}
```

### Private Metadata
Only accessible from the backend (requires Backend API).

{: .note }
> Private metadata can only be set using the Backend API, not from client SDKs.

---

## User Profile Component (Flutter)

Here's a complete user profile component:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final user = authState.user;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Not signed in')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: const [ClerkUserButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Image
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: user.imageUrl != null
                  ? NetworkImage(user.imageUrl!)
                  : null,
              child: user.imageUrl == null
                  ? Text(
                      user.firstName?.substring(0, 1).toUpperCase() ?? 'U',
                      style: const TextStyle(fontSize: 40),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 24),
          
          // Name
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Name'),
            subtitle: Text('${user.firstName ?? ''} ${user.lastName ?? ''}'),
          ),
          
          // Email
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(user.emailAddress ?? 'No email'),
          ),
          
          // Username
          if (user.username != null)
            ListTile(
              leading: const Icon(Icons.alternate_email),
              title: const Text('Username'),
              subtitle: Text(user.username!),
            ),
          
          // Phone
          if (user.phoneNumber != null)
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: Text(user.phoneNumber!),
            ),
          
          // Account Created
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Member Since'),
            subtitle: Text(
              '${user.createdAt.year}-${user.createdAt.month}-${user.createdAt.day}',
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## Next Steps

- [Organizations]({{ '/guides/organizations' | relative_url }}) - Multi-tenant user management
- [Session Tokens]({{ '/guides/session-tokens' | relative_url }}) - Access user data in tokens
- [Customization]({{ '/guides/customization' | relative_url }}) - Customize user profile UI
- [Backend Integration]({{ '/guides/backend-integration' | relative_url }}) - Manage users from your backend

