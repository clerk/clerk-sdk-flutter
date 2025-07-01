import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_grammar.dart';

/// Extensions to add grammatical sentence formatting to
/// localizations
///
extension GrammaticalExtensions on ClerkSdkLocalizations {
  /// Get the grammar related to these localizations
  ClerkSdkGrammar get grammar => ClerkSdkGrammar.of(localeName);
}
