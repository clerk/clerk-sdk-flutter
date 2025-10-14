import 'package:clerk_auth/src/utils/extensions.dart';

/// Convert a value to a [DateTime]. For JsonSerializable
DateTime intToDateTime(dynamic input) {
  if (input is num) {
    return DateTimeExt.utcEpochMillis(input.toInt());
  }
  return DateTimeExt.epoch;
}

/// Convert a [DateTime] to an [int]. For JsonSerializable
int dateTimeToInt(DateTime dt) => dt.millisecondsSinceEpoch;

/// [true] if a value is ['on'] or ['required'], else [false]. For
/// JsonSerializable
bool isOn(dynamic value) => value == 'on' || value == 'required';

/// [true] if a value is [true], else [false]. For JsonSerializable
bool isTrue(dynamic boolean) => boolean == true;

/// Read a [String] from a map
String readString(Map map, String name, String subname) =>
    readItem<String>(map, name, subname) ?? '';

/// Read a [bool] from a map
bool readBool(Map map, String name, String subname) =>
    readItem<bool>(map, name, subname) ?? false;

/// Read the enabled status of a key in a map
bool readEnabled(Map map, String name) => readBool(map, name, 'enabled');

/// Read an item from a map. The item could either be at the top level, or in
/// a submap at a named position
T? readItem<T>(Map map, String name, String subname) {
  return switch (map[name]) {
    T result => result,
    Map submap => submap[subname] as T?,
    _ => null,
  };
}
