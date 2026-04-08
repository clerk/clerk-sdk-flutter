# Clerk Auth API Documentation

This document provides comprehensive documentation for all public methods in the `Auth` class from `clerk_auth/lib/src/clerk_auth/auth.dart`.

## Overview

The `Auth` class is the core of the Clerk authentication system for Dart/Flutter applications. It provides a high-level API for managing user authentication, sessions, and user data.

### Key Concepts

**Re-entrant Methods**: The `attemptSignIn()` and `attemptSignUp()` methods are designed to be **re-entrant**, meaning they can be called multiple times with different parameters as the user progresses through the authentication flow. This design allows for flexible, step-by-step authentication processes.

**State Management**: The Auth class maintains the current authentication state through the `Client` object, which contains:
- `SignIn` object (during sign-in flow)
- `SignUp` object (during sign-up flow)
- `User` object (when signed in)
- `Session` objects (active sessions)

**Transfer Flow**: When using OAuth or ID token authentication, users may need to "transfer" between sign-in and sign-up flows if they don't exist yet (or already exist). Use the `transfer()` method to handle this seamlessly.

## Table of Contents

- [Initialization & Lifecycle](#initialization--lifecycle)
- [Authentication State](#authentication-state)
- [Sign In Methods](#sign-in-methods)
- [Sign Up Methods](#sign-up-methods)
- [OAuth Methods](#oauth-methods)
- [Passkey Methods](#passkey-methods)
- [Session Management](#session-management)
- [User Management](#user-management)
- [Organization Management](#organization-management)
- [Password Management](#password-management)
- [Advanced Methods](#advanced-methods)

---

## Initialization & Lifecycle

### `initialize()`

Initializes the Auth object. **Must be called before any other Auth methods.**

```dart
Future<void> initialize()
```

**Example:**
```dart
final auth = Auth(config: AuthConfig(
  publishableKey: 'pk_test_...',
  persistor: Persistor.none,
));
await auth.initialize();
```

**Behavior:**
- Loads persisted client and environment data
- Sets up periodic client refresh (if configured)
- Starts session token polling (if enabled)
- Retries fetching client/environment if initial fetch fails

---

### `terminate()`

Disposes of the Auth object and cleans up resources.

```dart
void terminate()
```

**Example:**
```dart
auth.terminate();
```

**Behavior:**
- Cancels all timers (polling, refresh, etc.)
- Closes stream controllers
- Terminates telemetry and API connections

---

## Authentication State

### `isSignedIn`

Returns whether a user is currently signed in.

```dart
bool get isSignedIn
```

**Example:**
```dart
if (auth.isSignedIn) {
  print('User: ${auth.user?.fullName}');
}
```

---

### `isSigningIn`

Returns whether a sign-in flow is currently in progress.

```dart
bool get isSigningIn
```

---

### `isSigningUp`

Returns whether a sign-up flow is currently in progress.

```dart
bool get isSigningUp
```

---

### `client`

The current Client object containing authentication state.

```dart
Client get client
```

**Example:**
```dart
final client = auth.client;
print('Active sessions: ${client.sessions.length}');
```

---

### `user`

The currently signed-in User, or null if not signed in.

```dart
User? get user
```

---

### `session`

The current active Session, or null.

```dart
Session? get session
```

---

### `signIn`

The current SignIn object, or null.

```dart
SignIn? get signIn
```

---

### `signUp`

The current SignUp object, or null.

```dart
SignUp? get signUp
```

---

### `organization`

The current active Organization, or null.

```dart
Organization? get organization
```

---

### `env`

The Environment object containing Clerk account configuration.

```dart
Environment get env
```

---

### `isNotAvailable`

Returns whether the Auth object is not yet initialized.

```dart
bool get isNotAvailable
```

**Example:**
```dart
if (auth.isNotAvailable) {
  print('Auth is still initializing...');
}
```

---

### `handleError()`

Handles ClerkError exceptions when they occur. Override this method to customize error handling.

```dart
void handleError(Object error)
```

**Default Behavior:**
- Throws the error

**Example (Custom Error Handling):**
```dart
class MyAuth extends Auth {
  MyAuth({required super.config});

  @override
  void handleError(Object error) {
    if (error is ClerkError) {
      // Log error instead of throwing
      print('Clerk error: ${error.message}');
      // Show user-friendly message
      showErrorToUser(error.message);
    } else {
      // Re-throw non-Clerk errors
      super.handleError(error);
    }
  }
}
```

---

### `update()`

A method to be overridden by extension classes to handle state updates. Called automatically after most Auth operations.

```dart
void update()
```

**Example:**
```dart
class MyAuth extends Auth with ChangeNotifier {
  MyAuth({required super.config});

  @override
  void update() {
    super.update();
    notifyListeners(); // Notify UI of changes
  }
}
```

---

## Sign In Methods

### `attemptSignIn()`

**Re-entrant method** for progressively signing in a user. Can be called multiple times with updated parameters until sign-in is complete.

```dart
Future<void> attemptSignIn({
  required Strategy strategy,
  String? identifier,
  String? password,
  String? code,
  String? token,
  String? redirectUrl,
  String? passkeyCredential,
})
```

**Parameters:**
- `strategy`: The authentication strategy (e.g., `Strategy.emailCode`, `Strategy.password`)
- `identifier`: Email, phone, or username
- `password`: User's password (for password-based auth)
- `code`: Verification code (for code-based strategies)
- `token`: OAuth or ID token
- `redirectUrl`: Redirect URL for email link strategy
- `passkeyCredential`: Passkey credential JSON string

**Example 1: Email + Password Sign In**
```dart
// Initial call with identifier and password
await auth.attemptSignIn(
  strategy: Strategy.password,
  identifier: 'user@example.com',
  password: 'SecurePass123!',
);

// If 2FA is required, call again with the code
if (auth.signIn?.needsSecondFactor == true) {
  await auth.attemptSignIn(
    strategy: Strategy.emailCode,
    code: '123456',
  );
}
```

**Example 2: Email Code Sign In (Re-entrant)**
```dart
// Step 1: Start sign-in with email
await auth.attemptSignIn(
  strategy: Strategy.emailCode,
  identifier: 'user@example.com',
);

// Step 2: User receives code, submit it
await auth.attemptSignIn(
  strategy: Strategy.emailCode,
  code: '123456',
);
```

**Example 3: Password Reset**
```dart
// Step 1: Initiate password reset
await auth.initiatePasswordReset(
  identifier: 'user@example.com',
  strategy: Strategy.resetPasswordEmailCode,
);

// Step 2: Submit code and new password
await auth.attemptSignIn(
  strategy: Strategy.resetPasswordEmailCode,
  code: '123456',
  password: 'NewSecurePass123!',
);
```

**Example 4: Passkey Sign In**
```dart
// Step 1: Prepare passkey sign-in
await auth.attemptSignIn(strategy: Strategy.passkey);

// Step 2: Get passkey credential from authenticator
final nonce = auth.signIn?.firstFactorVerification?.nonce;
// ... use passkey library to get credential ...

// Step 3: Complete sign-in with credential
await auth.attemptSignIn(
  strategy: Strategy.passkey,
  passkeyCredential: credentialJson,
);
```

**Re-entrant Behavior:**
- The method intelligently handles the current state of the sign-in flow
- Can be called multiple times as the user progresses through authentication steps
- Automatically creates a SignIn object if one doesn't exist
- Handles preparation and attempt phases based on the strategy and current state

---

### `initiatePasswordReset()`

Initiates a password reset flow.

```dart
Future<void> initiatePasswordReset({
  required String identifier,
  required Strategy strategy,
})
```

**Example:**
```dart
await auth.initiatePasswordReset(
  identifier: 'user@example.com',
  strategy: Strategy.resetPasswordEmailCode,
);
```

---

### `idTokenSignIn()`

Sign in with an ID token from a provider (e.g., Apple, Google).

```dart
Future<void> idTokenSignIn({
  required IdTokenProvider provider,
  required String idToken,
})
```

**Example:**
```dart
// Apple Sign In
await auth.idTokenSignIn(
  provider: IdTokenProvider.apple,
  idToken: credential.identityToken!,
);

// Check if transfer needed (user doesn't exist)
if (auth.signIn?.isTransferable == true) {
  await auth.transfer(); // Switch to sign-up flow
}
```

**Transfer Flow:**
If the user doesn't exist, the verification status will be `transferable`. Call `transfer()` to switch to the sign-up flow.

---

## Sign Up Methods

### `attemptSignUp()`

**Re-entrant method** for progressively signing up a new user. Can be called multiple times with updated parameters until sign-up is complete.

```dart
Future<Client> attemptSignUp({
  required Strategy strategy,
  String? firstName,
  String? lastName,
  String? username,
  String? emailAddress,
  String? phoneNumber,
  String? password,
  String? passwordConfirmation,
  String? code,
  String? token,
  String? signature,
  String? redirectUrl,
  Map<String, dynamic>? metadata,
  bool? legalAccepted,
})
```

**Parameters:**
- `strategy`: The authentication strategy
- `firstName`, `lastName`, `username`: User profile information
- `emailAddress`, `phoneNumber`: Contact identifiers
- `password`, `passwordConfirmation`: Password (must match)
- `code`: Verification code
- `token`: OAuth or ID token
- `signature`: Email link signature
- `redirectUrl`: Redirect URL for email link strategy
- `metadata`: Custom metadata to attach to the user
- `legalAccepted`: Legal consent acceptance (required if enabled in settings)

**Example 1: Email + Password Sign Up (Re-entrant)**
```dart
// Step 1: Create sign-up with initial data
await auth.attemptSignUp(
  strategy: Strategy.emailCode,
  emailAddress: 'newuser@example.com',
  password: 'SecurePass123!',
  passwordConfirmation: 'SecurePass123!',
  firstName: 'John',
  lastName: 'Doe',
);

// Step 2: Verify email with code
await auth.attemptSignUp(
  strategy: Strategy.emailCode,
  code: '123456',
);
```

**Example 2: Phone Number Sign Up**
```dart
// Step 1: Create sign-up
await auth.attemptSignUp(
  strategy: Strategy.phoneCode,
  phoneNumber: '+1234567890',
  firstName: 'Jane',
  lastName: 'Smith',
);

// Step 2: Verify phone
await auth.attemptSignUp(
  strategy: Strategy.phoneCode,
  code: '123456',
);
```

**Example 3: Sign Up with Metadata**
```dart
await auth.attemptSignUp(
  strategy: Strategy.emailCode,
  emailAddress: 'user@example.com',
  password: 'SecurePass123!',
  passwordConfirmation: 'SecurePass123!',
  metadata: {
    'referralCode': 'ABC123',
    'source': 'mobile_app',
  },
);
```

**Example 4: Sign Up with Legal Consent**
```dart
await auth.attemptSignUp(
  strategy: Strategy.emailCode,
  emailAddress: 'user@example.com',
  password: 'SecurePass123!',
  passwordConfirmation: 'SecurePass123!',
  legalAccepted: true, // Required if legal consent is enabled
);
```

**Re-entrant Behavior:**
- Can be called multiple times to update sign-up data
- Automatically handles verification preparation and attempts
- Updates existing SignUp object if one exists
- Creates new SignUp object on first call
- Validates password confirmation matches password

**Throws:**
- `ClerkError` with code `passwordMatchError` if passwords don't match
- `ClerkError` with code `legalAcceptanceRequired` if legal consent is required but not provided

---

### `idTokenSignUp()`

Sign up with an ID token from a provider (e.g., Apple, Google).

```dart
Future<void> idTokenSignUp({
  required IdTokenProvider provider,
  required String idToken,
  String? firstName,
  String? lastName,
})
```

**Example:**
```dart
// Apple Sign Up
await auth.idTokenSignUp(
  provider: IdTokenProvider.apple,
  idToken: credential.identityToken!,
  firstName: credential.givenName,
  lastName: credential.familyName,
);

// Check if transfer needed (user already exists)
if (auth.signUp?.isTransferable == true) {
  await auth.transfer(); // Switch to sign-in flow
}
```

**Transfer Flow:**
If the user already exists, the verification status will be `transferable`. Call `transfer()` to switch to the sign-in flow.

---

### `resendCode()`

Resends a verification code for the given strategy.

```dart
Future<ApiResponse> resendCode(Strategy strategy)
```

**Example:**
```dart
// During sign-up or sign-in
await auth.resendCode(Strategy.emailCode);
```

**Throws:**
- `ClerkError` with code `noInitialCodeHasBeenSetUpToResend` if no code flow is active

---

## OAuth Methods

### `oauthSignIn()`

Prepares for sign-in via an OAuth provider.

```dart
Future<void> oauthSignIn({
  required Strategy strategy,
  required Uri? redirect,
})
```

**Example:**
```dart
await auth.oauthSignIn(
  strategy: Strategy.oauthGoogle,
  redirect: Uri.parse('myapp://oauth-callback'),
);

// The user will be redirected to the OAuth provider
// After authentication, complete the flow with completeOAuthSignIn()
```

---

### `completeOAuthSignIn()`

Completes OAuth sign-in by presenting the token.

```dart
Future<void> completeOAuthSignIn({
  required String token,
})
```

**Example:**
```dart
// After OAuth redirect
await auth.completeOAuthSignIn(token: rotatingTokenNonce);
```

---

### `oauthConnect()`

Connects an external account via an OAuth provider to the current user.

```dart
Future<void> oauthConnect({
  required Strategy strategy,
  required Uri? redirect,
})
```

**Example:**
```dart
// Connect Google account to existing user
await auth.oauthConnect(
  strategy: Strategy.oauthGoogle,
  redirect: Uri.parse('myapp://oauth-callback'),
);
```

---

### `deleteExternalAccount()`

Deletes an external account connection.

```dart
Future<void> deleteExternalAccount({
  required ExternalAccount account,
})
```

**Example:**
```dart
final googleAccount = auth.user?.externalAccounts
    ?.firstWhere((acc) => acc.provider == 'google');
if (googleAccount != null) {
  await auth.deleteExternalAccount(account: googleAccount);
}
```

---

## Passkey Methods

### `createPasskey()`

Creates an unverified passkey for the current user.

```dart
Future<Passkey?> createPasskey()
```

**Example:**
```dart
final passkey = await auth.createPasskey();
if (passkey?.verification?.nonce case VerificationNonce nonce) {
  // Use passkey library to register
  final authenticator = PasskeyAuthenticator();
  final challenge = RegisterRequestType(
    challenge: nonce.challenge,
    relyingParty: nonce.relyingParty.toRelyingPartyType(),
    user: nonce.user!.toUserType(),
    excludeCredentials: const [],
    timeout: nonce.timeout,
  );
  final credential = await authenticator.register(challenge);

  // Verify the passkey
  await auth.attemptPasskeyVerification(passkey!, credential.toJsonString());
}
```

---

### `attemptPasskeyVerification()`

Verifies a passkey with the provided credential.

```dart
Future<void> attemptPasskeyVerification(
  Passkey passkey,
  String credential,
)
```

**Example:**
```dart
await auth.attemptPasskeyVerification(passkey, credentialJson);
```

---

## Session Management

### `sessionToken()`

Gets the current session token for an organization.

```dart
Future<SessionToken> sessionToken({
  Organization? organization,
  String? templateName,
})
```

**Example:**
```dart
// Get default session token
final token = await auth.sessionToken();
print('JWT: ${token.jwt}');

// Get token for specific organization
final orgToken = await auth.sessionToken(
  organization: myOrganization,
);

// Get token with custom template
final customToken = await auth.sessionToken(
  templateName: 'my_custom_template',
);
```

**Throws:**
- `ClerkError` with code `noSessionTokenRetrieved` if token cannot be retrieved

---

### `sessionTokenStream`

Stream of SessionTokens as they renew.

```dart
Stream<SessionToken> get sessionTokenStream
```

**Example:**
```dart
auth.sessionTokenStream.listen((token) {
  print('New token: ${token.jwt}');
  // Update your API client with new token
});
```

---

### `activate()`

Activates the given session.

```dart
Future<void> activate(Session session)
```

**Example:**
```dart
final sessions = auth.client.sessions;
if (sessions.length > 1) {
  await auth.activate(sessions[1]); // Switch to another session
}
```

---

### `signOut()`

Signs out of all sessions and deletes the current client.

```dart
Future<void> signOut()
```

**Example:**
```dart
await auth.signOut();
```

---

### `signOutOf()`

Signs out of a specific session.

```dart
Future<void> signOutOf(Session session)
```

**Example:**
```dart
await auth.signOutOf(auth.session!);
```

---

### `transfer()`

Transfers an OAuth authentication into a User (handles sign-in/sign-up transfer flow).

```dart
Future<void> transfer()
```

**Example:**
```dart
// After OAuth or ID token authentication
if (auth.signIn?.isTransferable == true) {
  await auth.transfer(); // Switch to sign-up
} else if (auth.signUp?.isTransferable == true) {
  await auth.transfer(); // Switch to sign-in
}
```

---

## User Management

### `updateUser()`

Updates the current user's profile information.

```dart
Future<void> updateUser({
  String? username,
  String? firstName,
  String? lastName,
  String? primaryEmailAddressId,
  String? primaryPhoneNumberId,
  String? primaryWeb3WalletId,
  Map<String, dynamic>? metadata,
  File? avatar,
})
```

**Example:**
```dart
await auth.updateUser(
  firstName: 'John',
  lastName: 'Doe',
  username: 'johndoe',
  metadata: {'theme': 'dark'},
);
```

---

### `deleteUser()`

Deletes the current user.

```dart
Future<void> deleteUser()
```

**Example:**
```dart
if (auth.env.user.actions.deleteSelf) {
  await auth.deleteUser();
}
```

**Throws:**
- `ClerkError` with code `cannotDeleteSelf` if user is not authorized to delete themselves

---

### `updateUserImage()`

Updates the user's avatar.

```dart
Future<void> updateUserImage(File file)
```

**Example:**
```dart
final imageFile = File('/path/to/avatar.jpg');
await auth.updateUserImage(imageFile);
```

---

### `deleteUserImage()`

Deletes the user's avatar.

```dart
Future<void> deleteUserImage()
```

**Example:**
```dart
await auth.deleteUserImage();
```

---

### `addIdentifyingData()`

Adds an email, phone number, or other identifier to the current user.

```dart
Future<void> addIdentifyingData(
  String identifier,
  IdentifierType type,
)
```

**Example:**
```dart
// Add email address
await auth.addIdentifyingData(
  'newemail@example.com',
  IdentifierType.emailAddress,
);

// Add phone number
await auth.addIdentifyingData(
  '+1234567890',
  IdentifierType.phoneNumber,
);
```

---

### `verifyIdentifyingData()`

Verifies user identifying data with a code.

```dart
Future<void> verifyIdentifyingData(
  UserIdentifyingData uid,
  String code,
)
```

**Example:**
```dart
final email = auth.user?.emailAddresses
    ?.firstWhere((e) => e.emailAddress == 'newemail@example.com');
if (email != null) {
  await auth.verifyIdentifyingData(email, '123456');
}
```

---

### `deleteIdentifyingData()`

Deletes user identifying data.

```dart
Future<void> deleteIdentifyingData(
  UserIdentifyingData uid,
)
```

**Example:**
```dart
final email = auth.user?.emailAddresses?.first;
if (email != null) {
  await auth.deleteIdentifyingData(email);
}
```

---

## Password Management

### `updateUserPassword()`

Updates the current user's password.

```dart
Future<void> updateUserPassword(
  String currentPassword,
  String newPassword, {
  bool signOut = true,
})
```

**Example:**
```dart
await auth.updateUserPassword(
  'OldPassword123!',
  'NewPassword456!',
  signOut: false, // Keep user signed in
);
```

---

### `deleteUserPassword()`

Deletes the current user's password.

```dart
Future<void> deleteUserPassword(String currentPassword)
```

**Example:**
```dart
await auth.deleteUserPassword('CurrentPassword123!');
```

---

## Organization Management

### `createOrganization()`

Creates a new organization.

```dart
Future<void> createOrganization({
  required String name,
  String? slug,
  File? logo,
})
```

**Example:**
```dart
await auth.createOrganization(
  name: 'Acme Corp',
  slug: 'acme-corp',
  logo: File('/path/to/logo.png'),
);
```

---

### `updateOrganization()`

Updates an organization.

```dart
Future<void> updateOrganization({
  required Organization organization,
  String? name,
  File? logo,
})
```

**Example:**
```dart
await auth.updateOrganization(
  organization: auth.organization!,
  name: 'New Name',
  logo: File('/path/to/new-logo.png'),
);
```

---

### `setActiveOrganization()`

Makes an organization active.

```dart
Future<void> setActiveOrganization(Organization organization)
```

**Example:**
```dart
final orgs = auth.user?.organizationMemberships;
if (orgs != null && orgs.isNotEmpty) {
  await auth.setActiveOrganization(orgs.first.organization);
}
```

---

### `leaveOrganization()`

Leaves an organization.

```dart
Future<bool> leaveOrganization({
  required Organization organization,
  Session? session,
})
```

**Example:**
```dart
final success = await auth.leaveOrganization(
  organization: auth.organization!,
);
```

---

### `fetchOrganizationInvitations()`

Fetches all organization invitations for the user.

```dart
Future<List<OrganizationInvitation>> fetchOrganizationInvitations()
```

**Example:**
```dart
final invitations = await auth.fetchOrganizationInvitations();
for (final invitation in invitations) {
  print('Invited to: ${invitation.organizationName}');
}
```

---

### `acceptOrganizationInvitation()`

Accepts an organization invitation.

```dart
Future<ApiResponse> acceptOrganizationInvitation(
  OrganizationInvitation invitation,
)
```

**Example:**
```dart
final invitations = await auth.fetchOrganizationInvitations();
if (invitations.isNotEmpty) {
  await auth.acceptOrganizationInvitation(invitations.first);
}
```

---

### `fetchOrganizationDomains()`

Fetches all domains for an organization.

```dart
Future<List<OrganizationDomain>> fetchOrganizationDomains({
  required Organization organization,
})
```

**Example:**
```dart
final domains = await auth.fetchOrganizationDomains(
  organization: auth.organization!,
);
```

---

### `createDomain()`

Creates a new domain within an organization.

```dart
Future<void> createDomain({
  required Organization organization,
  required String name,
  required EnrollmentMode mode,
})
```

**Example:**
```dart
await auth.createDomain(
  organization: auth.organization!,
  name: 'example.com',
  mode: EnrollmentMode.automaticInvitation,
);
```

---

## Advanced Methods

### `refreshClient()`

Refreshes the current client from the server.

```dart
Future<void> refreshClient()
```

**Example:**
```dart
await auth.refreshClient();
```

---

### `resetClient()`

Resets the current client, clearing any SignUp or SignIn objects.

```dart
Future<void> resetClient()
```

**Example:**
```dart
await auth.resetClient();
```

---

### `refreshEnvironment()`

Refreshes the current environment from the server.

```dart
Future<void> refreshEnvironment()
```

**Example:**
```dart
await auth.refreshEnvironment();
```

---

### `fetchApiResponse()`

Low-level access to the Clerk API.

```dart
Future<ApiResponse> fetchApiResponse(
  String url, {
  HttpMethod method = HttpMethod.post,
  Map<String, String>? headers,
  Map<String, dynamic>? params,
  Map<String, dynamic>? nullableParams,
  bool withSession = false,
})
```

**Example:**
```dart
final response = await auth.fetchApiResponse(
  '/users/me/custom_endpoint',
  method: HttpMethod.get,
  withSession: true,
);
```

**Note:** This method will be deprecated in a future version. Use only for advanced use cases not covered by other methods.

---

## Error Handling

All methods may throw `ClerkError` exceptions. Use try-catch blocks or override the `handleError` method to handle errors.

**Example:**
```dart
try {
  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: 'user@example.com',
    password: 'wrong_password',
  );
} on ClerkError catch (error) {
  print('Error: ${error.message}');
  print('Code: ${error.code}');
}
```

**Custom Error Handling:**
```dart
class MyAuth extends Auth {
  MyAuth({required super.config});

  @override
  void handleError(Object error) {
    // Custom error handling
    if (error is ClerkError) {
      print('Clerk error: ${error.message}');
    }
    // Don't call super.handleError() to prevent throwing
  }
}
```

---

## Common Patterns

### Complete Sign-In Flow

```dart
// Email + Password with optional 2FA
Future<void> signInUser(String email, String password) async {
  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: email,
    password: password,
  );

  // Check if 2FA is required
  if (auth.signIn?.needsSecondFactor == true) {
    // Prompt user for 2FA code
    final code = await promptUserFor2FACode();
    await auth.attemptSignIn(
      strategy: Strategy.emailCode,
      code: code,
    );
  }

  // User is now signed in
  print('Welcome, ${auth.user?.fullName}!');
}
```

### Complete Sign-Up Flow

```dart
// Email + Password sign-up with verification
Future<void> signUpUser({
  required String email,
  required String password,
  required String firstName,
  required String lastName,
}) async {
  // Step 1: Create sign-up
  await auth.attemptSignUp(
    strategy: Strategy.emailCode,
    emailAddress: email,
    password: password,
    passwordConfirmation: password,
    firstName: firstName,
    lastName: lastName,
  );

  // Step 2: Verify email
  final code = await promptUserForEmailCode();
  await auth.attemptSignUp(
    strategy: Strategy.emailCode,
    code: code,
  );

  // User is now signed up and signed in
  print('Welcome, ${auth.user?.fullName}!');
}
```

### OAuth Sign-In with Transfer

```dart
// Apple Sign In with automatic transfer
Future<void> appleSignIn(String idToken, {String? firstName, String? lastName}) async {
  // Try sign-in first
  await auth.idTokenSignIn(
    provider: IdTokenProvider.apple,
    idToken: idToken,
  );

  // If user doesn't exist, transfer to sign-up
  if (auth.signIn?.isTransferable == true) {
    await auth.transfer();

    // Update with additional info if available
    if (firstName != null || lastName != null) {
      await auth.attemptSignUp(
        strategy: Strategy.oauthTokenApple,
        firstName: firstName,
        lastName: lastName,
      );
    }
  }

  print('Signed in: ${auth.user?.fullName}');
}
```

### Multi-Session Management

```dart
// Switch between multiple sessions
Future<void> switchSession(int sessionIndex) async {
  final sessions = auth.client.sessions;
  if (sessionIndex < sessions.length) {
    await auth.activate(sessions[sessionIndex]);
    print('Switched to: ${auth.user?.fullName}');
  }
}

// Sign out of specific session
Future<void> signOutSession(Session session) async {
  await auth.signOutOf(session);
  print('Signed out of session: ${session.id}');
}
```

---

## Best Practices

1. **Always initialize before use**: Call `initialize()` before any other Auth methods
2. **Handle errors gracefully**: Wrap Auth calls in try-catch blocks or override `handleError()`
3. **Use re-entrant methods correctly**: `attemptSignIn()` and `attemptSignUp()` are designed to be called multiple times
4. **Check transfer status**: After OAuth/ID token auth, check `isTransferable` and call `transfer()` if needed
5. **Clean up resources**: Call `terminate()` when disposing of the Auth object
6. **Monitor session tokens**: Use `sessionTokenStream` to keep your API client updated with fresh tokens
7. **Validate passwords**: Ensure password and passwordConfirmation match before calling `attemptSignUp()`
8. **Check environment settings**: Use `env` to check what features are enabled before attempting operations

---

## Related Documentation

- [Clerk Dashboard](https://dashboard.clerk.com/)
- [Clerk API Reference](https://clerk.com/docs/reference/backend-api)
- [Flutter SDK Guide](https://clerk.com/docs/quickstarts/flutter)

---

*Generated for clerk_auth version 0.0.14-beta*


