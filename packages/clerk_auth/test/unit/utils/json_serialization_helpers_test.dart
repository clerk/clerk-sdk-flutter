import 'package:clerk_auth/src/utils/json_serialization_helpers.dart'
    as helpers;
import 'package:test/test.dart';

void main() {
  group('json_serialization_helpers', () {
    test('isOn returns true for \'required\'', () {
      expect(helpers.isOn('required'), isTrue);
    });

    test('isOn returns true for \'on\'', () {
      expect(helpers.isOn('on'), isTrue);
    });

    test('isOn returns false for \'off\'', () {
      expect(helpers.isOn('off'), isFalse);
    });

    test('isOn returns false for null', () {
      expect(helpers.isOn(null), isFalse);
    });
  });
}
