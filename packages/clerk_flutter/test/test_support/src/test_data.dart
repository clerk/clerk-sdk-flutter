import 'package:clerk_auth/clerk_auth.dart';

/// Creates a test Verification with sensible defaults
Verification createTestVerification({
  Status status = Status.verified,
  Strategy strategy = Strategy.emailCode,
  int? attempts = 0,
  DateTime? expireAt,
}) {
  return Verification(
    status: status,
    strategy: strategy,
    attempts: attempts,
    expireAt: expireAt ?? DateTime.now().add(const Duration(days: 1)),
  );
}

/// Creates a test Email with sensible defaults
Email createTestEmail({
  String id = 'email_123',
  String emailAddress = 'john.doe@example.com',
  Verification? verification,
  bool reserved = false,
  DateTime? updatedAt,
  DateTime? createdAt,
}) {
  return Email(
    id: id,
    emailAddress: emailAddress,
    verification: verification ?? createTestVerification(),
    reserved: reserved,
    updatedAt: updatedAt ?? DateTime.now(),
    createdAt: createdAt ?? DateTime.now(),
  );
}

/// Creates a test User with sensible defaults
User createTestUser({
  String id = 'user_test_123',
  String? firstName = 'John',
  String? lastName = 'Doe',
  String? username = 'johndoe',
  String? imageUrl,
  bool? hasImage = false,
  String? primaryEmailAddressId = 'email_123',
  List<Email>? emailAddresses,
}) {
  return User(
    id: id,
    externalId: null,
    username: username,
    firstName: firstName,
    lastName: lastName,
    profileImageUrl: null,
    imageUrl: imageUrl,
    hasImage: hasImage,
    primaryEmailAddressId: primaryEmailAddressId,
    primaryPhoneNumberId: null,
    primaryWeb3WalletId: null,
    publicMetadata: const {},
    privateMetadata: const {},
    unsafeMetadata: const {},
    emailAddresses: emailAddresses ?? [createTestEmail()],
    phoneNumbers: const [],
    web3Wallets: const [],
    passkeys: const [],
    organizationMemberships: const [],
    createOrganizationEnabled: false,
    externalAccounts: const [],
    passwordEnabled: true,
    twoFactorEnabled: false,
    totpEnabled: false,
    backupCodeEnabled: false,
    lastSignInAt: DateTime.now(),
    banned: false,
    locked: false,
    lockoutExpiresInSeconds: null,
    verificationAttemptsRemaining: null,
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    lastActiveAt: DateTime.now(),
    deleteSelfEnabled: true,
  );
}

/// Creates a test Session with sensible defaults
Session createTestSession({
  String id = 'sess_test_123',
  Status status = Status.active,
  User? user,
  String? lastActiveOrganizationId,
}) {
  final testUser = user ?? createTestUser();
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

/// Creates a test Client with sensible defaults
Client createTestClient({
  String? id = 'client_test_123',
  List<Session>? sessions,
  String? lastActiveSessionId,
  SignIn? signIn,
  SignUp? signUp,
}) {
  final testSessions = sessions ?? [];
  return Client(
    id: id,
    sessions: testSessions,
    lastActiveSessionId:
        lastActiveSessionId ?? (testSessions.isNotEmpty ? testSessions.first.id : null),
    signIn: signIn,
    signUp: signUp,
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
  );
}

/// Creates a test Client with a signed-in user
Client createSignedInClient({
  User? user,
  String sessionId = 'sess_test_123',
}) {
  final testUser = user ?? createTestUser();
  final session = createTestSession(id: sessionId, user: testUser);
  return createTestClient(
    sessions: [session],
    lastActiveSessionId: sessionId,
  );
}

/// Creates an empty test Client (signed out state)
Client createSignedOutClient() {
  return createTestClient(sessions: []);
}

