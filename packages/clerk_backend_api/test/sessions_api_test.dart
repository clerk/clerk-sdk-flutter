//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

/// tests for SessionsApi
void main() {
  // final instance = SessionsApi();

  group('tests for SessionsApi', () {
    // Create a new active session
    //
    // Create a new active session for the provided user ID.  **This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend, we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.
    //
    //Future<Session> createSession({ CreateSessionRequest createSessionRequest }) async
    test('test createSession', () async {
      // TODO
    });

    // Create a session token
    //
    // Creates a session JSON Web Token (JWT) based on a session.
    //
    //Future<CreateSessionToken200Response> createSessionToken(String sessionId, { CreateSessionTokenRequest createSessionTokenRequest }) async
    test('test createSessionToken', () async {
      // TODO
    });

    // Create a session token from a jwt template
    //
    // Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance
    //
    //Future<CreateSessionToken200Response> createSessionTokenFromTemplate(String sessionId, String templateName, { CreateSessionTokenFromTemplateRequest createSessionTokenFromTemplateRequest }) async
    test('test createSessionTokenFromTemplate', () async {
      // TODO
    });

    // Retrieve a session
    //
    // Retrieve the details of a session
    //
    //Future<Session> getSession(String sessionId) async
    test('test getSession', () async {
      // TODO
    });

    // List all sessions
    //
    // Returns a list of all sessions. The sessions are returned sorted by creation date, with the newest sessions appearing first. **Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however moving forward at least one of `client_id` or `user_id` parameters should be provided.
    //
    //Future<List<Session>> getSessionList({ String clientId, String userId, String status, bool paginated, int limit, int offset }) async
    test('test getSessionList', () async {
      // TODO
    });

    // Revoke a session
    //
    // Sets the status of a session as \"revoked\", which is an unauthenticated state. In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.
    //
    //Future<Session> revokeSession(String sessionId) async
    test('test revokeSession', () async {
      // TODO
    });

    // Verify a session
    //
    // Returns the session if it is authenticated, otherwise returns an error. WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,          which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).          For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).
    //
    //Future<Session> verifySession(String sessionId, { VerifySessionRequest verifySessionRequest }) async
    test('test verifySession', () async {
      // TODO
    });
  });
}
