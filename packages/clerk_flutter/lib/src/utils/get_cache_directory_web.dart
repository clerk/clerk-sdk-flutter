/// Returns null on web — the web persistor uses IndexedDB for file-byte
/// caching (and localStorage for auth persistence), not the file system.
Object? getCacheDirectory() => null;
