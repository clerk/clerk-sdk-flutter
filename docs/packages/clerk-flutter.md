---
layout: default
title: clerk_flutter
parent: Packages
nav_order: 2
---

# clerk_flutter Package
{: .no_toc }

The official Clerk Flutter SDK with pre-built UI components.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Overview

The `clerk_flutter` package provides a complete authentication solution for Flutter applications with:

- Pre-built UI components
- Material Design integration
- Cross-platform support (iOS, Android, Web, Desktop)
- Seamless Flutter integration

**Package:** [clerk_flutter on pub.dev](https://pub.dev/packages/clerk_flutter)  
**Version:** 0.0.13-beta  
**Repository:** [GitHub](https://github.com/clerk/clerk-sdk-flutter/tree/main/packages/clerk_flutter)

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  clerk_flutter: ^0.0.13-beta
```

Then run:

```bash
flutter pub get
```

---

## Requirements

- Flutter >= 3.27.4
- Dart >= 3.6.2

---

## Core Widgets

### ClerkAuth

The root widget that initializes Clerk authentication.

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

ClerkAuth(
  config: ClerkAuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
  ),
  child: MaterialApp(
    // Your app
  ),
)
```

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `config` | `ClerkAuthConfig` | Configuration object |
| `child` | `Widget` | Your app widget |
| `persistor` | `Persistor?` | Custom storage mechanism |
| `httpService` | `HttpService?` | Custom HTTP service |

---

### ClerkAuthConfig

Configuration for ClerkAuth.

```dart
ClerkAuthConfig(
  publishableKey: 'pk_test_xxxxxxxxxxxxx',
  redirectionGenerator: (url) => Uri.parse('myapp://oauth'),
  deepLinkStream: AppLinks().allUriLinkStream.map(
    (uri) => ClerkDeepLink(uri: uri),
  ),
)
```

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `publishableKey` | `String` | Your Clerk publishable key |
| `redirectionGenerator` | `Function?` | Generate OAuth redirect URLs |
| `deepLinkStream` | `Stream<ClerkDeepLink>?` | Handle OAuth callbacks |
| `loading` | `Widget?` | Widget shown during initialization |

---

### ClerkAuthBuilder

Build different UI based on authentication state.

```dart
ClerkAuthBuilder(
  signedInBuilder: (context, authState) {
    return Text('Welcome, ${authState.user?.firstName}!');
  },
  signedOutBuilder: (context, authState) {
    return const ClerkAuthentication();
  },
)
```

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `signedInBuilder` | `AuthWidgetBuilder?` | Builder when user is signed in |
| `signedOutBuilder` | `AuthWidgetBuilder?` | Builder when user is signed out |
| `builder` | `AuthWidgetBuilder?` | Fallback builder |

---

### ClerkAuthentication

Pre-built authentication UI with sign-in and sign-up.

```dart
const ClerkAuthentication()
```

Features:
- Email/password sign-in and sign-up
- OAuth provider buttons
- Email verification
- Password reset
- Automatic error handling

---

### ClerkUserButton

User menu with profile and sign-out options.

```dart
ClerkUserButton(
  showName: true,
  sessionActions: [
    ClerkUserAction(
      label: 'Settings',
      icon: Icons.settings,
      onPressed: (context, authState) {
        // Handle action
      },
    ),
  ],
)
```

**Properties:**

| Property | Type | Description |
|----------|------|-------------|
| `showName` | `bool` | Show user's name |
| `sessionActions` | `List<ClerkUserAction>?` | Custom session actions |
| `additionalActions` | `List<ClerkUserAction>?` | Additional menu items |

---

### ClerkSignedIn / ClerkSignedOut

Conditional rendering based on auth state.

```dart
ClerkSignedIn(
  child: Text('Only visible when signed in'),
)

ClerkSignedOut(
  child: Text('Only visible when signed out'),
)
```

---

### ClerkErrorListener

Listens for authentication errors and displays them.

```dart
ClerkErrorListener(
  child: YourWidget(),
)
```

---

### ClerkOrganizationList

Display and manage organizations (if enabled).

```dart
const ClerkOrganizationList()
```

---

## Accessing Auth State

### Using ClerkAuth.of()

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authState = ClerkAuth.of(context);
    final user = authState.user;
    
    return Text('Hello, ${user?.firstName}!');
  }
}
```

### ClerkAuthState Properties

| Property | Type | Description |
|----------|------|-------------|
| `user` | `User?` | Current user |
| `client` | `Client` | Client with sessions |
| `env` | `Environment` | Environment config |
| `isSignedIn` | `bool` | Whether user is signed in |
| `sessionTokenStream` | `Stream<String?>` | Session token stream |

### ClerkAuthState Methods

| Method | Description |
|--------|-------------|
| `attemptSignIn()` | Start sign-in |
| `attemptSignUp()` | Start sign-up |
| `signOut()` | Sign out current user |
| `signOutOf(Session)` | Sign out of specific session |

---

## Theming

### Apply Custom Theme

```dart
import 'package:clerk_flutter/clerk_flutter.dart';

MaterialApp(
  theme: ThemeData.light().copyWith(
    extensions: [
      ClerkTheme(
        colors: ClerkColors.light(
          primary: Colors.blue,
          background: Colors.white,
        ),
      ),
    ],
  ),
)
```

### ClerkTheme Properties

| Property | Type | Description |
|----------|------|-------------|
| `colors` | `ClerkColors` | Color scheme |
| `typography` | `ClerkTypography?` | Text styles |

---

## Deep Links for OAuth

### Setup Deep Links

1. Add `app_links` package:

```yaml
dependencies:
  app_links: ^3.5.1
```

2. Configure ClerkAuth:

```dart
import 'package:app_links/app_links.dart';

ClerkAuth(
  config: ClerkAuthConfig(
    publishableKey: 'pk_test_xxxxxxxxxxxxx',
    redirectionGenerator: (url) {
      return Uri.parse('myapp://oauth-callback');
    },
    deepLinkStream: AppLinks().allUriLinkStream.map((uri) {
      return ClerkDeepLink(uri: uri);
    }),
  ),
  child: MaterialApp(/* ... */),
)
```

3. Configure platform-specific deep links:

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="myapp" />
</intent-filter>
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>myapp</string>
        </array>
    </dict>
</array>
```

---

## Examples

### Complete App Example

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
      appBar: AppBar(title: const Text('My App')),
      body: SafeArea(
        child: ClerkErrorListener(
          child: ClerkAuthBuilder(
            signedInBuilder: (context, authState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome, ${authState.user?.firstName}!'),
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

---

## API Documentation

For complete API documentation, see:

- [pub.dev Documentation](https://pub.dev/documentation/clerk_flutter/latest/)
- [GitHub Repository](https://github.com/clerk/clerk-sdk-flutter/tree/main/packages/clerk_flutter)
- [Example App](https://github.com/clerk/clerk-sdk-flutter/tree/main/packages/clerk_flutter/example)

---

## Next Steps

- [Flutter Quickstart]({{ '/getting-started/quickstart-flutter' | relative_url }})
- [Widget Reference]({{ '/api/widgets' | relative_url }})
- [Customization Guide]({{ '/guides/customization' | relative_url }})
- [Authentication Flows]({{ '/guides/authentication' | relative_url }})

