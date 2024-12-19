<p align="center">
<img src="https://images.clerk.com/static/logo-light-mode-400x400.png" height="90">
</p>

## Official [Clerk](https://clerk.com) Flutter SDK (Pre-release Alpha)

[![Pub Version](https://img.shields.io/pub/v/clerk_flutter?color=blueviolet)](https://pub.dev/packages/clerk_flutter)
[![Pub Points](https://img.shields.io/pub/points/clerk_flutter?label=pub%20points)](https://pub.dev/packages/clerk_flutter/score)
[![chat on Discord](https://img.shields.io/discord/856971667393609759.svg?logo=discord)](https://discord.com/invite/b5rXHjAg7A)
[![documentation](https://img.shields.io/badge/documentation-clerk-green.svg)](https://clerk.com/docs)
[![twitter](https://img.shields.io/twitter/follow/ClerkDev?style=social)](https://twitter.com/intent/follow?screen_name=ClerkDev)

> ### ⚠️ The Clerk Flutter SDK is in Alpha and not recommended for use in production. ⚠️
> ❗️ Breaking changes should be expected until the first stable release (1.0.0) ❗️

**Clerk helps developers build user management. We provide streamlined user experiences
for your users to sign up, sign in, and manage their profile from your Flutter code.**

## Requirements

* Flutter >= 3.24.0
* Dart >= 3.5.0

## In Development

* Organization support

## Example Usage

To use this package you will need to go to your [Clerk Dashboard](https://dashboard.clerk.com/)
create an application and copy the public and publishable API keys into your project.

```dart
class ExampleApp extends StatefulWidget {
  /// Constructs an instance of Example App
  const ExampleApp({
    super.key,
    required this.publishableKey,
  });

  /// Publishable Key
  final String publishableKey;

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClerkAuth(
        publishableKey: widget.publishableKey,
        child: Scaffold(
          backgroundColor: ClerkColors.whiteSmoke,
          body: Padding(
            padding: horizontalPadding32,
            child: Center(
              child: ClerkAuthBuilder(
                signedInBuilder: (context, auth) => const ClerkUserButton(),
                signedOutBuilder: (context, auth) =>
                    const ClerkAuthenticationWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Translation

The default language in use for alert and UI messaging within the Clerk Flutter SDK is English. For other languages, 
you will need to override the `ClerkTranslator`  passed in to the `ClerkAuth` or `ClerkAuthProvider` widgets via the 
optional `translator` parameter. Translations will need to be provided for the following (hopefully self-explanatory) 
words and phrases:
```text
Add account
Add email address
Add phone number
Already have an account?
Authenticator app
Backup code
Cancel
Click on the link that‘s been sent to ### and then check back here
Continue
Don’t have an account?
Email address
Email address '###' is invalid
Email address verification
Enter the code sent to ###
Enter the code sent to you
First name
Last name
Manage account
OK
Optional
or
Passkey
Password
Password and password confirmation must match
Password confirmation
Phone number
Phone number '###' is invalid
Phone number verification
Phone numbers
PRIMARY
Profile
Profile details
Sign in
Sign in by entering a code sent to you by email
Sign in by entering a code sent to you by text message
Sign in to ###
Sign out
Sign out of all accounts
Sign up
Sign up to ###
Type '###' invalid
UNVERIFIED
Username
Verify your email address
Verify your phone number
Web3 wallet
Welcome back! Please sign in to continue
Welcome! Please fill in the details to get started
```


### Asynchronous translation
Some translations cannot be known ahead of time e.g. arbitrary error messages from the Clerk server. An 
asynchronous translation method `translateAsync` is provided to allow for translation generation on the fly in this 
instance.

## License

This SDK is licensed under the MIT license found in the [LICENSE](./LICENSE) file.
