//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

/// tests for M2MTokensApi
void main() {
  // final instance = M2MTokensApi();

  group('tests for M2MTokensApi', () {
    // Create a M2M Token
    //
    // Creates a new M2M Token. Must be authenticated via a Machine Secret Key.
    //
    //Future<CreateM2MToken201Response> createM2MToken(CreateM2MTokenRequest createM2MTokenRequest) async
    test('test createM2MToken', () async {
      // TODO
    });

    // Get M2M Tokens
    //
    // Fetches M2M tokens for a specific machine.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When fetching M2M tokens with a Machine Secret Key, only tokens associated with the authenticated machine can be retrieved. - When fetching M2M tokens with a Clerk Secret Key, tokens for any machine in the instance can be retrieved.
    //
    //Future<GetM2MTokens200Response> getM2MTokens(String subject, { bool revoked, bool expired, num limit, num offset }) async
    test('test getM2MTokens', () async {
      // TODO
    });

    // Revoke a M2M Token
    //
    // Revokes a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When revoking a M2M Token with a Machine Secret Key, the token must managed by the Machine associated with the Machine Secret Key. - When revoking a M2M Token with a Clerk Secret Key, any token on the Instance can be revoked.
    //
    //Future<GetM2MTokens200ResponseM2mTokensInner> revokeM2MToken(String m2mTokenId, RevokeApiKeyRequest revokeApiKeyRequest) async
    test('test revokeM2MToken', () async {
      // TODO
    });

    // Verify a M2M Token
    //
    // Verifies a M2M Token.  This endpoint can be authenticated by either a Machine Secret Key or by a Clerk Secret Key.  - When verifying a M2M Token with a Machine Secret Key, the token must be granted access to the Machine associated with the Machine Secret Key. - When verifying a M2M Token with a Clerk Secret Key, any token on the Instance can be verified.
    //
    //Future<GetM2MTokens200ResponseM2mTokensInner> verifyM2MToken(VerifyM2MTokenRequest verifyM2MTokenRequest) async
    test('test verifyM2MToken', () async {
      // TODO
    });
  });
}
