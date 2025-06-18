import 'dart:convert';

/// Extension on [Object] useful for debugging
extension ObjectIdentity on Object {
  /// Returns a summary of the runtime type and hash code of `object`.
  String describeIdentity([String optimizedValue = '<optimized out>']) {
    assert(() {
      optimizedValue = runtimeType.toString();
      return true;
    }());
    return '$optimizedValue#$shortHash';
  }

  /// Returns a 5 character long hexadecimal string generated from
  /// [Object.hashCode]'s 20 least-significant bits.
  String get shortHash {
    return hashCode.toUnsigned(20).toRadixString(16).padLeft(5, '0');
  }
}

/// Extensions to the [Map] class
extension MapExtension<T, S> on Map<T, S> {
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

  /// A version of the [String] which is null if empty
  String? get orNullIfEmpty => isNotEmpty ? this : null;
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

  /// Do we contain a thing?
  bool doesNotContain(T t) => contains(t) == false;
}

/// Extension class for [Duration]
///
extension DurationExt on Duration {
  /// Is this duration zero length?
  bool get isZero => inMicroseconds == 0;

  /// Is this not a zero duration?
  bool get isNotZero => isZero == false;
}

/// Extension class to create extra statics for [DateTime] use
///
extension DateTimeExt on DateTime {
  /// The epoch as a const [DateTime] (YES I KNOW!!!)
  static const epoch = Epoch();

  /// returns a [DateTime] in UTC in seconds since epoch
  static DateTime utcEpochSeconds(int seconds) =>
      utcEpochMillis(seconds * Duration.millisecondsPerSecond);

  /// returns a [DateTime] in UTC in milliseconds since epoch
  static DateTime utcEpochMillis(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
}

/// An implementation of [DateTime] that represents the epoch exclusively
class Epoch implements DateTime {
  /// Create a const [Epoch]
  const Epoch();

  @override
  DateTime add(Duration duration) =>
      DateTime.fromMicrosecondsSinceEpoch(duration.inMicroseconds, isUtc: true);

  @override
  int compareTo(DateTime other) => -other.microsecondsSinceEpoch;

  @override
  int get day => 1;

  @override
  Duration difference(DateTime other) =>
      other is Epoch ? Duration.zero : -other.difference(this);

  @override
  int get hour => 0;

  @override
  bool isAfter(DateTime other) =>
      (isAtSameMomentAs(other) || other.isAfter(this)) == false;

  @override
  bool isAtSameMomentAs(DateTime other) => other.microsecondsSinceEpoch == 0;

  @override
  bool isBefore(DateTime other) =>
      (isAtSameMomentAs(other) || other.isBefore(this)) == false;

  @override
  bool get isUtc => true;

  @override
  int get microsecond => 0;

  @override
  int get microsecondsSinceEpoch => 0;

  @override
  int get millisecond => 0;

  @override
  int get millisecondsSinceEpoch => 0;

  @override
  int get minute => 0;

  @override
  int get month => 1;

  @override
  int get second => 0;

  @override
  DateTime subtract(Duration duration) => add(-duration);

  @override
  String get timeZoneName => 'UTC';

  @override
  Duration get timeZoneOffset => Duration.zero;

  @override
  String toIso8601String() => '1970-01-01T00:00:00.000Z';

  @override
  DateTime toLocal() => DateTime.fromMicrosecondsSinceEpoch(0, isUtc: false);

  @override
  DateTime toUtc() => this;

  @override
  int get weekday => 0;

  @override
  int get year => 1970;
}
