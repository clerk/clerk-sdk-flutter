//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:clerk_backend_api/api.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// tests for OrganizationsApi
void main() {
  group('tests for OrganizationsApi', () {
    late ApiClient apiClient;
    late OrganizationsApi organizationsApi;

    final organizationJson = {
      'object': 'organization',
      'id': 'org_123',
      'name': 'Test Organization',
      'slug': 'test-org',
      'has_image': false,
      'max_allowed_memberships': 100,
      'admin_delete_enabled': true,
      'public_metadata': {},
      'created_at': 1700000000,
      'updated_at': 1700000001,
    };

    final deletedObjectJson = {
      'object': 'deleted_object',
      'id': 'org_123',
      'slug': 'test-org',
      'deleted': true,
    };

    final organizationsJson = {
      'data': [organizationJson, organizationJson],
      'total_count': 2,
    };

    group('createOrganization', () {
      test('returns Organization on successful creation', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/organizations'));
          return http.Response(jsonEncode(organizationJson), 201);
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.createOrganization(
          createOrganizationRequest: CreateOrganizationRequest(
            name: 'Test Organization',
          ),
        );

        expect(result, isNotNull);
        expect(result!.id, equals('org_123'));
        expect(result.name, equals('Test Organization'));
      });

      test('sends correct request body', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          final body = jsonDecode(request.body);
          expect(body['name'], equals('My Org'));
          expect(body['slug'], equals('my-org'));
          return http.Response(jsonEncode(organizationJson), 201);
        });
        organizationsApi = OrganizationsApi(apiClient);

        await organizationsApi.createOrganization(
          createOrganizationRequest: CreateOrganizationRequest(
            name: 'My Org',
            slug: 'my-org',
          ),
        );
      });
    });

    group('deleteOrganization', () {
      test('returns DeletedObject on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/organizations/org_123'));
          return http.Response(jsonEncode(deletedObjectJson), 200);
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.deleteOrganization('org_123');

        expect(result, isNotNull);
        expect(result!.deleted, isTrue);
      });
    });

    group('getOrganization', () {
      test('returns Organization on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/organizations/org_123'));
          return http.Response(jsonEncode(organizationJson), 200);
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.getOrganization('org_123');

        expect(result, isNotNull);
        expect(result!.id, equals('org_123'));
        expect(result.slug, equals('test-org'));
      });

      test('throws ApiException on 404', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        organizationsApi = OrganizationsApi(apiClient);

        expect(
          () => organizationsApi.getOrganization('nonexistent'),
          throwsA(isA<ApiException>()),
        );
      });
    });

    group('listOrganizations', () {
      test('returns Organizations list', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/organizations'));
          return http.Response(jsonEncode(organizationsJson), 200);
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.listOrganizations();

        expect(result, isNotNull);
        expect(result!.data.length, equals(2));
        expect(result.totalCount, equals(2));
      });

      test('passes query parameters correctly', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.url.queryParameters['limit'], equals('10'));
          expect(request.url.queryParameters['query'], equals('test'));
          return http.Response(jsonEncode(organizationsJson), 200);
        });
        organizationsApi = OrganizationsApi(apiClient);

        await organizationsApi.listOrganizations(limit: 10, query: 'test');
      });
    });

    group('updateOrganization', () {
      test('returns updated Organization', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('PATCH'));
          expect(request.url.path, equals('/v1/organizations/org_123'));
          return http.Response(
            jsonEncode({...organizationJson, 'name': 'Updated Org'}),
            200,
          );
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.updateOrganization(
          'org_123',
          UpdateOrganizationRequest(name: 'Updated Org'),
        );

        expect(result, isNotNull);
        expect(result!.name, equals('Updated Org'));
      });
    });

    group('mergeOrganizationMetadata', () {
      test('returns Organization with merged metadata', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('PATCH'));
          expect(request.url.path, equals('/v1/organizations/org_123/metadata'));
          return http.Response(
            jsonEncode({...organizationJson, 'public_metadata': {'key': 'value'}}),
            200,
          );
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.mergeOrganizationMetadata(
          'org_123',
          MergeOrganizationMetadataRequest(publicMetadata: {'key': 'value'}),
        );

        expect(result, isNotNull);
      });
    });

    group('deleteOrganizationLogo', () {
      test('returns Organization without logo', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/organizations/org_123/logo'));
          return http.Response(
            jsonEncode({...organizationJson, 'has_image': false}),
            200,
          );
        });
        organizationsApi = OrganizationsApi(apiClient);

        final result = await organizationsApi.deleteOrganizationLogo('org_123');

        expect(result, isNotNull);
        expect(result!.hasImage, isFalse);
      });
    });
  });
}
