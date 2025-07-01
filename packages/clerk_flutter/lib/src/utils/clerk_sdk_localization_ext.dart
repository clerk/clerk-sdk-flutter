import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_grammar.dart';
import 'package:flutter/material.dart';

/// Extensions to add grammatical sentence formatting to
/// localizations
///
extension GrammaticalExtensions on ClerkSdkLocalizations {
  /// A method that takes a list of pre-translated [items] e.g.
  /// \['first', 'second', 'third'\] and returns a textual representation
  /// of its contents as alternatives e.g. for English "first, second or third"
  ///
  /// The [context] can be used to find necessary localizations
  /// to complete the litany
  ///
  /// The [inclusive] boolean decides whether the litany should indicate all
  /// elements are relevant ([true]) or a single element of the options
  /// is relevant (default [false]). This will make more sense when looking
  /// at the individual language implementations.
  ///
  /// The optional [note] adds extra context to the litany.
  ///
  /// Language specific interpretations of what these both mean will be
  /// commented in those implementations (see [ClerkSdkLocalizationsEn] below).
  ///
  /// This method should be overridden for languages where this format does not
  /// provide the correct representation for alternates
  ///
  /// Current locale can be derived from the [context]
  ///
  String toLitany(
    List<String> items, {
    required BuildContext context,
    bool inclusive = false,
    String? note,
  }) {
    return ClerkSdkGrammar.of(localeName)
        .toLitany(items, context: context, inclusive: inclusive, note: note);
  }

  /// Return a version of a string as if it were to be used as
  /// a sentence. In English, this means with the first word
  /// capitalized.
  ///
  /// Current locale can be derived from the [context]
  ///
  String toSentence(String item) =>
      ClerkSdkGrammar.of(localeName).toSentence(item);
}
