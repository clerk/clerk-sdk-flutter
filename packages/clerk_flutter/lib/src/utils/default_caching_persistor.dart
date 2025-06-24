import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:http/http.dart' as http;

/// A [clerk.Persistor] that can also function as a [ClerkFileCache]
///
class DefaultCachingPersistor extends clerk.DefaultPersistor
    implements ClerkFileCache {
  /// Constructor
  DefaultCachingPersistor({required super.getDirectory});

  @override
  Stream<File> stream(
    Uri uri, {
    Duration ttl = ClerkFileCache.defaultTTL,
    Map<String, String>? headers,
  }) async* {
    final filename = uri.hashCode.toString();
    final file = File('${cacheDirectory!.path}/$filename');

    final exists = await file.exists();
    if (exists) {
      yield file;
      final modified = await file.lastModified();
      if (DateTime.timestamp().difference(modified) < ttl) {
        return;
      }
    }

    try {
      final response = await http.get(uri, headers: headers);
      await file.writeAsBytes(response.bodyBytes);
    } on SocketException {
      // failed fetch - ignore
      return;
    }

    yield file;
  }
}
