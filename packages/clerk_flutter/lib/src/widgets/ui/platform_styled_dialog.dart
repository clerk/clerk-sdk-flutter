import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A default enum for basic choices from a dialog
enum DialogChoice {
  /// ok
  ok,

  /// cancel
  cancel;
}

/// A dialog that conforms to Cupertino or Material designs as appropriate
class PlatformStyledDialog<T> extends StatelessWidget {
  /// Constructor a [PlatformStyledDialog]
  const PlatformStyledDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.defaultAction,
  });

  /// The dialog [title]
  final String title;

  /// The dialog [content]
  final String content;

  /// Any [actions]
  final Map<T, String> actions;

  /// A [default] if there is one
  final T? defaultAction;

  /// Show a [PlatformStyledDialog] with appropriate styling
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String content,
    required Map<T, String> actions,
    T? defaultAction,
  }) async {
    final dialog = PlatformStyledDialog<T>(
      title: title,
      content: content,
      defaultAction: defaultAction,
      actions: actions,
    );

    return Platform.isIOS
        ? await showCupertinoDialog(context: context, builder: (_) => dialog)
        : await showDialog(context: context, builder: (_) => dialog);
  }

  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            ...actions.entries.map(
              (a) => CupertinoDialogAction(
                isDefaultAction: a.key == defaultAction,
                onPressed: () => Navigator.pop(context, a.key),
                child: Text(a.value),
              ),
            ),
          ],
        )
      : AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            ...actions.entries.map(
              (a) => TextButton(
                child: Text(a.value.toUpperCase()),
                onPressed: () => Navigator.pop(context, a.key),
              ),
            ),
          ],
        );
}
