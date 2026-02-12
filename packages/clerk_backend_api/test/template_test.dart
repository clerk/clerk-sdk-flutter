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
  group('Template', () {
    late Template instance;

    setUp(() {
      instance = Template(
        id: 'tmpl_123',
        object: TemplateObjectEnum.template,
        instanceId: 'inst_123',
        resourceType: 'user',
        templateType: 'email',
        name: 'Welcome Email',
        slug: 'welcome_email',
        position: 1,
        canRevert: true,
        canDelete: false,
        canEditBody: true,
        canToggle: false,
        subject: 'Welcome to our app!',
        markup: '<h1>Welcome</h1>',
        body: 'Welcome {{name}}!',
        availableVariables: ['name', 'email'],
        requiredVariables: ['name'],
        fromEmailName: 'Support',
        replyToEmailName: 'No Reply',
        deliveredByClerk: true,
        enabled: true,
        flaggedAsSuspicious: false,
        updatedAt: 1700001000,
        createdAt: 1700000000,
      );
    });

    test('constructor creates instance with optional parameters', () {
      final empty = Template();
      expect(empty.id, isNull);
      expect(empty.object, isNull);
      expect(empty.availableVariables, isEmpty);
      expect(empty.requiredVariables, isEmpty);
    });

    test('constructor creates instance with all parameters', () {
      expect(instance.id, 'tmpl_123');
      expect(instance.object, TemplateObjectEnum.template);
      expect(instance.instanceId, 'inst_123');
      expect(instance.resourceType, 'user');
      expect(instance.templateType, 'email');
      expect(instance.name, 'Welcome Email');
      expect(instance.slug, 'welcome_email');
      expect(instance.position, 1);
      expect(instance.canRevert, true);
      expect(instance.canDelete, false);
      expect(instance.canEditBody, true);
      expect(instance.canToggle, false);
      expect(instance.subject, 'Welcome to our app!');
      expect(instance.body, 'Welcome {{name}}!');
      expect(instance.availableVariables, ['name', 'email']);
      expect(instance.requiredVariables, ['name']);
      expect(instance.deliveredByClerk, true);
      expect(instance.enabled, true);
    });

    test('toJson produces correct map', () {
      final json = instance.toJson();
      expect(json['id'], 'tmpl_123');
      expect(json['object'], TemplateObjectEnum.template);
      expect(json['instance_id'], 'inst_123');
      expect(json['resource_type'], 'user');
      expect(json['template_type'], 'email');
      expect(json['name'], 'Welcome Email');
      expect(json['slug'], 'welcome_email');
      expect(json['position'], 1);
      expect(json['can_revert'], true);
      expect(json['can_delete'], false);
      expect(json['subject'], 'Welcome to our app!');
      expect(json['available_variables'], ['name', 'email']);
      expect(json['required_variables'], ['name']);
    });

    test('fromJson creates instance from map', () {
      final json = {
        'id': 'tmpl_456',
        'object': 'template',
        'instance_id': 'inst_456',
        'resource_type': 'system',
        'template_type': 'sms',
        'name': 'Verification SMS',
        'slug': 'verification_sms',
        'position': 2,
        'can_revert': false,
        'can_delete': true,
        'can_edit_body': false,
        'can_toggle': true,
        'body': 'Your code is {{code}}',
        'available_variables': ['code'],
        'required_variables': ['code'],
        'delivered_by_clerk': false,
        'enabled': false,
        'updated_at': 1600001000,
        'created_at': 1600000000,
      };
      final result = Template.fromJson(json);
      expect(result, isNotNull);
      expect(result!.id, 'tmpl_456');
      expect(result.templateType, 'sms');
      expect(result.name, 'Verification SMS');
      expect(result.canToggle, true);
    });

    test('fromJson returns null for non-map input', () {
      expect(Template.fromJson('invalid'), isNull);
      expect(Template.fromJson(123), isNull);
      expect(Template.fromJson(null), isNull);
    });

    test('listFromJson returns empty list for empty input', () {
      expect(Template.listFromJson([]), isEmpty);
      expect(Template.listFromJson(null), isEmpty);
    });

    test('hashCode is consistent', () {
      expect(instance.hashCode, equals(instance.hashCode));
    });

    test('toString returns expected format', () {
      final str = instance.toString();
      expect(str, contains('Template'));
      expect(str, contains('id=tmpl_123'));
      expect(str, contains('name=Welcome Email'));
    });

    test('requiredKeys is empty', () {
      expect(Template.requiredKeys, isEmpty);
    });
  });

  group('TemplateObjectEnum', () {
    test('values contains all enum values', () {
      expect(TemplateObjectEnum.values, contains(TemplateObjectEnum.template));
    });

    test('toJson returns correct string', () {
      expect(TemplateObjectEnum.template.toJson(), 'template');
    });

    test('fromJson parses correct value', () {
      expect(TemplateObjectEnum.fromJson('template'), TemplateObjectEnum.template);
    });

    test('fromJson returns null for unknown value', () {
      expect(TemplateObjectEnum.fromJson('unknown'), isNull);
    });
  });
}
