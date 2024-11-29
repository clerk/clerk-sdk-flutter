import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

typedef _AsyncFileAction = Future<void> Function(File);

/// A default [clerk.Persistor] that just writes a cache
/// of values to the file system
///
class ClerkPersistor implements clerk.Persistor {
  ClerkPersistor._();

  static ClerkPersistor? _instance;

  /// Create and initialise a [ClerkPersistor]
  static Future<ClerkPersistor> create() async {
    if (_instance is! ClerkPersistor) {
      _instance = ClerkPersistor._();
      await _instance!._initialize();
    }
    return _instance!;
  }

  static const _writeDelay = Duration(milliseconds: 100);
  static const _filename = 'clerk_sdk_token_cache.json';

  final _cache = <String, String>{};
  Timer? _timer;
  Completer<void>? _lockCompleter;

  Future<void>? get _lock => _lockCompleter?.future;

  Future<void> _initialize() async {
    await _fileIO((file) async {
      try {
        if (file.existsSync()) {
          final data = await file.readAsString();
          _cache.addAll(json.decode(data) as Map<String, String>);
        }
      } finally {}
    });
  }

  @override
  Future<void> delete(String key) async {
    if (_cache.containsKey(key)) await _schedule(() => _cache.remove(key));
  }

  @override
  Future<String?> read(String key) async => _cache[key];

  @override
  Future<void> write(String key, String value) =>
      _schedule(() => _cache[key] = value);

  Future<void> _schedule(VoidCallback fn) async {
    await _lock;
    _timer?.cancel();
    fn.call();
    _timer = Timer(_writeDelay, _writeCache);
  }

  Future<void> _writeCache() async {
    await _fileIO((file) async {
      final data = json.encode(_cache);
      await file.writeAsString(data);
    });
  }

  Future<void> _fileIO(_AsyncFileAction fn) async {
    await _lock;
    _lockCompleter = Completer<void>();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$_filename');
    await fn.call(file);

    _lockCompleter!.complete();
  }
}
