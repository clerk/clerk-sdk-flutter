import 'package:clerk_auth/clerk_auth.dart';
import 'package:http/http.dart' show ByteStream, Response;

class TestAuthConfig extends AuthConfig {
  const TestAuthConfig({
    required super.publishableKey,
    super.httpService = const _NoneHttpService(),
  }) : super(
          sessionTokenPolling: false,
          localesLookup: _localesLookup,
          persistor: Persistor.none,
          clientRefreshPeriod: Duration.zero,
          telemetryPeriod: Duration.zero,
        );

  static List<String> _localesLookup() => const <String>['en'];
}

class _NoneHttpService implements HttpService {
  const _NoneHttpService();

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) => Future.value(true);

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) {
    return Future.value(Response('', 200));
  }

  @override
  Future<Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) {
    return Future.value(Response('', 200));
  }
}
