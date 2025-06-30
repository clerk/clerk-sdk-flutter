import 'dart:io';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/widgets.dart';

/// A widget that returns an image using the [ClerkAuthState] file cache
///
class ClerkCachedImage extends StatelessWidget {
  const ClerkCachedImage._(
    Key? key,
    this.uri,
    this.fit,
    this.width,
    this.height,
  ) : super(key: key);

  /// Constructor
  factory ClerkCachedImage(
    String url, {
    Key? key,
    BoxFit? fit,
    double? width,
    double? height,
  }) {
    final uri = Uri.parse(url);
    return ClerkCachedImage._(key, uri, fit, width, height);
  }

  /// The [uri] of the image
  final Uri uri;

  /// The optional [fit] of the image
  final BoxFit? fit;

  /// The optional [width] of the image
  final double? width;

  /// The optional [height] of the image
  final double? height;

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
          );
        }

        return SizedBox(width: width, height: height);
      },
    );
  }
}
