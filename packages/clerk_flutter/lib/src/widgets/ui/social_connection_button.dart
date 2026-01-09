import 'dart:async';
import 'dart:ui' as ui;

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/clerk_theme.dart';
import 'package:flutter/material.dart';

/// The [SocialConnectionButton] is to be used with the authentication flow when working with
/// a an oAuth provider. When there is sufficient space, an [Icon] and [Text] description of
/// the provider. Else, just the [Icon].
///

@immutable
class SocialConnectionButton extends StatelessWidget {
  /// Constructs a new [SocialConnectionButton].
  const SocialConnectionButton({
    super.key,
    required this.connection,
    required this.onPressed,
  });

  /// Function to call when a strategy chosen
  final VoidCallback onPressed;

  /// The oAuth provider this button represents.
  final clerk.SocialConnection connection;

  @override
  Widget build(BuildContext context) {
    final cache = ClerkAuth.fileCacheOf(context);
    final themeExtension = ClerkAuth.themeExtensionOf(context);
    return MaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius4,
        side: BorderSide(color: themeExtension.colors.borderSide),
      ),
      padding: allPadding12,
      textColor: themeExtension.colors.lightweightText,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final logo = SizedBox.square(
            dimension: 12,
            child: Center(
              child: connection.logoUrl.isNotEmpty
                  ? _ConnectionLogo(
                      key: ValueKey<clerk.SocialConnection>(connection),
                      url: connection.logoUrl,
                      themeExtension: themeExtension,
                      cache: cache,
                    )
                  : Text(
                      connection.name.initials,
                      textAlign: TextAlign.center,
                      style: themeExtension.styles.heading.copyWith(
                        height: .1,
                        fontSize: 16,
                      ),
                    ),
            ),
          );
          if (constraints.maxWidth < 100.0) {
            return logo;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              horizontalMargin8,
              Text(
                connection.name,
                maxLines: 1,
                style: themeExtension.styles.text,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ConnectionLogo extends StatelessWidget {
  _ConnectionLogo({
    super.key,
    required this.url,
    required this.themeExtension,
    required this.cache,
  }) {
    _loadLogo();
  }

  final ClerkThemeExtension themeExtension;

  final ClerkFileCache cache;

  final String url;

  final _completer = Completer<Image>();

  static const _brightnessThreshold = 0.2;

  Future<void> _loadLogo() async {
    final file = await cache.stream(Uri.parse(url)).first;
    final bytes = await file.readAsBytes();
    final codec =
        await ui.instantiateImageCodec(bytes, targetWidth: 4, targetHeight: 4);
    final image = (await codec.getNextFrame()).image;
    final imageBytes = await image.toByteData();

    // we've got what we want now, so...
    codec.dispose();
    image.dispose();

    double r = 0, b = 0, g = 0, count = 0;
    for (final value in imageBytes!.buffer.asUint32List()) {
      final opacity = (value & 0xff000000) / 0xff000000;
      if (opacity > 0) {
        r += ((value & 0x00ff0000) >> 16) * opacity * (0.299 / 255.0);
        g += ((value & 0x0000ff00) >> 8) * opacity * (0.587 / 255.0);
        b += (value & 0x000000ff) * opacity * (0.114 / 255.0);
        count++;
      }
    }
    final result = (r + b + g) / count;
    final textColor = themeExtension.colors.text;
    final color = switch (themeExtension.brightness) {
      Brightness.light when result > 1 - _brightnessThreshold => textColor,
      Brightness.dark when result < _brightnessThreshold => textColor,
      _ => null,
    };

    _completer.complete(
      Image.memory(bytes, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _completer.future,
      builder: (context, snapshot) => snapshot.data ?? emptyWidget,
    );
  }
}
