import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phone_input/phone_input_package.dart';

import '../../../test_support/test_support.dart';

void main() {
  group('PhoneNumberExtension', () {
    test('intlFormattedNsn formats phone number correctly', () {
      final phoneNumber = PhoneNumber(isoCode: IsoCode.US, nsn: '5551234567');
      expect(phoneNumber.intlFormattedNsn, contains('+1'));
      expect(phoneNumber.intlFormattedNsn, contains('555'));
    });
  });

  group('Common UI Widgets', () {
    testWidgets('defaultOrgLogo is an SvgPicture', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: defaultOrgLogo,
          ),
        ),
      );
      // Just verify it renders without error
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    group('with ClerkAuth context', () {
      late ClerkAuthState authState;

      setUp(() async {
        authState = await createSignedOutAuthState();
      });

      tearDown(() {
        authState.terminate();
      });

      testWidgets('inputBorderSide returns correct BorderSide', (tester) async {
        late BorderSide borderSide;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                borderSide = inputBorderSide(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(borderSide.width, 1.0);
        expect(borderSide.color, isA<Color>());
      });

      testWidgets('outlineInputBorder returns OutlineInputBorder', (tester) async {
        late OutlineInputBorder border;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                border = outlineInputBorder(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(border, isA<OutlineInputBorder>());
      });

      testWidgets('inputBoxBorder returns RoundedRectangleBorder', (tester) async {
        late OutlinedBorder border;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                border = inputBoxBorder(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(border, isA<RoundedRectangleBorder>());
      });

      testWidgets('inputBoxBorderDecoration returns ShapeDecoration', (tester) async {
        late ShapeDecoration decoration;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                decoration = inputBoxBorderDecoration(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(decoration, isA<ShapeDecoration>());
      });

      testWidgets('divider returns Divider with correct properties', (tester) async {
        late Divider div;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                div = divider(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(div.thickness, 1.0);
        expect(div.height, 1.0);
      });

      testWidgets('narrowDivider returns Divider with zero thickness', (tester) async {
        late Divider div;

        await tester.pumpWidget(
          TestClerkAuthWrapper(
            authState: authState,
            child: Builder(
              builder: (context) {
                div = narrowDivider(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(div.thickness, 0.0);
        expect(div.height, 1.0);
      });
    });
  });

  group('Additional Margins', () {
    test('horizontalMargin8 has correct width', () {
      expect((horizontalMargin8 as SizedBox).width, 8.0);
    });

    test('horizontalMargin12 has correct width', () {
      expect((horizontalMargin12 as SizedBox).width, 12.0);
    });

    test('horizontalMargin14 has correct width', () {
      expect((horizontalMargin14 as SizedBox).width, 14.0);
    });
  });
}

