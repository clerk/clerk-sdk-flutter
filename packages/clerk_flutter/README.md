<p align="center">
  <a href="https://clerk.com?utm_source=github&utm_medium=sdk_flutter" target="_blank" rel="noopener noreferrer">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://images.clerk.com/static/logo-dark-mode-400x400.png">
      <img src="https://images.clerk.com/static/logo-light-mode-400x400.png" height="64">
    </picture>
  </a>
  <br />
</p>


# Clerk Flutter / Pre-release Alpha

The official [Clerk](https://clerk.com) Flutter client library.

This package  will allow you to authenticate your users and use Clerk services from your Flutter code.

[![Pub Version](https://img.shields.io/pub/v/clerk_flutter?color=blueviolet)](https://pub.dev/packages/clerk_flutter)
[![Pub Points](https://img.shields.io/pub/points/clerk_flutter?label=pub%20points)](https://pub.dev/packages/clerk_flutter/score)
[![chat on Discord](https://img.shields.io/discord/856971667393609759.svg?logo=discord)](https://discord.com/invite/b5rXHjAg7A)
[![documentation](https://img.shields.io/badge/documentation-clerk-green.svg)](https://clerk.com/docs)
[![twitter](https://img.shields.io/twitter/follow/ClerkDev?style=social)](https://twitter.com/intent/follow?screen_name=ClerkDev)

## Requirements

* Flutter >= 3.24.0
* Dart >= 3.5.0


## Example Usage

To use this package you will need to go to your [Clerk Dashboard](https://dashboard.clerk.com/) 
create an application and copy the public and publishable API keys into your project.

```dart
class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.publicKey,
    required this.publishableKey,
  });

  final String publicKey;
  final String publishableKey;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final persistor = const _Persistor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClerkAuth(
        publicKey: widget.publicKey,
        publishableKey: widget.publishableKey,
        persistor: persistor,
        child: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: Padding(
            padding: horizontalPadding32,
            child: Center(
              child: ClerkAuthBuilder(
                signedInBuilder: (context, auth) => const ClerkUserButton(),
                signedOutBuilder: (context, auth) => const ClerkAuthenticationWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
## License

This SDK is licensed under the MIT license found in the [LICENSE](./LICENSE) file.
