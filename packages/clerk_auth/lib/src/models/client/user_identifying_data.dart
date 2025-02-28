import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/informative_to_string_mixin.dart';
import 'package:clerk_auth/src/models/status.dart';

export 'package:clerk_auth/src/models/client/verification.dart';

/// Abstract class to be parent to e.g. [PhoneNumber] and [Email]
/// so that both can be used as an identifier
///
abstract class UserIdentifyingData with InformativeToStringMixin {
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
