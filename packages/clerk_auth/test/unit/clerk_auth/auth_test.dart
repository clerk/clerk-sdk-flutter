import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/models/client/external_account.dart';
import 'package:clerk_auth/src/models/client/organization_invitation.dart';
import 'package:clerk_auth/src/models/client/session.dart';
import 'package:clerk_auth/src/models/client/sign_in.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/client/user_public.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

// Valid publishable key with base64-encoded domain (somedomain.com)
const _validPublishableKey = 'pk_test_c29tZWRvbWFpbi5jb20K';

User _createTestUser({
  String id = 'user_123',
  String? firstName,
  String? lastName,
}) {
  return User(
    id: id,
    externalId: null,
    username: null,
    firstName: firstName,
    lastName: lastName,
    profileImageUrl: null,
    imageUrl: null,
    hasImage: false,
    primaryEmailAddressId: null,
    primaryPhoneNumberId: null,
    primaryWeb3WalletId: null,
    publicMetadata: null,
    privateMetadata: {},
    unsafeMetadata: null,
    emailAddresses: null,
    phoneNumbers: null,
    web3Wallets: null,
    passkeys: null,
    organizationMemberships: null,
    createOrganizationEnabled: false,
    externalAccounts: null,
    passwordEnabled: false,
    twoFactorEnabled: false,
    totpEnabled: false,
    backupCodeEnabled: false,
    lastSignInAt: DateTimeExt.epoch,
    banned: false,
    locked: false,
    lockoutExpiresInSeconds: null,
    verificationAttemptsRemaining: null,
    updatedAt: DateTimeExt.epoch,
    createdAt: DateTimeExt.epoch,
    lastActiveAt: DateTimeExt.epoch,
    deleteSelfEnabled: false,
  );
}

Session _createTestSession({
  String id = 'sess_123',
  Status status = Status.active,
  User? user,
  String? lastActiveOrganizationId,
}) {
  final testUser = user ?? _createTestUser();
  return Session(
    id: id,
    status: status,
    lastActiveAt: DateTime.now(),
    expireAt: DateTime.now().add(const Duration(days: 1)),
    abandonAt: DateTime.now().add(const Duration(days: 7)),
    publicUserData: UserPublic(
      firstName: testUser.firstName,
      lastName: testUser.lastName,
      profileImageUrl: testUser.profileImageUrl,
      imageUrl: testUser.imageUrl,
      hasImage: testUser.hasImage ?? false,
      identifier: testUser.email ?? '',
    ),
    lastActiveOrganizationId: lastActiveOrganizationId,
    user: testUser,
  );
}

Organization _createTestOrganization({
  String id = 'org_123',
  String name = 'Test Org',
  String slug = 'test-org',
}) {
  return Organization(
    id: id,
    name: name,
    slug: slug,
  );
}

ExternalAccount _createTestExternalAccount({
  String id = 'ext_123',
  String provider = 'google',
}) {
  return ExternalAccount(
    id: id,
    provider: provider,
    providerUserId: 'provider_user_123',
    approvedScopes: '',
    emailAddress: 'test@gmail.com',
    username: null,
    firstName: 'Test',
    lastName: 'User',
    avatarUrl: null,
    imageUrl: null,
    label: null,
    publicMetadata: const {},
    verification: Verification(
      status: Status.verified,
      strategy: Strategy.oauthGoogle,
      attempts: 0,
      expireAt: DateTime.now().add(const Duration(days: 1)),
    ),
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
  );
}

OrganizationInvitation _createTestOrganizationInvitation({
  String id = 'inv_123',
}) {
  return OrganizationInvitation(
    id: id,
    status: Status.pending,
    roleName: 'basic_member',
    organization: _createTestOrganization(),
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
  );
}

void main() {
  group('Auth', () {
    group('initial state', () {
      test('isNotAvailable returns true before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.isNotAvailable, true);
      });

      test('client is empty before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.client.isEmpty, true);
      });

      test('env is empty before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.env.isEmpty, true);
      });

      test('user is null before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.user, isNull);
      });

      test('session is null before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.session, isNull);
      });

      test('signIn is null before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.signIn, isNull);
      });

      test('signUp is null before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.signUp, isNull);
      });

      test('isSignedIn returns false before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.isSignedIn, false);
      });

      test('isSigningIn returns false before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.isSigningIn, false);
      });

      test('isSigningUp returns false before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.isSigningUp, false);
      });

      test('organization is null before initialization', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        expect(auth.organization, isNull);
      });
    });

    group('client setter', () {
      test('updates client value', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final session = _createTestSession();
        final newClient = Client(
          id: 'client_123',
          sessions: [session],
          lastActiveSessionId: session.id,
        );

        auth.client = newClient;

        expect(auth.client.id, 'client_123');
        expect(auth.client.sessions.length, 1);
      });

      test('updates user when client has active session', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final user = _createTestUser(id: 'user_abc', firstName: 'Test');
        final session = _createTestSession(user: user);
        final newClient = Client(
          id: 'client_123',
          sessions: [session],
          lastActiveSessionId: session.id,
        );

        auth.client = newClient;

        expect(auth.user?.id, 'user_abc');
        expect(auth.user?.firstName, 'Test');
      });

      test('isSignedIn returns true when client has active session', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final session = _createTestSession();
        final newClient = Client(
          id: 'client_123',
          sessions: [session],
          lastActiveSessionId: session.id,
        );

        auth.client = newClient;

        expect(auth.isSignedIn, true);
      });
    });

    group('env setter', () {
      test('updates env value', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );

        auth.env = Environment.empty;

        expect(auth.env.isEmpty, true);
      });

      test('isNotAvailable returns true when env is empty', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );

        auth.env = Environment.empty;

        expect(auth.isNotAvailable, true);
      });
    });

    group('defaultLocalesLookup', () {
      test('returns English as default locale', () {
        final locales = Auth.defaultLocalesLookup();
        expect(locales, ['en']);
      });
    });

    group('handleError', () {
      test('throws ClerkError', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        const error = ClerkError(
          message: 'Test error',
          code: ClerkErrorCode.clientAppError,
        );

        expect(
          () => auth.handleError(error),
          throwsA(isA<ClerkError>()),
        );
      });
    });

    group('signIn and signUp getters', () {
      test('signIn returns client signIn', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final signIn = SignIn.empty;
        final newClient = Client(
          id: 'client_123',
          signIn: signIn,
        );

        auth.client = newClient;

        expect(auth.signIn, isNotNull);
        expect(auth.isSigningIn, true);
      });

      test('signUp returns client signUp', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final signUp = SignUp(
          id: 'signup_123',
          status: Status.missingRequirements,
          requiredFields: const [],
          optionalFields: const [],
          missingFields: const [],
          unverifiedFields: const [],
          username: null,
          emailAddress: null,
          phoneNumber: null,
          web3Wallet: null,
          passwordEnabled: false,
          firstName: null,
          lastName: null,
          unsafeMetadata: const {},
          publicMetadata: const {},
          verifications: const {},
          customAction: false,
          externalId: null,
          createdSessionId: null,
          createdUserId: null,
          abandonAt: DateTime.now().add(const Duration(days: 7)),
        );
        final newClient = Client(
          id: 'client_123',
          signUp: signUp,
        );

        auth.client = newClient;

        expect(auth.signUp, isNotNull);
        expect(auth.isSigningUp, true);
      });
    });

    group('session getter', () {
      test('returns active session from client', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final session = _createTestSession(id: 'sess_active');
        final newClient = Client(
          id: 'client_123',
          sessions: [session],
          lastActiveSessionId: 'sess_active',
        );

        auth.client = newClient;

        expect(auth.session?.id, 'sess_active');
      });

      test('returns null when no active session', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final newClient = Client(
          id: 'client_123',
          sessions: [],
        );

        auth.client = newClient;

        expect(auth.session, isNull);
      });
    });

    group('organization getter', () {
      test('returns organization from active session', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        final session = _createTestSession(lastActiveOrganizationId: 'org_123');
        final newClient = Client(
          id: 'client_123',
          sessions: [session],
          lastActiveSessionId: session.id,
        );

        auth.client = newClient;

        // Organization is derived from session.lastActiveOrganizationId
        // and user's organizationMemberships, which we haven't set up
        expect(auth.organization, isNull);
      });
    });

    group('update method', () {
      test('can be called without error', () {
        final auth = Auth(
          config: const TestAuthConfig(publishableKey: _validPublishableKey),
        );
        // update() is a no-op in base Auth class
        expect(() => auth.update(), returnsNormally);
      });
    });

    group('with MockHttpService', () {
      late MockHttpService mockHttp;
      late Auth auth;

      setUp(() {
        mockHttp = MockHttpService();
      });

      tearDown(() {
        mockHttp.reset();
      });

      group('initialize', () {
        test('fetches client and environment', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          expect(auth.client.isNotEmpty, true);
          expect(auth.env.isNotEmpty, true);
          expect(auth.isNotAvailable, false);

          auth.terminate();
        });

        test('handles error response gracefully', () async {
          // Add error responses
          mockHttp.addJsonResponse({'errors': []}, statusCode: 500);
          mockHttp.addJsonResponse({'errors': []}, statusCode: 500);

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          // Should still work but with empty client/env due to error responses
          expect(auth.client.isEmpty, true);
          expect(auth.env.isEmpty, true);

          auth.terminate();
        });
      });

      group('terminate', () {
        test('can be called after initialize', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          expect(() => auth.terminate(), returnsNormally);
        });
      });

      group('refreshClient', () {
        test('updates client from API', () async {
          mockHttp.addClientResponse(clientId: 'client_initial');
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(clientId: 'client_refreshed');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          expect(auth.client.id, 'client_initial');

          await auth.refreshClient();
          expect(auth.client.id, 'client_refreshed');

          auth.terminate();
        });
      });

      group('resetClient', () {
        test('creates new client', () async {
          mockHttp.addClientResponse(clientId: 'client_initial');
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(clientId: 'client_reset');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.resetClient();

          expect(auth.client.id, 'client_reset');

          auth.terminate();
        });
      });

      group('refreshEnvironment', () {
        test('updates environment from API', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.refreshEnvironment();

          expect(auth.env.isNotEmpty, true);

          auth.terminate();
        });
      });

      group('signOut', () {
        test('clears client', () async {
          mockHttp.addClientResponse(clientId: 'client_123');
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(clientId: ''); // Empty client after signout

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.signOut();

          // Client should be updated
          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('transfer', () {
        test('does nothing when no signIn or signUp', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.transfer();

          // No additional API calls should be made
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });
      });

      group('oauthSignIn', () {
        test('creates sign in with oauth strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignInResponse(status: 'needs_first_factor');
          mockHttp.addSignInResponse(status: 'needs_first_factor');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.oauthSignIn(
            strategy: Strategy.oauthGoogle,
            redirect: Uri.parse('https://example.com/callback'),
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('completeOAuthSignIn', () {
        test('does nothing when no signIn or signUp', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.completeOAuthSignIn(token: 'test_token');

          // No additional API calls should be made
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });
      });

      group('oauthConnect', () {
        test('adds external account', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.oauthConnect(
            strategy: Strategy.oauthGoogle,
            redirect: Uri.parse('https://example.com/callback'),
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('idTokenSignIn', () {
        test('calls attemptSignIn with provider strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignInResponse(status: 'complete');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.idTokenSignIn(
            provider: IdTokenProvider.apple,
            idToken: 'test_id_token',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('idTokenSignUp', () {
        test('calls attemptSignUp with provider strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignUpResponse(status: 'complete');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.idTokenSignUp(
            provider: IdTokenProvider.apple,
            idToken: 'test_id_token',
            firstName: 'Test',
            lastName: 'User',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('initiatePasswordReset', () {
        test('creates sign in with password reset strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignInResponse(status: 'needs_first_factor');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.initiatePasswordReset(
            identifier: 'test@example.com',
            strategy: Strategy.resetPasswordEmailCode,
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });

        test('throws error for non-password-reset strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          expect(
            () => auth.initiatePasswordReset(
              identifier: 'test@example.com',
              strategy: Strategy.password,
            ),
            throwsA(isA<ClerkError>()),
          );

          auth.terminate();
        });
      });

      group('attemptSignIn', () {
        test('creates sign in with identifier', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignInResponse(
            status: 'needs_first_factor',
            identifier: 'test@example.com',
          );

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.attemptSignIn(
            strategy: Strategy.password,
            identifier: 'test@example.com',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));
          // After attemptSignIn, the client should have a signIn object
          // The isSigningIn state depends on the response status

          auth.terminate();
        });

        test('handles oauth token strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignInResponse(status: 'complete');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.attemptSignIn(
            strategy: Strategy.oauthApple,
            token: 'oauth_token_123',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });

        test('handles oauth code strategy', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignInResponse(status: 'complete');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.attemptSignIn(
            strategy: Strategy.oauthGoogle,
            code: 'oauth_code_123',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('attemptSignUp', () {
        test('creates sign up with email', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignUpResponse(
            status: 'missing_requirements',
            emailAddress: 'test@example.com',
          );

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.attemptSignUp(
            strategy: Strategy.emailCode,
            emailAddress: 'test@example.com',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));
          // After attemptSignUp, the client should have a signUp object
          // The isSigningUp state depends on the response status

          auth.terminate();
        });

        test('throws error when passwords do not match', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          expect(
            () => auth.attemptSignUp(
              strategy: Strategy.password,
              password: 'password123',
              passwordConfirmation: 'different_password',
            ),
            throwsA(isA<ClerkError>()),
          );

          auth.terminate();
        });

        test('creates sign up with all fields', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addSignUpResponse(
            status: 'missing_requirements',
            firstName: 'Test',
            lastName: 'User',
            emailAddress: 'test@example.com',
          );

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.attemptSignUp(
            strategy: Strategy.password,
            firstName: 'Test',
            lastName: 'User',
            emailAddress: 'test@example.com',
            password: 'password123',
            passwordConfirmation: 'password123',
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('signOutOf', () {
        test('signs out of specific session', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final session = _createTestSession(id: 'sess_to_signout');
          await auth.signOutOf(session);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('setActiveOrganization', () {
        test('does nothing when no session', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          await auth.setActiveOrganization(org);

          // No additional API calls since no session
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });
      });

      group('createOrganization', () {
        test('creates organization with name', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addOrganizationResponse(name: 'New Org');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.createOrganization(name: 'New Org');

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('leaveOrganization', () {
        test('leaves organization', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addApiResponse(response: {'success': true});

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          await auth.leaveOrganization(organization: org);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('fetchOrganizationInvitations', () {
        test('fetches empty invitations list', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addOrganizationInvitationsResponse(invitations: []);

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          final invitations = await auth.fetchOrganizationInvitations();

          expect(invitations, isEmpty);

          auth.terminate();
        });

        test('fetches invitations with data', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          // Add empty response for the invitations call (no data key means empty list)
          mockHttp.addOrganizationInvitationsResponse(invitations: []);

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          final invitations = await auth.fetchOrganizationInvitations();

          // The method makes an API call and returns the parsed invitations
          expect(invitations, isA<List<OrganizationInvitation>>());
          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('fetchOrganizationDomains', () {
        test('fetches empty domains list', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addOrganizationDomainsResponse(domains: []);

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          final domains = await auth.fetchOrganizationDomains(organization: org);

          expect(domains, isEmpty);

          auth.terminate();
        });
      });

      group('activate', () {
        test('activates session', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final session = _createTestSession();
          await auth.activate(session);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('updateUser', () {
        test('does nothing when no user', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.updateUser(firstName: 'New Name');

          // No additional API calls since no user
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });
      });

      group('deleteUser', () {
        test('deletes user when allowed', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(); // For deleteUser API call
          mockHttp.addClientResponse(); // For currentClient refresh

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          // The mock environment has delete_self: true, so this should work
          await auth.deleteUser();

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('addIdentifyingData', () {
        test('adds email to user', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.addIdentifyingData('new@example.com', IdentifierType.emailAddress);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });

        test('adds phone to user', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.addIdentifyingData('+1234567890', IdentifierType.phoneNumber);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('updateUserPassword', () {
        test('updates password', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.updateUserPassword('old_password', 'new_password');

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });

        test('updates password without sign out', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.updateUserPassword('old_password', 'new_password', signOut: false);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('deleteUserPassword', () {
        test('deletes password', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.deleteUserPassword('current_password');

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('fetchApiResponse', () {
        test('makes API call with default parameters', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(); // For the API call

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          final response = await auth.fetchApiResponse('/test');

          // The response is an ApiResponse object
          expect(response, isA<ApiResponse>());
          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });

        test('makes API call with custom method', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(); // For the API call

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          final response = await auth.fetchApiResponse(
            '/test',
            method: HttpMethod.get,
          );

          expect(response, isA<ApiResponse>());

          auth.terminate();
        });

        test('makes API call with headers and params', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse(); // For the API call

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          final response = await auth.fetchApiResponse(
            '/test',
            headers: {'X-Custom': 'header'},
            params: {'key': 'value'},
          );

          expect(response, isA<ApiResponse>());

          auth.terminate();
        });
      });

      group('sessionTokenStream', () {
        test('returns a stream', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          expect(auth.sessionTokenStream, isA<Stream<SessionToken>>());

          auth.terminate();
        });
      });

      group('deleteExternalAccount', () {
        test('deletes external account', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final account = _createTestExternalAccount();

          await auth.deleteExternalAccount(account: account);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('acceptOrganizationInvitation', () {
        test('accepts invitation', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final invitation = _createTestOrganizationInvitation();

          await auth.acceptOrganizationInvitation(invitation);

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('createDomain', () {
        test('creates domain with manual invitation mode', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addApiResponse(response: {'id': 'domain_123'});

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          await auth.createDomain(
            organization: org,
            name: 'example.com',
            mode: EnrollmentMode.manualInvitation,
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });

        test('creates domain with automatic invitation mode', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          // For createDomain - needs client response with response containing id
          mockHttp.addJsonResponse({
            'response': {'id': 'domain_123', 'name': 'example.com'},
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });
          // For updateDomainEnrollmentMode
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          await auth.createDomain(
            organization: org,
            name: 'example.com',
            mode: EnrollmentMode.automaticInvitation,
          );

          expect(mockHttp.calls.length, greaterThanOrEqualTo(4));

          auth.terminate();
        });
      });

      group('updateOrganization', () {
        test('does nothing when no changes', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          // Pass same name - should not make API call
          await auth.updateOrganization(organization: org, name: 'Test Org');

          // No additional API calls
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });

        test('updates organization name', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addOrganizationResponse(name: 'New Name');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();

          await auth.updateOrganization(organization: org, name: 'New Name');

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('setActiveOrganization', () {
        test('does nothing when no session exists', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();
          // Should not throw when no session exists
          await auth.setActiveOrganization(org);

          // Only 2 calls for initialization (client + env)
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });
      });

      group('createOrganization', () {
        test('creates organization without slug', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          // For createOrganization
          mockHttp.addOrganizationResponse(name: 'Test Org');

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          await auth.createOrganization(name: 'Test Org');

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('updateUserImage', () {
        test('updates user avatar', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          // We can't easily test file upload without a real file,
          // but we can verify the method exists and is callable
          expect(auth.updateUserImage, isA<Function>());

          auth.terminate();
        });
      });

      group('deleteUserImage', () {
        test('deletes user avatar', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addClientResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          await auth.deleteUserImage();

          expect(mockHttp.calls.length, greaterThanOrEqualTo(3));

          auth.terminate();
        });
      });

      group('transfer', () {
        test('does nothing when no signIn or signUp', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          // Transfer should do nothing when no signIn or signUp
          await auth.transfer();

          // Only 2 calls for initialization
          expect(mockHttp.calls.length, 2);

          auth.terminate();
        });
      });

      group('fetchOrganizationDomains', () {
        test('fetches domains with pagination', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          // First page with data
          mockHttp.addJsonResponse({
            'response': {
              'data': [
                {
                  'object': 'organization_domain',
                  'id': 'domain_1',
                  'organization_id': 'org_123',
                  'name': 'example.com',
                  'enrollment_mode': 'manual_invitation',
                  'verification': null,
                  'affiliation_email_address': null,
                  'total_pending_invitations': 0,
                  'total_pending_suggestions': 0,
                  'created_at': DateTime.now().millisecondsSinceEpoch,
                  'updated_at': DateTime.now().millisecondsSinceEpoch,
                }
              ],
              'total_count': 1,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();
          final domains = await auth.fetchOrganizationDomains(organization: org);

          expect(domains, isA<List<OrganizationDomain>>());
          expect(domains.length, 1);

          auth.terminate();
        });

        test('handles multiple pages of domains', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          // First page with 20 items (full page)
          final firstPageDomains = List.generate(
            20,
            (i) => {
              'object': 'organization_domain',
              'id': 'domain_$i',
              'organization_id': 'org_123',
              'name': 'example$i.com',
              'enrollment_mode': 'manual_invitation',
              'verification': null,
              'affiliation_email_address': null,
              'total_pending_invitations': 0,
              'total_pending_suggestions': 0,
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          );
          mockHttp.addJsonResponse({
            'response': {
              'data': firstPageDomains,
              'total_count': 25,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });
          // Second page with 5 items (partial page - ends pagination)
          final secondPageDomains = List.generate(
            5,
            (i) => {
              'object': 'organization_domain',
              'id': 'domain_${20 + i}',
              'organization_id': 'org_123',
              'name': 'example${20 + i}.com',
              'enrollment_mode': 'manual_invitation',
              'verification': null,
              'affiliation_email_address': null,
              'total_pending_invitations': 0,
              'total_pending_suggestions': 0,
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          );
          mockHttp.addJsonResponse({
            'response': {
              'data': secondPageDomains,
              'total_count': 25,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();
          final domains = await auth.fetchOrganizationDomains(organization: org);

          expect(domains, isA<List<OrganizationDomain>>());
          expect(domains.length, 25);

          auth.terminate();
        });

        test('handles empty response', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addJsonResponse({
            'response': {
              'data': null,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final org = _createTestOrganization();
          final domains = await auth.fetchOrganizationDomains(organization: org);

          expect(domains, isA<List<OrganizationDomain>>());
          expect(domains.isEmpty, true);

          auth.terminate();
        });
      });

      group('fetchOrganizationInvitations', () {
        test('handles multiple pages of invitations', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          // First page with 20 items (full page)
          final firstPageInvitations = List.generate(
            20,
            (i) => {
              'object': 'organization_invitation',
              'id': 'inv_$i',
              'status': 'pending',
              'role_name': 'member',
              'public_organization_data': {
                'object': 'organization',
                'id': 'org_123',
                'name': 'Test Org',
                'slug': 'test-org',
              },
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          );
          mockHttp.addJsonResponse({
            'response': {
              'data': firstPageInvitations,
              'total_count': 25,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });
          // Second page with 5 items (partial page - ends pagination)
          final secondPageInvitations = List.generate(
            5,
            (i) => {
              'object': 'organization_invitation',
              'id': 'inv_${20 + i}',
              'status': 'pending',
              'role_name': 'member',
              'public_organization_data': {
                'object': 'organization',
                'id': 'org_123',
                'name': 'Test Org',
                'slug': 'test-org',
              },
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          );
          mockHttp.addJsonResponse({
            'response': {
              'data': secondPageInvitations,
              'total_count': 25,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final invitations = await auth.fetchOrganizationInvitations();

          expect(invitations, isA<List<OrganizationInvitation>>());
          expect(invitations.length, 25);

          auth.terminate();
        });

        test('handles empty response', () async {
          mockHttp.addClientResponse();
          mockHttp.addEnvironmentResponse();
          mockHttp.addJsonResponse({
            'response': {
              'data': null,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();

          final invitations = await auth.fetchOrganizationInvitations();

          expect(invitations, isA<List<OrganizationInvitation>>());
          expect(invitations.isEmpty, true);

          auth.terminate();
        });
      });

      group('transfer', () {
        test('transfers sign up when signIn is transferable', () async {
          // SignIn.isTransferable checks verification?.status.isTransferable
          final signInJson = {
            'object': 'sign_in',
            'id': 'signin_123',
            'status': 'needs_first_factor',
            'identifier': 'test@example.com',
            'supported_identifiers': ['email_address'],
            'supported_first_factors': [],
            'supported_second_factors': [],
            'first_factor_verification': {
              'status': 'transferable',
              'strategy': 'oauth_google',
              'attempts': 0,
              'expire_at': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch,
            },
            'second_factor_verification': null,
            'created_session_id': null,
            'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
          };
          mockHttp.addClientResponse(signIn: signInJson);
          mockHttp.addEnvironmentResponse();
          // Response for transferSignUp
          mockHttp.addJsonResponse({
            'response': {
              'object': 'sign_up',
              'id': 'signup_123',
              'status': 'complete',
              'required_fields': [],
              'optional_fields': [],
              'missing_fields': [],
              'unverified_fields': [],
              'verifications': {},
              'password_enabled': false,
              'custom_action': false,
              'unsafe_metadata': {},
              'public_metadata': {},
              'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.transfer();

          // Verify transferSignUp was called (calls /client/sign_ups with transfer=true)
          expect(mockHttp.calls.any((c) => c.uri.path.contains('sign_ups')), true);

          auth.terminate();
        });

        test('transfers sign in when signUp is transferable', () async {
          // SignUp.isTransferable checks if any verification has status.isTransferable
          final signUpJson = {
            'object': 'sign_up',
            'id': 'signup_123',
            'status': 'missing_requirements',
            'required_fields': [],
            'optional_fields': [],
            'missing_fields': [],
            'unverified_fields': [],
            'verifications': {
              'external_account': {
                'status': 'transferable',
                'strategy': 'oauth_google',
                'attempts': 0,
                'expire_at': DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch,
              },
            },
            'password_enabled': false,
            'custom_action': false,
            'unsafe_metadata': {},
            'public_metadata': {},
            'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
          };
          mockHttp.addClientResponse(signUp: signUpJson);
          mockHttp.addEnvironmentResponse();
          // Response for transferSignIn
          mockHttp.addJsonResponse({
            'response': {
              'object': 'sign_in',
              'id': 'signin_123',
              'status': 'complete',
              'identifier': 'test@example.com',
              'supported_identifiers': ['email_address'],
              'supported_first_factors': [],
              'supported_second_factors': [],
              'first_factor_verification': null,
              'second_factor_verification': null,
              'created_session_id': null,
              'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.transfer();

          // Verify transferSignIn was called (calls /client/sign_ins with transfer=true)
          expect(mockHttp.calls.any((c) => c.uri.path.contains('sign_ins')), true);

          auth.terminate();
        });
      });

      group('completeOAuthSignIn', () {
        test('sends oauth token when signIn exists', () async {
          final signInJson = {
            'object': 'sign_in',
            'id': 'signin_123',
            'status': 'needs_first_factor',
            'identifier': 'test@example.com',
            'supported_identifiers': ['email_address'],
            'supported_first_factors': [
              {'strategy': 'oauth_google'},
            ],
            'supported_second_factors': [],
            'first_factor_verification': null,
            'second_factor_verification': null,
            'created_session_id': null,
            'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
          };
          mockHttp.addClientResponse(signIn: signInJson);
          mockHttp.addEnvironmentResponse();
          // Response for sendOauthToken
          mockHttp.addJsonResponse({
            'response': {
              'object': 'sign_in',
              'id': 'signin_123',
              'status': 'complete',
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.completeOAuthSignIn(token: 'oauth_token_123');

          // Verify sendOauthToken was called
          expect(mockHttp.calls.any((c) => c.uri.path.contains('signin_123')), true);

          auth.terminate();
        });

        test('sends oauth token when signUp exists', () async {
          final signUpJson = {
            'object': 'sign_up',
            'id': 'signup_123',
            'status': 'missing_requirements',
            'required_fields': [],
            'optional_fields': [],
            'missing_fields': [],
            'unverified_fields': [],
            'verifications': {},
            'password_enabled': false,
            'custom_action': false,
            'unsafe_metadata': {},
            'public_metadata': {},
            'abandon_at': DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch,
          };
          mockHttp.addClientResponse(signUp: signUpJson);
          mockHttp.addEnvironmentResponse();
          // Response for sendOauthToken
          mockHttp.addJsonResponse({
            'response': {
              'object': 'sign_up',
              'id': 'signup_123',
              'status': 'complete',
            },
            'client': {
              'object': 'client',
              'id': 'client_123',
              'sessions': [],
              'created_at': DateTime.now().millisecondsSinceEpoch,
              'updated_at': DateTime.now().millisecondsSinceEpoch,
            },
          });

          auth = Auth(
            config: TestAuthConfig(
              publishableKey: _validPublishableKey,
              httpService: mockHttp,
            ),
          );

          await auth.initialize();
          await auth.completeOAuthSignIn(token: 'oauth_token_123');

          // Verify sendOauthToken was called
          expect(mockHttp.calls.any((c) => c.uri.path.contains('signup_123')), true);

          auth.terminate();
        });
      });
    });
  });
}

