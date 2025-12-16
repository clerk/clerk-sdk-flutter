import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_cached_image.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
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
                  ? ClerkCachedImage(connection.logoUrl)
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
