import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// Widget which wraps a [MultiDigitCodeInput] widget, providing
/// [title] and [subtitle] etc
class ClerkCodeInput extends StatelessWidget {
  /// Construct a [ClerkCodeInput]
  const ClerkCodeInput({
    super.key,
    required this.open,
    required this.onSubmit,
    this.title,
    this.subtitle,
  });

  /// Should this widget be open?
  final bool open;

  /// Title for the input
  final String? title;

  /// Subtitle for the input
  final String? subtitle;

  /// Function to call when code is submitted
  final Future<bool> Function(String) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Closeable(
      closed: open == false,
      child: Padding(
        padding: horizontalPadding32 + verticalPadding8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title case String title)
              FittedBox(
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: ClerkTextStyle.inputLabel,
                ),
              ),
            if (subtitle case String subtitle)
              FittedBox(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: ClerkTextStyle.inputLabel,
                ),
              ),
            verticalMargin4,
            MultiDigitCodeInput(onSubmit: onSubmit),
          ],
        ),
      ),
    );
  }
}
