import 'package:clerk_auth/clerk_auth.dart';

/// A class to hold flags to guide the action of the SDK and UI
///
class ClerkSdkFlags extends SdkFlags {
  /// Constructor
  const ClerkSdkFlags({this.clearCookiesOnSignOut = false});

  /// Should cookies be cleared from the internal webview when
  /// signing out of the last account, so that next oauth sign in
  /// will require password again?
  final bool clearCookiesOnSignOut;
}
