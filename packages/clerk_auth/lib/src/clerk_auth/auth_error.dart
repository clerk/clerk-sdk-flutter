class AuthError extends Error {
  AuthError({this.code, required this.message});

  final int? code;
  final String message;

  @override
  String toString() => message;
}
