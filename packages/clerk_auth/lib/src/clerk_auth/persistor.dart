/// Abstract class defining the persistence interface for values
/// required to allow seamless auth across app runs
///
abstract class Persistor {
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
