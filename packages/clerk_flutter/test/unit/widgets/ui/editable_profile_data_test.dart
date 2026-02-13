import 'dart:io';

import 'package:clerk_flutter/clerk_flutter.dart';
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
      Future<void> onSubmit(String name, File? image) async {}
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
  });
}

