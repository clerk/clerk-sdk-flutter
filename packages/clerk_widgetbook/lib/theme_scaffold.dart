import 'package:flutter/material.dart';

class ThemeScaffold extends StatelessWidget {
  const ThemeScaffold({
    super.key,
    required this.theme,
    required this.child,
  });

  final ThemeData theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final brightness = theme.brightness;
    final bright = brightness == Brightness.light;
    return Scaffold(
      backgroundColor: bright //
          ? Colors.grey
          : Colors.black,
      body: SafeArea(
        child: Center(child: child),
      ),
    );
  }
}
