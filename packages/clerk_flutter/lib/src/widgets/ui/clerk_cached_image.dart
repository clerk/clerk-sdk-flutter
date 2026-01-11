import 'dart:io';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// A widget that returns an image using the [ClerkAuthState] file cache
///
class ClerkCachedImage extends StatelessWidget {
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

  static const _inversionFilter = ColorFilter.matrix(
    [-1, 0, 0, 0, 255, 0, -1, 0, 0, 255, 0, 0, -1, 0, 255, 0, 0, 0, 1, 0],
  );

  Widget _invert(BuildContext context, Widget child, int? _, bool __) =>
      ColorFiltered(colorFilter: _inversionFilter, child: child);

  @override
  Widget build(BuildContext context) {
    final cache = ClerkAuth.fileCacheOf(context);
    return StreamBuilder(
      stream: cache.stream(uri),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.hasData) {
          return Image.file(
            snapshot.data!,
            height: height,
            width: width,
            fit: fit,
            frameBuilder: invertColors ? _invert : null,
          );
        }

        return SizedBox(width: width, height: height);
      },
    );
  }
}
