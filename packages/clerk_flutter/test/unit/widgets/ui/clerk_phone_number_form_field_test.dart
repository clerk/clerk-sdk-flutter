import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/identifier.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_phone_number_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('ClerkPhoneNumberFormField', () {
    late ClerkAuthState authState;

    setUp(() async {
      authState = await createSignedOutAuthState();
    });

    tearDown(() {
      authState.terminate();
    });

    test('stores onChanged callback', () {
      void onChanged(Identifier id) {}
      final widget = ClerkPhoneNumberFormField(onChanged: onChanged);
      expect(widget.onChanged, onChanged);
    });

    test('stores onSubmit callback', () {
      void onSubmit(String value) {}
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        onSubmit: onSubmit,
      );
      expect(widget.onSubmit, onSubmit);
    });

    test('stores label parameter', () {
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        label: 'Phone Number',
      );
      expect(widget.label, 'Phone Number');
    });

    test('stores isOptional parameter', () {
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        isOptional: true,
      );
      expect(widget.isOptional, isTrue);
    });

    test('defaults isOptional to false', () {
      final widget = ClerkPhoneNumberFormField(onChanged: (id) {});
      expect(widget.isOptional, isFalse);
    });

    test('stores isMissing parameter', () {
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        isMissing: true,
      );
      expect(widget.isMissing, isTrue);
    });

    test('defaults isMissing to false', () {
      final widget = ClerkPhoneNumberFormField(onChanged: (id) {});
      expect(widget.isMissing, isFalse);
    });

    test('stores initial parameter', () {
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        initial: '+1234567890',
      );
      expect(widget.initial, '+1234567890');
    });

    test('stores focusNode parameter', () {
      final focusNode = FocusNode();
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        focusNode: focusNode,
      );
      expect(widget.focusNode, focusNode);
    });

    test('stores trailing widget', () {
      const trailing = Icon(Icons.phone);
      final widget = ClerkPhoneNumberFormField(
        onChanged: (id) {},
        trailing: trailing,
      );
      expect(widget.trailing, trailing);
    });

    testWidgets('renders Column', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: ClerkPhoneNumberFormField(onChanged: null),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('renders InputLabel', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: ClerkPhoneNumberFormField(
                onChanged: null,
                label: 'Phone',
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(InputLabel), findsOneWidget);
    });

    testWidgets('renders DecoratedBox', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: ClerkPhoneNumberFormField(onChanged: null),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(DecoratedBox), findsWidgets);
    });

    testWidgets('displays label text', (tester) async {
      await tester.pumpWidget(
        TestClerkAuthWrapper(
          authState: authState,
          child: const Scaffold(
            body: SingleChildScrollView(
              child: ClerkPhoneNumberFormField(
                onChanged: null,
                label: 'Phone Number',
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Phone Number'), findsOneWidget);
    });
  });
}

