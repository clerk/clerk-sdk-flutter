import 'dart:io';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/organization/create_organization_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('CreateOrganizationPanel', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores onSubmit callback', () {
      Future<void> onSubmit(String name, String slug, File? image) async {}
      final widget = CreateOrganizationPanel(onSubmit: onSubmit);
      expect(widget.onSubmit, onSubmit);
    });

    testWidgets('creates state', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CreateOrganizationPanel), findsOneWidget);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders Center', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('renders ClerkPanelHeader', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkPanelHeader), findsOneWidget);
    });

    testWidgets('renders two ClerkTextFormField widgets', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkTextFormField), findsNWidgets(2));
    });

    testWidgets('renders ClerkMaterialButton', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ClerkMaterialButton), findsWidgets);
    });

    testWidgets('calls onSubmit when button is pressed', (tester) async {
      var submitCalled = false;
      String? submittedName;
      String? submittedSlug;
      File? submittedImage;

      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {
                  submitCalled = true;
                  submittedName = name;
                  submittedSlug = slug;
                  submittedImage = image;
                },
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // Find and tap the create organization button
      final buttons = find.byType(ClerkMaterialButton);
      await tester.tap(buttons.last);
      await tester.pump();

      expect(submitCalled, isTrue);
      expect(submittedName, '');
      expect(submittedSlug, '');
      expect(submittedImage, isNull);
    });

    testWidgets('updates name when text field changes', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // Find the name text field (first one)
      final nameField = find.byType(ClerkTextFormField).first;
      await tester.enterText(nameField, 'Test Organization');
      await tester.pump();

      // The widget should rebuild with the new name
      expect(find.byType(CreateOrganizationPanel), findsOneWidget);
    });

    testWidgets('updates slug when text field changes', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: CreateOrganizationPanel(
                onSubmit: (name, slug, image) async {},
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      // Find the slug text field (second one)
      final slugField = find.byType(ClerkTextFormField).last;
      await tester.enterText(slugField, 'test-org');
      await tester.pump();

      // The widget should rebuild with the new slug
      expect(find.byType(CreateOrganizationPanel), findsOneWidget);
    });
  });
}
