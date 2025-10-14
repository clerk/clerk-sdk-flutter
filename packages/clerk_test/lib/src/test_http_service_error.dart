class TestHttpServiceError extends Error {
  TestHttpServiceError({required this.message});

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}
