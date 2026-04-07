<p align="center">
<img src="https://images.clerk.com/static/logo-light-mode-400x400.png" height="90">
</p>

## Official Clerk Flutter SDK (Beta)

[![Pub Version](https://img.shields.io/badge/pub-v0.0.14--beta-blueviolet)](https://pub.dev/packages/clerk_flutter)
[![Pub Points](https://img.shields.io/pub/points/clerk_flutter?label=pub%20points)](https://pub.dev/packages/clerk_flutter/score)
[![chat on Discord](https://img.shields.io/discord/856971667393609759.svg?logo=discord)](https://clerk.com/discord)
[![documentation](https://img.shields.io/badge/documentation-clerk-green.svg)](https://clerk.com/docs)
[![twitter](https://img.shields.io/twitter/follow/Clerk?style=social)](https://twitter.com/intent/follow?screen_name=Clerk)

> ### ⚠️ The Clerk Flutter SDK is in Beta ⚠️
> ❗️ Breaking changes should be expected until the first stable release (1.0.0) ❗️

**Clerk helps developers build user management. We provide streamlined user experiences
for your users to sign up, sign in, and manage their profile from your Flutter code.**

<p align="center">
  <img src="./assets/example-light.png" width="320">
  <img src="./assets/example-dark.png" width="320">
  <br />
  <em>The clerk_flutter example app</em>
</p>

---

## Requirements

| Flutter | Dart |
|---------|------|
| 3.27.4+ | 3.6.2+ |

## 🚀 Getting Started

1. [Sign up for an account](https://dashboard.clerk.com/sign-up?utm_source=github&utm_medium=clerk_flutter_repo_readme)
2. Create an application in your Clerk dashboard
3. Copy the publishable key from the dashboard
4. Add `clerk_flutter` and `clerk_auth` to your `pubspec.yaml` 

```yaml
dependencies:
  clerk_auth: ^0.0.14-beta
  clerk_flutter: ^0.0.14-beta
```

5. You can now make use of Clerk Flutter widgets adding authentication to your application


```dart
/// Example App
class ExampleApp extends StatelessWidget {
  /// Constructs an instance of Example App
  const ExampleApp({super.key, required this.publishableKey});

  /// Publishable Key
  final String publishableKey;

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(publishableKey: publishableKey),
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: ClerkAuthBuilder(
              signedInBuilder: (context, authState) {
                return const ClerkUserButton();
              },
              signedOutBuilder: (context, authState) {
                return const ClerkAuthentication();
              },
            ),
          ),
        ),
      ),
    );
  }
}
```

## License

This project is licensed under the MIT license.

See [LICENSE](./LICENSE) for more information.
