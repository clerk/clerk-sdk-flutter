import 'dart:io';

/// An interface to enable read-through cache for e.g. image caching
abstract class ClerkFileCache {
  /// The default TTL for a file in cache
  static const defaultTTL = Duration(days: 30);

  /// Initialises this instance of the file cache
  ///
  /// It is possible that [initialize] will be called
  /// multiple times, and must be prepared for that to happen
  Future<void> initialize() async {}

  /// Terminates this instance of the file cache
  ///
  /// It is possible that [terminate] will be called
  /// multiple times, and must be prepared for that to happen
  void terminate() {}

  /// A function to initiate a stream of files for a given [Uri].
  ///
  /// If the file exists in cache, this should be sent initially.
  ///
  /// If the file does not exist or was created longer ago than the [ttl]
  /// an attempt should be made to read it from the [uri]. If successful
  /// this version of the file should be stored and sent into the stream.
  ///
  /// Once either or both have been sent the stream should close
  ///
  Stream<File> stream(
    Uri uri, {
    Duration ttl = defaultTTL,
    Map<String, String>? headers,
  });
}
