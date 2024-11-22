import 'package:clerk_auth/clerk_auth.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../test_helpers.dart';

void main() {
  late final Auth auth;
  late final TestEnv env;
  final httpClient = TestHttpClient();
  final expireAt =
      DateTime.now().add(const Duration(minutes: 5)).millisecondsSinceEpoch;

  String emailAddress = '';
  String phoneNumber = '';
  String username = '';
  String password = '';

  setUp(() async {
    password = 'A${const Uuid().v4()}';
    username = 'user-$password';
    emailAddress = '$username+clerk_test@some.domain';
    phoneNumber = '+15555550179';
  });

  setUpAll(() async {
    env = TestEnv('.env.test');
    auth = Auth(
        publicKey: env.publicKey,
        publishableKey: env.publishableKey,
        client: httpClient);

    httpClient.expect(
      'POST /v1/client',
      200,
      '{"response":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":null,"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732019672385,"updated_at":1732019672391},"client":null}',
    );
    httpClient.expect(
      'GET /v1/environment',
      200,
      '{"auth_config":{"object":"auth_config","id":"AUTH_CONFIG_ID","first_name":"on","last_name":"on","email_address":"on","phone_number":"on","username":"on","password":"required","identification_requirements":[["email_address","oauth_apple","oauth_github","oauth_google","oauth_token_apple","phone_number"],["username"]],"identification_strategies":["email_address","oauth_apple","oauth_github","oauth_google","phone_number","username"],"first_factors":["email_code","email_link","google_one_tap","oauth_apple","oauth_github","oauth_google","oauth_token_apple","password","phone_code","reset_password_email_code","reset_password_phone_code","ticket"],"second_factors":["phone_code"],"email_address_verification_strategies":["email_code"],"single_session_mode":false,"enhanced_email_deliverability":false,"test_mode":true,"cookieless_dev":true,"url_based_session_syncing":true,"demo":false},"display_config":{"object":"display_config","id":"DISPLAY_CONFIG_ID","instance_environment_type":"development","application_name":"Flutter SDK Test","theme":{"buttons":{"font_color":"#ffffff","font_family":"\\"Source Sans Pro\\", sans-serif","font_weight":"600"},"general":{"color":"#6c47ff","padding":"1em","box_shadow":"0 2px 8px rgba(0, 0, 0, 0.2)","font_color":"#151515","font_family":"\\"Source Sans Pro\\", sans-serif","border_radius":"0.5em","background_color":"#ffffff","label_font_weight":"600"},"accounts":{"background_color":"#ffffff"}},"preferred_sign_in_strategy":"password","logo_image_url":"https://img.clerk.com/eyJ0eXBlIjoicHJveHkiLCJzcmMiOiJodHRwczovL2ltYWdlcy5jbGVyay5kZXYvdXBsb2FkZWQvaW1nXzJuYzhPMll4aHg1UXdIYU9NTjBrQUhSUmIyTiJ9","favicon_image_url":"","home_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","sign_in_url":"https://CLERK-ACCOUNT.accounts.dev/sign-in","sign_up_url":"https://CLERK-ACCOUNT.accounts.dev/sign-up","USER_ID":"https://CLERK-ACCOUNT.accounts.dev/user","waitlist_url":"https://CLERK-ACCOUNT.accounts.dev/waitlist","after_sign_in_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","after_sign_up_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","after_sign_out_one_url":"https://CLERK-ACCOUNT.accounts.dev/sign-in/choose","after_sign_out_all_url":"https://CLERK-ACCOUNT.accounts.dev/sign-in","after_switch_session_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","after_join_waitlist_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","organization_profile_url":"https://CLERK-ACCOUNT.accounts.dev/organization","create_organization_url":"https://CLERK-ACCOUNT.accounts.dev/create-organization","after_leave_organization_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","after_create_organization_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","logo_link_url":"https://CLERK-ACCOUNT.accounts.dev/default-redirect","support_email":null,"branded":true,"experimental_force_oauth_first":false,"clerk_js_version":"5","show_devmode_warning":true,"google_one_tap_client_id":"fake.com","help_url":null,"privacy_policy_url":null,"terms_url":null,"logo_url":"https://images.clerk.dev/uploaded/IMAGE_ID","favicon_url":null,"logo_image":{"object":"image","id":"IMAGE_ID","public_url":"https://images.clerk.dev/uploaded/IMAGE_ID"},"favicon_image":null,"captcha_public_key":null,"captcha_widget_type":null,"captcha_public_key_invisible":null,"captcha_provider":null,"captcha_oauth_bypass":[]},"USER_ID":{"attributes":{"email_address":{"enabled":true,"required":false,"used_for_first_factor":true,"first_factors":["email_code","email_link"],"used_for_second_factor":false,"second_factors":[],"verifications":["email_code"],"verify_at_sign_up":true},"phone_number":{"enabled":true,"required":false,"used_for_first_factor":true,"first_factors":["phone_code"],"used_for_second_factor":true,"second_factors":["phone_code"],"verifications":["phone_code"],"verify_at_sign_up":true},"username":{"enabled":true,"required":false,"used_for_first_factor":true,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"web3_wallet":{"enabled":false,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"first_name":{"enabled":true,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"last_name":{"enabled":true,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"password":{"enabled":true,"required":true,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"authenticator_app":{"enabled":false,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"ticket":{"enabled":true,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"backup_code":{"enabled":false,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false},"passkey":{"enabled":false,"required":false,"used_for_first_factor":false,"first_factors":[],"used_for_second_factor":false,"second_factors":[],"verifications":[],"verify_at_sign_up":false}},"sign_in":{"second_factor":{"required":false}},"sign_up":{"captcha_enabled":false,"captcha_widget_type":"smart","custom_action_required":false,"progressive":true,"mode":"public","legal_consent_enabled":false},"restrictions":{"allowlist":{"enabled":false},"blocklist":{"enabled":false},"block_email_subaddresses":{"enabled":false},"block_disposable_email_domains":{"enabled":false},"ignore_dots_for_gmail_addresses":{"enabled":false}},"username_settings":{"min_length":4,"max_length":64},"actions":{"delete_self":true,"create_organization":true,"create_organizations_limit":null},"attack_protection":{"USER_ID":{"enabled":true,"max_attempts":100,"duration_in_minutes":60},"pii":{"enabled":true},"email_link":{"require_same_client":false}},"passkey_settings":{"allow_autofill":true,"show_sign_in_button":true},"social":{"oauth_apple":{"enabled":true,"required":false,"authenticatable":true,"block_email_subaddresses":false,"strategy":"oauth_apple","not_selectable":false,"deprecated":false,"name":"Apple","logo_url":"https://img.clerk.com/static/apple.png"},"oauth_custom_spung":{"enabled":false,"required":false,"authenticatable":true,"block_email_subaddresses":false,"strategy":"oauth_custom_spung","not_selectable":false,"deprecated":false,"name":"spung"},"oauth_github":{"enabled":true,"required":false,"authenticatable":true,"block_email_subaddresses":false,"strategy":"oauth_github","not_selectable":false,"deprecated":false,"name":"GitHub","logo_url":"https://img.clerk.com/static/github.png"},"oauth_google":{"enabled":true,"required":false,"authenticatable":true,"block_email_subaddresses":true,"strategy":"oauth_google","not_selectable":false,"deprecated":false,"name":"Google","logo_url":"https://img.clerk.com/static/google.png"}},"password_settings":{"disable_hibp":false,"min_length":8,"max_length":0,"require_special_char":true,"require_numbers":true,"require_uppercase":true,"require_lowercase":true,"show_zxcvbn":false,"min_zxcvbn_strength":0,"enforce_hibp_on_sign_in":false,"allowed_special_characters":"!\\"#\$%\u0026\'()*+,-./:;\u003c=\u003e?@[]^_`{|}~"},"saml":{"enabled":false},"enterprise_sso":{"enabled":false}},"organization_settings":{"enabled":false,"max_allowed_memberships":5,"actions":{"admin_delete":true},"domains":{"enabled":false,"enrollment_modes":[],"default_role":""},"creator_role":"org:admin"},"maintenance_mode":false}',
    );

    await auth.initialize();

    await setUpLogging(printer: TestLogPrinter(), level: Level.SEVERE);
  });

  tearDown(() async {
    httpClient.expect('DELETE /v1/client', 200, '');
    await auth.signOut();
  });

  group('SignUp', () {
    test('can sign up with emailCode in separate steps', () async {
      await runWithLogging(() async {
        expect(auth.user, null);

        httpClient.expect(
          'POST /v1/client/sign_ups strategy=email_code&email_address=$emailAddress',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_github","oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","first_name","last_name","oauth_github","oauth_google","oauth_apple","email_address"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020614748}}',
        );
        httpClient.expect(
          'PATCH /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID strategy=email_code&email_address=$emailAddress',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple","oauth_github"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","first_name","last_name","oauth_apple","oauth_github"],"missing_fields":["password"],"unverified_fields":["email_address"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020614748}}',
        );
        httpClient.expect(
          'PATCH /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID strategy=email_code&username=user-$password&password=$password',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["phone_number","username","first_name","last_name","oauth_apple","oauth_github","oauth_google","email_address"],"missing_fields":[],"unverified_fields":["email_address"],"verifications":{"email_address":{"status":"unverified","strategy":"email_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["email_code"]},"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-aea093fbf-fe71-4b32-8b31-06d7e3a59c3b","email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","first_name","last_name","oauth_apple","oauth_github"],"missing_fields":[],"unverified_fields":["email_address"],"verifications":{"email_address":{"status":"unverified","strategy":"email_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["email_code"]},"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-aea093fbf-fe71-4b32-8b31-06d7e3a59c3b","email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107014735,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020614748}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification strategy=email_code&code=424242',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"complete","required_fields":["password"],"optional_fields":["oauth_apple","oauth_github","oauth_google","email_address","phone_number","username","first_name","last_name"],"missing_fields":[],"unverified_fields":[],"verifications":{"email_address":{"status":"verified","strategy":"email_code","attempts":1,"expire_at":$expireAt,"next_action":"","supported_strategies":["email_code"]},"phone_number":null,"web3_wallet":null,"external_account":null},"username":"user-aea093fbf-fe71-4b32-8b31-06d7e3a59c3b","email_address":"$emailAddress","phone_number":null,"web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":"SESSION_ID","created_user_id":"USER_ID","abandon_at":1732107014735,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734612615961,"last_active_at":1732020615961,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"user-aea093fbf-fe71-4b32-8b31-06d7e3a59c3b","first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNEx0U1JPZmxlM0tuTWIwd2JmN1diRUFzWSJ9","has_image":false,"primary_email_address_id":"IDENTIFIER_ID","primary_phone_number_id":null,"primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[{"id":"IDENTIFIER_ID","object":"email_address","email_address":"$emailAddress","reserved":false,"verification":{"status":"verified","strategy":"email_code","attempts":1,"expire_at":$expireAt},"linked_to":[],"created_at":1732020615047,"updated_at":1732020615977}],"phone_numbers":[],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732020615963,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1732020615957,"updated_at":1732020615997,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1732020615955,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNEx0U1JPZmxlM0tuTWIwd2JmN1diRUFzWSJ9","has_image":false,"identifier":"$emailAddress","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732020615963,"updated_at":1732020616046,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMjA2NzYsImlhdCI6MTczMjAyMDYxNiwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDIwNjA2LCJzaWQiOiJzZXNzXzJwNEx0WTZ3QWFjcVEwdDFwUG1XWVJQNEN1QyIsInN1YiI6InVzZXJfMnA0THRTUk9mbGUzS25NYjB3YmY3V2JFQXNZIn0.S7UvULOVvBkJ5WqV3I7kU4m_SW_gQak0BP3ouTiDOONf-5tPeiO54bEZ3Ohc3gjHru-BPJ_2Twbd0WzEI3RHCad12pQhQdVwVOosesNn4kI1bCKYdkaL9VgoBCFFoSETANz93dmiNDRdcWRMxUgkviSsqNFFYKZO3wuC1g7nc6n5JvZrVahBuvSn1589M7CPXXer0CCEWi2xXpsYam26mo7QIRbJ1akWJltNkaHStW5WE15ObADecYBXPb0liX7TG9IyT88WVXNPT05EtpBlz4VRnVuiad6ZduhCnr4tN03p2VQ1tpoYqpptKl2DfUmZcEGrtbiRvmDUr9reDpSfeA"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732020614717,"updated_at":1732020616043}}',
        );

        Client client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          emailAddress: emailAddress,
        );
        expect(client.signUp?.status, Status.missingRequirements);

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          username: username,
          password: password,
          // ignore: unnecessary_string_interpolations
          passwordConfirmation: '$password', // technically a 'different' string
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(
            client.signUp?.unverifiedFields.contains(Field.emailAddress), true);

        client = await auth.attemptSignUp(
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);
      });
    });

    test('can sign up with phoneCode in separate steps', () async {
      await runWithLogging(() async {
        expect(auth.user, null);

        httpClient.expect(
          'POST /v1/client/sign_ups strategy=phone_code&phone_number=+15555550179',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_github","oauth_google","email_address","phone_number","username","first_name","last_name","oauth_apple"],"missing_fields":["password"],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107138339,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple","oauth_github"],"missing_fields":["password"],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107138339,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020738327,"updated_at":1732020738349}}',
        );
        httpClient.expect(
          'PATCH /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID strategy=phone_code&phone_number=+15555550179',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["first_name","oauth_apple","oauth_github","oauth_google","email_address","phone_number","username","last_name"],"missing_fields":["password"],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107138339,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_google","email_address","phone_number","username","last_name","first_name","oauth_apple","oauth_github"],"missing_fields":["password"],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":null,"web3_wallet":null,"external_account":null},"username":null,"email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":false,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107138339,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020738327,"updated_at":1732020738349}}',
        );
        httpClient.expect(
          'PATCH /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID strategy=phone_code&username=$username&password=$password',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["oauth_apple","email_address","phone_number","username","last_name","first_name","oauth_github","oauth_google"],"missing_fields":[],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":{"status":"unverified","strategy":"phone_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["phone_code"]},"web3_wallet":null,"external_account":null},"username":"user-a312ee66c-786d-4489-80a5-93e68eb4f98d","email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107138339,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[],"sign_in":null,"sign_up":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"missing_requirements","required_fields":["password"],"optional_fields":["username","first_name","last_name","oauth_apple","oauth_github","oauth_google","email_address","phone_number"],"missing_fields":[],"unverified_fields":["phone_number"],"verifications":{"email_address":null,"phone_number":{"status":"unverified","strategy":"phone_code","attempts":0,"expire_at":$expireAt,"next_action":"needs_attempt","supported_strategies":["phone_code"]},"web3_wallet":null,"external_account":null},"username":"user-a312ee66c-786d-4489-80a5-93e68eb4f98d","email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":null,"created_user_id":null,"abandon_at":1732107138339,"legal_accepted_at":null},"last_active_session_id":null,"cookie_expires_at":null,"created_at":1732020738327,"updated_at":1732020738349}}',
        );
        httpClient.expect(
          'POST /v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification strategy=phone_code&code=424242',
          200,
          '{"response":{"object":"sign_up_attempt","id":"SIGN_UP_ATTEMPT_ID","status":"complete","required_fields":["password"],"optional_fields":["first_name","last_name","oauth_apple","oauth_github","oauth_google","email_address","phone_number","username"],"missing_fields":[],"unverified_fields":[],"verifications":{"email_address":null,"phone_number":{"status":"verified","strategy":"phone_code","attempts":1,"expire_at":$expireAt,"next_action":"","supported_strategies":["phone_code"]},"web3_wallet":null,"external_account":null},"username":"user-a312ee66c-786d-4489-80a5-93e68eb4f98d","email_address":null,"phone_number":"+15555550179","web3_wallet":null,"password_enabled":true,"first_name":null,"last_name":null,"unsafe_metadata":{},"public_metadata":{},"custom_action":false,"external_id":null,"created_session_id":"SESSION_ID","created_user_id":"USER_ID","abandon_at":1732107138339,"legal_accepted_at":null},"client":{"object":"client","id":"CLIENT_ID","sessions":[{"object":"session","id":"SESSION_ID","status":"active","expire_at":$expireAt,"abandon_at":1734612739655,"last_active_at":1732020739655,"last_active_organization_id":null,"actor":null,"user":{"id":"USER_ID","object":"user","username":"user-a312ee66c-786d-4489-80a5-93e68eb4f98d","first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNE05NHBzY1BDOHZ2SzcxenVmWVhvR3Y1bCJ9","has_image":false,"primary_email_address_id":null,"primary_phone_number_id":"IDENTIFIER_ID","primary_web3_wallet_id":null,"password_enabled":true,"two_factor_enabled":false,"totp_enabled":false,"backup_code_enabled":false,"email_addresses":[],"phone_numbers":[{"id":"IDENTIFIER_ID","object":"phone_number","phone_number":"+15555550179","reserved_for_second_factor":false,"default_second_factor":false,"reserved":false,"verification":{"status":"verified","strategy":"phone_code","attempts":1,"expire_at":$expireAt},"linked_to":[],"backup_codes":null,"created_at":1732020738696,"updated_at":1732020739705}],"web3_wallets":[],"passkeys":[],"external_accounts":[],"saml_accounts":[],"enterprise_accounts":[],"public_metadata":{},"unsafe_metadata":{},"external_id":null,"last_sign_in_at":1732020739656,"banned":false,"locked":false,"lockout_expires_in_seconds":null,"verification_attempts_remaining":100,"created_at":1732020739650,"updated_at":1732020739722,"delete_self_enabled":true,"create_organization_enabled":true,"last_active_at":1732020739647,"mfa_enabled_at":null,"mfa_disabled_at":null,"legal_accepted_at":null,"profile_image_url":"https://www.gravatar.com/avatar?d=mp","organization_memberships":[]},"public_user_data":{"first_name":null,"last_name":null,"image_url":"https://img.clerk.com/eyJ0eXBlIjoiZGVmYXVsdCIsImlpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJyaWQiOiJ1c2VyXzJwNE05NHBzY1BDOHZ2SzcxenVmWVhvR3Y1bCJ9","has_image":false,"identifier":"+15555550179","profile_image_url":"https://www.gravatar.com/avatar?d=mp"},"created_at":1732020739656,"updated_at":1732020739786,"last_active_token":{"object":"token","jwt":"eyJhbGciOiJSUzI1NiIsImNhdCI6ImNsX0I3ZDRQRDExMUFBQSIsImtpZCI6Imluc18ya3ZZdzF0WkY4OHNvQjdtN0FYaGlEQ2llMmsiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjE3MzIwMjA3OTksImlhdCI6MTczMjAyMDczOSwiaXNzIjoiaHR0cHM6Ly9tb3JlLXlldGktNTMuY2xlcmsuYWNjb3VudHMuZGV2IiwibmJmIjoxNzMyMDIwNzI5LCJzaWQiOiJzZXNzXzJwNE05OE1XMXhSZ1VMQW13NzB5bGQzdXpuayIsInN1YiI6InVzZXJfMnA0TTk0cHNjUEM4dnZLNzF6dWZZWG9HdjVsIn0.whYxOlCv1t-qWlenxWUQGWl8DB8BhMBivilXKyXJ8dTXOoH2gPfe6KYodKu9fEpLMzxV1AnJ-Gm8VRfB0m6yEvJB7_e9d6T-Cwgj9VyYDN41bZ86-hqzVtznPMWE0FQUiQ6mI4h8u1D82CmbK-CkXwsxpAAx4UoknZHXKdcrgjS-TM9lxSSf7eX-4ubRYbIoiOv7fUf4KjhwO27R0x0EUbhsMN8as3ix0ydfjXxDzX1XCtAdzbHSXPSvmS-hwC1AUH2IN_4P-ssYrj_6wHXTFLThMFH_OXrGj3SV2HmRX6hJeagY3497Tc5TeLhs9w_4fPaRlPqbsTt4OnaKbziQQg"}}],"sign_in":null,"sign_up":null,"last_active_session_id":"SESSION_ID","cookie_expires_at":null,"created_at":1732020738327,"updated_at":1732020739782}}',
        );

        Client client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          phoneNumber: phoneNumber,
        );
        expect(client.signUp?.status, Status.missingRequirements);

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          username: username,
          password: password,
          // ignore: unnecessary_string_interpolations
          passwordConfirmation: '$password', // technically a 'different' string
        );
        expect(client.signUp?.status, Status.missingRequirements);
        expect(
            client.signUp?.unverifiedFields.contains(Field.phoneNumber), true);

        client = await auth.attemptSignUp(
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(client.signUp, null);
        expect(client.user is User, true);
      });
    });
  });
}
