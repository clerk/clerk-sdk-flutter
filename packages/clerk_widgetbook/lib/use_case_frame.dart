import 'package:flutter/material.dart';

class UseCaseFrame extends StatelessWidget {
  const UseCaseFrame({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: LayoutBuilder(builder: (context, contraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: width ?? contraints.maxWidth,
                height: height ?? contraints.maxHeight,
              ),
              child: child,
            ),
          );
        }),
      ),
    );
  }
}
