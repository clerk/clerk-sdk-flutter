import 'package:clerk_auth/clerk_auth.dart';
import 'package:meta/meta.dart';

/// Pseudo-enum representing fields
///
@immutable
class Field {
  const Field._(this.name);

  /// Create a [Field]
  factory Field({required String name}) {
    return _values[name] ??= Field._(name);
  }

  /// fromJson factory for JsonSerializable
  factory Field.fromJson(String name) => Field(name: name);

  /// phone number
  static const phoneNumber = Field._('phone_number');

  /// email address
  static const emailAddress = Field._('email_address');

  /// username
  static const username = Field._('username');

  /// password
  static const password = Field._('password');

  /// saml
  static const saml = Field._('saml');

  /// enterprise sso
  static const enterpriseSSO = Field._('enterprise_sso');

  static final _values = <String, Field>{
    phoneNumber.name: phoneNumber,
    emailAddress.name: emailAddress,
    username.name: username,
    password.name: password,
    saml.name: saml,
    enterpriseSSO.name: enterpriseSSO,
  };

  /// The [values] of the Fields
  static List<Field> get values => _values.values.toList(growable: false);

  /// The index of this field
  int get index => values.indexOf(this);

  /// the [name] of the [Field]
  final String name;

  /// toJson
  String toJson() => name;

  /// toJson
  @override
  String toString() => name;

  /// A display title for this attribute
  String get title => name.replaceAll('_', ' ');

  /// return the appropriate [Field] for a [UserAttribute]
  static Field? forUserAttribute(UserAttribute attribute) {
    return switch (attribute) {
      UserAttribute.phoneNumber => phoneNumber,
      UserAttribute.emailAddress => emailAddress,
      _ => null,
    };
  }
}
