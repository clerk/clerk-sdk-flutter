/// Container for errors encountered during Clerk auth(entication|orization)
///
class AuthError implements Exception {
  /// Construct an [AuthError]
  const AuthError({
    required this.code,
    required this.message,
    this.argument,
  });

  /// Error code
  final AuthErrorCode? code;

  /// The associated [message]
  final String message;

  /// Any arguments
  final String? argument;

  @override
  String toString() {
    if (argument case String argument) {
      return message.replaceFirst('{arg}', argument);
    }
    return message;
  }
}

/// Code to enable consuming apps to identify the error
enum AuthErrorCode {
  /// Server error response
  serverErrorResponse,

  /// Webview error response
  webviewErrorResponse,

  /// Invalid Password
  invalidPassword,

  /// Type Invalid
  typeInvalid,

  /// No stage for status
  noStageForStatus,

  /// No session token retrieved
  noSessionTokenRetrieved,

  /// No strategy associated with type,
  noAssociatedStrategy,

  /// No code retrieval method associated with the strategy,
  noAssociatedCodeRetrievalMethod,

  /// Password and password confirmation must match
  passwordMatchError,

  /// JWT poorly formatted
  jwtPoorlyFormatted,

  /// Awaited user action not completed in required timeframe
  actionNotTimely,

  /// No session found for user
  noSessionFoundForUser,

  /// Unsupported strategy for first factor
  noSuchFirstFactorStrategy,

  /// Unsupported strategy for second factor
  noSuchSecondFactorStrategy,

  /// Unsupported Sign-in attempt
  signInError,

  /// Password reset error
  passwordResetStrategyError,

  /// You are not authorized to delete your user
  cannotDeleteSelf,

  /// We are having problems connecting
  problemsConnecting,

  /// Required fields are missing
  requiredFieldsAreMissing,
}
