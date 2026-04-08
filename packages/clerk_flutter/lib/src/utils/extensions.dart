import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator.dart';

/// Extensions on [PasskeyAuthenticator]
///
extension AvailbilityExtension on PasskeyAuthenticator {
  /// Is passkey authentication available?
  Future<bool> get isAvailable async {
    try {
      if (kIsWeb) {
        final availability = await getAvailability().web();
        return availability.hasPasskeySupport;
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        final availability = await getAvailability().iOS();
        return availability.hasPasskeySupport;
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        final availability = await getAvailability().android();
        return availability.hasPasskeySupport;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
