import 'package:clerk_auth/src/models/client/passkey_user.dart';
import 'package:clerk_auth/src/models/client/relying_party.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'verification_nonce.g.dart';

/// [Verification] Clerk object
@immutable
@JsonSerializable()
class VerificationNonce with InformativeToStringMixin {
  /// Constructor
  const VerificationNonce({
    required this.challenge,
    required this.relyingParty,
    required this.timeout,
    this.userVerification,
    this.user,
  });

  /// challenge
  final String challenge;

  /// strategy
  @JsonKey(defaultValue: 30000)
  final int timeout;

  /// user verification
  final String? userVerification;

  /// rp id
  @JsonKey(readValue: _readRelyingParty)
  final RelyingParty relyingParty;

  /// user
  final PasskeyUser? user;

  /// fromJson
  static VerificationNonce fromJson(Map<String, dynamic> json) =>
      _$VerificationNonceFromJson(json);

  /// toJson
  @override
  Map<String, dynamic> toJson() => _$VerificationNonceToJson(this);
}

/// Read the relying party from the map
///
/// The relying party can take one of two forms, depending on whether we're
/// registering or signing in:
///    registering: a map with key `rp` and body `{ id: <rp id>, name: <rp name> }`
///    signing in: just the id is supplied as a string with key `rpId`
///
/// This function creates a unified view of the relying party as a map with
/// keys `id` and `name` if available
///
Map<String, dynamic> _readRelyingParty(Map<dynamic, dynamic> map, String _) =>
    map['rp'] ?? {'id': map['rpId']};
