import 'package:clerk_auth/clerk_auth.dart' as clerk;

/// A class told hold flags affecting the way the SDK and UI behave
class ClerkSdkFlags extends clerk.SdkFlags {
  /// Constructor
  const ClerkSdkFlags({this.clearCookiesOnSignOut = false});

  /// Should cookies be cleared from the internal webview when
  /// signing out of the last account, so that next oauth sign in
  /// will require password again?
  final bool clearCookiesOnSignOut;
}
