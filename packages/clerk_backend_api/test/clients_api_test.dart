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

/// tests for ClientsApi
void main() {
  group('tests for ClientsApi', () {
    late ApiClient apiClient;
    late ClientsApi clientsApi;

    final clientJson = {
      'object': 'client',
      'id': 'client_123',
      'session_ids': ['sess_1', 'sess_2'],
      'sessions': [],
      'sign_in_id': 'signin_456',
      'sign_up_id': 'signup_789',
      'last_active_session_id': 'sess_1',
      'last_authentication_strategy': 'password',
      'updated_at': 1700000001,
      'created_at': 1700000000,
    };

    group('getClient', () {
      test('returns Client on successful response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/clients/client_123'));
          return http.Response(jsonEncode(clientJson), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.getClient('client_123');

        expect(result, isNotNull);
        expect(result!.id, equals('client_123'));
        expect(result.object, equals(ClientObjectEnum.client));
        expect(result.sessionIds, equals(['sess_1', 'sess_2']));
      });

      test('throws ApiException on 404 response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        clientsApi = ClientsApi(apiClient);

        expect(
          () => clientsApi.getClient('nonexistent'),
          throwsA(isA<ApiException>()),
        );
      });

      test('throws ApiException on 401 unauthorized', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "unauthorized"}', 401);
        });
        clientsApi = ClientsApi(apiClient);

        expect(
          () => clientsApi.getClient('client_123'),
          throwsA(isA<ApiException>()),
        );
      });

      test('returns null on 204 no content', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('', 204);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.getClient('client_123');
        expect(result, isNull);
      });
    });

    group('getClientList', () {
      test('returns list of clients on successful response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/clients'));
          return http.Response(jsonEncode([clientJson, clientJson]), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.getClientList();

        expect(result, isNotNull);
        expect(result!.length, equals(2));
        expect(result[0].id, equals('client_123'));
      });

      test('passes pagination parameters correctly', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.url.queryParameters['paginated'], equals('true'));
          expect(request.url.queryParameters['limit'], equals('10'));
          expect(request.url.queryParameters['offset'], equals('5'));
          return http.Response(jsonEncode([clientJson]), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.getClientList(
          paginated: true,
          limit: 10,
          offset: 5,
        );

        expect(result, isNotNull);
        expect(result!.length, equals(1));
      });

      test('returns empty list on empty response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response(jsonEncode([]), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.getClientList();

        expect(result, isNotNull);
        expect(result!.isEmpty, isTrue);
      });

      test('throws ApiException on error response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "server_error"}', 500);
        });
        clientsApi = ClientsApi(apiClient);

        expect(
          () => clientsApi.getClientList(),
          throwsA(isA<ApiException>()),
        );
      });
    });

    group('verifyClient', () {
      test('returns Client on successful verification', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/clients/verify'));
          expect(request.headers['Content-Type'], contains('application/json'));
          return http.Response(jsonEncode(clientJson), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.verifyClient(
          verifyClientRequest: VerifyClientRequest(token: 'test_token'),
        );

        expect(result, isNotNull);
        expect(result!.id, equals('client_123'));
      });

      test('sends correct request body', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          final body = jsonDecode(request.body);
          expect(body['token'], equals('my_verification_token'));
          return http.Response(jsonEncode(clientJson), 200);
        });
        clientsApi = ClientsApi(apiClient);

        await clientsApi.verifyClient(
          verifyClientRequest: VerifyClientRequest(token: 'my_verification_token'),
        );
      });

      test('throws ApiException on invalid token', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "invalid_token"}', 400);
        });
        clientsApi = ClientsApi(apiClient);

        expect(
          () => clientsApi.verifyClient(
            verifyClientRequest: VerifyClientRequest(token: 'invalid'),
          ),
          throwsA(isA<ApiException>()),
        );
      });

      test('works without request body', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response(jsonEncode(clientJson), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final result = await clientsApi.verifyClient();
        expect(result, isNotNull);
      });
    });

    group('getClientWithHttpInfo', () {
      test('returns raw HTTP response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response(jsonEncode(clientJson), 200);
        });
        clientsApi = ClientsApi(apiClient);

        final response = await clientsApi.getClientWithHttpInfo('client_123');

        expect(response.statusCode, equals(200));
        expect(response.body, isNotEmpty);
      });
    });
  });
}
