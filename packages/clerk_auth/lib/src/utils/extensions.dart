extension MapExtension on Map {
  Map<String, String> toStringMap() =>
      map((k, v) => MapEntry(k.toString(), v.toString()));
}

extension StringExtension on String {
  bool _isUpper(int c) => c >= 0x41 && c <= 0x5a;
  bool _isNumeric(int c) => c >= 0x30 && c <= 0x39;
  bool _isAlphaNumeric(int c) => _isUpper(c) || _isNumeric(c);

  String get capitalized => this[0].toUpperCase() + substring(1);

  String get initials => toUpperCase()
      .split(' ')
      .where((t) => t.isNotEmpty && _isAlphaNumeric(t.runes.first))
      .map((t) => t[0])
      .join();
}

extension ListExtension on List {
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
