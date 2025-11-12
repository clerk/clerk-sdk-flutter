class TestHttpServiceError extends Error {
  TestHttpServiceError(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}
