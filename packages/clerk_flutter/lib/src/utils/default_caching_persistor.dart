import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:http/http.dart' as http;

/// A [clerk.Persistor] that can also function as a [ClerkFileCache]
///
class DefaultCachingPersistor extends clerk.DefaultPersistor
    implements ClerkFileCache {
  /// Constructor
  DefaultCachingPersistor({required super.getCacheDirectory});

  static const _kETagHeader = 'ETag';

  @override
  Stream<File> stream(
    Uri uri, {
    Duration ttl = ClerkFileCache.defaultTTL,
    Map<String, String>? headers,
  }) async* {
    final filename = uri.hashCode.toString();
    final file =
        File('${cacheDirectory!.path}${Platform.pathSeparator}$filename');
    final eTagFile = File('${file.path}.eTag');

    if (await file.exists()) {
      if (DateTime.timestamp().difference(await file.lastModified()) > ttl) {
        /// If the file is older than the TTL, delete it
        await file.delete();
        if (await eTagFile.exists()) {
          await eTagFile.delete();
        }
      } else {
        yield file;
      }
    }

    final eTagFileExists = await eTagFile.exists();
    final eTag = eTagFileExists ? await eTagFile.readAsString() : null;
    try {
      final response = await http.get(
        uri,
        headers: {
          ...?headers,
          if (eTag case String eTag when eTag.isNotEmpty) //
            _kETagHeader: eTag,
        },
      );
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        if (response.headers[_kETagHeader] case String eTag) {
          await eTagFile.writeAsString(eTag);
        } else if (eTagFileExists) {
          // a new image but no eTag, so the existing tag will be wrong
          await eTagFile.delete();
        }
        yield file;
      }
    } on SocketException {
      // failed fetch - ignore
    }
  }
}
