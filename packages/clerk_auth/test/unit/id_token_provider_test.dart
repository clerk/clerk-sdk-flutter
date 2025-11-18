import 'package:clerk_auth/clerk_auth.dart';

import '../test_helpers.dart';

void main() {
  group('IdTokenProvider', () {
    test('apple returns correct strategy', () {
      expect(
        IdTokenProvider.apple.strategy,
        equals(Strategy.oauthTokenApple),
      );
    });

    test('fromStrategy returns apple for oauthTokenApple', () {
      expect(
        IdTokenProvider.fromStrategy(Strategy.oauthTokenApple),
        equals(IdTokenProvider.apple),
      );
    });

    test('fromStrategy returns null for non-id-token strategies', () {
      expect(
        IdTokenProvider.fromStrategy(Strategy.password),
        isNull,
      );
    });
  });
}
