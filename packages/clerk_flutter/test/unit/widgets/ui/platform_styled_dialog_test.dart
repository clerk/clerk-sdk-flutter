import 'package:clerk_flutter/src/widgets/ui/platform_styled_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
  });
}

