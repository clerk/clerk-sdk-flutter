import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:clerk_widgetbook/use_case_frame.dart';

@widgetbook.UseCase(name: 'Authentication', type: ClerkSignInPanel)
Widget buildClerkSignInWidgetUseCase(BuildContext context) {
  final sizeAdjust = context.knobs.boolean(
    label: 'Adjust Size',
    description: 'Add height and width sliders',
    initialValue: false,
  );
  double? maxHeight, minWidth, maxWidth, height, width;
  if (sizeAdjust) {
    maxHeight = context.knobs.double.input(label: 'max. height', initialValue: 1000.0);
    minWidth = context.knobs.double.input(label: 'min. width', initialValue: 530.0);
    maxWidth = context.knobs.double.input(label: 'max. width', initialValue: 1000.0);
    height = context.knobs.double.slider(
      label: 'height',
      initialValue: 600.0,
      min: 530.0,
      max: maxHeight,
    );
    width = context.knobs.double.slider(
      label: 'width',
      initialValue: 600.0,
      min: minWidth,
      max: maxWidth,
    );
  }
  return UseCaseFrame(
    height: height,
    width: width,
    child: const SizedBox.shrink(), //ClerkSignInWidget(),
  );
}
