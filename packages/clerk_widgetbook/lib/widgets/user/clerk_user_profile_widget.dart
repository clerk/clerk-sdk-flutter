import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:clerk_widgetbook/use_case_frame.dart';

@widgetbook.UseCase(name: 'User', type: ClerkUserProfileWidget)
Widget buildClerkUserProfileWidgetUseCase(BuildContext context) {
  return const UseCaseFrame(
    child: ClerkUserProfileWidget(),
  );
}
