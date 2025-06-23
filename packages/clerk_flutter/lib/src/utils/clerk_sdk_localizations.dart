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
  String toLitany(
    List<String> items, {
    bool inclusive = false,
    String? note,
  });

  /// Return a version of a string as if it were to be used as
  /// a sentence.
  ///
  String toSentence(String item);
}

/// An English implementation of the localizations
///
class ClerkSdkLocalizationsEn extends ClerkSdkLocalizationsBaseEn
    implements ClerkSdkLocalizations {
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
      final connector = inclusive ? and : or;
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
