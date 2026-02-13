import 'dart:io';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/organization/create_organization_panel.dart';
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
          child: CreateOrganizationPanel(
            onSubmit: (name, slug, image) async {},
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
          child: CreateOrganizationPanel(
            onSubmit: (name, slug, image) async {},
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
          child: CreateOrganizationPanel(
            onSubmit: (name, slug, image) async {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Center), findsWidgets);
    });
  });
}

