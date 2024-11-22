/// Abstract class to be parent to e.g. [PhoneNumber] and [Email]
/// so that both can be used as an identifier
///
abstract class UserIdentifyingData {
  /// Construct a [UserIdentifyingData] object
  const UserIdentifyingData({required this.id});

  /// the [id]
  final String id;

  /// Getter for the [identifier]
  String get identifier;
}
