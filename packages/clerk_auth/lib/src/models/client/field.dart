import 'package:meta/meta.dart';

/// Pseudo-enum representing fields
///
@immutable
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

  /// username
  static const username = Field._(name: 'username');

  static final _values = <String, Field>{
    phoneNumber.name: phoneNumber,
    emailAddress.name: emailAddress,
    username.name: username,
  };

  /// The [values] of the Fields
  static List<Field> get values => _values.values.toList(growable: false);

  /// The index of this field
  int get index => values.indexOf(this);

  /// the [name] of the [Field]
  final String name;

  /// toString
  @override
  String toString() => name;

  /// toJson
  String toJson() => name;

  /// A display title for this attribute
  String get title => name.replaceAll('_', ' ');
}
