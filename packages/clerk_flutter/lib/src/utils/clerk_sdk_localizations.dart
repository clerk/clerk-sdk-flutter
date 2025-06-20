import 'package:clerk_flutter/src/generated/clerk_sdk_localizations_base.dart';
import 'package:clerk_flutter/src/generated/clerk_sdk_localizations_base_en.dart';

/// The generated localizations with some extra functionality
abstract class ClerkSdkLocalizations extends ClerkSdkLocalizationsBase
    implements ClerkSentenceFormattingExtensions {
  /// Constructor
  ClerkSdkLocalizations(super.locale);
}

/// Sentence formatting extensions
abstract class ClerkSentenceFormattingExtensions {
  /// A method that takes a list of pre-translated [items] e.g.
  /// \['first', 'second', 'third'\] and returns a textual representation
  /// of its contents as alternatives e.g. for English "first, second or third"
  ///
  /// The [inclusive] boolean decides whether the connector is 'and' if [true]
  /// or 'or' if [false].
  ///
  /// This method should be overridden for languages where this format does not
  /// provide the correct representation for alternates
  ///
  /// Current locale can be derived from the [context]
  ///
  String toListAsText(
    List<String> items, {
    bool inclusive = false,
  });

  /// Return a version of a string as if it were to be used as
  /// a sentence. In English, this means with the first word
  /// capitalized.
  ///
  /// Current locale can be derived from the [context]
  ///
  String toSentence(String item);
}

/// An English implementation of the localizations
class ClerkSdkLocalizationsEn extends ClerkSdkLocalizationsBaseEn
    implements ClerkSdkLocalizations {
  @override
  String toListAsText(List<String> items, {bool inclusive = false}) {
    if (items.isEmpty) {
      return '';
    }

    final buf = StringBuffer();

    buf.write(items.first);

    for (int i = 1; i < items.length - 1; i++) {
      buf.write(', ');
      buf.write(items[i]);
    }

    if (items.length > 1) {
      final connector = inclusive ? and : or;
      buf.write(' $connector ');
      buf.write(items.last);
    }

    return buf.toString();
  }

  @override
  String toSentence(String item) {
    if (item.isEmpty) {
      return '';
    }
    return item[0].toUpperCase() + item.substring(1);
  }
}
