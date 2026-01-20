---
layout: default
title: Flutter Quickstart
parent: Getting Started
nav_order: 2
---

# Flutter Quickstart
{: .no_toc }

Get started with Clerk authentication in your Flutter application with pre-built UI components.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Install clerk_flutter

Add `clerk_flutter` to your `pubspec.yaml`:

```yaml
dependencies:
  clerk_flutter: ^0.0.13-beta
```

Install the package:

```bash
flutter pub get
```

---

## Platform setup

### Android

Add the Internet permission to `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET" />
    <!-- rest of your manifest -->
</manifest>
```

### iOS, Web, Desktop

No additional setup required.

---

## Wrap your app with ClerkAuth

Wrap your `MaterialApp` with the `ClerkAuth` widget:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: 'pk_test_xxxxxxxxxxxxx',
      ),
      child: MaterialApp(
        title: 'My Clerk App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
```

{: .warning }
> Replace `pk_test_xxxxxxxxxxxxx` with your actual publishable key from the [Clerk Dashboard](https://dashboard.clerk.com).

---

## Build conditional UI with ClerkAuthBuilder

Use `ClerkAuthBuilder` to show different UI based on authentication state:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClerkErrorListener(
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) {
              // User is signed in
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome, ${authState.user?.firstName}!'),
                    const SizedBox(height: 20),
                    const ClerkUserButton(),
                  ],
                ),
              );
            },
            signedOutBuilder: (context, authState) {
              // User is signed out
              return const Center(
                child: ClerkAuthentication(),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

---

## Use pre-built authentication UI

The `ClerkAuthentication` widget provides a complete sign-in/sign-up flow:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ClerkAuthentication(),
        ),
      ),
    );
  }
}
```

The `ClerkAuthentication` widget automatically handles:
- Email/password sign-in
- Email/password sign-up
- OAuth providers (Google, GitHub, etc.)
- Email verification
- Password reset
- Error states

---

## Use the ClerkUserButton

The `ClerkUserButton` provides a user menu with profile management and sign-out:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: const [
          ClerkUserButton(),
        ],
      ),
      body: ClerkSignedIn(
        child: Center(
          child: Text('Protected content'),
        ),
      ),
    );
  }
}
```

---

## Conditional rendering with ClerkSignedIn/ClerkSignedOut

Use these widgets to conditionally render content:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class ConditionalPage extends StatelessWidget {
  const ConditionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClerkSignedIn(
            child: Text('This is only visible when signed in'),
          ),
          ClerkSignedOut(
            child: Text('This is only visible when signed out'),
          ),
        ],
      ),
    );
  }
}
```

---

## Access the current user

Access user information through the `ClerkAuth` inherited widget:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final user = authState.user;

    if (user == null) {
      return const Text('Not signed in');
    }

    return Column(
      children: [
        Text('Name: ${user.firstName} ${user.lastName}'),
        Text('Email: ${user.emailAddress}'),
        Text('User ID: ${user.id}'),
        if (user.imageUrl != null)
          Image.network(user.imageUrl!),
      ],
    );
  }
}
```

---

## Handle deep links for OAuth

For OAuth authentication, you need to handle deep links:

```dart
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:app_links/app_links.dart';

ClerkAuth(
  config: ClerkAuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
    redirectionGenerator: (url) {
      // Generate your app's deep link
      return Uri.parse('myapp://oauth-callback');
    },
    deepLinkStream: AppLinks().allUriLinkStream.map((uri) {
      // Handle incoming deep links
      return ClerkDeepLink(uri: uri);
    }),
  ),
  child: MaterialApp(
    // ...
  ),
)
```

Add the `app_links` package to handle deep links:

```yaml
dependencies:
  app_links: ^3.5.1
```

---

## Next steps

Explore more features and customization options:

- [Widget Reference]({{ '/api/widgets' | relative_url }}) - All available widgets and their properties
- [Customization]({{ '/guides/customization' | relative_url }}) - Theme and style your components
- [Authentication Flows]({{ '/guides/authentication' | relative_url }}) - OAuth, passwordless, MFA
- [User Management]({{ '/guides/user-management' | relative_url }}) - Profile updates, session management
- [Organizations]({{ '/guides/organizations' | relative_url }}) - Multi-tenant support

---

## Complete example

Here's a complete Flutter app with Clerk authentication:

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: 'pk_test_xxxxxxxxxxxxx',
      ),
      child: MaterialApp(
        title: 'Clerk Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clerk Flutter Demo'),
      ),
      body: SafeArea(
        child: ClerkErrorListener(
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, ${authState.user?.firstName ?? "User"}!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 20),
                    const ClerkUserButton(showName: true),
                  ],
                ),
              );
            },
            signedOutBuilder: (context, authState) {
              return const Center(
                child: ClerkAuthentication(),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

