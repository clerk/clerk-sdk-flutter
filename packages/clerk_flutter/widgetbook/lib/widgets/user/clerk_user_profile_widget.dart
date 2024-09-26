import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

@widgetbook.UseCase(name: 'User', type: ClerkUserProfileWidget)
Widget buildClerkUserProfileWidgetUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: ClerkUserProfileWidget(),
  );
}
