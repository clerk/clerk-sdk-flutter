import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:http/http.dart';

/// Enum detailing [HttpMethod]s used by the Clerk API
enum HttpMethod {
  /// DELETE
  delete,

  /// GET
  get,

  /// PATCH
  patch,

  /// POST
  post,

  /// PUT
  put;

  /// Is the method GET or something else
  bool get isGet => this == get;

  /// Is the method something other than GET
  bool get isNotGet => isGet == false;

  @override
  String toString() => name.toUpperCase();
}

/// Abstract class defining the interface to call the
/// Clerk back-end over http
///
abstract class HttpClient {
  /// Constructor
  const HttpClient();

  /// [send] date to the back end, and receive a [Response]
  ///
  Future<Response> send(
    HttpMethod method,
    Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  );
}

/// Default implementation of [HttpClient]
///
class DefaultHttpClient implements HttpClient {
  /// Constructor
  const DefaultHttpClient();

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
