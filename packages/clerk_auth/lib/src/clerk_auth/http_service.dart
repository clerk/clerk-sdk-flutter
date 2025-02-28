import 'dart:io';

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
abstract class HttpService {
  /// Initialises this instance of the http service
  void initialise();

  /// Terminates this instance of the http service
  void terminate();

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

/// Default implementation of [HttpService]
///
class DefaultHttpService implements HttpService {
  /// Constructor
  DefaultHttpService();

  Client? _client;

  @override
  void initialise() {
    _client ??= Client();
  }

  @override
  void terminate() {
    _client?.close();
    _client = null;
  }

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

    final streamedResponse = await _client!.send(request);
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

    final streamedResponse = await _client!.send(request);
    return Response.fromStream(streamedResponse);
  }
}
