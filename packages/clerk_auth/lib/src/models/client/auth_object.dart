/// A superclass for [Signin] and [SignUp]
///
abstract class AuthObject {
  /// Constructor
  const AuthObject({required this.id});

  /// The string to use in urls
  String get urlType;

  /// The [id]
  final String id;
}
