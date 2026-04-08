import 'dart:async';
import 'dart:convert';

import 'package:clerk_auth/src/clerk_auth/persistor/persistor.dart';
import 'package:web/web.dart' as web;

/// A default [Persistor] that uses browser localStorage for persistence
///
class DefaultPersistor implements Persistor {
  /// Constructor
  ///
  /// [getCacheDirectory] is typed as [Object?] (not `DirectoryGetter`) because
  /// `dart:io`'s [Directory] doesn't exist on web. The parameter is accepted
  /// but ignored — it exists so that the shared call site in
  /// `ClerkAuthConfig` can pass `getCacheDirectory:` on all platforms.
  DefaultPersistor({Object? getCacheDirectory});

  static const _storageKey = 'clerk_sdk_cache';

  final _cache = <String, dynamic>{};

  @override
  Future<void> initialize() async {
    try {
      final stored = web.window.localStorage.getItem(_storageKey);
      if (stored != null) {
        _cache.addAll(json.decode(stored) as Map<String, dynamic>);
      }
    } on FormatException catch (_) {
      // if we can't decode the stored data, clear it and start over
      web.window.localStorage.removeItem(_storageKey);
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
    final data = json.encode(_cache);
    web.window.localStorage.setItem(_storageKey, data);
  }
}
