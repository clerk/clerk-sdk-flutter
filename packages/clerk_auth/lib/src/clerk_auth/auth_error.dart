/// Container for errors encountered during Clerk auth(entication|orization)
///
class AuthError extends Error {
  /// Construct an [AuthError]
  AuthError({this.code, required this.message, this.substitution});

  /// An error [code], likely to be an http status code
  final int? code;

  /// The associated [message]
  final String message;

  /// A possible [substitution] within the message
  final String? substitution;

  @override
  String toString() {
    if (substitution case String substitution) {
      return message.replaceAll('###', substitution);
    }
    return message;
  }
}
