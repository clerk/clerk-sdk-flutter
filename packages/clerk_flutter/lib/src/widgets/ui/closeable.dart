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
    required this.closed,
    this.child,
    this.duration = _defaultDuration,
    this.axis = ClosingAxis.vertical,
    this.alignment = Alignment.topLeft,
    this.curve = Curves.linear,
    this.onEnd,
  });

  /// Animation's [Duration]
  final Duration duration;

  /// Animation's [Curve]
  final Curve curve;

  /// Child [Widget] to be displayed in the panel
  final Widget? child;

  /// Axis of animation
  final ClosingAxis axis;

  /// Alignment of child widget within the panel
  final Alignment alignment;

  /// is the panel closed?
  final bool closed;

  /// optional function to call when closing or opening has
  /// finished animating
  final ValueChanged<bool>? onEnd;

  @override
  Widget build(BuildContext context) {
    final value = closed ? 0.0 : 1.0;
    return IgnorePointer(
      ignoring: closed,
      child: ClipRect(
        child: AnimatedAlign(
          duration: duration,
          curve: curve,
          alignment: alignment,
          heightFactor: axis.isVertical ? value : null,
          widthFactor: axis.isHorizontal ? value : null,
          onEnd: () => onEnd?.call(closed),
          child: child,
        ),
      ),
    );
  }
}

/// A version of [Closeable] that will animate to its state
/// from the other on first render
///
class AnimatedCloseable extends StatefulWidget {
  /// Construct an [AnimatedCloseable]
  const AnimatedCloseable({
    super.key,
    required this.closed,
    this.child,
    this.duration = _defaultDuration,
    this.axis = ClosingAxis.vertical,
    this.alignment = Alignment.topLeft,
    this.curve = Curves.linear,
    this.onEnd,
  });

  /// Animation's [Duration]
  final Duration duration;

  /// Animation's [Curve]
  final Curve curve;

  /// Child [Widget] to be displayed in the panel
  final Widget? child;

  /// Axis of animation
  final ClosingAxis axis;

  /// Alignment of child widget within the panel
  final Alignment alignment;

  /// is the panel closed?
  final bool closed;

  /// optional function to call when closing or opening has
  /// finished animating
  final ValueChanged<bool>? onEnd;

  @override
  State<AnimatedCloseable> createState() => _AnimatedCloseableState();
}

class _AnimatedCloseableState extends State<AnimatedCloseable> {
  late bool closed = widget.closed == false;

  void _update() {
    if (closed != widget.closed) {
      setState(() => closed = widget.closed);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _update);
  }

  @override
  void didUpdateWidget(covariant AnimatedCloseable oldWidget) {
    super.didUpdateWidget(oldWidget);
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Closeable(
      closed: closed,
      curve: widget.curve,
      duration: widget.duration,
      axis: widget.axis,
      alignment: widget.alignment,
      onEnd: widget.onEnd,
      child: widget.child,
    );
  }
}
