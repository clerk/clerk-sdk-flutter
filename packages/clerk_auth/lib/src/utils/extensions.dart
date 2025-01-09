import 'dart:convert';

/// Extensions to the [Map] class
extension MapExtension<T, S> on Map<T, S> {
  /// Return a version of this map where all keys
  /// and values are converted to [String]s
  ///
  Map<String, String> toStringMap() =>
      map((k, v) => MapEntry(k.toString(), v.toString()));

  /// Return [true] if [this] and [other] are equal at a deep level,
  /// else [false]
  ///
  bool deepEqual(Object other) => _deepEqual(this, other);

  bool _deepEqual(Object a, Object b) {
    if (a == b) {
      return true;
    }

    if (a.runtimeType != b.runtimeType) {
      return false;
    }

    switch ((a, b)) {
      case (Map a, Map b):
        if (a.keys.length != b.keys.length) {
          return false;
        }
        if (a.keys.toSet().difference(b.keys.toSet()).isNotEmpty) {
          return false;
        }

        for (final key in a.keys) {
          if (_deepEqual(a[key], b[key]) == false) {
            return false;
          }
        }

        return true;

      case (Iterable a, Iterable b):
        if (a.length != b.length) {
          return false;
        }

        for (int i = 0; i < a.length; ++i) {
          if (_deepEqual(a.elementAt(i), b.elementAt(i)) == false) {
            return false;
          }
        }

        return true;

      default:
        return false;
    }
  }
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
