import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:phone_input/phone_input_package.dart';

/// A class to hold an identifier and its pretty version
class Identifier {
  /// Constructor
  const Identifier(this.identifier);

  /// Create an [Identifier] from a [String] if it is not null
  static Identifier? orNull(String? identifier) =>
      identifier is String ? Identifier(identifier) : null;

  /// The identifier
  final String identifier;

  /// The pretty version of the identifier
  String get prettyIdentifier => identifier;
}

/// A class to hold a phone number and its pretty version
class PhoneNumberIdentifier extends Identifier {
  /// Constructor
  const PhoneNumberIdentifier(super.identifier, this.prettyIdentifier);

  /// Create a [PhoneNumberIdentifier] from a [String] if it is not null
  static PhoneNumberIdentifier? orNull(String? identifier) {
    if (identifier is String) {
      try {
        if (PhoneNumber.parse(identifier) case final phn when phn.isValid()) {
          return PhoneNumberIdentifier(phn.international, phn.intlFormattedNsn);
        }
      } catch (e) {
        // Should be a [PhoneNumberException], but that's sadly not exported
        // ignore
      }
    }
    return null;
  }

  @override
  final String prettyIdentifier;
}
