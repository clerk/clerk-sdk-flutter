// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:dart_dotenv/dart_dotenv.dart';
import 'package:http/http.dart' show ByteStream, Response;
import 'package:test/test.dart' as test show expect;

export 'package:test/test.dart' hide expect;

// Override for the standard expect that lets us leave out
// the second parameter if it's simply `true`
void expect(dynamic actual, [dynamic matcher = true]) {
  test.expect(actual, matcher);
}

// This adheres to the required Clerk publishable key format, and contains
// a base64 encoding of the domain `somedomain.com`
const _testPublishableKey = r'pk_c29tZWRvbWFpbi5jb20K';

class TestEnv {
  TestEnv._(this._map);

  factory TestEnv(
    String filename, {
    Map<String, dynamic>? overrides,
  }) {
    final dotEnv = DotEnv(filePath: filename);
    final map = {
      ...dotEnv.getDotEnv(),
      if (overrides case final overrides?) //
        for (final entry in overrides.entries) //
          entry.key: entry.value.toString(),
    };
    return TestEnv._(map);
  }

  factory TestEnv.withOpenIdentifiers(String filename, String name) {
    final id = base64Encode(name.codeUnits).replaceAll('=', '').toLowerCase();
    return TestEnv(
      filename,
      overrides: {
        'password': 'Ab$id%',
        'username': 'user-$id',
        'first_name': 'User',
        'last_name': id[0].toUpperCase() + id.substring(1),
        'email': 'user-$id+clerk_test@somedomain.com',
        'phone_number': '+155555501${(name.hashCode % 90) + 10}',
        'use_open_identifiers': true,
      },
    );
  }

  final Map<String, String> _map;

  bool get recording => _map['recording'] == r'true';

  bool get useOpenIdentifiers => _map['use_open_identifiers'] == 'true';

  String get email => _map['email'] ?? r'user+clerk_test@somedomain.com';

  String get emailForLink => _map['email_for_link'] ?? email;

  String get phoneNumber => _map['phone_number'] ?? r'+5555550169';

  String get password => _map['password'] ?? r'Password8$';

  String get code => _map['code'] ?? r'424242';

  String get publishableKey => _map['publishable_key'] ?? _testPublishableKey;

  String get username => _map['username'] ?? r'testuser';

  String get firstName => _map['first_name'] ?? r'Firstname';

  String get lastName => _map['last_name'] ?? r'Lastname';
}

class TestLogPrinter extends Printer {
  @override
  void print(String output) {
    Zone.root.print(output);
  }
}

extension on num {
  String toPaddedString([int width = 3]) => toString().padLeft(width, '0');
}

class TestHttpService implements HttpService {
  TestHttpService(this.recordDirectory, this.env);

  final String recordDirectory;
  final TestEnv env;

  String? _recordPath;
  int hitCount = 0;

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

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  Future<bool> ping(Uri _, {required Duration timeout}) => Future.value(true);

  Directory get _directory {
    return Directory(
      ['./test/_responses', recordDirectory, _recordPath].nonNulls.join('/'),
    );
  }

  File _file(int count) {
    final path = '${_directory.path}/${count.toPaddedString()}.json';
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

    final key = _key(method, uri, bodyParams: params);

    final file = _file(++hitCount);

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
      final json = jsonEncode({'key': key, 'body': respBody});
      await file.writeAsString(json);
      return resp;
    }

    if (file.existsSync() == false) {
      throw TestHttpServiceError('No response available for $key ($uri)');
    }

    final respBody = await file.readAsString();
    final data = jsonDecode(respBody);
    if (data['key'] case String? expected when expected != key) {
      throw TestHttpServiceError(
        'Key clash for $key: expected $expected ($uri)',
      );
    }

    return Response(_inflateForTests(data['body'], env), 200);
  }

  bool get isCompleted {
    final file = _file(hitCount + 1);
    return file.existsSync() == false;
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
            'Unacceptable ${key.toUpperCase()} header on $method $uri: '
            '"${headers[key]}" should be "$value',
          );
        }
      }
    }
  }

  static final _identifiers = {
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
    RegExp(r'identifier":"[^@"]+@[^@"]+"'): 'identifier":"$_kEmailAddress"',
    RegExp(r'identifier":"[+*0-9]+"'): 'identifier":"$_kPhoneNumber"',
    RegExp(r'identifier":"[^%"]+"'): 'identifier":"$_kUsername"',
  };

  static final _dateRE = RegExp(r'_at":-?(\d{13})[,}]');
  static final _datetimeOffsetRE = RegExp(r'"%%DATETIME (-?\d+)%%"');

  String _deflateFromReality(String item) {
    item = _swapIdentifiers(item);

    final fields = {
      ..._fields,
      if (env.useOpenIdentifiers == false) //
        ..._obscuredIdentifierFields,
    };
    for (final MapEntry(:key, :value) in fields.entries) {
      item = item.replaceAll(key, value);
    }

    // we change timestamps to arbitrary integer offsets that still retain the
    // original order and are negative if past, positive if future. Hopefully
    // this will mean that there are fewer recommits when response files are
    // regenerated
    final now = DateTime.timestamp().millisecondsSinceEpoch;
    final timestamps = <int>{now};
    for (final match in _dateRE.allMatches(item)) {
      if (int.tryParse(match.group(1)!) case int date) {
        timestamps.add(date);
      }
    }
    int idx = -timestamps.where((d) => d < now).length;
    for (final timestamp in timestamps.toList()..sort()) {
      item = item.replaceAll('_at":$timestamp', '_at":"%%DATETIME ${idx++}%%"');
    }

    return item;
  }

  String _inflateForTests(String item, TestEnv env) {
    item = item.replaceAll(_kEmailAddress, env.email);
    item = item.replaceAll(_kPhoneNumber, env.phoneNumber);
    item = item.replaceAll(_kUsername, env.username);

    final now = DateTime.timestamp().millisecondsSinceEpoch;
    for (final match in _datetimeOffsetRE.allMatches(item)) {
      final matchString = match.group(0)!;
      final offset = int.tryParse(match.group(1)!) ?? 0;
      item = item.replaceAll(matchString, (now + offset * 1000).toString());
    }

    return item;
  }

  String _key(
    HttpMethod method,
    Uri uri, {
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
      if (bodyParams case Map<String, dynamic> params when params.isNotEmpty) //
        _mapToString(params),
    ].join(' ');
  }

  String _mapToString(Map map) {
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
      if (privateIdentifiers.contains(e.key)) {
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

class TestHttpServiceError extends Error {
  TestHttpServiceError(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class TestAuthConfig extends AuthConfig {
  const TestAuthConfig({
    required super.publishableKey,
    super.httpService = const NoneHttpService(),
  }) : super(
          sessionTokenPolling: false,
          localesLookup: _localesLookup,
          persistor: Persistor.none,
          clientRefreshPeriod: Duration.zero,
          telemetryPeriod: Duration.zero,
        );

  static List<String> _localesLookup() => const <String>['en'];
}

class NoneHttpService implements HttpService {
  const NoneHttpService();

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
