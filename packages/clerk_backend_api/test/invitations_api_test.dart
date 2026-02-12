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

/// tests for InvitationsApi
void main() {
  group('tests for InvitationsApi', () {
    late ApiClient apiClient;
    late InvitationsApi invitationsApi;

    final invitationJson = {
      'object': 'invitation',
      'id': 'inv_123',
      'email_address': 'test@example.com',
      'public_metadata': {},
      'status': 'pending',
      'created_at': 1700000000,
      'updated_at': 1700000001,
    };

    group('createInvitation', () {
      test('returns Invitation on successful creation', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/invitations'));
          return http.Response(jsonEncode(invitationJson), 201);
        });
        invitationsApi = InvitationsApi(apiClient);

        final result = await invitationsApi.createInvitation(
          createInvitationRequest: CreateInvitationRequest(
            emailAddress: 'test@example.com',
          ),
        );

        expect(result, isNotNull);
        expect(result!.id, equals('inv_123'));
        expect(result.emailAddress, equals('test@example.com'));
      });

      test('sends correct request body', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          final body = jsonDecode(request.body);
          expect(body['email_address'], equals('user@example.com'));
          expect(body['notify'], equals(true));
          return http.Response(jsonEncode(invitationJson), 201);
        });
        invitationsApi = InvitationsApi(apiClient);

        await invitationsApi.createInvitation(
          createInvitationRequest: CreateInvitationRequest(
            emailAddress: 'user@example.com',
            notify: true,
          ),
        );
      });
    });

    group('createBulkInvitations', () {
      test('returns list of Invitations', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/invitations/bulk'));
          return http.Response(jsonEncode([invitationJson, invitationJson]), 201);
        });
        invitationsApi = InvitationsApi(apiClient);

        final result = await invitationsApi.createBulkInvitations(
          createBulkInvitationsRequestInner: [
            CreateBulkInvitationsRequestInner(emailAddress: 'a@example.com'),
            CreateBulkInvitationsRequestInner(emailAddress: 'b@example.com'),
          ],
        );

        expect(result, isNotNull);
        expect(result!.length, equals(2));
      });
    });

    group('listInvitations', () {
      test('returns list of invitations', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/invitations'));
          return http.Response(jsonEncode([invitationJson, invitationJson]), 200);
        });
        invitationsApi = InvitationsApi(apiClient);

        final result = await invitationsApi.listInvitations();

        expect(result, isNotNull);
        expect(result!.length, equals(2));
      });

      test('passes query parameters correctly', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.url.queryParameters['status'], equals('pending'));
          expect(request.url.queryParameters['limit'], equals('10'));
          return http.Response(jsonEncode([invitationJson]), 200);
        });
        invitationsApi = InvitationsApi(apiClient);

        await invitationsApi.listInvitations(status: 'pending', limit: 10);
      });
    });

    group('revokeInvitation', () {
      test('returns revoked invitation', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/invitations/inv_123/revoke'));
          return http.Response(
            jsonEncode({...invitationJson, 'status': 'revoked'}),
            200,
          );
        });
        invitationsApi = InvitationsApi(apiClient);

        final result = await invitationsApi.revokeInvitation('inv_123');

        expect(result, isNotNull);
      });

      test('throws ApiException on 404', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        invitationsApi = InvitationsApi(apiClient);

        expect(
          () => invitationsApi.revokeInvitation('nonexistent'),
          throwsA(isA<ApiException>()),
        );
      });
    });
  });
}
