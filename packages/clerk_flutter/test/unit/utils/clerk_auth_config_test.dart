import 'package:clerk_auth/clerk_auth.dart' show Persistor;
import 'package:clerk_flutter/src/utils/clerk_auth_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClerkAuthConfig', () {
    test('can be created with minimal parameters', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      expect(config.publishableKey, 'pk_test_123');
    });

    test('has default localizations', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      expect(config.localizations, isNotEmpty);
      expect(config.localizations.containsKey('en'), true);
    });

    test('has default fallback localization', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      expect(config.fallbackLocalization, isNotNull);
    });

    test('has default grammars', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      expect(config.grammars, isNotEmpty);
      expect(config.grammars.containsKey('en'), true);
    });

    test('has default fallback grammar', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      expect(config.fallbackGrammar, isNotNull);
    });

    test('localizationsForLocale returns localization for known locale', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      final localization = config.localizationsForLocale(const Locale('en'));
      expect(localization, isNotNull);
    });

    test('localizationsForLocale returns fallback for unknown locale', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      final localization =
          config.localizationsForLocale(const Locale('unknown'));
      expect(localization, config.fallbackLocalization);
    });

    test('loading widget can be customized', () {
      final customLoading = Container(key: const Key('custom_loading'));
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
        loading: customLoading,
      );

      expect(config.loading, customLoading);
    });

    test('loading widget can be set to null', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
        loading: null,
      );

      expect(config.loading, isNull);
    });

    test('localesLookup returns available locales', () {
      final config = ClerkAuthConfig(
        publishableKey: 'pk_test_123',
        persistor: Persistor.none,
      );

      final locales = config.localesLookup();
      expect(locales, contains('en'));
    });
  });
}

