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

/// tests for EmailAddressesApi
void main() {
  group('tests for EmailAddressesApi', () {
    late ApiClient apiClient;
    late EmailAddressesApi emailAddressesApi;

    final emailAddressJson = {
      'object': 'email_address',
      'id': 'email_123',
      'email_address': 'test@example.com',
      'reserved': false,
      'verification': {
        'status': 'verified',
        'strategy': 'email_link',
        'attempts': 1,
        'expire_at': 1700100000,
      },
      'linked_to': [],
      'created_at': 1700000000,
      'updated_at': 1700000001,
    };

    final deletedObjectJson = {
      'object': 'deleted_object',
      'id': 'email_123',
      'slug': null,
      'deleted': true,
    };

    group('createEmailAddress', () {
      test('returns EmailAddress on successful creation', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/email_addresses'));
          return http.Response(jsonEncode(emailAddressJson), 201);
        });
        emailAddressesApi = EmailAddressesApi(apiClient);

        final result = await emailAddressesApi.createEmailAddress(
          createEmailAddressRequest: CreateEmailAddressRequest(
            userId: 'user_123',
            emailAddress: 'test@example.com',
          ),
        );

        expect(result, isNotNull);
        expect(result!.emailAddress, equals('test@example.com'));
      });

      test('sends correct request body', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          final body = jsonDecode(request.body);
          expect(body['user_id'], equals('user_123'));
          expect(body['email_address'], equals('new@example.com'));
          expect(body['verified'], equals(true));
          return http.Response(jsonEncode(emailAddressJson), 201);
        });
        emailAddressesApi = EmailAddressesApi(apiClient);

        await emailAddressesApi.createEmailAddress(
          createEmailAddressRequest: CreateEmailAddressRequest(
            userId: 'user_123',
            emailAddress: 'new@example.com',
            verified: true,
          ),
        );
      });
    });

    group('getEmailAddress', () {
      test('returns EmailAddress on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/email_addresses/email_123'));
          return http.Response(jsonEncode(emailAddressJson), 200);
        });
        emailAddressesApi = EmailAddressesApi(apiClient);

        final result = await emailAddressesApi.getEmailAddress('email_123');

        expect(result, isNotNull);
        expect(result!.emailAddress, equals('test@example.com'));
      });

      test('throws ApiException on 404', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        emailAddressesApi = EmailAddressesApi(apiClient);

        expect(
          () => emailAddressesApi.getEmailAddress('nonexistent'),
          throwsA(isA<ApiException>()),
        );
      });
    });

    group('updateEmailAddress', () {
      test('returns updated EmailAddress', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('PATCH'));
          expect(request.url.path, equals('/v1/email_addresses/email_123'));
          return http.Response(jsonEncode(emailAddressJson), 200);
        });
        emailAddressesApi = EmailAddressesApi(apiClient);

        final result = await emailAddressesApi.updateEmailAddress(
          'email_123',
          updateEmailAddressRequest: UpdateEmailAddressRequest(verified: true),
        );

        expect(result, isNotNull);
      });
    });

    group('deleteEmailAddress', () {
      test('returns DeletedObject on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/email_addresses/email_123'));
          return http.Response(jsonEncode(deletedObjectJson), 200);
        });
        emailAddressesApi = EmailAddressesApi(apiClient);

        final result = await emailAddressesApi.deleteEmailAddress('email_123');

        expect(result, isNotNull);
        expect(result!.deleted, isTrue);
      });
    });
  });
}
