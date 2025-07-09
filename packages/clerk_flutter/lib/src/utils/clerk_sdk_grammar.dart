import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/widgets.dart';

/// An class to deal with the niceties of grammar, which will change
/// hugely according to locale
///
abstract class ClerkSdkGrammar {
  /// Constructor
  const ClerkSdkGrammar();

  static late final ClerkSdkGrammarCollection _grammars;

  static late final ClerkSdkGrammar _default;

  /// A method to return the correct [ClerkSdkGrammar] for a given locale string
  ///
  static ClerkSdkGrammar of(String locale) =>
      _grammars[locale] ?? _grammars[locale.split('_').first] ?? _default;

  /// A method to initialise the collection of grammars
  ///
  static void initialise(
    ClerkSdkGrammarCollection? grammars,
    ClerkSdkGrammar? defaultGrammar,
  ) {
    _grammars = grammars ?? {};
    _default = defaultGrammar ?? const ClerkSdkGrammarEn();
  }

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
  });

  /// Return a version of a string as if it were to be used as
  /// a sentence. In English, this means with the first word
  /// capitalized.
  ///
  /// Current locale can be derived from the [context]
  ///
  String toSentence(String item);
}

/// A [ClerkSdkGrammar] default implementation, using English language
/// structures
///
class ClerkSdkGrammarEn implements ClerkSdkGrammar {
  /// Constructor
  const ClerkSdkGrammarEn();

  /// [inclusive] is taken to indicate whether an 'and' or 'or' list should be
  /// returned:
  /// - [true]: "first, second and third"
  /// - [false]: "first, second or third"
  ///
  /// [note] is used as a simple prefix
  ///
  @override
  String toLitany(
    List<String> items, {
    required BuildContext context,
    bool inclusive = false,
    String? note,
  }) {
    if (items.isEmpty) {
      return '';
    }

    final buf = StringBuffer();

    if (note case String note) {
      buf.write(note);
      buf.writeCharCode(0x20);
    }

    buf.write(items.first);

    for (int i = 1; i < items.length - 1; i++) {
      buf.write(', ');
      buf.write(items[i]);
    }

    if (items.length > 1) {
      final l10ns = ClerkAuth.localizationsOf(context);
      final connector = inclusive ? l10ns.and : l10ns.or;
      buf.writeCharCode(0x20);
      buf.write(connector);
      buf.writeCharCode(0x20);
      buf.write(items.last);
    }

    return buf.toString();
  }

  /// To make a string into a sentence in English we simply capitalize
  /// the first word
  @override
  String toSentence(String item) =>
      item.isNotEmpty ? item[0].toUpperCase() + item.substring(1) : '';
}
