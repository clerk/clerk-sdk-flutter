// ignore_for_file: avoid_print

import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_test/src/test_env.dart';
import 'package:clerk_test/src/test_http_service_error.dart';
import 'package:http/http.dart';

class _Expectation {
  _Expectation._(this.name);

  final String name;

  int _count = 0;
  int _expectation = 0;

  void hit() => ++_count;

  void increaseExpectation() => ++_expectation;

  int get count => _count;

  int get remaining => _expectation - _count;

  bool get isComplete => _count == _expectation;

  bool get isNotComplete => isComplete == false;
}

class _ExpectationCollection {
  final _expectations = <String, _Expectation>{};

  void reset() => _expectations.clear();

  _Expectation of(String name) => _expectations[name] ??= _Expectation._(name);

  bool expects(String name) => _expectations[name]?.isNotComplete == true;

  List<_Expectation> get unresolvedExpectations =>
      _expectations.values.where((e) => e.isNotComplete).toList();
}

extension on num {
  String toPaddedString([int width = 3]) => toString().padLeft(width, '0');
}

class TestHttpService implements HttpService {
  TestHttpService(this.recordDirectory, this.env);

  final _expectations = _ExpectationCollection();
  final String recordDirectory;
  final TestEnv env;

  String? _recordPath;

  set recordPath(String? path) {
    _recordPath = path;
    if (path is String && env.recording) {
      // if we're given a path when recording, delete what's there so we
      // can start afresh
      final dir = _directory;
      if (dir.existsSync()) {
        dir.deleteSync(recursive: true);
      }
    }
  }

  void reset() {
    recordPath = null;
    _expectations.reset();
  }

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  Future<bool> ping(Uri _, {required Duration timeout}) => Future.value(true);

  Directory get _directory {
    final segments = [
      Directory.current.path,
      'test/_responses',
      recordDirectory,
      _recordPath
    ];
    return Directory(segments.nonNulls.join('/'));
  }

  File _file(String name) {
    final count = _expectations.of(name).count.toPaddedString();
    final filename = '${name.replaceAll('/', '.')}.$count';
    final path = '${_directory.path}/$filename';
    return File(path);
  }

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    _checkHeaders(method, uri, headers);

    String key =
        _key(method, uri, bodyParams: params, includeIdentifiers: true);
    if (_expectations.expects(key) == false) {
      key = _key(method, uri, bodyParams: params);
    }
    _expectations.of(key).hit();

    final file = _file(key);

    if (env.recording) {
      const service = DefaultHttpService();
      final resp = await service.send(
        method,
        uri,
        headers: headers,
        params: params,
        body: body,
      );
      await _directory.create(recursive: true);
      final respBody = _deflateFromReality(resp.body);
      await file.writeAsString(respBody);
      return resp;
    }

    if (await file.exists()) {
      final responseBody = await file.readAsString();
      return Response(_inflateForTests(responseBody, env), 200);
    }

    print('\x1B[31mNO RESPONSE AVAILABLE FOR: $key ($uri)\x1B[0m');
    throw TestHttpServiceError(
      message: 'No response available for $key ($uri)',
    );
  }

  void expect(
    HttpMethod method,
    String path, {
    bool includeIdentifiers = false,
    Map<String, dynamic>? params,
  }) {
    final key = _key(
      method,
      Uri.parse(path),
      bodyParams: params,
      includeIdentifiers: includeIdentifiers,
    );
    _expectations.of(key).increaseExpectation();
  }

  bool get isCompleted {
    if (env.recording) {
      return true; // no way to tell
    }

    final remaining = _expectations.unresolvedExpectations;
    for (final exp in remaining) {
      print('\x1B[31mUNUSED CALL: ${exp.remaining} x ${exp.name}\x1B[0m');
    }

    return remaining.isEmpty;
  }

  void _checkHeaders(HttpMethod method, Uri uri, Map<String, String>? headers) {
    if (headers case Map<String, String> headers) {
      final expectedHeaders = {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.acceptLanguageHeader: 'en',
        HttpHeaders.contentTypeHeader: method.isGet
            ? 'application/json'
            : 'application/x-www-form-urlencoded',
        'clerk-api-version': ClerkConstants.clerkApiVersion,
        'x-flutter-sdk-version': ClerkConstants.flutterSdkVersion,
        'x-mobile': '1',
      };
      for (final MapEntry(:key, :value) in expectedHeaders.entries) {
        if (headers[key] != value) {
          throw TestHttpServiceError(
            message:
                'Unacceptable ${key.toUpperCase()} header on $method $uri: '
                '"${headers[key]}" should be "$value',
          );
        }
      }
    }
  }

  final _identifiers = {
    RegExp(r'sia_\w+'): r'SIGN_IN_ID',
    RegExp(r'sua_\w+'): r'SIGN_UP_ID',
    RegExp(r'idn_\w+'): r'IDENTIFIER_ID',
    RegExp(r'sess_\w+'): r'SESSION_ID',
    RegExp(r'aac_\w+'): r'AUTH_CONFIG_ID',
    RegExp(r'display_config_\w+'): r'DISPLAY_CONFIG_ID',
    RegExp(r'img_\w+'): r'IMAGE_ID',
    RegExp(r'user_\w{13,}'): r'USER_ID',
    RegExp(r'client_\w{13,}'): r'CLIENT_ID',
    RegExp(r'https://img\.clerk\.\w+/[^"]+"'): r'IMAGE_URL"',
    RegExp(r'https://www\.gravatar\.\w+/avatar\?d=mp'): r'GRAVATAR_URL',
    RegExp(r'_url":"[^"]+"'): r'_url":"URL"',
    RegExp(r'"application_name":"[^"]+"'):
        r'"application_name":"APPLICATION_NAME"',
    RegExp(r'"google_one_tap_client_id":"[^"]+"'):
        r'"google_one_tap_client_id":"GOOGLE_ONE_TAP_CLIENT_ID"',
    RegExp(r'"allowed_special_characters":".+",'):
        r'"allowed_special_characters":"+$-_",',
    RegExp(r'"allowed_special_characters":".+"}'):
        r'"allowed_special_characters":"+$-_"}',
  };

  String _swapIdentifiers(String item) {
    for (final MapEntry(:key, :value) in _identifiers.entries) {
      item = item.replaceAll(key, value);
    }
    return item;
  }

  static const _kFirstName = '%%FIRSTNAME%%';
  static const _kLastName = '%%LASTNAME%%';
  static const _kEmailAddress = '%%EMAIL%%';
  static const _kPhoneNumber = '%%PHONE%%';
  static const _kUsername = '%%USERNAME%%';

  static final _fields = {
    RegExp(r'"jwt":"[^"]+"'): '"jwt":"e30=.e30=.e30="',
  };

  static final _obscuredIdentifierFields = {
    RegExp(r'"first_name":"\w+"'): '"first_name":"$_kFirstName"',
    RegExp(r'"last_name":"\w+"'): '"last_name":"$_kLastName"',
    RegExp(r'"email_address":"[^"]+"'): '"email_address":"$_kEmailAddress"',
    RegExp(r'"phone_number":"[^"]+"'): '"phone_number":"$_kPhoneNumber"',
    RegExp(r'identifier":"[^@"]+@[^@"]+"'): 'identifier":"$_kEmailAddress"',
    RegExp(r'identifier":"[+*0-9]+"'): 'identifier":"$_kPhoneNumber"',
    RegExp(r'identifier":"[^%"]+"'): 'identifier":"$_kUsername"',
  };

  static final _dateRE = RegExp(r'_at":-?(\d{13})[,}]');

  String _deflateFromReality(String item) {
    item = _swapIdentifiers(item);

    final fields = {..._fields, ..._obscuredIdentifierFields};
    for (final MapEntry(:key, :value) in fields.entries) {
      item = item.replaceAll(key, value);
    }

    final now = DateTime.timestamp().millisecondsSinceEpoch;
    for (final match in _dateRE.allMatches(item)) {
      if (int.tryParse(match.group(1)!) case int date) {
        item = item.replaceAll(date.toString(), '"%%DATETIME ${now - date}%%"');
      }
    }

    return item;
  }

  static final _datetimeOffsetRE = RegExp(r'"%%DATETIME (-?\d+)%%"');

  String _inflateForTests(String item, TestEnv env) {
    item = item.replaceAll(_kEmailAddress, env.email);
    item = item.replaceAll(_kPhoneNumber, env.phoneNumber);
    item = item.replaceAll(_kUsername, env.username);

    final now = DateTime.timestamp().millisecondsSinceEpoch;
    for (final match in _datetimeOffsetRE.allMatches(item)) {
      final matchString = match.group(0)!;
      final offset = int.tryParse(match.group(1)!) ?? 0;
      item = item.replaceAll(matchString, (now - offset).toString());
    }

    return item;
  }

  String _key(
    HttpMethod method,
    Uri uri, {
    bool includeIdentifiers = false,
    Map<String, dynamic>? bodyParams,
  }) {
    final queryParams = {
      ...uri.queryParameters,
      if (uri.queryParameters.containsKey('_clerk_session_id')) //
        '_clerk_session_id': 'SESSION_ID',
    }
      ..remove('_is_native')
      ..remove('_clerk_js_version');

    final normalisedPath = Uri(
      path: _swapIdentifiers(uri.path),
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    ).toString();

    return [
      method,
      normalisedPath,
      if (bodyParams case final params? when params.isNotEmpty) //
        _mapToString(params, includeIdentifiers),
    ].join(' ');
  }

  String _mapToString(Map map, bool includeIdentifiers) {
    const privateIdentifiers = [
      'identifier',
      'email_address',
      'phone_number',
      'first_name',
      'last_name',
      'password',
      'username',
    ];
    final pairs = map.entries.map((e) {
      if (includeIdentifiers == false && privateIdentifiers.contains(e.key)) {
        return e.key;
      }
      return '${e.key}=${_swapIdentifiers(e.value.toString())}';
    }).toList()
      ..sort();
    return pairs.join('&');
  }

  @override
  Future<Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    ByteStream stream,
    int length,
    Map<String, String> headers,
  ) {
    // TODO: add tests for sendFile
    throw UnimplementedError();
  }
}
