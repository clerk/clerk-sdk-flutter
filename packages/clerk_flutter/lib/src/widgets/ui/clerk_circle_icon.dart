import 'dart:math' as math;

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A [ClerkCircleIcon] displays an icon inside a coloured
/// circle, with a potentially dashed border
///
class ClerkCircleIcon extends StatelessWidget {
  /// Construct a [ClerkCircleIcon]
  const ClerkCircleIcon({
    super.key,
    required this.icon,
    this.color = ClerkColors.stormGrey,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
    this.dashLength = 0,
    this.diameter = 24,
    this.gapLength,
  });

  /// The [IconData] to display
  final IconData icon;

  /// The colour of the icon
  final Color color;

  /// Background colour to the icon
  final Color backgroundColor;

  /// Colour for border, if different
  /// to [color]
  final Color? borderColor;

  /// The length of each dash
  final double dashLength;

  /// The diameter of the circle
  final double diameter;

  /// The minimum length of gaps between dashes
  /// Will default to same as [dashLength]
  final double? gapLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: diameter,
      child: CustomPaint(
        painter: _DottedBorderPainter(
          color: borderColor ?? color,
          backgroundColor: backgroundColor,
          dashLength: dashLength,
          gapLength: gapLength ?? dashLength,
        ),
        child: Icon(icon, size: diameter * 2 / 3, color: color),
      ),
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  _DottedBorderPainter({
    required Color color,
    Color backgroundColor = Colors.transparent,
    this.dashLength = 0,
    this.gapLength = 0,
  })  : assert(
          dashLength > 0 || gapLength == 0,
          'dashLength cannot be 0 or less unless gapLength is 0',
        ),
        _paint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color,
        _backgroundPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = backgroundColor;

  final double dashLength;
  final double gapLength; // actually, minimum gap length

  final Paint _paint;
  final Paint _backgroundPaint;

  static const _twoPi = 2 * math.pi;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final radius = rect.width / 2;

    if (_backgroundPaint.color.alpha > 0) {
      canvas.drawCircle(rect.center, radius, _backgroundPaint);
    }

    if (_paint.color.alpha > 0) {
      if (gapLength == 0) {
        canvas.drawCircle(rect.center, radius, _paint);
      } else {
        final gapDash = dashLength + gapLength;
        final circumference = _twoPi * radius;
        final numDashes = circumference ~/ gapDash;
        final gapDashArc = _twoPi / numDashes;
        final dashArc = dashLength / radius;
        for (int i = 0; i < numDashes; ++i) {
          canvas.drawArc(rect, i * gapDashArc, dashArc, false, _paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
