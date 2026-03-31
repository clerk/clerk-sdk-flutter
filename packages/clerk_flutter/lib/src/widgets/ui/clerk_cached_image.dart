import 'dart:typed_data';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A widget that returns an image using the [ClerkAuthState] file cache
///
class ClerkCachedImage extends StatefulWidget {
  const ClerkCachedImage._(
    Key? key,
    this.uri,
    this.fit,
    this.width,
    this.height,
    this.invertColors,
  ) : super(key: key);

  /// Constructor
  factory ClerkCachedImage(
    String url, {
    Key? key,
    BoxFit? fit,
    double? width,
    double? height,
    Color? color,
    bool invertColors = false,
  }) {
    final uri = Uri.parse(url);
    return ClerkCachedImage._(key, uri, fit, width, height, invertColors);
  }

  /// The [uri] of the image
  final Uri uri;

  /// The optional [fit] of the image
  final BoxFit? fit;

  /// The optional [width] of the image
  final double? width;

  /// The optional [height] of the image
  final double? height;

  /// Should the image be rendered as monochrome?
  final bool invertColors;

  @override
  State<ClerkCachedImage> createState() => _ClerkCachedImageState();
}

class _ClerkCachedImageState extends State<ClerkCachedImage> {
  static const _inversionFilter = ColorFilter.matrix([
    -1, 0, 0, 0, 255, //
    0, -1, 0, 0, 255, //
    0, 0, -1, 0, 255, //
    0, 0, 0, 1, 0, //
  ]);

  Stream<Uint8List>? _stream;

  Widget _invert(BuildContext context, Widget child, int? _, bool __) =>
      ColorFiltered(colorFilter: _inversionFilter, child: child);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_stream == null) {
      final cache = ClerkAuth.fileCacheOf(context);
      _stream = cache.stream(widget.uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data!,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
            frameBuilder: widget.invertColors ? _invert : null,
          );
        }

        return SizedBox(width: widget.width, height: widget.height);
      },
    );
  }
}
