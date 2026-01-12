/// A class to hold an identifier and its pretty version
class Identifier {
  /// Constructor
  const Identifier(this.identifier);

  /// The identifier
  final String identifier;

  /// The pretty version of the identifier
  String get prettyIdentifier => identifier;
}

/// A class to hold a phone number and its pretty version
class PhoneNumberIdentifier extends Identifier {
  /// Constructor
  const PhoneNumberIdentifier(super.identifier, this.prettyIdentifier);

  @override
  final String prettyIdentifier;
}
