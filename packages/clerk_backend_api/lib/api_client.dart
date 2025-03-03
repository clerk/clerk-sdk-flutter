//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({
    this.basePath = 'https://api.clerk.com/v1',
    this.authentication,
  });

  final String basePath;
  final Authentication? authentication;

  var _client = http.Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [http.Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  http.Client get client => _client;

  /// Requests to use a new HTTP [http.Client] in this class.
  set client(http.Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<http.Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty
        ? '?${urlEncodedQueryParams.join('&')}'
        : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (body is http.MultipartFile &&
          (contentType == null ||
              !contentType.toLowerCase().startsWith('multipart/form-data'))) {
        final request = http.StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
              request.sink.add,
              onDone: request.sink.close,
              // ignore: avoid_types_on_closure_parameters
              onError: (Object error, StackTrace trace) => request.sink.close(),
              cancelOnError: true,
            );
        final response = await _client.send(request);
        return http.Response.fromStream(response);
      }

      if (body is http.MultipartRequest) {
        final request = http.MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return http.Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
          ? formParams
          : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch (method) {
        case 'POST':
          return await _client.post(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PUT':
          return await _client.put(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'DELETE':
          return await _client.delete(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PATCH':
          return await _client.patch(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'HEAD':
          return await _client.head(
            uri,
            headers: nullableHeaderParams,
          );
        case 'GET':
          return await _client.get(
            uri,
            headers: nullableHeaderParams,
          );
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on http.ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(
    String value,
    String targetType, {
    bool growable = false,
  }) async =>
      // ignore: deprecated_member_use_from_same_package
      deserialize(value, targetType, growable: growable);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(
    String value,
    String targetType, {
    bool growable = false,
  }) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType =
        targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
        ? value
        : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(
    dynamic value,
    String targetType, {
    bool growable = false,
  }) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'ActorToken':
          return ActorToken.fromJson(value);
        case 'AddDomainRequest':
          return AddDomainRequest.fromJson(value);
        case 'Admin':
          return Admin.fromJson(value);
        case 'AllowlistIdentifier':
          return AllowlistIdentifier.fromJson(value);
        case 'BlocklistIdentifier':
          return BlocklistIdentifier.fromJson(value);
        case 'BlocklistIdentifiers':
          return BlocklistIdentifiers.fromJson(value);
        case 'CNameTarget':
          return CNameTarget.fromJson(value);
        case 'ChangeProductionInstanceDomainRequest':
          return ChangeProductionInstanceDomainRequest.fromJson(value);
        case 'ClerkError':
          return ClerkError.fromJson(value);
        case 'ClerkErrors':
          return ClerkErrors.fromJson(value);
        case 'Client':
          return Client.fromJson(value);
        case 'CreateActorTokenRequest':
          return CreateActorTokenRequest.fromJson(value);
        case 'CreateActorTokenRequestActor':
          return CreateActorTokenRequestActor.fromJson(value);
        case 'CreateAllowlistIdentifierRequest':
          return CreateAllowlistIdentifierRequest.fromJson(value);
        case 'CreateBlocklistIdentifierRequest':
          return CreateBlocklistIdentifierRequest.fromJson(value);
        case 'CreateBulkInvitationsRequestInner':
          return CreateBulkInvitationsRequestInner.fromJson(value);
        case 'CreateEmailAddressRequest':
          return CreateEmailAddressRequest.fromJson(value);
        case 'CreateInvitationRequest':
          return CreateInvitationRequest.fromJson(value);
        case 'CreateJWTTemplateRequest':
          return CreateJWTTemplateRequest.fromJson(value);
        case 'CreateOAuthApplicationRequest':
          return CreateOAuthApplicationRequest.fromJson(value);
        case 'CreateOrganizationDomainRequest':
          return CreateOrganizationDomainRequest.fromJson(value);
        case 'CreateOrganizationInvitationRequest':
          return CreateOrganizationInvitationRequest.fromJson(value);
        case 'CreateOrganizationMembershipRequest':
          return CreateOrganizationMembershipRequest.fromJson(value);
        case 'CreateOrganizationRequest':
          return CreateOrganizationRequest.fromJson(value);
        case 'CreatePhoneNumberRequest':
          return CreatePhoneNumberRequest.fromJson(value);
        case 'CreateRedirectURLRequest':
          return CreateRedirectURLRequest.fromJson(value);
        case 'CreateSAMLConnectionRequest':
          return CreateSAMLConnectionRequest.fromJson(value);
        case 'CreateSAMLConnectionRequestAttributeMapping':
          return CreateSAMLConnectionRequestAttributeMapping.fromJson(value);
        case 'CreateSessionRequest':
          return CreateSessionRequest.fromJson(value);
        case 'CreateSessionToken200Response':
          return CreateSessionToken200Response.fromJson(value);
        case 'CreateSessionTokenFromTemplateRequest':
          return CreateSessionTokenFromTemplateRequest.fromJson(value);
        case 'CreateSessionTokenRequest':
          return CreateSessionTokenRequest.fromJson(value);
        case 'CreateSignInTokenRequest':
          return CreateSignInTokenRequest.fromJson(value);
        case 'CreateUserRequest':
          return CreateUserRequest.fromJson(value);
        case 'CreateWaitlistEntryRequest':
          return CreateWaitlistEntryRequest.fromJson(value);
        case 'DeletedObject':
          return DeletedObject.fromJson(value);
        case 'DisableMFA200Response':
          return DisableMFA200Response.fromJson(value);
        case 'Domain':
          return Domain.fromJson(value);
        case 'Domains':
          return Domains.fromJson(value);
        case 'EmailAddress':
          return EmailAddress.fromJson(value);
        case 'EmailAddressVerification':
          return EmailAddressVerification.fromJson(value);
        case 'FromOAuth':
          return FromOAuth.fromJson(value);
        case 'FromOAuthError':
          return FromOAuthError.fromJson(value);
        case 'GetOAuthAccessToken200ResponseInner':
          return GetOAuthAccessToken200ResponseInner.fromJson(value);
        case 'IdentificationLink':
          return IdentificationLink.fromJson(value);
        case 'Instance':
          return Instance.fromJson(value);
        case 'InstanceRestrictions':
          return InstanceRestrictions.fromJson(value);
        case 'Invitation':
          return Invitation.fromJson(value);
        case 'JWKS':
          return JWKS.fromJson(value);
        case 'JWKSEcdsaPrivateKey':
          return JWKSEcdsaPrivateKey.fromJson(value);
        case 'JWKSEcdsaPublicKey':
          return JWKSEcdsaPublicKey.fromJson(value);
        case 'JWKSEd25519PrivateKey':
          return JWKSEd25519PrivateKey.fromJson(value);
        case 'JWKSEd25519PublicKey':
          return JWKSEd25519PublicKey.fromJson(value);
        case 'JWKSKeysInner':
          return JWKSKeysInner.fromJson(value);
        case 'JWKSRsaPrivateKey':
          return JWKSRsaPrivateKey.fromJson(value);
        case 'JWKSRsaPublicKey':
          return JWKSRsaPublicKey.fromJson(value);
        case 'JWKSSymmetricKey':
          return JWKSSymmetricKey.fromJson(value);
        case 'JWTTemplate':
          return JWTTemplate.fromJson(value);
        case 'ListWaitlistEntries200Response':
          return ListWaitlistEntries200Response.fromJson(value);
        case 'MergeOrganizationMetadataRequest':
          return MergeOrganizationMetadataRequest.fromJson(value);
        case 'OAuthApplication':
          return OAuthApplication.fromJson(value);
        case 'OAuthApplicationWithSecret':
          return OAuthApplicationWithSecret.fromJson(value);
        case 'OAuthApplications':
          return OAuthApplications.fromJson(value);
        case 'OTP':
          return OTP.fromJson(value);
        case 'Organization':
          return Organization.fromJson(value);
        case 'OrganizationDomain':
          return OrganizationDomain.fromJson(value);
        case 'OrganizationDomainVerification':
          return OrganizationDomainVerification.fromJson(value);
        case 'OrganizationDomains':
          return OrganizationDomains.fromJson(value);
        case 'OrganizationInvitation':
          return OrganizationInvitation.fromJson(value);
        case 'OrganizationInvitationPublicOrganizationData':
          return OrganizationInvitationPublicOrganizationData.fromJson(value);
        case 'OrganizationInvitationWithPublicOrganizationData':
          return OrganizationInvitationWithPublicOrganizationData.fromJson(
              value);
        case 'OrganizationInvitations':
          return OrganizationInvitations.fromJson(value);
        case 'OrganizationInvitationsWithPublicOrganizationData':
          return OrganizationInvitationsWithPublicOrganizationData.fromJson(
              value);
        case 'OrganizationMembership':
          return OrganizationMembership.fromJson(value);
        case 'OrganizationMembershipPublicUserData':
          return OrganizationMembershipPublicUserData.fromJson(value);
        case 'OrganizationMemberships':
          return OrganizationMemberships.fromJson(value);
        case 'OrganizationSettings':
          return OrganizationSettings.fromJson(value);
        case 'OrganizationWithLogo':
          return OrganizationWithLogo.fromJson(value);
        case 'Organizations':
          return Organizations.fromJson(value);
        case 'Passkey':
          return Passkey.fromJson(value);
        case 'PhoneNumber':
          return PhoneNumber.fromJson(value);
        case 'PhoneNumberVerification':
          return PhoneNumberVerification.fromJson(value);
        case 'PreviewTemplateRequest':
          return PreviewTemplateRequest.fromJson(value);
        case 'ProxyCheck':
          return ProxyCheck.fromJson(value);
        case 'RedirectURL':
          return RedirectURL.fromJson(value);
        case 'RevokeInvitation200Response':
          return RevokeInvitation200Response.fromJson(value);
        case 'RevokeOrganizationInvitationRequest':
          return RevokeOrganizationInvitationRequest.fromJson(value);
        case 'SAML':
          return SAML.fromJson(value);
        case 'SAMLAccount':
          return SAMLAccount.fromJson(value);
        case 'SAMLAccountSamlConnection':
          return SAMLAccountSamlConnection.fromJson(value);
        case 'SAMLAccountVerification':
          return SAMLAccountVerification.fromJson(value);
        case 'SAMLConnection':
          return SAMLConnection.fromJson(value);
        case 'SAMLConnectionAttributeMapping':
          return SAMLConnectionAttributeMapping.fromJson(value);
        case 'SAMLConnections':
          return SAMLConnections.fromJson(value);
        case 'SchemasPasskey':
          return SchemasPasskey.fromJson(value);
        case 'SchemasPasskeyVerification':
          return SchemasPasskeyVerification.fromJson(value);
        case 'SchemasSAMLConnection':
          return SchemasSAMLConnection.fromJson(value);
        case 'Session':
          return Session.fromJson(value);
        case 'SessionActivityResponse':
          return SessionActivityResponse.fromJson(value);
        case 'SignInToken':
          return SignInToken.fromJson(value);
        case 'SignUp':
          return SignUp.fromJson(value);
        case 'SignUpVerification':
          return SignUpVerification.fromJson(value);
        case 'SignUpVerifications':
          return SignUpVerifications.fromJson(value);
        case 'SvixURL':
          return SvixURL.fromJson(value);
        case 'Template':
          return Template.fromJson(value);
        case 'TestingToken':
          return TestingToken.fromJson(value);
        case 'Ticket':
          return Ticket.fromJson(value);
        case 'ToggleTemplateDeliveryRequest':
          return ToggleTemplateDeliveryRequest.fromJson(value);
        case 'TotalCount':
          return TotalCount.fromJson(value);
        case 'UpdateDomainRequest':
          return UpdateDomainRequest.fromJson(value);
        case 'UpdateEmailAddressRequest':
          return UpdateEmailAddressRequest.fromJson(value);
        case 'UpdateInstanceAuthConfig200Response':
          return UpdateInstanceAuthConfig200Response.fromJson(value);
        case 'UpdateInstanceAuthConfigRequest':
          return UpdateInstanceAuthConfigRequest.fromJson(value);
        case 'UpdateInstanceOrganizationSettingsRequest':
          return UpdateInstanceOrganizationSettingsRequest.fromJson(value);
        case 'UpdateInstanceRequest':
          return UpdateInstanceRequest.fromJson(value);
        case 'UpdateInstanceRestrictionsRequest':
          return UpdateInstanceRestrictionsRequest.fromJson(value);
        case 'UpdateOAuthApplicationRequest':
          return UpdateOAuthApplicationRequest.fromJson(value);
        case 'UpdateOrganizationDomainRequest':
          return UpdateOrganizationDomainRequest.fromJson(value);
        case 'UpdateOrganizationMembershipMetadataRequest':
          return UpdateOrganizationMembershipMetadataRequest.fromJson(value);
        case 'UpdateOrganizationMembershipRequest':
          return UpdateOrganizationMembershipRequest.fromJson(value);
        case 'UpdateOrganizationRequest':
          return UpdateOrganizationRequest.fromJson(value);
        case 'UpdatePhoneNumberRequest':
          return UpdatePhoneNumberRequest.fromJson(value);
        case 'UpdateProductionInstanceDomainRequest':
          return UpdateProductionInstanceDomainRequest.fromJson(value);
        case 'UpdateSAMLConnectionRequest':
          return UpdateSAMLConnectionRequest.fromJson(value);
        case 'UpdateSAMLConnectionRequestAttributeMapping':
          return UpdateSAMLConnectionRequestAttributeMapping.fromJson(value);
        case 'UpdateSignUpRequest':
          return UpdateSignUpRequest.fromJson(value);
        case 'UpdateUserMetadataRequest':
          return UpdateUserMetadataRequest.fromJson(value);
        case 'UpdateUserRequest':
          return UpdateUserRequest.fromJson(value);
        case 'UpsertTemplateRequest':
          return UpsertTemplateRequest.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'VerifyClientRequest':
          return VerifyClientRequest.fromJson(value);
        case 'VerifyDomainProxyRequest':
          return VerifyDomainProxyRequest.fromJson(value);
        case 'VerifyPassword200Response':
          return VerifyPassword200Response.fromJson(value);
        case 'VerifyPasswordRequest':
          return VerifyPasswordRequest.fromJson(value);
        case 'VerifySessionRequest':
          return VerifySessionRequest.fromJson(value);
        case 'VerifyTOTP200Response':
          return VerifyTOTP200Response.fromJson(value);
        case 'VerifyTOTPRequest':
          return VerifyTOTPRequest.fromJson(value);
        case 'WaitlistEntry':
          return WaitlistEntry.fromJson(value);
        case 'WaitlistEntryInvitation':
          return WaitlistEntryInvitation.fromJson(value);
        case 'Web3Signature':
          return Web3Signature.fromJson(value);
        case 'Web3Wallet':
          return Web3Wallet.fromJson(value);
        case 'Web3WalletVerification':
          return Web3WalletVerification.fromJson(value);
        default:
          dynamic match;
          if (value is List &&
              (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toList(growable: growable);
          }
          if (value is Set &&
              (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toSet();
          }
          if (value is Map &&
              (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(
                    v,
                    match,
                    growable: growable,
                  )),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.internalServerError,
        'Exception during deserialization.',
        error,
        trace,
      );
    }
    throw ApiException(
      HttpStatus.internalServerError,
      'Could not find a suitable class for deserialization',
    );
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String' ? message.json : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
      ? message.json
      : ApiClient.fromJson(
          json.decode(message.json),
          targetType,
          growable: message.growable,
        );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async =>
    value == null ? '' : json.encode(value);
