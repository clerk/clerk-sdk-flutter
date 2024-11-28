/// Abstract class defining the persistence interface for values
/// required to allow seamless auth across app runs
///
abstract class Persistor {
  /// Persistor used when no persistence is required
  static const none = _NonePersistor();

  /// Persist a [value] against a [key]
  ///
  Future<void> write(String key, String value);

  /// Read a [String?] from a [key]
  ///
  Future<String?> read(String key);

  /// Delete data associated with a [key]
  ///
  Future<void> delete(String key);
}

final class _NonePersistor implements Persistor {
  const _NonePersistor();

  @override
  Future<void> write(String key, String value) async {}

  @override
  Future<String?> read(String key) => Future.value(null);

  @override
  Future<void> delete(String key) async {}
}
