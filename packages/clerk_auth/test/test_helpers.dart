import 'dart:async';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:http/http.dart' show Response;

class TestEnv {
  TestEnv._(this._map);

  factory TestEnv(String filename) {
    final dotEnv = DotEnv(filePath: filename);
    return TestEnv._(dotEnv.getDotEnv());
  }

  final Map<String, String> _map;

  String get email => _map['email'] ?? '';

  String get phoneNumber => _map['phone_number'] ?? '';

  String get password => _map['password'] ?? '';

  String get code => _map['code'] ?? '';

  String get publishableKey => _map['publishable_key'] ?? '';
}

class TestLogPrinter extends Printer {
  @override
  void print(String output) {
    Zone.root.print(output);
  }
}

class TestHttpClient implements HttpClient {
  final _expectations = <String, List<Response>>{};

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  ) async {
    final key = _key(method, uri, headers, body);

    if (_expectations[key] case List<Response> responses
        when responses.isNotEmpty) {
      final resp = responses.removeAt(0);
      return Future.value(resp);
    }
    final remaining = _expectations.keys.where((k) => _expectations[k]?.isNotEmpty == true);
    if (key.closestFrom(remaining) case String closest when closest.isNotEmpty) {
      throw TestHttpClientError(message: 'No response for $key. Possibly `$closest`?');
    } else {
      throw TestHttpClientError(message: 'No response for $key.');
    }
  }

  void expect(String key, int status, String body) {
    _expectations[key] ??= [];
    _expectations[key]!.add(Response(body, status));
  }

  String _key(
    HttpMethod method,
    Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  ) {
    final hdrs = {...?headers}
      ..remove(HttpHeaders.acceptHeader)
      ..remove(HttpHeaders.contentTypeHeader)
      ..remove(HttpHeaders.authorizationHeader);

    final queryParams = {
      ...uri.queryParameters,
      if (uri.queryParameters.containsKey(Api.kClerkSessionId)) //
        Api.kClerkSessionId: 'SESSION_ID',
    }
      ..remove(Api.kIsNative)
      ..remove(Api.kClerkJsVersion);

    return [
      method.toString(),
      uri.path,
      if (queryParams.isNotEmpty) _mapToString(queryParams),
      if (hdrs.isNotEmpty) _mapToString(hdrs),
      if (body?.isNotEmpty == true) _mapToString(body!),
    ].join(' ');
  }

  String _mapToString(Map map) =>
      map.entries.map((me) => '${me.key}=${me.value}').join('&');
}

class TestHttpClientError extends Error {
  TestHttpClientError({required this.message});

  final String message;

  @override
  String toString() => 'TestHttpClientError: $message';
}

extension on String {
  int _matchLength(String other) {
    int i;

    for (i = 0; i < length && i < other.length; ++i) {
      if (this[i] != other[i]) break;
    }

    return i;
  }

  String closestFrom(Iterable<String> list) {
    if (list.isEmpty) return '';

    String result = list.first;
    int mostMatched = _matchLength(result);
    for (final item in list.skip(1)) {
      final thisMatch = _matchLength(item);
      if (thisMatch > mostMatched) {
        mostMatched = thisMatch;
        result = item;
      }
    }

    return result;
  }
}
