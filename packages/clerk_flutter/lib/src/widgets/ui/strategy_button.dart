import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// The [StrategyButton] is to be used with the authentication flow when working with
/// a an non-oAuth strategy
@immutable
class StrategyButton extends StatelessWidget {
  /// Constructs a new [StrategyButton].
  const StrategyButton({
    super.key,
    required this.strategy,
    required this.onClick,
  });

  /// The oAuth provider this button represents.
  final clerk.Strategy strategy;

  /// The function called when a button is tapped
  final VoidCallback onClick;

  /// details for strategies we support
  static const _descriptors = {
    clerk.Strategy.emailLink: _StrategyDescriptor(
      icon: Icons.email_outlined,
      title: 'Sign in by clicking a link sent to you by email',
    ),
    clerk.Strategy.emailCode: _StrategyDescriptor(
      icon: Icons.email_outlined,
      title: 'Sign in by entering a code sent to you by email',
    ),
    clerk.Strategy.phoneCode: _StrategyDescriptor(
      icon: Icons.phone_android_outlined,
      title: 'Sign in by entering a code sent to you by text message',
    ),
  };

  /// boolean to say whether the [strategy] can be displayed
  /// by this widget
  static bool supports(clerk.Strategy strategy) =>
      _descriptors[strategy] is _StrategyDescriptor;

  @override
  Widget build(BuildContext context) {
    final descriptor = _descriptors[strategy];
    if (descriptor is! _StrategyDescriptor) {
      return emptyWidget;
    }

    final translator = ClerkAuth.translatorOf(context);

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: MaterialButton(
            onPressed: onClick,
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
              borderRadius: borderRadius4,
              side: BorderSide(color: ClerkColors.dawnPink),
            ),
            child: Padding(
              padding: verticalPadding4,
              child: Icon(descriptor.icon, color: ClerkColors.midGrey),
            ),
          ),
        ),
        horizontalMargin8,
        Expanded(
          child: Text(
            translator.translate(descriptor.title),
            maxLines: 1,
            style: ClerkTextStyle.buttonTitle,
          ),
        )
      ],
    );
  }
}

class _StrategyDescriptor {
  const _StrategyDescriptor({required this.icon, required this.title});

  final IconData icon;
  final String title;
}
