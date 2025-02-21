/// Container for errors encountered during Clerk auth(entication|orization)
///
class AuthError extends Error {
  /// Construct an [AuthError]
  AuthError({required this.message, this.argument, this.localizationCode});

  /// The associated [message]
  final String message;

  /// Any arguments
  final dynamic argument;

  /// Localization code
  final AuthErrorLocalizationCode? localizationCode;

  @override
  String toString() {
    if (argument != null) {
      return message.replaceFirst('{arg}', argument.toString());
    }
    return message;
  }
}

/// Code to enable consuming apps to localize if they choose
enum AuthErrorLocalizationCode {
  /// No stage for status
  noStageForStatus,

  /// No session token retrieved
  noSessionTokenRetrieved,

  /// No strategy associated with type,
  noAssociatedStrategy,

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
}
