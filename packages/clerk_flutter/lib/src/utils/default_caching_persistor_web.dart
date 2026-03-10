import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
// Direct import of the web persistor — can't use `clerk.DefaultPersistor`
// because the conditional export in `clerk_auth.dart` resolves to the IO
// version in the analyzer's default context.
import 'package:clerk_auth/clerk_auth_persistor_web.dart';
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:http/http.dart' as http;
import 'package:universal_io/universal_io.dart';
import 'package:web/web.dart' as web;

/// A [clerk.Persistor] that can also function as a [ClerkFileCache]
/// on the web platform. Inherits localStorage auth persistence from
/// [DefaultPersistor] and adds IndexedDB for image byte caching.
///
class DefaultCachingPersistor extends DefaultPersistor
    implements ClerkFileCache {
  /// Constructor
  DefaultCachingPersistor({super.getCacheDirectory});

  static const _kETagHeader = 'ETag';

  // IndexedDB constants
  static const _dbName = 'clerk_flutter_files';
  static const _dbVersion = 1;
  static const _storeName = 'file_cache';

  web.IDBDatabase? _db;

  @override
  Future<void> initialize() async {
    await super.initialize();
    _db = await _openDatabase();
  }

  @override
  void terminate() {
    _db?.close();
    _db = null;
    super.terminate();
  }

  // -- IndexedDB helpers --

  Future<web.IDBDatabase> _openDatabase() {
    final completer = Completer<web.IDBDatabase>();
    final request = web.window.indexedDB.open(_dbName, _dbVersion);

    request.onupgradeneeded = (web.IDBVersionChangeEvent event) {
      final db = (event.target as web.IDBRequest).result as web.IDBDatabase;
      if (!db.objectStoreNames.contains(_storeName)) {
        db.createObjectStore(_storeName);
      }
    }.toJS;

    request.onsuccess = (web.Event event) {
      completer.complete(request.result as web.IDBDatabase);
    }.toJS;

    request.onerror = (web.Event event) {
      completer.completeError(
        request.error?.message ?? 'Failed to open IndexedDB',
      );
    }.toJS;

    return completer.future;
  }

  Future<void> _idbPut(String key, Uint8List bytes) async {
    final db = _db;
    if (db == null) return;

    final completer = Completer<void>();
    final txn = db.transaction(_storeName.toJS, 'readwrite');
    final store = txn.objectStore(_storeName);

    final record = _CacheRecord(
      bytes: bytes.buffer.toJS,
      timestamp: DateTime.timestamp().millisecondsSinceEpoch,
    );

    final request = store.put(record, key.toJS);
    request.onsuccess = (web.Event _) {
      completer.complete();
    }.toJS;
    request.onerror = (web.Event _) {
      completer.completeError(
        request.error?.message ?? 'IndexedDB put failed',
      );
    }.toJS;

    return completer.future;
  }

  Future<({Uint8List bytes, DateTime timestamp})?> _idbGet(String key) async {
    final db = _db;
    if (db == null) return null;

    final completer = Completer<({Uint8List bytes, DateTime timestamp})?>();
    final txn = db.transaction(_storeName.toJS, 'readonly');
    final store = txn.objectStore(_storeName);
    final request = store.get(key.toJS);

    request.onsuccess = (web.Event _) {
      final result = request.result;
      if (result == null || result.isUndefinedOrNull) {
        completer.complete(null);
        return;
      }
      try {
        final record = result as _CacheRecord;
        completer.complete((
          bytes: record.bytes.toDart.asUint8List(),
          timestamp: DateTime.fromMillisecondsSinceEpoch(
            record.timestamp,
            isUtc: true,
          ),
        ));
      } catch (_) {
        completer.complete(null);
      }
    }.toJS;

    request.onerror = (web.Event _) {
      completer.complete(null);
    }.toJS;

    return completer.future;
  }

  Future<void> _idbDelete(String key) async {
    final db = _db;
    if (db == null) return;

    final completer = Completer<void>();
    final txn = db.transaction(_storeName.toJS, 'readwrite');
    final store = txn.objectStore(_storeName);
    final request = store.delete(key.toJS);

    request.onsuccess = (web.Event _) {
      completer.complete();
    }.toJS;
    request.onerror = (web.Event _) {
      completer.completeError(
        request.error?.message ?? 'IndexedDB delete failed',
      );
    }.toJS;

    return completer.future;
  }

  // -- ClerkFileCache implementation --

  @override
  Stream<Uint8List> stream(
    Uri uri, {
    Duration ttl = ClerkFileCache.defaultTTL,
    Map<String, String>? headers,
  }) async* {
    final key = uri.hashCode.toString();
    final etagKey = '$key.etag';

    // Check IndexedDB cache
    final cached = await _idbGet(key);
    if (cached != null) {
      if (DateTime.timestamp().difference(cached.timestamp) > ttl) {
        await _idbDelete(key);
        await delete(etagKey);
      } else {
        yield cached.bytes;
      }
    }

    // Fetch from network
    final etag = await read<String>(etagKey);
    try {
      final response = await http.get(
        uri,
        headers: {
          ...?headers,
          if (etag case final etag?) //
            _kETagHeader: etag,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final bytes = Uint8List.fromList(response.bodyBytes);
        await _idbPut(key, bytes);
        if (response.headers[_kETagHeader] case final etag?) {
          await write(etagKey, etag);
        } else if (etag is String) {
          await delete(etagKey);
        }
        yield bytes;
      }
    } catch (_) {
      // failed fetch - ignore
    }
  }
}

/// Type-safe JS interop for IndexedDB cache records.
extension type _CacheRecord._(JSObject _) implements JSObject {
  external factory _CacheRecord({JSArrayBuffer bytes, int timestamp});

  external JSArrayBuffer get bytes;
  external int get timestamp;
}
