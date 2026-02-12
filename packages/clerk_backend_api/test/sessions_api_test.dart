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

/// tests for SessionsApi
void main() {
  group('tests for SessionsApi', () {
    late ApiClient apiClient;
    late SessionsApi sessionsApi;

    final sessionJson = {
      'object': 'session',
      'id': 'sess_123',
      'user_id': 'user_123',
      'client_id': 'client_123',
      'status': 'active',
      'last_active_at': 1700000000,
      'expire_at': 1700100000,
      'abandon_at': 1700200000,
      'updated_at': 1700000001,
      'created_at': 1700000000,
    };

    final tokenJson = {
      'object': 'token',
      'jwt': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test',
    };

    group('createSession', () {
      test('returns Session on successful creation', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/sessions'));
          return http.Response(jsonEncode(sessionJson), 201);
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.createSession(
          createSessionRequest: CreateSessionRequest(userId: 'user_123'),
        );

        expect(result, isNotNull);
        expect(result!.id, equals('sess_123'));
        expect(result.userId, equals('user_123'));
      });

      test('throws ApiException on error', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "forbidden"}', 403);
        });
        sessionsApi = SessionsApi(apiClient);

        expect(
          () => sessionsApi.createSession(),
          throwsA(isA<ApiException>()),
        );
      });
    });

    group('createSessionToken', () {
      test('returns token on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/sessions/sess_123/tokens'));
          return http.Response(jsonEncode(tokenJson), 200);
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.createSessionToken('sess_123');

        expect(result, isNotNull);
        expect(result!.jwt, contains('eyJ'));
      });
    });

    group('createSessionTokenFromTemplate', () {
      test('returns token from template', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/sessions/sess_123/tokens/my_template'));
          return http.Response(jsonEncode(tokenJson), 200);
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.createSessionTokenFromTemplate(
          'sess_123',
          'my_template',
        );

        expect(result, isNotNull);
        expect(result!.jwt, contains('eyJ'));
      });
    });

    group('getSession', () {
      test('returns Session on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/sessions/sess_123'));
          return http.Response(jsonEncode(sessionJson), 200);
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.getSession('sess_123');

        expect(result, isNotNull);
        expect(result!.id, equals('sess_123'));
        expect(result.status, equals(SessionStatusEnum.active));
      });

      test('throws ApiException on 404', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        sessionsApi = SessionsApi(apiClient);

        expect(
          () => sessionsApi.getSession('nonexistent'),
          throwsA(isA<ApiException>()),
        );
      });
    });

    group('getSessionList', () {
      test('returns list of sessions', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/sessions'));
          return http.Response(jsonEncode([sessionJson, sessionJson]), 200);
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.getSessionList();

        expect(result, isNotNull);
        expect(result!.length, equals(2));
      });

      test('passes query parameters correctly', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.url.queryParameters['user_id'], equals('user_123'));
          expect(request.url.queryParameters['limit'], equals('10'));
          return http.Response(jsonEncode([sessionJson]), 200);
        });
        sessionsApi = SessionsApi(apiClient);

        await sessionsApi.getSessionList(userId: 'user_123', limit: 10);
      });
    });

    group('revokeSession', () {
      test('returns revoked Session', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/sessions/sess_123/revoke'));
          return http.Response(
            jsonEncode({...sessionJson, 'status': 'revoked'}),
            200,
          );
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.revokeSession('sess_123');

        expect(result, isNotNull);
        expect(result!.status, equals(SessionStatusEnum.revoked));
      });
    });

    group('refreshSession', () {
      test('returns SessionRefresh on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/sessions/sess_123/refresh'));
          return http.Response(jsonEncode({
            'object': 'cookies',
            'jwt': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test',
            'cookies': ['__session=abc123'],
          }), 200);
        });
        sessionsApi = SessionsApi(apiClient);

        final result = await sessionsApi.refreshSession('sess_123');

        expect(result, isNotNull);
        expect(result!.jwt, contains('eyJ'));
      });
    });
  });
}
