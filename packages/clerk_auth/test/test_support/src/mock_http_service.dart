import 'dart:convert';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:http/http.dart' show ByteStream, Response;

/// A mock HTTP service that returns pre-configured responses for testing
class MockHttpService implements HttpService {
  MockHttpService();

  final List<MockHttpCall> calls = [];
  final List<MockHttpResponse> responses = [];
  int _responseIndex = 0;

  /// Add a response to be returned by the next call
  void addResponse(MockHttpResponse response) {
    responses.add(response);
  }

  /// Add a JSON response to be returned by the next call
  void addJsonResponse(Map<String, dynamic> json, {int statusCode = 200}) {
    responses.add(MockHttpResponse(
      body: jsonEncode(json),
      statusCode: statusCode,
    ));
  }

  /// Add an empty response
  void addEmptyResponse({int statusCode = 200}) {
    responses.add(MockHttpResponse(body: '{}', statusCode: statusCode));
  }

  /// Add a client response
  void addClientResponse({
    String clientId = 'client_123',
    List<Map<String, dynamic>>? sessions,
    String? lastActiveSessionId,
    Map<String, dynamic>? signIn,
    Map<String, dynamic>? signUp,
    int statusCode = 200,
  }) {
    final clientJson = {
      'object': 'client',
      'id': clientId,
      'sessions': sessions ?? [],
      'last_active_session_id': lastActiveSessionId,
      'sign_in': signIn,
      'sign_up': signUp,
      'created_at': DateTime.now().millisecondsSinceEpoch,
      'updated_at': DateTime.now().millisecondsSinceEpoch,
    };
    addJsonResponse({'response': clientJson}, statusCode: statusCode);
  }

  /// Add an environment response
  void addEnvironmentResponse({int statusCode = 200}) {
    final envJson = {
      'auth_config': {
        'object': 'auth_config',
        'id': 'aac_123',
        'single_session_mode': false,
        'url_based_session_syncing': false,
        'first_factors': ['email_address', 'phone_number'],
        'second_factors': [],
      },
      'display_config': {
        'object': 'display_config',
        'id': 'display_config_123',
        'instance_environment_type': 'development',
        'application_name': 'Test App',
        'theme': {},
        'preferred_sign_in_strategy': 'password',
        'logo_image_url': null,
        'favicon_image_url': null,
        'home_url': 'https://example.com',
        'sign_in_url': 'https://example.com/sign-in',
        'sign_up_url': 'https://example.com/sign-up',
        'user_profile_url': 'https://example.com/user',
        'after_sign_in_url': 'https://example.com',
        'after_sign_up_url': 'https://example.com',
        'after_sign_out_one_url': 'https://example.com',
        'after_sign_out_all_url': 'https://example.com',
        'after_switch_session_url': 'https://example.com',
        'branded': false,
        'captcha_public_key': null,
        'support_email': null,
        'clerk_js_version': '5',
        'show_devmode_warning': true,
        'google_one_tap_client_id': null,
        'help_url': null,
        'privacy_policy_url': null,
        'terms_url': null,
        'logo_link_url': null,
        'organization_profile_url': null,
        'create_organization_url': null,
        'after_leave_organization_url': null,
        'after_create_organization_url': null,
        'logo_url': null,
        'favicon_url': null,
        'waitlist_url': null,
        'after_join_waitlist_url': null,
      },
      'user_settings': {
        'attributes': {},
        'sign_in': {},
        'sign_up': {},
        'actions': {'delete_self': true, 'create_organization': true},
        'social': {},
        'password_settings': {
          'disable_hibp': false,
          'min_length': 8,
          'max_length': 72,
          'require_special_char': false,
          'require_numbers': false,
          'require_uppercase': false,
          'require_lowercase': false,
          'show_zxcvbn': false,
          'min_zxcvbn_strength': 0,
          'enforce_hibp_on_sign_in': false,
          'allowed_special_characters': r'+$-_',
        },
        'passkey_settings': {'allow_autofill': false, 'show_sign_in_button': false},
        'saml': {'enabled': false},
      },
      'organization_settings': {
        'enabled': false,
        'max_allowed_memberships': 5,
        'actions': {'admin_delete': true},
        'domains': {'enabled': false, 'enrollment_modes': []},
      },
    };
    addJsonResponse(envJson, statusCode: statusCode);
  }

  void reset() {
    calls.clear();
    responses.clear();
    _responseIndex = 0;
  }

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  Future<bool> ping(Uri uri, {required Duration timeout}) => Future.value(true);

  @override
  Future<Response> send(
    HttpMethod method,
    Uri uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? body,
  }) async {
    calls.add(MockHttpCall(method: method, uri: uri, headers: headers, params: params, body: body));

    if (_responseIndex < responses.length) {
      final response = responses[_responseIndex++];
      return Response(response.body, response.statusCode, headers: response.headers);
    }
    return Response('{}', 200);
  }

  @override
  Future<Response> sendByteStream(
    HttpMethod method,
    Uri uri,
    ByteStream stream,
    int length,
    Map<String, String> headers,
  ) async {
    calls.add(MockHttpCall(method: method, uri: uri, headers: headers));
    if (_responseIndex < responses.length) {
      final response = responses[_responseIndex++];
      return Response(response.body, response.statusCode, headers: response.headers);
    }
    return Response('{}', 200);
  }
}

class MockHttpCall {
  MockHttpCall({required this.method, required this.uri, this.headers, this.params, this.body});
  final HttpMethod method;
  final Uri uri;
  final Map<String, String>? headers;
  final Map<String, dynamic>? params;
  final String? body;
}

class MockHttpResponse {
  MockHttpResponse({required this.body, this.statusCode = 200, this.headers = const {}});
  final String body;
  final int statusCode;
  final Map<String, String> headers;
}

/// Extension methods for adding common responses
extension MockHttpServiceExtensions on MockHttpService {
  /// Add a sign-in response
  void addSignInResponse({
    String signInId = 'signin_123',
    String status = 'needs_identifier',
    String? identifier,
    Map<String, dynamic>? firstFactorVerification,
    Map<String, dynamic>? secondFactorVerification,
    int statusCode = 200,
  }) {
    final signInJson = {
      'object': 'sign_in',
      'id': signInId,
      'status': status,
      'identifier': identifier,
      'supported_identifiers': ['email_address', 'phone_number'],
      'supported_first_factors': [
        {'strategy': 'password'},
        {'strategy': 'email_code'},
      ],
      'supported_second_factors': [],
      'first_factor_verification': firstFactorVerification,
      'second_factor_verification': secondFactorVerification,
      'created_session_id': null,
      'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
    };
    addJsonResponse({'response': signInJson, 'client': _emptyClientJson()}, statusCode: statusCode);
  }

  /// Add a sign-up response
  void addSignUpResponse({
    String signUpId = 'signup_123',
    String status = 'missing_requirements',
    List<String> requiredFields = const ['email_address'],
    List<String> optionalFields = const [],
    List<String> missingFields = const ['email_address'],
    List<String> unverifiedFields = const [],
    String? emailAddress,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    Map<String, dynamic>? verifications,
    int statusCode = 200,
  }) {
    final signUpJson = {
      'object': 'sign_up',
      'id': signUpId,
      'status': status,
      'required_fields': requiredFields,
      'optional_fields': optionalFields,
      'missing_fields': missingFields,
      'unverified_fields': unverifiedFields,
      'email_address': emailAddress,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'username': null,
      'web3_wallet': null,
      'password_enabled': false,
      'unsafe_metadata': {},
      'public_metadata': {},
      'verifications': verifications ?? {},
      'custom_action': false,
      'external_id': null,
      'created_session_id': null,
      'created_user_id': null,
      'abandon_at': DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
    };
    addJsonResponse({'response': signUpJson, 'client': _emptyClientJson()}, statusCode: statusCode);
  }

  /// Add a session response
  void addSessionResponse({
    String sessionId = 'sess_123',
    String status = 'active',
    String userId = 'user_123',
    int statusCode = 200,
  }) {
    final sessionJson = _createSessionJson(sessionId: sessionId, status: status, userId: userId);
    addJsonResponse({'response': sessionJson, 'client': _emptyClientJson()}, statusCode: statusCode);
  }

  /// Add a client response with active session
  void addClientWithSessionResponse({
    String clientId = 'client_123',
    String sessionId = 'sess_123',
    String userId = 'user_123',
    int statusCode = 200,
  }) {
    final sessionJson = _createSessionJson(sessionId: sessionId, userId: userId);
    final clientJson = {
      'object': 'client',
      'id': clientId,
      'sessions': [sessionJson],
      'last_active_session_id': sessionId,
      'sign_in': null,
      'sign_up': null,
      'created_at': DateTime.now().millisecondsSinceEpoch,
      'updated_at': DateTime.now().millisecondsSinceEpoch,
    };
    addJsonResponse({'response': clientJson}, statusCode: statusCode);
  }

  /// Add an organization response
  void addOrganizationResponse({
    String orgId = 'org_123',
    String name = 'Test Org',
    String? slug,
    int statusCode = 200,
  }) {
    final orgJson = {
      'object': 'organization',
      'id': orgId,
      'name': name,
      'slug': slug ?? name.toLowerCase().replaceAll(' ', '-'),
      'image_url': null,
      'has_image': false,
      'members_count': 1,
      'pending_invitations_count': 0,
      'max_allowed_memberships': 5,
      'admin_delete_enabled': true,
      'public_metadata': {},
      'created_at': DateTime.now().millisecondsSinceEpoch,
      'updated_at': DateTime.now().millisecondsSinceEpoch,
    };
    addJsonResponse({'response': orgJson, 'client': _emptyClientJson()}, statusCode: statusCode);
  }

  /// Add an organization invitation list response
  void addOrganizationInvitationsResponse({
    List<Map<String, dynamic>>? invitations,
    int statusCode = 200,
  }) {
    addJsonResponse({
      'response': {
        'data': invitations ?? [],
        'total_count': invitations?.length ?? 0,
      }
    }, statusCode: statusCode);
  }

  /// Add an organization domains list response
  void addOrganizationDomainsResponse({
    List<Map<String, dynamic>>? domains,
    int statusCode = 200,
  }) {
    addJsonResponse({
      'response': {
        'data': domains ?? [],
        'total_count': domains?.length ?? 0,
      }
    }, statusCode: statusCode);
  }

  /// Add a user response
  void addUserResponse({
    String userId = 'user_123',
    String? firstName,
    String? lastName,
    String? username,
    int statusCode = 200,
  }) {
    final userJson = _createUserJson(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      username: username,
    );
    addJsonResponse({'response': userJson, 'client': _emptyClientJson()}, statusCode: statusCode);
  }

  /// Add an API response (generic)
  void addApiResponse({
    Map<String, dynamic>? response,
    Map<String, dynamic>? client,
    int statusCode = 200,
  }) {
    addJsonResponse({
      'response': response ?? {},
      if (client != null) 'client': client,
    }, statusCode: statusCode);
  }

  /// Add a session token response
  void addSessionTokenResponse({
    String token = 'test_token_123',
    int expiresInSeconds = 3600,
    int statusCode = 200,
  }) {
    addJsonResponse({
      'jwt': token,
    }, statusCode: statusCode);
  }

  Map<String, dynamic> _emptyClientJson() => {
        'object': 'client',
        'id': 'client_123',
        'sessions': <Map<String, dynamic>>[],
        'last_active_session_id': null,
        'sign_in': null,
        'sign_up': null,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      };

  Map<String, dynamic> _createSessionJson({
    String sessionId = 'sess_123',
    String status = 'active',
    String userId = 'user_123',
  }) =>
      {
        'object': 'session',
        'id': sessionId,
        'status': status,
        'last_active_at': DateTime.now().millisecondsSinceEpoch,
        'expire_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
        'abandon_at': DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
        'last_active_organization_id': null,
        'user': _createUserJson(userId: userId),
        'public_user_data': {
          'first_name': null,
          'last_name': null,
          'profile_image_url': null,
          'image_url': null,
          'has_image': false,
          'identifier': 'test@example.com',
        },
      };

  Map<String, dynamic> _createUserJson({
    String userId = 'user_123',
    String? firstName,
    String? lastName,
    String? username,
  }) =>
      {
        'object': 'user',
        'id': userId,
        'external_id': null,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'profile_image_url': null,
        'image_url': null,
        'has_image': false,
        'primary_email_address_id': null,
        'primary_phone_number_id': null,
        'primary_web3_wallet_id': null,
        'public_metadata': {},
        'private_metadata': {},
        'unsafe_metadata': {},
        'email_addresses': [],
        'phone_numbers': [],
        'web3_wallets': [],
        'passkeys': [],
        'organization_memberships': [],
        'create_organization_enabled': false,
        'external_accounts': [],
        'password_enabled': false,
        'two_factor_enabled': false,
        'totp_enabled': false,
        'backup_code_enabled': false,
        'last_sign_in_at': DateTime.now().millisecondsSinceEpoch,
        'banned': false,
        'locked': false,
        'lockout_expires_in_seconds': null,
        'verification_attempts_remaining': null,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'last_active_at': DateTime.now().millisecondsSinceEpoch,
        'delete_self_enabled': true,
      };
}
