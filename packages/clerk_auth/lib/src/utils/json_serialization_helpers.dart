import 'package:clerk_auth/src/models/client/field.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
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

/// [true] if a value is ['on'], else [false]. For JsonSerializable
bool isOn(dynamic on) => on == 'on';

/// [true] if a value is [true], else [false]. For JsonSerializable
bool isTrue(dynamic boolean) => boolean == true;

/// Returns a list of recognised [Strategy]s. For JsonSerializable
List<Strategy> toStrategyList(dynamic data) {
  if (data case List data) {
    return data.map(Strategy.named).nonNulls.toList(growable: false);
  }
  return const [];
}

/// Returns a list of recognised [Field]s. For JsonSerializable
List<Field> toFieldList(dynamic data) {
  if (data case List data) {
    return data.map(Field.named).nonNulls.toList(growable: false);
  }
  return const [];
}
