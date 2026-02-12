//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

void main() {
  group('InstanceRestrictions', () {
    late InstanceRestrictions instance;

    setUp(() {
      instance = InstanceRestrictions(
        object: InstanceRestrictionsObjectEnum.instanceRestrictions,
        allowlist: true,
        blocklist: false,
        allowlistBlocklistDisabledOnSignIn: true,
        blockEmailSubaddresses: false,
        blockDisposableEmailDomains: true,
      );
    });

    test('constructor creates instance with required parameters', () {
      expect(instance.object, InstanceRestrictionsObjectEnum.instanceRestrictions);
      expect(instance.allowlist, true);
      expect(instance.blocklist, false);
      expect(instance.allowlistBlocklistDisabledOnSignIn, true);
      expect(instance.blockEmailSubaddresses, false);
      expect(instance.blockDisposableEmailDomains, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['object'], InstanceRestrictionsObjectEnum.instanceRestrictions);
      expect(json['allowlist'], true);
      expect(json['blocklist'], false);
      expect(json['allowlist_blocklist_disabled_on_sign_in'], true);
      expect(json['block_email_subaddresses'], false);
      expect(json['block_disposable_email_domains'], true);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'object': 'instance_restrictions',
        'allowlist': false,
        'blocklist': true,
        'allowlist_blocklist_disabled_on_sign_in': false,
        'block_email_subaddresses': true,
        'block_disposable_email_domains': false,
      };
      final result = InstanceRestrictions.fromJson(json);
      expect(result, isNotNull);
      expect(result!.object, InstanceRestrictionsObjectEnum.instanceRestrictions);
      expect(result.allowlist, false);
      expect(result.blocklist, true);
      expect(result.allowlistBlocklistDisabledOnSignIn, false);
      expect(result.blockEmailSubaddresses, true);
      expect(result.blockDisposableEmailDomains, false);
    });

    test('fromJson returns null for non-map input', () {
      expect(InstanceRestrictions.fromJson('invalid'), isNull);
      expect(InstanceRestrictions.fromJson(123), isNull);
      expect(InstanceRestrictions.fromJson(null), isNull);
    });

    test('listFromJson creates list from json array', () {
      final jsonList = [
        {
          'object': 'instance_restrictions',
          'allowlist': true,
          'blocklist': false,
          'allowlist_blocklist_disabled_on_sign_in': true,
          'block_email_subaddresses': false,
          'block_disposable_email_domains': true,
        },
        {
          'object': 'instance_restrictions',
          'allowlist': false,
          'blocklist': true,
          'allowlist_blocklist_disabled_on_sign_in': false,
          'block_email_subaddresses': true,
          'block_disposable_email_domains': false,
        },
      ];
      final result = InstanceRestrictions.listFromJson(jsonList);
      expect(result.length, 2);
      expect(result[0].allowlist, true);
      expect(result[1].allowlist, false);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(InstanceRestrictions.listFromJson([]), isEmpty);
      expect(InstanceRestrictions.listFromJson(null), isEmpty);
    });

    test('equality operator works correctly', () {
      final other = InstanceRestrictions(
        object: InstanceRestrictionsObjectEnum.instanceRestrictions,
        allowlist: true,
        blocklist: false,
        allowlistBlocklistDisabledOnSignIn: true,
        blockEmailSubaddresses: false,
        blockDisposableEmailDomains: true,
      );
      expect(instance, equals(other));
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('InstanceRestrictions'));
      expect(str, contains('allowlist=true'));
    });

    test('requiredKeys contains required fields', () {
      expect(InstanceRestrictions.requiredKeys, contains('object'));
      expect(InstanceRestrictions.requiredKeys, contains('allowlist'));
      expect(InstanceRestrictions.requiredKeys, contains('blocklist'));
      expect(InstanceRestrictions.requiredKeys, contains('allowlist_blocklist_disabled_on_sign_in'));
      expect(InstanceRestrictions.requiredKeys, contains('block_email_subaddresses'));
      expect(InstanceRestrictions.requiredKeys, contains('block_disposable_email_domains'));
    });
  });

  group('InstanceRestrictionsObjectEnum', () {
    test('values contains all enum values', () {
      expect(InstanceRestrictionsObjectEnum.values, contains(InstanceRestrictionsObjectEnum.instanceRestrictions));
    });

    test('toJson returns correct string', () {
      expect(InstanceRestrictionsObjectEnum.instanceRestrictions.toJson(), 'instance_restrictions');
    });

    test('fromJson parses correct value', () {
      expect(InstanceRestrictionsObjectEnum.fromJson('instance_restrictions'), InstanceRestrictionsObjectEnum.instanceRestrictions);
    });

    test('fromJson returns null for unknown value', () {
      expect(InstanceRestrictionsObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
