/// Container for errors encountered during Clerk auth(entication|orization)
///
class AuthError extends Error {
  /// Construct an [AuthError]
  AuthError({this.code, required this.message, this.substitutions});

  /// An error [code], likely to be an http status code
  final int? code;

  /// The associated [message]
  final String message;

  /// A possible [substitution] within the message
  final List<dynamic>? substitutions;

  @override
  String toString() {
    if (substitutions case List<dynamic> subs when subs.isNotEmpty) {
      String msg = message.replaceFirst('###', subs.first);
      for (int i = 1; i < subs.length; ++i) {
        msg = msg.replaceFirst('#${i + 1}#', subs[i].toString());
      }
      return msg;
    }
    return message;
  }
}
