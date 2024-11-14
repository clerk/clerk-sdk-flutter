import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:http/http.dart';

enum HttpMethod {
  delete,
  get,
  patch,
  post,
  put;

  bool get isGet => this == get;

  bool get isNotGet => isGet == false;

  @override
  String toString() => name.toUpperCase();
}

abstract class HttpClient {
  Future<Response> send(
    HttpMethod method,
    Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  );
}

class DefaultHttpClient implements HttpClient {
  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  ) async {
    final request = Request(method.toString(), uri);
    if (headers != null) {
      request.headers.addAll(headers);
    }
    if (body != null) {
      request.bodyFields = body.toStringMap();
    }
    final streamedResponse = await request.send();
    return Response.fromStream(streamedResponse);
  }
}
