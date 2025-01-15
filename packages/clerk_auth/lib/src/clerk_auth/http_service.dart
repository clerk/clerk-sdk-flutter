import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
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
abstract class HttpService {
  /// Constructor
  const HttpService();

  /// An empty implementation
  static final none = _NoneHttpService();

  /// [send] data to the back end, and receive a [Response]
  ///
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  });

  /// Upload a [File] to the back end, and receive a [Response]
  ///
  Future<Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    ByteStream byteStream,
    int length,
    Map<String, String> headers,
  );
}

class _NoneHttpService implements HttpService {
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

/// Default implementation of [HttpService]
///
class DefaultHttpService implements HttpService {
  /// Constructor
  const DefaultHttpService();

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    final request = Request(method.toString(), uri);

    if (headers case Map<String, String> headers) {
      request.headers.addAll(headers);
    }

    if (params case Map<String, dynamic> params) {
      request.bodyFields = params.toStringMap();
    }

    if (body case String body) {
      request.body = body;
    }

    final streamedResponse = await request.send();
    return Response.fromStream(streamedResponse);
  }

  @override
  Future<Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) async {
    final request = MultipartRequest(method.toString(), uri);
    request.headers.addAll(headers);

    final multipartFile = MultipartFile(
      'file',
      byteStream,
      length,
      filename: byteStream.hashCode.toString(),
    );
    request.files.add(multipartFile);

    final streamedResponse = await request.send();
    return Response.fromStream(streamedResponse);
  }
}
