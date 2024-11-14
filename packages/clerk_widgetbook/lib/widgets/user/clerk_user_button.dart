import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User', type: ClerkUserButton)
Widget buildClerkUserButtonUseCase(BuildContext context) {
  final quadrant = context.knobs.list<_Quadrant>(
    label: 'Quadrant',
    initialOption: _Quadrant.topLeft,
    options: _Quadrant.values,
    labelBuilder: (_Quadrant quadrant) => quadrant.name,
  );
  return Align(
    alignment: switch (quadrant) {
      _Quadrant.topLeft => Alignment.topLeft,
      _Quadrant.topRight => Alignment.topRight,
      _Quadrant.bottomRight => Alignment.bottomRight,
      _Quadrant.bottomLeft => Alignment.bottomLeft,
    },
    child: Padding(
      padding: switch (quadrant) {
        _Quadrant.topLeft => const EdgeInsets.only(left: 16.0, top: 16.0),
        _Quadrant.topRight => const EdgeInsets.only(right: 16.0, top: 16.0),
        _Quadrant.bottomRight => const EdgeInsets.only(right: 16.0, bottom: 16.0),
        _Quadrant.bottomLeft => const EdgeInsets.only(left: 16.0, bottom: 16.0),
      },
      child: const ClerkUserButton(),
    ),
  );
}

enum _Quadrant { topLeft, topRight, bottomRight, bottomLeft }
