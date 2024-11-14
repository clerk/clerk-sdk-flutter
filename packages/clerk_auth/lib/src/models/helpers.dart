import 'package:clerk_auth/clerk_auth.dart';

DateTime? intToDateTime(dynamic input) {
  if (input is num) {
    return DateTime.fromMillisecondsSinceEpoch(input.toInt());
  }
  return null;
}

bool isOn(dynamic on) => on == 'on';

bool isTrue(dynamic boolean) => boolean == true;

List<Strategy> toStrategyList(dynamic data) {
  if (data case List data) {
    return data.map(Strategy.named).nonNulls.toList(growable: false);
  }
  return const [];
}
