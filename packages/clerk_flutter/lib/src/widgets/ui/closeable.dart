import 'dart:async';

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
class Closeable extends StatefulWidget {
  /// Construct a [Closeable] panel
  const Closeable({
    super.key,
    required this.closed,
    this.animateToFirstPosition = false,
    this.duration = _defaultDuration,
    this.axis = ClosingAxis.vertical,
    this.alignment = Alignment.topLeft,
    this.curve = Curves.linear,
    this.onEnd,
    this.child,
  });

  /// Animation's [Duration]
  final Duration duration;

  /// Animation's [Curve]
  final Curve curve;

  /// Axis of animation
  final ClosingAxis axis;

  /// Alignment of child widget within the panel
  final Alignment alignment;

  /// is the panel closed?
  final bool closed;

  /// Should the panel start closed?
  final bool animateToFirstPosition;

  /// optional function to call when closing or opening has
  /// finished animating
  final ValueChanged<bool>? onEnd;

  /// Child [Widget] to be displayed in the panel
  final Widget? child;

  @override
  State<Closeable> createState() => _CloseableState();
}

class _CloseableState extends State<Closeable> {
  late bool closed =
      widget.animateToFirstPosition ? widget.closed == false : widget.closed;
  late bool _renderChild = closed == false;

  void _update() {
    if (closed != widget.closed) {
      _renderChild = true;
      closed = widget.closed;
    }
  }

  @override
  void initState() {
    super.initState();
    if (closed != widget.closed) {
      scheduleMicrotask(() => setState(_update));
    }
  }

  @override
  void didUpdateWidget(covariant Closeable oldWidget) {
    super.didUpdateWidget(oldWidget);
    _update();
  }

  @override
  Widget build(BuildContext context) {
    final value = closed ? 0.0 : 1.0;
    return IgnorePointer(
      ignoring: closed,
      child: ClipRect(
        child: AnimatedAlign(
          duration: widget.duration,
          curve: widget.curve,
          alignment: widget.alignment,
          heightFactor: widget.axis.isVertical ? value : null,
          widthFactor: widget.axis.isHorizontal ? value : null,
          onEnd: () {
            widget.onEnd?.call(closed);
            if (closed) {
              setState(() => _renderChild = false);
            }
          },
          child: _renderChild ? widget.child : null,
        ),
      ),
    );
  }
}
