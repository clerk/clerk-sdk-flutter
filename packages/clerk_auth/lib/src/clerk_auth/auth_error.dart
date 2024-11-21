/// Container for errors encountered during Clerk auth(entication|orization)
///
class AuthError extends Error {
  /// Construct an [AuthError]
  AuthError({this.code, required this.message});

  /// An error [code], likely to be an http status code
  final int? code;

  /// The associated [message]
  final String message;

  @override
  String toString() => message;
}
