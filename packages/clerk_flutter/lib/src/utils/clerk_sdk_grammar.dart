import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:flutter/widgets.dart';

/// An class to deal with the niceties of grammar, which will change
/// hugely according to locale
///
class ClerkSdkGrammar {
  /// Constructor
  const ClerkSdkGrammar({this.context});

  /// The context to use for grammar choices e.g [Locale] based decisions
  final BuildContext? context;

  /// A method to return a [ClerkSdkGrammar] tied to a given [BuildContext]
  /// and therefore [Locale]
  ClerkSdkGrammar of(BuildContext context) => ClerkSdkGrammar(context: context);

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
  }) {
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
      final l10ns =
          context is BuildContext ? ClerkAuth.localizationsOf(context!) : null;
      final connector = inclusive ? (l10ns?.and ?? 'and') : (l10ns?.or ?? 'or');
      buf.write(' $connector ');
      buf.write(items.last);
    }

    return buf.toString();
  }

  /// Return a version of a string as if it were to be used as
  /// a sentence. In English, this means with the first word
  /// capitalized.
  ///
  /// Current locale can be derived from the [context]
  ///
  String toSentence(String item) {
    if (item.isEmpty) {
      return '';
    }
    return item[0].toUpperCase() + item.substring(1);
  }
}
