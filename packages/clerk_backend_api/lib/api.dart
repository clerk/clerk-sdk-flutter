//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/actor_tokens_api.dart';
part 'api/allow_list_block_list_api.dart';
part 'api/beta_features_api.dart';
part 'api/clients_api.dart';
part 'api/domains_api.dart';
part 'api/email_addresses_api.dart';
part 'api/email_sms_templates_api.dart';
part 'api/instance_settings_api.dart';
part 'api/invitations_api.dart';
part 'api/jwks_api.dart';
part 'api/jwt_templates_api.dart';
part 'api/miscellaneous_api.dart';
part 'api/o_auth_applications_api.dart';
part 'api/organization_domains_api.dart';
part 'api/organization_invitations_api.dart';
part 'api/organization_memberships_api.dart';
part 'api/organizations_api.dart';
part 'api/phone_numbers_api.dart';
part 'api/proxy_checks_api.dart';
part 'api/redirect_urls_api.dart';
part 'api/saml_connections_api.dart';
part 'api/sessions_api.dart';
part 'api/sign_in_tokens_api.dart';
part 'api/sign_ups_api.dart';
part 'api/testing_tokens_api.dart';
part 'api/users_api.dart';
part 'api/waitlist_entries_api.dart';
part 'api/webhooks_api.dart';

part 'model/actor_token.dart';
part 'model/add_domain_request.dart';
part 'model/admin.dart';
part 'model/allowlist_identifier.dart';
part 'model/blocklist_identifier.dart';
part 'model/blocklist_identifiers.dart';
part 'model/c_name_target.dart';
part 'model/change_production_instance_domain_request.dart';
part 'model/clerk_error.dart';
part 'model/clerk_errors.dart';
part 'model/client.dart';
part 'model/create_actor_token_request.dart';
part 'model/create_actor_token_request_actor.dart';
part 'model/create_allowlist_identifier_request.dart';
part 'model/create_blocklist_identifier_request.dart';
part 'model/create_bulk_invitations_request_inner.dart';
part 'model/create_email_address_request.dart';
part 'model/create_invitation_request.dart';
part 'model/create_jwt_template_request.dart';
part 'model/create_o_auth_application_request.dart';
part 'model/create_organization_domain_request.dart';
part 'model/create_organization_invitation_request.dart';
part 'model/create_organization_membership_request.dart';
part 'model/create_organization_request.dart';
part 'model/create_phone_number_request.dart';
part 'model/create_redirect_url_request.dart';
part 'model/create_saml_connection_request.dart';
part 'model/create_saml_connection_request_attribute_mapping.dart';
part 'model/create_session_request.dart';
part 'model/create_session_token200_response.dart';
part 'model/create_session_token_from_template_request.dart';
part 'model/create_session_token_request.dart';
part 'model/create_sign_in_token_request.dart';
part 'model/create_user_request.dart';
part 'model/create_waitlist_entry_request.dart';
part 'model/deleted_object.dart';
part 'model/disable_mfa200_response.dart';
part 'model/domain.dart';
part 'model/domains.dart';
part 'model/email_address.dart';
part 'model/email_address_verification.dart';
part 'model/from_o_auth.dart';
part 'model/from_o_auth_error.dart';
part 'model/get_o_auth_access_token200_response_inner.dart';
part 'model/identification_link.dart';
part 'model/instance.dart';
part 'model/instance_restrictions.dart';
part 'model/invitation.dart';
part 'model/jwks.dart';
part 'model/jwks_ecdsa_private_key.dart';
part 'model/jwks_ecdsa_public_key.dart';
part 'model/jwksed25519_private_key.dart';
part 'model/jwksed25519_public_key.dart';
part 'model/jwks_keys_inner.dart';
part 'model/jwks_rsa_private_key.dart';
part 'model/jwks_rsa_public_key.dart';
part 'model/jwks_symmetric_key.dart';
part 'model/jwt_template.dart';
part 'model/list_waitlist_entries200_response.dart';
part 'model/merge_organization_metadata_request.dart';
part 'model/o_auth_application.dart';
part 'model/o_auth_application_with_secret.dart';
part 'model/o_auth_applications.dart';
part 'model/otp.dart';
part 'model/organization.dart';
part 'model/organization_domain.dart';
part 'model/organization_domain_verification.dart';
part 'model/organization_domains.dart';
part 'model/organization_invitation.dart';
part 'model/organization_invitation_public_organization_data.dart';
part 'model/organization_invitation_with_public_organization_data.dart';
part 'model/organization_invitations.dart';
part 'model/organization_invitations_with_public_organization_data.dart';
part 'model/organization_membership.dart';
part 'model/organization_membership_public_user_data.dart';
part 'model/organization_memberships.dart';
part 'model/organization_settings.dart';
part 'model/organization_with_logo.dart';
part 'model/organizations.dart';
part 'model/passkey.dart';
part 'model/phone_number.dart';
part 'model/phone_number_verification.dart';
part 'model/preview_template_request.dart';
part 'model/proxy_check.dart';
part 'model/redirect_url.dart';
part 'model/revoke_invitation200_response.dart';
part 'model/revoke_organization_invitation_request.dart';
part 'model/saml.dart';
part 'model/saml_account.dart';
part 'model/saml_account_saml_connection.dart';
part 'model/saml_account_verification.dart';
part 'model/saml_connection.dart';
part 'model/saml_connection_attribute_mapping.dart';
part 'model/saml_connections.dart';
part 'model/schemas_passkey.dart';
part 'model/schemas_passkey_verification.dart';
part 'model/schemas_saml_connection.dart';
part 'model/session.dart';
part 'model/session_activity_response.dart';
part 'model/sign_in_token.dart';
part 'model/sign_up.dart';
part 'model/sign_up_verification.dart';
part 'model/sign_up_verifications.dart';
part 'model/svix_url.dart';
part 'model/template.dart';
part 'model/testing_token.dart';
part 'model/ticket.dart';
part 'model/toggle_template_delivery_request.dart';
part 'model/total_count.dart';
part 'model/update_domain_request.dart';
part 'model/update_email_address_request.dart';
part 'model/update_instance_auth_config200_response.dart';
part 'model/update_instance_auth_config_request.dart';
part 'model/update_instance_organization_settings_request.dart';
part 'model/update_instance_request.dart';
part 'model/update_instance_restrictions_request.dart';
part 'model/update_o_auth_application_request.dart';
part 'model/update_organization_domain_request.dart';
part 'model/update_organization_membership_metadata_request.dart';
part 'model/update_organization_membership_request.dart';
part 'model/update_organization_request.dart';
part 'model/update_phone_number_request.dart';
part 'model/update_production_instance_domain_request.dart';
part 'model/update_saml_connection_request.dart';
part 'model/update_saml_connection_request_attribute_mapping.dart';
part 'model/update_sign_up_request.dart';
part 'model/update_user_metadata_request.dart';
part 'model/update_user_request.dart';
part 'model/upsert_template_request.dart';
part 'model/user.dart';
part 'model/verify_client_request.dart';
part 'model/verify_domain_proxy_request.dart';
part 'model/verify_password200_response.dart';
part 'model/verify_password_request.dart';
part 'model/verify_session_request.dart';
part 'model/verify_totp200_response.dart';
part 'model/verify_totp_request.dart';
part 'model/waitlist_entry.dart';
part 'model/waitlist_entry_invitation.dart';
part 'model/web3_signature.dart';
part 'model/web3_wallet.dart';
part 'model/web3_wallet_verification.dart';

/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) =>
    pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
