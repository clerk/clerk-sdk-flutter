import 'dart:async';
import 'dart:io';

import 'package:clerk_auth/src/utils/extensions.dart';
import 'package:http/http.dart' as http;

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
abstract interface class HttpService {
  /// Construct a [HttpService]
  const HttpService();

  /// Initialises this instance of the http service
  ///
  /// It is possible that [initialize] will be called
  /// multiple times, and must be prepared for that to happen
  Future<void> initialize() async {}

  /// Terminates this instance of the http service
  ///
  /// It is possible that [terminate] will be called
  /// multiple times, and must be prepared for that to happen
  void terminate() {}

  /// Check that connectivity to an endpoint is available
  ///
  Future<bool> ping(Uri uri, {required Duration timeout});

  /// [send] data to the back end, and receive a [Response]
  ///
  Future<http.Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  });

  /// Upload a [File] to the back end, and receive a [Response]
  ///
  Future<http.Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    http.ByteStream byteStream,
    int length,
    Map<String, String> headers,
  );
}

/// Default implementation of [HttpService]
///
class DefaultHttpService extends HttpService {
  /// Constructor
  const DefaultHttpService();

  static final _clients = <DefaultHttpService, http.Client>{};

  http.Client get _client => _clients[this] ??= http.Client();

  @override
  void terminate() {
    _clients.remove(this)?.close();
  }

  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) async {
    try {
      final result = await _client.head(uri).timeout(timeout);
      return result.statusCode == 200;
    } on Exception {
      return false;
    }
  }

  @override
  Future<http.Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    final request = http.Request(method.toString(), uri);

    if (headers case Map<String, String> headers) {
      request.headers.addAll(headers);
    }

    if (params case Map<String, dynamic> params) {
      request.bodyFields = params.toStringMap();
    }

    if (body case String body) {
      request.body = body;
    }

    final streamedResponse = await _client.send(request);
    return http.Response.fromStream(streamedResponse);
  }

  @override
  Future<http.Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    http.ByteStream byteStream,
    int length,
    Map<String, String> headers,
  ) async {
    final request = http.MultipartRequest(method.toString(), uri);
    request.headers.addAll(headers);

    final multipartFile = http.MultipartFile(
      'file',
      byteStream,
      length,
      filename: byteStream.hashCode.toString(),
    );
    request.files.add(multipartFile);

    final streamedResponse = await _client.send(request);
    return http.Response.fromStream(streamedResponse);
  }
}
