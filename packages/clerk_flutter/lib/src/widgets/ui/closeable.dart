import 'package:flutter/material.dart';

const _defaultDuration = Duration(milliseconds: 250);

/// [Closeable] provides a widget that will animate to closed or open positions depending
/// on the `open` or `closed` parameter values. One and only one of `open` or `closed` must
/// be provided.
class Closeable extends StatelessWidget {
  const Closeable({
    super.key,
    bool? closed,
    bool? open,
    required this.child,
    this.duration = _defaultDuration,
    this.orientation = Axis.vertical,
  })  : assert((closed is bool) || (open is bool), 'One of closed or open required'),
        assert((closed is bool) != (open is bool), 'Only one of closed or open allowed'),
        _value = (open == true || closed == false) ? 1 : 0;

  final Duration duration;
  final double _value;
  final Widget child;
  final Axis orientation;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: _value,
      child: ClipRect(
        child: AnimatedAlign(
          duration: duration,
          alignment: Alignment.topLeft,
          heightFactor: orientation == Axis.vertical ? _value : null,
          widthFactor: orientation == Axis.horizontal ? _value : null,
          child: child,
        ),
      ),
    );
  }
}

/// [AnimatingCloseable] provides a closeable widget just like [Closeable]
/// with the minor difference that it animates to its first position from closed
class AnimatingCloseable extends StatefulWidget {
  final Duration duration;
  final bool? open;
  final bool? closed;
  final Widget child;
  final Axis orientation;

  const AnimatingCloseable({
    super.key,
    this.open,
    this.closed,
    required this.child,
    this.duration = _defaultDuration,
    this.orientation = Axis.vertical,
  })  : assert((closed is bool) || (open is bool), 'One of closed or open required'),
        assert((closed is bool) != (open is bool), 'Only one of closed or open allowed');

  @override
  State<AnimatingCloseable> createState() => _AnimatingCloseableState();
}

class _AnimatingCloseableState extends State<AnimatingCloseable> {
  bool? open = false;
  bool? closed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        open = widget.open;
        closed = widget.closed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Closeable(
      duration: widget.duration,
      open: open,
      closed: closed,
      orientation: widget.orientation,
      child: widget.child,
    );
  }
}
