import 'dart:async';
import 'package:meta/meta.dart';

/// Abstract class defining the persistence interface for values
/// required to allow seamless auth across app runs
///
abstract class Persistor {
  /// A no-op persistor used for testing (persistor is now required to use the sdk)
  @visibleForTesting
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
