<p align="center">
  <a href="https://clerk.com?utm_source=github&utm_medium=sdk_flutter" target="_blank" rel="noopener noreferrer">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://images.clerk.com/static/logo-dark-mode-400x400.png">
      <img src="https://images.clerk.com/static/logo-light-mode-400x400.png" height="64">
    </picture>
  </a>
  <br />
</p>

<div align="center">

[![Pub Version](https://img.shields.io/pub/v/clerk_flutter?color=blueviolet&label=clerk_flutter)](https://pub.dev/packages/clerk_flutter)
[![Pub Version](https://img.shields.io/pub/v/clerk_auth?color=blueviolet&label=clerk_auth)](https://pub.dev/packages/clerk_auth)
[![chat on Discord](https://img.shields.io/discord/856971667393609759.svg?logo=discord)](https://discord.com/invite/b5rXHjAg7A)
[![documentation](https://img.shields.io/badge/documentation-clerk-green.svg)](https://clerk.com/docs)

</div>

# Clerk Dart and Flutter SDKs

The official [Clerk](https://clerk.com) Dart and Flutter SDKs for authentication and user management.

**Clerk helps developers build user management. We provide streamlined user experiences for your users to sign up, sign in, and manage their profiles.**

> ### ⚠️ Beta Notice
> These SDKs are currently in Beta. Breaking changes should be expected until the first stable release (1.0.0).

---

## 📚 Documentation

**[View Full Documentation →](https://clerk.github.io/clerk-sdk-flutter/)**

Our comprehensive documentation includes:

- 🚀 [Getting Started Guides](https://clerk.github.io/clerk-sdk-flutter/getting-started)
- 📖 [API Reference](https://clerk.github.io/clerk-sdk-flutter/packages/clerk-auth)
- 🎯 [Authentication Flows](https://clerk.github.io/clerk-sdk-flutter/guides/authentication)
- 👤 [User Management](https://clerk.github.io/clerk-sdk-flutter/guides/user-management)
- 🎨 [Customization](https://clerk.github.io/clerk-sdk-flutter/guides/customization)

---

## 📦 Packages

### [clerk_auth](./packages/clerk_auth) - Dart SDK

Pure Dart SDK for backend and CLI applications.

[![Pub Version](https://img.shields.io/pub/v/clerk_auth?color=blueviolet)](https://pub.dev/packages/clerk_auth)
[![Pub Points](https://img.shields.io/pub/points/clerk_auth?label=pub%20points)](https://pub.dev/packages/clerk_auth/score)

```yaml
dependencies:
  clerk_auth: ^0.0.13-beta
```

**[View clerk_auth Documentation →](https://clerk.github.io/clerk-sdk-flutter/packages/clerk-auth)**

### [clerk_flutter](./packages/clerk_flutter) - Flutter SDK

Flutter SDK with pre-built UI components for iOS, Android, Web, and Desktop.

[![Pub Version](https://img.shields.io/pub/v/clerk_flutter?color=blueviolet)](https://pub.dev/packages/clerk_flutter)
[![Pub Points](https://img.shields.io/pub/points/clerk_flutter?label=pub%20points)](https://pub.dev/packages/clerk_flutter/score)

```yaml
dependencies:
  clerk_flutter: ^0.0.13-beta
```

**[View clerk_flutter Documentation →](https://clerk.github.io/clerk-sdk-flutter/packages/clerk-flutter)**

---

## 🚀 Quick Start

### Dart (clerk_auth)

```dart
import 'dart:io';
import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    config: AuthConfig(
      publishableKey: 'pk_test_xxxxxxxxxxxxx',
      persistor: DefaultPersistor(
        getCacheDirectory: () => Directory.current,
      ),
    ),
  );

  await auth.initialize();

  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: 'user@example.com',
    password: 'password',
  );

  print('Signed in as ${auth.user?.emailAddress}');
}
```

**[View Dart Quickstart →](https://clerk.github.io/clerk-sdk-flutter/getting-started/quickstart-dart)**

### Flutter (clerk_flutter)

```dart
import 'package:flutter/material.dart';
import 'package:clerk_flutter/clerk_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: 'pk_test_xxxxxxxxxxxxx',
      ),
      child: MaterialApp(
        home: Scaffold(
          body: ClerkAuthBuilder(
            signedInBuilder: (context, authState) {
              return Center(
                child: ClerkUserButton(showName: true),
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

**[View Flutter Quickstart →](https://clerk.github.io/clerk-sdk-flutter/getting-started/quickstart-flutter)**

---

## ✨ Features

- 🔐 **Complete Authentication** - Email, phone, OAuth, passwordless, and MFA
- 👤 **User Management** - Pre-built UI components and headless APIs
- 🏢 **Organizations** - Multi-tenant support with RBAC
- 🎨 **Customizable UI** - Themeable components that match your brand
- 📱 **Cross-Platform** - iOS, Android, Web, Windows, macOS, Linux
- 🚀 **Production Ready** - Battle-tested infrastructure

---

## 🤝 Community & Support

- 💬 [Discord Community](https://clerk.com/discord) - Chat with the community and Clerk team
- 📖 [Main Clerk Docs](https://clerk.com/docs) - Comprehensive guides and references
- 🐛 [GitHub Issues](https://github.com/clerk/clerk-sdk-flutter/issues) - Report bugs and request features
- 🐦 [Twitter](https://twitter.com/ClerkDev) - Latest updates and announcements

---

## 📄 License

These SDKs are licensed under the MIT license found in the [LICENSE](./LICENSE) file.

---

<div align="center">
  <p>Made with ❤️ by <a href="https://clerk.com">Clerk</a></p>
</div>
