import 'package:clerk_auth/src/models/api/external_error.dart';

/// Error class renamed this is for backwards compatibility
@Deprecated('Use ClerkError instead.')
typedef AuthError = ClerkError;

/// Error class renamed this is for backwards compatibility
@Deprecated('Use ClerkErrorCode instead.')
typedef AuthErrorCode = ClerkErrorCode;

/// Container for errors encountered during Clerk auth(entication|orization)
///
class ClerkError implements Exception {
  /// Construct an [ClerkError]
  const ClerkError({
    required this.code,
    required this.message,
    this.argument,
    this.errors,
  });

  /// Construct from an [ExternalErrorCollection]
  factory ClerkError.from(ExternalErrorCollection errors) => ClerkError(
        code: ClerkErrorCode.serverErrorResponse,
        message: errors.errorMessage,
        errors: errors,
      );

  /// Error code
  final ClerkErrorCode? code;

  /// The associated [message]
  final String message;

  /// Any arguments
  final String? argument;

  /// Any associated [ExternalErrorCollection]
  final ExternalErrorCollection? errors;

  @override
  String toString() {
    if (argument case String argument) {
      return message.replaceFirst('{arg}', argument);
    }
    return message;
  }
}

/// Code to enable consuming apps to identify the error
enum ClerkErrorCode {
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
