abstract class ClerkTranslator {
  String translate(String phrase,
      {String? substitution, List<String> substitutions = const []});
  String alternatives(List<String> items,
      {String connector = 'or', String? prefix});
}

class DefaultClerkTranslator implements ClerkTranslator {
  final substitutionKey = '###';

  const DefaultClerkTranslator();

  /// Translate a string into a different language. Identity function for English
  @override
  String translate(String phrase,
      {String? substitution, List<String> substitutions = const []}) {
    // if a single `substitution` is present, replace the first instance of `substitutionKey`
    // (default `###`) with it
    if (substitution case String sub) {
      return phrase.replaceFirst(substitutionKey, sub);
    }

    // if multiple `substitutions` are present, replace the first found character sequences `#<n>#`
    // with each substitution where `<n>` is the 1-based index into the array.
    //
    // This allows word order to vary across different languages without having to manipulate the
    // `substitutions` array, viz:
    //
    // `translate('#1# bites #2#', substitutions: ['man', 'dog'])`
    // vs
    // `translate('#2# is bitten by #1#', substitutions: ['man', 'dog'])`
    for (int i = 0; i < substitutions.length; ++i) {
      phrase = phrase.replaceFirst('#${i + 1}#', substitutions[i]);
    }

    return phrase;
  }

  /// A method that takes a list of strings ['first', 'second', 'third']
  /// and returns a textual representation of its contents as alternatives
  /// e.g. "first, second or third"
  ///
  /// Connecting word can be overridden, and a prefix can be prepended
  ///
  /// Should be overridden for languages where this does not provide the correct
  /// representation for alternates
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
