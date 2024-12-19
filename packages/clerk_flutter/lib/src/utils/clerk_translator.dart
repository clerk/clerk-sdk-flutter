/// Abstract class defining the [ClerkTranslator] interface
///
abstract class ClerkTranslator {
  /// Construct a [ClerkTranslator]
  const ClerkTranslator();

  /// the character sequence to replace with [substitution] during
  /// a call to [translate]. By default this is `###` for the first item
  /// (index 0) and `#<index + 1>#` for subsequent indices (index 1 or more)
  ///
  String substitutionKey([int idx = 0]) => idx < 1 ? '###' : '#${idx + 1}#';

  /// Translate a [phrase]] into a different language. Identity function by default
  /// for English
  ///
  /// A [substitution] or multiple [substitutions] for keys inside the [phrase]:
  ///
  /// If a single [substitution] is present, replace the first instance of
  /// `substitutionKey()` with it
  ///
  /// If multiple [substitutions] are present, use each substitution to
  /// replace the first found appropriate character sequence:
  /// `substitutionKey(index)`
  ///
  /// This allows word order to vary across different languages without having
  /// to manipulate the [substitutions] array, viz:
  ///
  /// `translate('### bites #2#', substitutions: ['man', 'dog'])`
  /// vs
  /// `translate('#2# is bitten by ###', substitutions: ['man', 'dog'])`
  ///
  String translate(
    String phrase, {
    String? substitution,
    List<String> substitutions = const [],
  });

  /// An asynchronous version of [translate], for situations in which the
  /// translation might not immediately be to hand. Parameters as above.
  ///
  Future<String> translateAsync(
    String phrase, {
    String? substitution,
    List<String>? substitutions,
  });

  /// A method that takes a list of [items] e.g. \['first', 'second', 'third'\]
  /// and returns a textual representation of its contents as alternatives
  /// e.g. "first, second or third"
  ///
  /// [connector] can be overridden, and a [prefix] can be prepended
  ///
  /// Should be overridden for languages where this does not provide the correct
  /// representation for alternates
  ///
  String alternatives(
    List<String> items, {
    String connector = 'or',
    String? prefix,
  });
}

/// Default implementation of [ClerkTranslator]
///
class DefaultClerkTranslator extends ClerkTranslator {
  /// Construct a [DefaultClerkTranslator]
  const DefaultClerkTranslator();

  @override
  String translate(
    String phrase, {
    String? substitution,
    List<String>? substitutions,
  }) {
    if (substitution case String sub) {
      return phrase.replaceFirst(substitutionKey(), sub);
    }

    if (substitutions case List<String> substitutions) {
      for (int i = 0; i < substitutions.length; ++i) {
        phrase = phrase.replaceFirst(substitutionKey(i), substitutions[i]);
      }
    }

    return phrase;
  }

  @override
  Future<String> translateAsync(
    String phrase, {
    String? substitution,
    List<String>? substitutions,
  }) async {
    return translate(
      phrase,
      substitution: substitution,
      substitutions: substitutions,
    );
  }

  @override
  String alternatives(List<String> items,
      {String connector = 'or', String? prefix}) {
    if (items.isEmpty) return '';

    final buf = StringBuffer();

    if (prefix case String prefix) {
      buf.write(translate(prefix));
      buf.writeCharCode(0x20);
    }

    buf.write(translate(items.first));

    for (int i = 1; i < items.length - 1; ++i) {
      buf.write(', ');
      buf.write(translate(items[i]));
    }

    if (items.length > 1) {
      buf.write(' ${translate(connector)} ');
      buf.write(translate(items.last));
    }

    return buf.toString();
  }
}
