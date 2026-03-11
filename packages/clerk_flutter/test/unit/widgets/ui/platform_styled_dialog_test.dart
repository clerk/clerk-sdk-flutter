import 'package:clerk_flutter/src/widgets/ui/platform_styled_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

enum _CustomAction { save, delete, cancel }

void main() {
  group('DialogChoice', () {
    test('has ok value', () {
      expect(DialogChoice.ok, isNotNull);
    });

    test('has cancel value', () {
      expect(DialogChoice.cancel, isNotNull);
    });

    test('values are distinct', () {
      expect(DialogChoice.ok, isNot(DialogChoice.cancel));
    });
  });

  group('PlatformStyledDialog', () {
    test('stores title', () {
      const dialog = PlatformStyledDialog<DialogChoice>(
        title: 'Test Title',
        content: 'Test Content',
        actions: {DialogChoice.ok: 'OK'},
      );

      expect(dialog.title, 'Test Title');
    });

    test('stores content', () {
      const dialog = PlatformStyledDialog<DialogChoice>(
        title: 'Test Title',
        content: 'Test Content',
        actions: {DialogChoice.ok: 'OK'},
      );

      expect(dialog.content, 'Test Content');
    });

    test('stores actions', () {
      const actions = {DialogChoice.ok: 'OK', DialogChoice.cancel: 'Cancel'};
      const dialog = PlatformStyledDialog<DialogChoice>(
        title: 'Test Title',
        content: 'Test Content',
        actions: actions,
      );

      expect(dialog.actions, actions);
    });

    test('stores defaultAction', () {
      const dialog = PlatformStyledDialog<DialogChoice>(
        title: 'Test Title',
        content: 'Test Content',
        actions: {DialogChoice.ok: 'OK'},
        defaultAction: DialogChoice.ok,
      );

      expect(dialog.defaultAction, DialogChoice.ok);
    });

    test('defaultAction can be null', () {
      const dialog = PlatformStyledDialog<DialogChoice>(
        title: 'Test Title',
        content: 'Test Content',
        actions: {DialogChoice.ok: 'OK'},
      );

      expect(dialog.defaultAction, isNull);
    });

    testWidgets('renders with title and content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlatformStyledDialog<DialogChoice>(
              title: 'Test Title',
              content: 'Test Content',
              actions: {DialogChoice.ok: 'OK'},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders action buttons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlatformStyledDialog<DialogChoice>(
              title: 'Test Title',
              content: 'Test Content',
              actions: {
                DialogChoice.ok: 'OK',
                DialogChoice.cancel: 'Cancel',
              },
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('OK'), findsOneWidget);
      expect(find.text('CANCEL'), findsOneWidget);
    });

    testWidgets('renders AlertDialog on non-iOS', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlatformStyledDialog<DialogChoice>(
              title: 'Test Title',
              content: 'Test Content',
              actions: {DialogChoice.ok: 'OK'},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('renders TextButton for actions', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlatformStyledDialog<DialogChoice>(
              title: 'Test Title',
              content: 'Test Content',
              actions: {DialogChoice.ok: 'OK'},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('renders multiple action buttons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlatformStyledDialog<DialogChoice>(
              title: 'Test Title',
              content: 'Test Content',
              actions: {
                DialogChoice.ok: 'OK',
                DialogChoice.cancel: 'Cancel',
              },
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(TextButton), findsNWidgets(2));
    });

    testWidgets('show method displays dialog and returns result',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  final result = await PlatformStyledDialog.show<DialogChoice>(
                    context: context,
                    title: 'Test Dialog',
                    content: 'Test Content',
                    actions: const {
                      DialogChoice.ok: 'OK',
                      DialogChoice.cancel: 'Cancel',
                    },
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Result: $result')),
                    );
                  }
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      // Tap button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify dialog is displayed
      expect(find.text('Test Dialog'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);

      // Tap OK button
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Verify dialog is dismissed
      expect(find.text('Test Dialog'), findsNothing);
    });

    testWidgets('show method with defaultAction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  await PlatformStyledDialog.show<DialogChoice>(
                    context: context,
                    title: 'Test Dialog',
                    content: 'Test Content',
                    actions: const {
                      DialogChoice.ok: 'OK',
                      DialogChoice.cancel: 'Cancel',
                    },
                    defaultAction: DialogChoice.ok,
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      // Tap button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify dialog is displayed
      expect(find.text('Test Dialog'), findsOneWidget);

      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
    });

    testWidgets('action buttons close dialog with correct value',
        (tester) async {
      DialogChoice? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  result = await PlatformStyledDialog.show<DialogChoice>(
                    context: context,
                    title: 'Test Dialog',
                    content: 'Test Content',
                    actions: const {
                      DialogChoice.ok: 'OK',
                      DialogChoice.cancel: 'Cancel',
                    },
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      // Tap button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Tap Cancel button
      await tester.tap(find.text('CANCEL'));
      await tester.pumpAndSettle();

      // Verify result is cancel
      expect(result, DialogChoice.cancel);
    });

    testWidgets('renders with custom generic type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlatformStyledDialog<_CustomAction>(
              title: 'Custom Dialog',
              content: 'Custom Content',
              actions: {
                _CustomAction.save: 'Save',
                _CustomAction.delete: 'Delete',
                _CustomAction.cancel: 'Cancel',
              },
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Custom Dialog'), findsOneWidget);
      expect(find.text('SAVE'), findsOneWidget);
      expect(find.text('DELETE'), findsOneWidget);
      expect(find.text('CANCEL'), findsOneWidget);
    });
  });
}
