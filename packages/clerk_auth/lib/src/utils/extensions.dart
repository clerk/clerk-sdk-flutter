/// Extensions to the [Map] class
extension MapExtension on Map {
  /// Return a version of this map where all keys
  /// and values are converted to [String]s
  ///
  Map<String, String> toStringMap() =>
      map((k, v) => MapEntry(k.toString(), v.toString()));
}

/// Extensions to the [String] class
extension StringExtension on String {
  bool _isUpper(int c) => c >= 0x41 && c <= 0x5a;

  bool _isNumeric(int c) => c >= 0x30 && c <= 0x39;

  bool _isAlphaNumeric(int c) => _isUpper(c) || _isNumeric(c);

  /// Return a version of this string with the first
  /// character capitalised
  ///
  String get capitalized => this[0].toUpperCase() + substring(1);

  /// Return a [String] comprising all alphanumeric first characters
  /// of space-delimited words in the string, upper cased
  ///
  String get initials => toUpperCase()
      .split(' ')
      .where((t) => t.isNotEmpty && _isAlphaNumeric(t.runes.first))
      .map((t) => t[0])
      .join();
}

/// Extensions to the [List] class
extension ListExtension on List {
  /// Add all the items in an [Iterable] into the current list, either
  /// at the end of the list, or preferably replacing an existing item.
  ///
  /// Existing items are deemed replaceable if they and the new item
  /// return equal values from the [by] function, or in its absence
  /// are themselves [Comparable]ly equal
  ///
  void addOrReplaceAll<T>(Iterable<T> list, {dynamic Function(T)? by}) {
    by ??= (t) => t;
    for (final item in list) {
      final identifier = by.call(item);
      switch (indexWhere((i) => by!.call(i) == identifier)) {
        case int idx when idx > -1:
          this[idx] = item;
        default:
          add(item);
      }
    }
  }
}

/// Extension class to create extra statics for [DateTime] use
///
extension DateTimeExt on DateTime {
  /// The epoch as a [DateTime]
  static final zero = DateTimeExt.utcEpochSeconds(0);

  /// returns a [DateTime] in UTC in seconds since epoch
  static DateTime utcEpochSeconds(int seconds) =>
      utcEpochMillis(seconds * Duration.millisecondsPerSecond);

  /// returns a [DateTime] in UTC in milliseconds since epoch
  static DateTime utcEpochMillis(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
}
