import 'package:clerk_auth/clerk_auth.dart';

/// Abstract class to be parent to e.g. [PhoneNumber] and [Email]
/// so that both can be used as an identifier
///
abstract class UserIdentifyingData {
  /// Construct a [UserIdentifyingData] object
  const UserIdentifyingData({
    required this.id,
    required this.type,
    this.verification,
  });

  /// the [id]
  final String id;

  /// the [IdentifierType]
  final IdentifierType type;

  /// Getter for the [identifier]
  String get identifier;

  /// verification
  final Verification? verification;

  /// Has this identifier been verified...
  bool get isVerified => verification?.status == Status.verified;

  /// ...or not?
  bool get isUnverified => isVerified == false;
}
