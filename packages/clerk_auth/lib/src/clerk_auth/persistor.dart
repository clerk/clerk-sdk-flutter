import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Abstract class defining the persistence interface for values
/// required to allow seamless auth across app runs
///
abstract class Persistor {
  /// Persistor used when no persistence is required
  static const none = _NonePersistor();

  /// Read a [String?] from a [key]
  ///
  FutureOr<T?> read<T>(String key);

  /// Persist a [value] against a [key]
  ///
  FutureOr<void> write<T>(String key, T value);

  /// Delete data associated with a [key]
  ///
  FutureOr<void> delete(String key);
}

final class _NonePersistor implements Persistor {
  const _NonePersistor();

  @override
  FutureOr<T?> read<T>(String key) => null;

  @override
  FutureOr<void> write<T>(String key, T value) {}

  @override
  FutureOr<void> delete(String key) {}
}

/// A default [Persistor] that just writes a cache
/// of values to the file system
///
class DefaultPersistor implements Persistor {
  DefaultPersistor._(Directory storageDirectory)
      : _cacheFile = File('${storageDirectory.path}/$_filename');

  static DefaultPersistor? _instance;

  /// Create and initialise a [DefaultPersistor]
  static Future<DefaultPersistor> create({
    required Directory storageDirectory,
  }) async {
    if (_instance is! DefaultPersistor) {
      _instance = DefaultPersistor._(storageDirectory);
      await _instance!._initialize();
    }
    return _instance!;
  }

  static const _writeDelay = Duration(milliseconds: 100);
  static const _filename = 'clerk_sdk.json';

  final File _cacheFile;

  final _cache = <String, dynamic>{};
  Timer? _timer;

  Future<void> _initialize() async {
    try {
      if (_cacheFile.existsSync()) {
        final data = await _cacheFile.readAsString();
        _cache.addAll(json.decode(data) as Map<String, dynamic>);
      }
    } on FormatException catch (_) {
      // if we can't decode the json file then we'll delete it and start over
      _cacheFile.deleteSync();
    }
  }

  @override
  FutureOr<T?> read<T>(String key) => _cache[key];

  @override
  FutureOr<void> write<T>(String key, T value) {
    _cache[key] = value;
    _save();
  }

  @override
  FutureOr<void> delete(String key) {
    if (_cache.containsKey(key)) {
      _cache.remove(key);
      _save();
    }
  }

  void _save() {
    _timer?.cancel();
    _timer = Timer(_writeDelay, () {
      final data = json.encode(_cache);
      _cacheFile.writeAsString(data);
    });
  }
}
