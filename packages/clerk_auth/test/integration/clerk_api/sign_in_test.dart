import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late final Api api;
  late final TestEnv env;
  final httpClient = TestHttpClient();
  final expireAt = DateTime.timestamp() //
      .add(const Duration(minutes: 5))
      .millisecondsSinceEpoch;

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(
        publicKey: env.publicKey,
        publishableKey: env.publishableKey,
        client: httpClient);
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  tearDown(() async {
    httpClient.expect('DELETE /v1/client', 200, '');
    await api.signOut();
  });

  group('Can sign in:', () {
    test('with email and password', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        httpClient.expect(
          'POST /v1/client/sign_ins identifier=test1+clerk_test@some.domain',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********01","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test1+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test1+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test1+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"test1+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732097350149},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********01","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test1+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test1+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test1+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"test1+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732097350149},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732010950134,"updated_at":1732010950161}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/attempt_first_factor strategy=password&password=password',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"complete","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":null,"supported_second_factors":null,"first_factor_verification":{"status":"verified","strategy":"password","attempts":1,"expire_at":null},"second_factor_verification":null,"identifier":"test1+clerk_test@some.domain","USER_ID":null,"created_session_id":"SESSION_ID","abandon_at":1732097350149},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734602950661,"last_active_at":1732010950661,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"test1","first_name":"Test","last_name":"User","image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJtbktmQms4MlhkZ0pYUzltNlhGZlkyTGZHTiIsImluaXRpYWxzIjoiVFUifQ","has_image":false,"primary_email_address_id":"IDENTIFIER_ID","primary_phone_number_id":"IDENTIFIER_ID","primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[{"id":"IDENTIFIER_ID","object":"email_address","email_address":"test1+clerk_test@some.domain","reserved":false,"verification":{"status":"verified","strategy":"admin","attempts":null,"expire_at":null},"linked_to":[],"created_at":1727707000228,"updated_at":1729075139789}],"phone_numbers":[{"id":"IDENTIFIER_ID","object":"phone_number","phone_number":"+15555550101","reserved_for_second_factor":false,"default_second_factor":false,"reserved":false,"verification":{"status":"verified","strategy":"admin","attempts":null,"expire_at":null},"linked_to":[],"backup_codes":null,"created_at":1727707000277,"updated_at":1727707000277}],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732010950666,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1727707000164,"updated_at":1732010950691,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1731928604966,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":"Test","last_name":"User","image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJtbktmQms4MlhkZ0pYUzltNlhGZlkyTGZHTiIsImluaXRpYWxzIjoiVFUifQ","has_image":false,"identifier":"test1+clerk_test@some.domain","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732010950666,"updated_at":1732010950707,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMTEwMTAsImlhdCI6MTczMjAxMDk1MCwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDEwOTQwLCJzaWQiOiJzZXNzXzJwNDJJekxoazBsa0ZTMUVodjdGdEpqUjRNdCIsInN1YiI6InVzZXJfMm1uS2ZCazgyWGRnSlhTOW02WEZmWTJMZkdOIn0.zfrvJPrOC9iV4nDjCDut7rhOmio5VMNCgyKUF1th8JF0P02wcwKy4aD0rwWgl-g5eLlRgDsQfE3pqokJwhB4sreGjBbUScMum7LWq77ik65JoxK_xbGmGwjSG6XNGEgJoA1jf6UCgkVtrZsAW-5rVBl9WfEj5hh22n_1zs3PQijoyO1TLRQHP6JrPNhBuipcqHhlhrKtgtxUu89N5zm30fq20e00O6eDdOHn6YbvTKZ6q6u2wfEFUdMUndO-jzOFLE53rDKcCCfoA9nUw9hxEBGBw7liMhMQBOh07nDZI-AybgNyGP7vKcCjrDmiNhugxvsI9tEMH0kRUfb_zmVJ9w"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732010950134,"updated_at":1732010950704}}',
        );

        response =
            await api.createSignIn(identifier: 'test1+clerk_test@some.domain');
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        final signIn = response.client!.signIn!;
        response = await api.attemptSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.password,
          password: env.password,
        );

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });

    test('with email code', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        httpClient.expect(
          'POST /v1/client/sign_ins identifier=test2+clerk_test@some.domain',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********02","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"test2+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101267634},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********02","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"test2+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101267634},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732014867622,"updated_at":1732014867646}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/prepare_first_factor strategy=email_code&email_address_id=IDENTIFIER_ID',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********02","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":{"status":"unverified","strategy":"email_code","attempts":0,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"test2+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101267634},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********02","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test2+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":{"status":"unverified","strategy":"email_code","attempts":0,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"test2+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101267634},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732014867622,"updated_at":1732014868200}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/attempt_first_factor strategy=email_code&code=424242',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"complete","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":null,"supported_second_factors":null,"first_factor_verification":{"status":"verified","strategy":"email_code","attempts":1,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"test2+clerk_test@some.domain","USER_ID":null,"created_session_id":"SESSION_ID","abandon_at":1732101267634},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734606868651,"last_active_at":1732014868651,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"test2","first_name":"Test2","last_name":"Tester","image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJtbktaNGV4aVBwSFk3MzA4WHp6OW1nZkpXTiIsImluaXRpYWxzIjoiVFQifQ","has_image":false,"primary_email_address_id":"IDENTIFIER_ID","primary_phone_number_id":"IDENTIFIER_ID","primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[{"id":"IDENTIFIER_ID","object":"email_address","email_address":"test2+clerk_test@some.domain","reserved":false,"verification":{"status":"verified","strategy":"admin","attempts":null,"expire_at":null},"linked_to":[],"created_at":1727706952389,"updated_at":1729075139751}],"phone_numbers":[{"id":"IDENTIFIER_ID","object":"phone_number","phone_number":"+15555550102","reserved_for_second_factor":false,"default_second_factor":false,"reserved":false,"verification":{"status":"verified","strategy":"admin","attempts":null,"expire_at":null},"linked_to":[],"backup_codes":null,"created_at":1727706952398,"updated_at":1727706952398}],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732014868661,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1727706952371,"updated_at":1732014868701,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1731931563814,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":"Test2","last_name":"Tester","image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJtbktaNGV4aVBwSFk3MzA4WHp6OW1nZkpXTiIsImluaXRpYWxzIjoiVFQifQ","has_image":false,"identifier":"test2+clerk_test@some.domain","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732014868661,"updated_at":1732014868727,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMTQ5MjgsImlhdCI6MTczMjAxNDg2OCwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDE0ODU4LCJzaWQiOiJzZXNzXzJwNEFGSEZQNVo1bm9HQ2JkdzhqTngyaVIzUSIsInN1YiI6InVzZXJfMm1uS1o0ZXhpUHBIWTczMDhYeno5bWdmSldOIn0.rRG-HVJwLMt4qHO4o-NAvCdNBicD7Pxc16lqxo5sKmTXtWXcfZWSw5diHN7aQ3LlU72c5momdUpS9i6pnN8-t1t9bt3_E4WMQkHb19IqMSjL-mbUwOREY7EsXNPfDFFBKJyWF2yUIicVmA6yL_NS1jcfE-YMm7FeLijAIka8KomWk-aEmEV2_JTuZMn5K4KxJsQpP3BW_9uM0QQqj09a3sxvGEUrcOFbRqarwv1VyrUHwV0kRkkl87VL699lf7L-KNvxc-BlZGuk4dDfebBHU06XlPZEKhhB9zLTDgZMz6Qr2rLRv8_JzNHdZPdkiQbiCeO-9vCfNSF4OCXIYvEJIg"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732014867622,"updated_at":1732014868723}}',
        );

        response =
            await api.createSignIn(identifier: 'test2+clerk_test@some.domain');
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        response = await api.prepareSignIn(
          response.client!.signIn!,
          stage: Stage.first,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        response = await api.attemptSignIn(
          response.client!.signIn!,
          stage: Stage.first,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(response.client!.sessions.isNotEmpty, true);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });

    test('with email link', () async {
      await runWithLogging(() async {
        late ApiResponse response;
        late SignIn signIn;

        httpClient.expect(
          'POST /v1/client/sign_ins identifier=test3+clerk_test@some.domain',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********03","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"test3+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101346272},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********03","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"test3+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101346272},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732014946258,"updated_at":1732014946285}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/prepare_first_factor strategy=email_link&email_address_id=IDENTIFIER_ID&redirect_url=https://redirect.to.somewhere',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********03","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":{"status":"unverified","strategy":"email_link","attempts":null,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"test3+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101346272},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+*********03","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_email_code","safe_identifier":"test3+clerk_test@some.domain","email_address_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":{"status":"unverified","strategy":"email_link","attempts":null,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"test3+clerk_test@some.domain","USER_ID":null,"created_session_id":null,"abandon_at":1732101346272},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732014946258,"updated_at":1732014946680}}',
        );

        response =
            await api.createSignIn(identifier: 'test3+clerk_test@some.domain');
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        const redirectUrl = 'https://redirect.to.somewhere';

        signIn = response.client!.signIn!;
        response = await api.prepareSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.emailLink,
          redirectUrl: redirectUrl,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        // no way to test onward journey easily
      });
    });

    test('with phone code', () async {
      await runWithLogging(() async {
        late ApiResponse response;
        late SignIn signIn;

        httpClient.expect(
          'POST /v1/client/sign_ins identifier=+15555550100',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"+15555550100","USER_ID":null,"created_session_id":null,"abandon_at":1732101394921},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":null,"second_factor_verification":null,"identifier":"+15555550100","USER_ID":null,"created_session_id":null,"abandon_at":1732101394921},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732014994887,"updated_at":1732014994949}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/prepare_first_factor strategy=phone_code&phone_number_id=IDENTIFIER_ID',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":{"status":"unverified","strategy":"phone_code","attempts":0,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"+15555550100","USER_ID":null,"created_session_id":null,"abandon_at":1732101394921},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"needs_first_factor","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":[{"strategy":"password"},{"strategy":"phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_code","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"email_link","safe_identifier":"t**************@d********.london","email_address_id":"IDENTIFIER_ID","primary":true},{"strategy":"reset_password_phone_code","safe_identifier":"+15555550100","phone_number_id":"IDENTIFIER_ID","primary":true}],"supported_second_factors":null,"first_factor_verification":{"status":"unverified","strategy":"phone_code","attempts":0,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"+15555550100","USER_ID":null,"created_session_id":null,"abandon_at":1732101394921},"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732014994887,"updated_at":1732014995396}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ins/SIGN_IN_ATTEMPT_ID/attempt_first_factor strategy=phone_code&code=424242',
          200,
          '{"response":{"object":"sign_in_attempt","id":"SIGN_IN_ATTEMPT_ID","status":"complete","supported_identifiers":["email_address","phone_number","username"],"supported_first_factors":null,"supported_second_factors":null,"first_factor_verification":{"status":"verified","strategy":"phone_code","attempts":1,"expire_at":$expireAt},"second_factor_verification":null,"identifier":"+15555550100","USER_ID":null,"created_session_id":"SESSION_ID","abandon_at":1732101394921},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734606996044,"last_active_at":1732014996044,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"testuser","first_name":"Test","last_name":"User","image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJsS2FxWDVNQ3N5d210M0F5TkJaaklsZWZCaCIsImluaXRpYWxzIjoiVFUifQ","has_image":false,"primary_email_address_id":"IDENTIFIER_ID","primary_phone_number_id":"IDENTIFIER_ID","primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[{"id":"IDENTIFIER_ID","object":"email_address","email_address":"test+clerk_test@some.domain","reserved":false,"verification":{"status":"verified","strategy":"admin","attempts":null,"expire_at":null},"linked_to":[],"created_at":1724931412298,"updated_at":1729070374898}],"phone_numbers":[{"id":"IDENTIFIER_ID","object":"phone_number","phone_number":"+15555550100","reserved_for_second_factor":false,"default_second_factor":false,"reserved":false,"verification":{"status":"verified","strategy":"admin","attempts":null,"expire_at":null},"linked_to":[],"backup_codes":null,"created_at":1724931412306,"updated_at":1724931412306}],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732014996071,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1724931412283,"updated_at":1732014996127,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1731940099584,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":"Test","last_name":"User","image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJsS2FxWDVNQ3N5d210M0F5TkJaaklsZWZCaCIsImluaXRpYWxzIjoiVFUifQ","has_image":false,"identifier":"+15555550100","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732014996071,"updated_at":1732014996155,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMTUwNTYsImlhdCI6MTczMjAxNDk5NiwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDE0OTg2LCJzaWQiOiJzZXNzXzJwNEFWTU01RnpERG1vYjF6WFpFV0F0Um9UMSIsInN1YiI6InVzZXJfMmxLYXFYNU1Dc3l3bXQzQXlOQlpqSWxlZkJoIn0.lXwxFOBUQo9hl3hs8-wF56NZcni0gCXbgkXF4B33_MN_65cnGNLOWZ6_2aWq6JMLw_lWABuAUyg5RRtncRr8Oz36QVNDoQ9clGwjTHrBtUaOczctd2fR9vuiTbkIaP3_fjKS0XCT3gCM1TMcFHEG5xeu2eCeVFpi9cdBVT-EOn7FuK-rzQT9VXwcuXcqfHBkd38Yri4CbvX202YVUtbeVfyPvfGEVFvoUrI5-PoNqiknJFygIWEEgVcYsCnqrYoL0Qvf6Aoo1v7MAdUUn_3uB6bgesISE4aaVbAQO7ZDppMxuNgdLXavoaCLsw-og27z6CBFkZtF4IO6i7MfKzUnUw"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732014994887,"updated_at":1732014996148}}',
        );

        response = await api.createSignIn(identifier: env.phoneNumber);
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        signIn = response.client!.signIn!;
        response = await api.prepareSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signIn?.status, Status.needsFirstFactor);

        signIn = response.client!.signIn!;
        response = await api.attemptSignIn(
          signIn,
          stage: Stage.first,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(response.client!.sessions.isNotEmpty, true);

        final client = response.client;
        expect(client?.signIn, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });
  });
}
