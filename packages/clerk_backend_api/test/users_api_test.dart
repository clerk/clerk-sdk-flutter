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

/// tests for UsersApi
void main() {
  group('tests for UsersApi', () {
    late ApiClient apiClient;
    late UsersApi usersApi;

    final userJson = {
      'id': 'user_123',
      'object': 'user',
      'external_id': 'ext_123',
      'primary_email_address_id': 'email_123',
      'primary_phone_number_id': 'phone_123',
      'primary_web3_wallet_id': 'web3_123',
      'username': 'testuser',
      'first_name': 'Test',
      'last_name': 'User',
      'has_image': false,
      'public_metadata': {},
      'email_addresses': [],
      'phone_numbers': [],
      'web3_wallets': [],
      'passkeys': [],
      'password_enabled': true,
      'two_factor_enabled': false,
      'totp_enabled': false,
      'backup_code_enabled': false,
      'mfa_enabled_at': 1700000000,
      'mfa_disabled_at': 1700000000,
      'external_accounts': [],
      'saml_accounts': [],
      'enterprise_accounts': [],
      'last_sign_in_at': 1700000000,
      'banned': false,
      'locked': false,
      'lockout_expires_in_seconds': 0,
      'verification_attempts_remaining': 5,
      'updated_at': 1700000001,
      'created_at': 1700000000,
      'delete_self_enabled': true,
      'create_organization_enabled': true,
      'last_active_at': 1700000000,
      'legal_accepted_at': 1700000000,
    };

    final deletedObjectJson = {
      'object': 'deleted_object',
      'id': 'user_123',
      'slug': null,
      'deleted': true,
    };

    final disableMfaJson = {
      'user_id': 'user_123',
    };

    final totalCountJson = {
      'object': 'total_count',
      'total_count': 42,
    };

    group('banUser', () {
      test('returns User on successful ban', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users/user_123/ban'));
          return http.Response(jsonEncode({...userJson, 'banned': true}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.banUser('user_123');

        expect(result, isNotNull);
        expect(result!.id, equals('user_123'));
        expect(result.banned, isTrue);
      });

      test('throws ApiException on 404', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        usersApi = UsersApi(apiClient);

        expect(() => usersApi.banUser('nonexistent'), throwsA(isA<ApiException>()));
      });
    });

    group('createUser', () {
      test('returns User on successful creation', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users'));
          expect(request.headers['Content-Type'], contains('application/json'));
          return http.Response(jsonEncode(userJson), 201);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.createUser(CreateUserRequest());

        expect(result, isNotNull);
        expect(result!.id, equals('user_123'));
      });

      test('sends correct request body', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          final body = jsonDecode(request.body);
          expect(body['email_address'], equals(['test@example.com']));
          expect(body['first_name'], equals('John'));
          return http.Response(jsonEncode(userJson), 201);
        });
        usersApi = UsersApi(apiClient);

        await usersApi.createUser(CreateUserRequest(
          emailAddress: ['test@example.com'],
          firstName: 'John',
        ));
      });
    });

    group('deleteUser', () {
      test('returns DeletedObject on successful deletion', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123'));
          return http.Response(jsonEncode(deletedObjectJson), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.deleteUser('user_123');

        expect(result, isNotNull);
        expect(result!.deleted, isTrue);
        expect(result.id, equals('user_123'));
      });
    });

    group('getUser', () {
      test('returns User on successful response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/users/user_123'));
          return http.Response(jsonEncode(userJson), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.getUser('user_123');

        expect(result, isNotNull);
        expect(result!.id, equals('user_123'));
        expect(result.username, equals('testuser'));
        expect(result.firstName, equals('Test'));
        expect(result.lastName, equals('User'));
      });

      test('throws ApiException on 404', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response('{"error": "not_found"}', 404);
        });
        usersApi = UsersApi(apiClient);

        expect(() => usersApi.getUser('nonexistent'), throwsA(isA<ApiException>()));
      });
    });

    group('getUserList', () {
      test('returns list of users', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/users'));
          return http.Response(jsonEncode([userJson, userJson]), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.getUserList();

        expect(result, isNotNull);
        expect(result!.length, equals(2));
      });

      test('passes query parameters correctly', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.url.queryParameters['limit'], equals('10'));
          expect(request.url.queryParameters['offset'], equals('5'));
          expect(request.url.queryParameters['query'], equals('test'));
          return http.Response(jsonEncode([userJson]), 200);
        });
        usersApi = UsersApi(apiClient);

        await usersApi.getUserList(limit: 10, offset: 5, query: 'test');
      });

      test('returns empty list on empty response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          return http.Response(jsonEncode([]), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.getUserList();

        expect(result, isNotNull);
        expect(result!.isEmpty, isTrue);
      });
    });

    group('getUsersCount', () {
      test('returns TotalCount on successful response', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/v1/users/count'));
          return http.Response(jsonEncode(totalCountJson), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.getUsersCount();

        expect(result, isNotNull);
        expect(result!.totalCount, equals(42));
      });
    });

    group('lockUser', () {
      test('returns User with locked status', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users/user_123/lock'));
          return http.Response(jsonEncode({...userJson, 'locked': true}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.lockUser('user_123');

        expect(result, isNotNull);
        expect(result!.locked, isTrue);
      });
    });

    group('unlockUser', () {
      test('returns User with unlocked status', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users/user_123/unlock'));
          return http.Response(jsonEncode({...userJson, 'locked': false}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.unlockUser('user_123');

        expect(result, isNotNull);
        expect(result!.locked, isFalse);
      });
    });

    group('unbanUser', () {
      test('returns User with unbanned status', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users/user_123/unban'));
          return http.Response(jsonEncode({...userJson, 'banned': false}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.unbanUser('user_123');

        expect(result, isNotNull);
        expect(result!.banned, isFalse);
      });
    });

    group('updateUser', () {
      test('returns updated User', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('PATCH'));
          expect(request.url.path, equals('/v1/users/user_123'));
          return http.Response(jsonEncode({...userJson, 'first_name': 'Updated'}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.updateUser(
          'user_123',
          UpdateUserRequest(firstName: 'Updated'),
        );

        expect(result, isNotNull);
        expect(result!.firstName, equals('Updated'));
      });
    });

    group('disableMFA', () {
      test('returns DisableMFA200Response on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123/mfa'));
          return http.Response(jsonEncode(disableMfaJson), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.disableMFA('user_123');

        expect(result, isNotNull);
        expect(result!.userId, equals('user_123'));
      });
    });

    group('deleteBackupCode', () {
      test('returns DisableMFA200Response on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123/backup_code'));
          return http.Response(jsonEncode(disableMfaJson), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.deleteBackupCode('user_123');

        expect(result, isNotNull);
      });
    });

    group('deleteTOTP', () {
      test('returns DisableMFA200Response on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123/totp'));
          return http.Response(jsonEncode(disableMfaJson), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.deleteTOTP('user_123');

        expect(result, isNotNull);
      });
    });

    group('verifyPassword', () {
      test('returns VerifyPassword200Response on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users/user_123/verify_password'));
          return http.Response(jsonEncode({'verified': true}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.verifyPassword(
          'user_123',
          verifyPasswordRequest: VerifyPasswordRequest(password: 'test123'),
        );

        expect(result, isNotNull);
        expect(result!.verified, isTrue);
      });
    });

    group('verifyTOTP', () {
      test('returns VerifyTOTP200Response on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/v1/users/user_123/verify_totp'));
          return http.Response(jsonEncode({'verified': true, 'code_type': 'totp'}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.verifyTOTP(
          'user_123',
          verifyTOTPRequest: VerifyTOTPRequest(code: '123456'),
        );

        expect(result, isNotNull);
        expect(result!.verified, isTrue);
      });
    });

    group('deleteExternalAccount', () {
      test('returns DeletedObject on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123/external_accounts/ext_acc_123'));
          return http.Response(jsonEncode({...deletedObjectJson, 'id': 'ext_acc_123'}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.deleteExternalAccount('user_123', 'ext_acc_123');

        expect(result, isNotNull);
        expect(result!.deleted, isTrue);
      });
    });

    group('userPasskeyDelete', () {
      test('returns DeletedObject on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123/passkeys/passkey_123'));
          return http.Response(jsonEncode({...deletedObjectJson, 'id': 'passkey_123'}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.userPasskeyDelete('user_123', 'passkey_123');

        expect(result, isNotNull);
        expect(result!.deleted, isTrue);
      });
    });

    group('userWeb3WalletDelete', () {
      test('returns DeletedObject on success', () async {
        apiClient = ApiClient();
        apiClient.client = MockClient((request) async {
          expect(request.method, equals('DELETE'));
          expect(request.url.path, equals('/v1/users/user_123/web3_wallets/wallet_123'));
          return http.Response(jsonEncode({...deletedObjectJson, 'id': 'wallet_123'}), 200);
        });
        usersApi = UsersApi(apiClient);

        final result = await usersApi.userWeb3WalletDelete('user_123', 'wallet_123');

        expect(result, isNotNull);
        expect(result!.deleted, isTrue);
      });
    });
  });
}
