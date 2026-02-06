import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Common UI Constants', () {
    group('Margins', () {
      test('horizontalMargin4 has correct width', () {
        const widget = horizontalMargin4;
        expect(widget.width, 4.0);
      });

      test('horizontalMargin16 has correct width', () {
        const widget = horizontalMargin16;
        expect(widget.width, 16.0);
      });

      test('verticalMargin8 has correct height', () {
        const widget = verticalMargin8;
        expect(widget.height, 8.0);
      });

      test('verticalMargin24 has correct height', () {
        const widget = verticalMargin24;
        expect(widget.height, 24.0);
      });
    });

    group('Paddings', () {
      test('horizontalPadding16 has correct values', () {
        expect(horizontalPadding16.left, 16.0);
        expect(horizontalPadding16.right, 16.0);
        expect(horizontalPadding16.top, 0.0);
        expect(horizontalPadding16.bottom, 0.0);
      });

      test('verticalPadding8 has correct values', () {
        expect(verticalPadding8.top, 8.0);
        expect(verticalPadding8.bottom, 8.0);
        expect(verticalPadding8.left, 0.0);
        expect(verticalPadding8.right, 0.0);
      });

      test('allPadding16 has correct values', () {
        expect(allPadding16.top, 16.0);
        expect(allPadding16.bottom, 16.0);
        expect(allPadding16.left, 16.0);
        expect(allPadding16.right, 16.0);
      });

      test('topPadding8 has correct values', () {
        expect(topPadding8.top, 8.0);
        expect(topPadding8.bottom, 0.0);
        expect(topPadding8.left, 0.0);
        expect(topPadding8.right, 0.0);
      });

      test('bottomPadding16 has correct values', () {
        expect(bottomPadding16.bottom, 16.0);
        expect(bottomPadding16.top, 0.0);
      });

      test('leftPadding12 has correct values', () {
        expect(leftPadding12.left, 12.0);
        expect(leftPadding12.right, 0.0);
      });

      test('rightPadding8 has correct values', () {
        expect(rightPadding8.right, 8.0);
        expect(rightPadding8.left, 0.0);
      });

      test('startPadding16 has correct values', () {
        expect(startPadding16.start, 16.0);
        expect(startPadding16.end, 0.0);
      });

      test('endPadding24 has correct values', () {
        expect(endPadding24.end, 24.0);
        expect(endPadding24.start, 0.0);
      });
    });

    group('Border Radius', () {
      test('borderRadius4 has correct value', () {
        expect(borderRadius4.topLeft, const Radius.circular(4.0));
        expect(borderRadius4.bottomRight, const Radius.circular(4.0));
      });

      test('borderRadius12 has correct value', () {
        expect(borderRadius12.topLeft, const Radius.circular(12.0));
        expect(borderRadius12.bottomRight, const Radius.circular(12.0));
      });

      test('borderRadius24 has correct value', () {
        expect(borderRadius24.topLeft, const Radius.circular(24.0));
        expect(borderRadius24.bottomRight, const Radius.circular(24.0));
      });
    });

    group('Empty and Spacer Widgets', () {
      test('emptyWidget is an empty SizedBox', () {
        expect(emptyWidget, isA<SizedBox>());
        expect(emptyWidget.width, isNull);
        expect(emptyWidget.height, isNull);
      });

      test('emptyWidgetWide has infinite width', () {
        expect(emptyWidgetWide, isA<SizedBox>());
        expect(emptyWidgetWide.width, double.infinity);
      });

      test('spacer is a Spacer widget', () {
        expect(spacer, isA<Spacer>());
      });
    });

    group('Column Widths', () {
      test('firstColumnWidth has correct value', () {
        expect(firstColumnWidth, 215.0);
      });

      test('secondColumnWidth has correct value', () {
        expect(secondColumnWidth, 280.0);
      });
    });

    group('Default Loading Widget', () {
      test('defaultLoadingWidget contains CircularProgressIndicator', () {
        expect(defaultLoadingWidget, isA<Center>());
      });
    });
  });
}

