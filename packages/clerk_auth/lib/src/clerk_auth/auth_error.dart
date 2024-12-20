/// Container for errors encountered during Clerk auth(entication|orization)
///
class AuthError extends Error {
  /// Construct an [AuthError]
  AuthError({this.code, required this.message, this.messageSubstitutions});

  /// An error [code], likely to be an http status code
  final int? code;

  /// The associated [message]
  final String message;

  /// A possible set of substitutions within the message
  final List<String>? messageSubstitutions;
}
