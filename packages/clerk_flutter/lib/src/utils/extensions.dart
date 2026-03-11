import 'dart:io';

import 'package:passkeys/authenticator.dart';

/// Extensions on [PasskeyAuthenticator]
///
extension AvailbilityExtension on PasskeyAuthenticator {
  /// Is passkey authentication available?
  Future<bool> get isAvailable async {
    try {
      if (Platform.isIOS) {
        final availability = await getAvailability().iOS();
        return availability.hasPasskeySupport;
      } else if (Platform.isAndroid) {
        final availability = await getAvailability().android();
        return availability.hasPasskeySupport;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
