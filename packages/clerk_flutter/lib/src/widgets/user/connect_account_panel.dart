import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A screen to allow additional accounts to be signed into
/// after a user has already completed sign in with one account
///
class ConnectAccountPanel extends StatelessWidget {
  /// Create a [ConnectAccountPanel]
  const ConnectAccountPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ClerkVerticalCard(
      topPortion: const _TopPortion(),
      middlePortion: ClerkAuthBuilder(
        builder: (context, auth) {
          return Padding(
            padding: horizontalPadding32 + bottomPadding32,
            child: ClerkSSOPanel(
              onStrategyChosen: (strategy) =>
                  auth.ssoConnect(context, strategy),
            ),
          );
        },
      ),
    );
  }
}

@immutable
class _TopPortion extends StatelessWidget {
  const _TopPortion();

  @override
  Widget build(BuildContext context) {
    final display = ClerkAuth.displayConfigOf(context);
    final translator = ClerkAuth.translatorOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: verticalPadding32,
          child: Center(
            child: SizedBox.square(
              dimension: 32.0,
              child: display.logoUrl?.isNotEmpty == true
                  ? Image.network(display.logoUrl!)
                  : SvgPicture.asset(
                      ClerkAssets.defaultOrganizationLogo,
                      package: 'clerk_flutter',
                    ),
            ),
          ),
        ),
        Padding(
          padding: horizontalPadding32,
          child: Text(
            display.applicationName,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: ClerkTextStyle.title,
          ),
        ),
        Padding(
          padding: horizontalPadding32 + bottomPadding24,
          child: Text(
            translator.translate('Please choose an account to connect'),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: ClerkTextStyle.subtitle,
          ),
        ),
      ],
    );
  }
}
