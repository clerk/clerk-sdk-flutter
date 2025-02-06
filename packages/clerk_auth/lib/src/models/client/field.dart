/// Pseudo-enum representing fields
///
class Field {
  const Field._({required this.name});

  /// Create a [Field]
  factory Field({required String name}) {
    return _values[name] ??= Field._(name: name);
  }

  /// For a given [name] return the [Field] it identifies.
  /// Create one if necessary and possible
  ///
  static Field? named(dynamic name) =>
      name is String ? Field(name: name) : null;

  /// phone number
  static const phoneNumber = Field._(name: 'phone_number');

  /// email address
  static const emailAddress = Field._(name: 'email_address');

  static final _values = <String, Field>{
    phoneNumber.name: phoneNumber,
    emailAddress.name: emailAddress,
  };

  /// The [values] of the Fields
  List<Field> get values => _values.values.toList(growable: false);

  /// The index of this field
  int get index => values.indexOf(this);

  /// the [name] of the [Field]
  final String name;

  /// toJson
  String toJson() => name;
}
