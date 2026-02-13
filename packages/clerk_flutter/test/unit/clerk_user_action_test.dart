import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkUserAction', () {
    test('stores label correctly', () {
      final action = ClerkUserAction(
        label: 'Test Action',
        callback: (context, authState) {},
      );

      expect(action.label, 'Test Action');
    });

    test('stores callback correctly', () {
      var callbackCalled = false;

      final action = ClerkUserAction(
        label: 'Action',
        callback: (context, authState) {
          callbackCalled = true;
        },
      );

      expect(action.callback, isNotNull);
    });

    test('stores icon correctly', () {
      final action = ClerkUserAction(
        label: 'Icon Action',
        callback: (context, authState) {},
        icon: Icons.settings,
      );

      expect(action.icon, Icons.settings);
    });

    test('stores asset correctly', () {
      final action = ClerkUserAction(
        label: 'Asset Action',
        callback: (context, authState) {},
        asset: 'assets/icons/custom.svg',
      );

      expect(action.asset, 'assets/icons/custom.svg');
    });

    test('icon and asset can both be null', () {
      final action = ClerkUserAction(
        label: 'No Icon',
        callback: (context, authState) {},
      );

      expect(action.icon, isNull);
      expect(action.asset, isNull);
    });

    test('icon and asset can both be set', () {
      final action = ClerkUserAction(
        label: 'Both',
        callback: (context, authState) {},
        icon: Icons.person,
        asset: 'assets/icons/person.svg',
      );

      expect(action.icon, Icons.person);
      expect(action.asset, 'assets/icons/person.svg');
    });
  });
}

