import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

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

  /// [send] data to the back end, and receive a [Response]
  ///
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  });

  /// Upload a [File] to the back end, and receive a [Response]
  ///
  Future<Response> sendFile(
    HttpMethod method,
    Uri uri,
    File file,
    Map<String, String> headers,
  );
}

/// Default implementation of [HttpClient]
///
class DefaultHttpClient implements HttpClient {
  /// Constructor
  const DefaultHttpClient();

  static const _imageExts = ['png', 'webp'];

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    final request = Request(method.toString(), uri);

    if (headers != null) request.headers.addAll(headers);

    if (params != null) request.bodyFields = params.toStringMap();

    final streamedResponse = await request.send();
    return Response.fromStream(streamedResponse);
  }

  @override
  Future<Response> sendFile(
    HttpMethod method,
    Uri uri,
    File file,
    Map<String, String> headers,
  ) async {
    final request = MultipartRequest(method.toString(), uri);
    request.headers.addAll(headers);

    final multipartFile = await MultipartFile.fromPath(
      'file',
      file.path,
      contentType: _contentTypeFor(file),
    );
    request.files.add(multipartFile);

    final streamedResponse = await request.send();
    return Response.fromStream(streamedResponse);
  }

  MediaType _contentTypeFor(File file) {
    return switch (file.path.split('.').last.toLowerCase()) {
      'jpg' => MediaType('image', 'jpeg'),
      String ext when _imageExts.contains(ext) => MediaType('image', ext),
      String ext => throw AuthError(
          message: 'Unknown media type for upload: ###',
          substitution: ext,
        ),
    };
  }
}
