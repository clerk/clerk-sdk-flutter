import 'package:clerk_auth/src/utils/extensions.dart';

/// mixin that provides a more informative [toString] experience
mixin InformativeToString {
  /// Basic [toJson] - generally overridden
  dynamic toJson() => const {};

  @override
  String toString() => '${describeIdentity()}${toJson()}';
}
