import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Abstract class defining the persistence interface for values
/// required to allow seamless auth across app runs
///
abstract class Persistor {
  /// Persistor used when no persistence is required
  static const none = _NonePersistor();

  /// Initialise the service
  Future<void> initialize();

  /// Terminate the service
  void terminate();

  /// Read a [String?] from a [key]
  FutureOr<T?> read<T>(String key);

  /// Persist a [value] against a [key]
  FutureOr<void> write<T>(String key, T value);

  /// Delete data associated with a [key]
  FutureOr<void> delete(String key);
}

final class _NonePersistor implements Persistor {
  const _NonePersistor();

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  FutureOr<T?> read<T>(String key) => null;

  @override
  FutureOr<void> write<T>(String key, T value) {}

  @override
  FutureOr<void> delete(String key) {}
}

/// A function which returns a directory for file operations
typedef DirectoryGetter = FutureOr<Directory> Function();

/// A default [Persistor] that just writes a cache
/// of values to the file system
///
class DefaultPersistor implements Persistor {
  /// Constructor
  DefaultPersistor({required DirectoryGetter directoryGetter})
      : _directoryGetter = directoryGetter;

  static const _writeDelay = Duration(milliseconds: 600);
  static const _filename = 'clerk_sdk.json';

  final DirectoryGetter _directoryGetter;
  final _cache = <String, dynamic>{};
  late final File _cacheFile;
  Timer? _timer;

  @override
  Future<void> initialize() async {
    final storageDirectory = await _directoryGetter();
    _cacheFile = File('${storageDirectory.path}/$_filename');
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
  void terminate() {}

  @override
  FutureOr<T?> read<T>(String key) => _cache[key] as T?;

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
