import 'dart:convert';

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

  /// Decode a [String] that has been base64 encoded
  ///
  String get b64decoded => utf8.decode(base64.decode(base64.normalize(this)));
}

/// Extensions to the [List] class
extension ListExtension<T> on List<T> {
  /// Add all the items in an [Iterable] into the current list, either
  /// at the end of the list, or preferably replacing an existing item.
  ///
  /// Existing items are deemed replaceable if they and the new item
  /// return equal values from the [by] function
  ///
  void addOrReplaceAll<S>(
    Iterable<T> list, {
    required S Function(T) by,
  }) {
    final ids = map(by).toList();
    for (final item in list) {
      final identifier = by(item);
      switch (ids.indexOf(identifier)) {
        case int idx when idx > -1:
          this[idx] = item;
        default:
          ids.add(identifier);
          add(item);
      }
    }
  }
}

/// Extension class to create extra statics for [DateTime] use
///
extension DateTimeExt on DateTime {
  /// The epoch as a [DateTime]
  static final zero = utcEpochMillis(0);

  /// returns a [DateTime] in UTC in seconds since epoch
  static DateTime utcEpochSeconds(int seconds) =>
      utcEpochMillis(seconds * Duration.millisecondsPerSecond);

  /// returns a [DateTime] in UTC in milliseconds since epoch
  static DateTime utcEpochMillis(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
}
