import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/auth_config.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../test_helpers.dart';

// Note that these are integration tests with a live backend. The configuration of the backend
// will affect the outcome of the tests. It is assumed that email and phone number are not required,
// but will need to be verified if present.

void main() {
  late final Api api;
  late final TestEnv env;
  final httpService = TestHttpService();
  final expireAt = DateTime.timestamp() //
      .add(const Duration(minutes: 5))
      .millisecondsSinceEpoch;

  String emailAddress = '';
  String phoneNumber = '';
  String username = '';
  String password = '';

  setUp(() async {
    password = 'A${const Uuid().v4()}';
    username = 'user-$password';
    emailAddress = '$username+clerk_test@some.domain';
    phoneNumber = '+15555550109';
  });

  setUpAll(() async {
    env = TestEnv('.env.test');
    api = Api(
      config: AuthConfig(
        publishableKey: env.publishableKey,
        localesLookup: testLocalesLookup,
        persistor: Persistor.none,
        httpService: httpService,
      ),
    );
    await api.initialize();
    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  tearDown(() async {
    httpService.expect('DELETE /v1/me?_clerk_session_id=SESSION_ID', 200, '');
    await api.deleteUser();
  });

  group('Can sign up:', () {
    test('with email verification', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        httpService.expect(
          'POST /v1/client/sign_ups strategy=email_code&username=user-$password&password=$password&email_address=user-$password+clerk_test@some.domain',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple","oauth_github"],"missing_fields":[],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd","email_address":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732101514123,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_apple","oauth_github","oauth_google","email_address","phone_number","username","last_name","first_name"],"missing_fields":[],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd","email_address":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732101514123,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732015114083,"updated_at":1732015114138}}',
        );
        httpService.expect(
          'POST /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/prepare_verification strategy=email_code',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","first_name","last_name","oauth_apple","oauth_github","oauth_google","email_address"],"missing_fields":[],"unverified_fields":["email_address"],"verifications":{"email_address":{"status":"unverified","strategy":"email_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["email_code"]},"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd","email_address":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732101514123,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_github","oauth_google","email_address","phone_number","username","first_name","last_name","oauth_apple"],"missing_fields":[],"unverified_fields":["email_address"],"verifications":{"email_address":{"status":"unverified","strategy":"email_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["email_code"]},"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd","email_address":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732101514123,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732015114083,"updated_at":1732015114138}}',
        );
        httpService.expect(
          'POST /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification strategy=email_code&code=424242',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"complete","required_fields":["password"],"optional_fields":["oauth_apple","email_address","phone_number","username","first_name","last_name","oauth_github","oauth_google"],"missing_fields":[],"unverified_fields":[],"verifications":{"email_address":{"status":"verified","strategy":"email_code","attempts":1,"expire_at":$expireAt,"next_action":"","supported_strategies":["email_code"]},"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd","email_address":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":"SESSION_ID","created_user_id":"USER_ID","abandon_at":1732101514123,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734607115211,"last_active_at":1732015115211,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd","first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNEFrSHJsYUZyVHEzQUVkYVdTS0R6cmRTWiJ9","has_image":false,"primary_email_address_id":"IDENTIFIER_ID","primary_phone_number_id":null,"primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[{"id":"IDENTIFIER_ID","object":"email_address","email_address":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","reserved":false,"verification":{"status":"verified","strategy":"email_code","attempts":1,"expire_at":$expireAt},"linked_to":[],"created_at":1732015114165,"updated_at":1732015115233}],"phone_numbers":[],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732015115213,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1732015115207,"updated_at":1732015115243,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1732015115205,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNEFrSHJsYUZyVHEzQUVkYVdTS0R6cmRTWiJ9","has_image":false,"identifier":"user-a8d714a45-cd24-4205-9084-5f1dc5882bdd+clerk_test@some.domain","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732015115213,"updated_at":1732015115306,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMTUxNzUsImlhdCI6MTczMjAxNTExNSwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDE1MTA1LCJzaWQiOiJzZXNzXzJwNEFrTWtIbk1aVVY4c0RpTWxRUHhsSFQzOSIsInN1YiI6InVzZXJfMnA0QWtIcmxhRnJUcTNBRWRhV1NLRHpyZFNaIn0.riumCOE7qL--kuRRDD5HS5O-m95_mXfifTP6Sbp4rZY9kQt-7gSoTLFAZso63GyU3o2gB3JdXilIR0Izl0GdiAnPSxzZspedujfeAb9_CZ9fzaOeIwCHYVM_ptACJLcaVKk8sBPQZlvrhbyfNWQaQikX5i4qb4NE3rpq7gZCqb7bdPgWpCCX_HreJwEtOLmy-7YCWbcxJhLOxn42AwI2qhdTC7QFQGW3muub9G0AZM-KKB99lGllU4EocnP1uxBFwRxrKYRrdlT_SVd44hYipA6ySAms4RfMeXLH53U4DAg30rhSML5svz3BrzoWrMCiSx6g6HoCQv0hL_H4jWZGqA"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732015114083,"updated_at":1732015115301}}',
        );

        response = await api.createSignUp(
          strategy: Strategy.emailCode,
          emailAddress: emailAddress,
          username: username,
          password: password,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        final client = response.client;
        expect(client?.signUp, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });

    test('with phone verification', () async {
      await runWithLogging(() async {
        late ApiResponse response;

        httpService.expect(
          'POST /v1/client/sign_ups strategy=phone_code&username=user-$password&password=$password&phone_number=+15555550109',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["email_address","phone_number","username","last_name","first_name","oauth_github","oauth_google","oauth_apple"],"missing_fields":[],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a4b3f7063-d0f5-4d19-b377-428b0ef73a47","email_address":null,"phone_number":"+15555550109","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732102859167,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["first_name","last_name","oauth_apple","oauth_github","oauth_google","email_address","phone_number","username"],"missing_fields":[],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-a4b3f7063-d0f5-4d19-b377-428b0ef73a47","email_address":null,"phone_number":"+15555550109","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732102859167,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732016459154,"updated_at":1732016459186}}',
        );
        httpService.expect(
          'POST /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/prepare_verification strategy=phone_code',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","last_name","first_name","oauth_apple","oauth_github","oauth_google","email_address"],"missing_fields":[],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":{"status":"unverified","strategy":"phone_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["phone_code"]},"web3_wallet":null,"external_account":null},"username":"user-a4b3f7063-d0f5-4d19-b377-428b0ef73a47","email_address":null,"phone_number":"+15555550109","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732102859167,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple","oauth_github"],"missing_fields":[],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":{"status":"unverified","strategy":"phone_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["phone_code"]},"web3_wallet":null,"external_account":null},"username":"user-a4b3f7063-d0f5-4d19-b377-428b0ef73a47","email_address":null,"phone_number":"+15555550109","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732102859167,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732016459154,"updated_at":1732016459186}}',
        );
        httpService.expect(
          'POST /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification strategy=phone_code&code=424242',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"complete","required_fields":["password"],"optional_fields":["first_name","last_name","oauth_apple","oauth_github","oauth_google","email_address","phone_number","username"],"missing_fields":[],"unverified_fields":[],"verifications":{"email_address":null,"phone_number":{"status":"verified","strategy":"phone_code","attempts":1,"expire_at":$expireAt,"next_action":"","supported_strategies":["phone_code"]},"web3_wallet":null,"external_account":null},"username":"user-a4b3f7063-d0f5-4d19-b377-428b0ef73a47","email_address":null,"phone_number":"+15555550109","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":"SESSION_ID","created_user_id":"USER_ID","abandon_at":1732102859167,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734608460278,"last_active_at":1732016460278,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"user-a4b3f7063-d0f5-4d19-b377-428b0ef73a47","first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNERUUGtjZHZjOEkzbnp2S0xhU3lpZ3lXayJ9","has_image":false,"primary_email_address_id":null,"primary_phone_number_id":"IDENTIFIER_ID","primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[],"phone_numbers":[{"id":"IDENTIFIER_ID","object":"phone_number","phone_number":"+15555550109","reserved_for_second_factor":false,"default_second_factor":false,"reserved":false,"verification":{"status":"verified","strategy":"phone_code","attempts":1,"expire_at":$expireAt},"linked_to":[],"backup_codes":null,"created_at":1732016459198,"updated_at":1732016460309}],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732016460286,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1732016460274,"updated_at":1732016460334,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1732016460272,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNERUUGtjZHZjOEkzbnp2S0xhU3lpZ3lXayJ9","has_image":false,"identifier":"+15555550109","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732016460286,"updated_at":1732016460387,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMTY1MjAsImlhdCI6MTczMjAxNjQ2MCwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDE2NDUwLCJzaWQiOiJzZXNzXzJwNERUSWR0S3VSN3hIQmpicHdBeTRKdzhyVyIsInN1YiI6InVzZXJfMnA0RFRQa2NkdmM4STNuenZLTGFTeWlneVdrIn0.p93MQ1BHOsiUPIFpfJccQs9HLs0-PJWcXmBHEZK17kUvo4bU1Ng9z7Kye3CVYsoNxx_6Gy6xmMouoxFrCQwLSNZKcWflfRWB1MUh6os1rtHeXzm5nLrhto2PFKPFCuHS24SpPUgAJ8VM0ygeKpq2yue5Xdlnq3a8fKh31YClR8VBvtBI5P-JvR8YahlUFQres23DcZkODBDIcDSnSIC2Jm_yiTEk_ruE3oJy-NZWzSIeR5zma94yd1hyF0b1gBvUsJv2wZPgjshJL1NmwU0TGSJTWM1wq_H6YiuXbgC8Z9Heodd513782SBULOoUsKatYuMquWWKKRIFjpf8lrKZSA"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732016459154,"updated_at":1732016460383}}',
        );

        response = await api.createSignUp(
          strategy: Strategy.phoneCode,
          phoneNumber: phoneNumber,
          username: username,
          password: password,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        final client = response.client;
        expect(client?.signUp, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier.isNotEmpty, true);
      });
    });
  });
}
