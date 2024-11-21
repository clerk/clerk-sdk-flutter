import 'package:flutter/material.dart';

const _defaultDuration = Duration(milliseconds: 250);

/// Enum defining the axis or axes along which the panel will close
enum ClosingAxis {
  /// both horizontal and vertical
  both,

  /// horizontal
  horizontal,

  /// vertical
  vertical;

  /// [true] if axis is vertical
  bool get isVertical => this != horizontal;

  /// [true] if axis is horizontal
  bool get isHorizontal => this != vertical;
}

/// [Closeable] provides a widget that will animate to closed or open positions depending
/// on the `open` or `closed` parameter values. One and only one of `open` or `closed` must
/// be provided.
class Closeable extends StatelessWidget {
  /// Construct a [Closeable] panel
  const Closeable({
    super.key,
    bool? closed,
    bool? open,
    required this.child,
    this.duration = _defaultDuration,
    this.axis = ClosingAxis.vertical,
    this.alignment = Alignment.topLeft,
  })  : assert(
          (closed is bool) || (open is bool),
          'One of closed or open required',
        ),
        assert(
          (closed is bool) != (open is bool),
          'Only one of closed or open allowed',
        ),
        _value = (open == true || closed == false) ? 1 : 0;

  /// Animation's [Duration]
  final Duration duration;

  /// Child [Widget] to be displayed in the panel
  final Widget child;

  /// Axis of animation
  final ClosingAxis axis;

  /// Alignment of child widget within the panel
  final Alignment alignment;

  final double _value;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _value == 0,
      child: ClipRect(
        child: AnimatedAlign(
          duration: duration,
          alignment: alignment,
          heightFactor: axis.isVertical ? _value : null,
          widthFactor: axis.isHorizontal ? _value : null,
          child: child,
        ),
      ),
    );
  }
}
