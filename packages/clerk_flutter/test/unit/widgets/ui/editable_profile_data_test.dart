import 'dart:typed_data';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_row_label.dart';
import 'package:clerk_flutter/src/widgets/ui/editable_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('EditableProfileData', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores name parameter', () {
      final widget = EditableProfileData(
        name: 'Test Name',
        imageUrl: null,
        onSubmit: (name, image) async {},
      );
      expect(widget.name, 'Test Name');
    });

    test('stores imageUrl parameter', () {
      final widget = EditableProfileData(
        name: 'Test',
        imageUrl: 'https://example.com/image.png',
        onSubmit: (name, image) async {},
      );
      expect(widget.imageUrl, 'https://example.com/image.png');
    });

    test('stores onSubmit callback', () {
      Future<void> onSubmit(String name, Uint8List? image) async {}
      final widget = EditableProfileData(
        name: 'Test',
        imageUrl: null,
        onSubmit: onSubmit,
      );
      expect(widget.onSubmit, onSubmit);
    });

    test('stores avatarBorderRadius parameter', () {
      const borderRadius = BorderRadius.all(Radius.circular(8));
      final widget = EditableProfileData(
        name: 'Test',
        imageUrl: null,
        onSubmit: (name, image) async {},
        avatarBorderRadius: borderRadius,
      );
      expect(widget.avatarBorderRadius, borderRadius);
    });

    test('stores editable parameter', () {
      final widget = EditableProfileData(
        name: 'Test',
        imageUrl: null,
        onSubmit: (name, image) async {},
        editable: false,
      );
      expect(widget.editable, isFalse);
    });

    test('defaults editable to true', () {
      final widget = EditableProfileData(
        name: 'Test',
        imageUrl: null,
        onSubmit: (name, image) async {},
      );
      expect(widget.editable, isTrue);
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(EditableProfileData), findsOneWidget);
    });

    testWidgets('renders Row', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('displays name', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Test Name'), findsOneWidget);
    });

    testWidgets('renders ClerkAvatar', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkAvatar), findsOneWidget);
    });

    testWidgets('renders SizedBox', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('renders Stack', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('renders Expanded', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Expanded), findsOneWidget);
    });

    testWidgets('renders Text when not editing', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Text), findsWidgets);
      expect(find.text('Test Name'), findsOneWidget);
    });

    testWidgets('renders ClerkRowLabel when editable', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
            editable: true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkRowLabel), findsOneWidget);
    });

    testWidgets('does not render ClerkRowLabel when not editable',
        (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
            editable: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkRowLabel), findsNothing);
    });

    testWidgets('renders GestureDetector', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: EditableProfileData(
            name: 'Test Name',
            imageUrl: null,
            onSubmit: (name, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('enters edit mode when edit label tapped', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: EditableProfileData(
              name: 'Test Name',
              imageUrl: null,
              onSubmit: (name, image) async {},
            ),
          ),
        ),
      );
      await tester.pump();

      // Initially not in edit mode
      expect(find.byType(TextFormField), findsNothing);

      // Tap the edit label
      await tester.tap(find.byType(ClerkRowLabel));
      await tester.pump();

      // Now in edit mode
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('renders TextFormField when editing', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: EditableProfileData(
              name: 'Test Name',
              imageUrl: null,
              onSubmit: (name, image) async {},
            ),
          ),
        ),
      );
      await tester.pump();

      // Enter edit mode
      await tester.tap(find.byType(ClerkRowLabel));
      await tester.pump();

      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('renders check and close icons when editing', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: EditableProfileData(
              name: 'Test Name',
              imageUrl: null,
              onSubmit: (name, image) async {},
            ),
          ),
        ),
      );
      await tester.pump();

      // Enter edit mode
      await tester.tap(find.byType(ClerkRowLabel));
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('exits edit mode when close icon tapped', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: EditableProfileData(
              name: 'Test Name',
              imageUrl: null,
              onSubmit: (name, image) async {},
            ),
          ),
        ),
      );
      await tester.pump();

      // Enter edit mode
      await tester.tap(find.byType(ClerkRowLabel));
      await tester.pump();
      expect(find.byType(TextFormField), findsOneWidget);

      // Tap close icon
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      // Exited edit mode
      expect(find.byType(TextFormField), findsNothing);
    });

    testWidgets('calls onSubmit when check icon tapped', (tester) async {
      var submitCalled = false;
      String? submittedName;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: EditableProfileData(
              name: 'Test Name',
              imageUrl: null,
              onSubmit: (name, image) async {
                submitCalled = true;
                submittedName = name;
              },
            ),
          ),
        ),
      );
      await tester.pump();

      // Enter edit mode
      await tester.tap(find.byType(ClerkRowLabel));
      await tester.pump();

      // Tap check icon
      await tester.tap(find.byIcon(Icons.check));
      await tester.pump();

      expect(submitCalled, isTrue);
      expect(submittedName, 'Test Name');
    });
  });
}
