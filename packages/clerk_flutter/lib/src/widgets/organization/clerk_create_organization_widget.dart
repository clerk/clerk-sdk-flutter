import 'package:clerk_flutter/assets.dart';
import 'package:clerk_flutter/src/common.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///The [ClerkCreateOrganizationWidget] component is used to render an organization creation
/// UI that allows users to create brand new organizations within your application.
///
@immutable
class ClerkCreateOrganizationWidget extends StatelessWidget {
  /// Constructs a const [ClerkCreateOrganizationWidget].
  const ClerkCreateOrganizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClerkVerticalCard(
      topPortion: _TopPortion(),
    );
  }
}

@immutable
class _TopPortion extends StatelessWidget {
  const _TopPortion();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: allPadding24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Create Organization', style: ClerkTextStyle.title, maxLines: 1),
          verticalMargin32,
          const Text('Logo', style: ClerkTextStyle.subtitle, maxLines: 1),
          verticalMargin10,
          Row(
            children: [
              SvgPicture.asset(
                ClerkAssets.uploadLogoPlaceholder,
                height: 64.0,
                width: 64.0,
              ),
              horizontalMargin16,
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 70.0,
                        child: ClerkMaterialButton(
                          style: ClerkMaterialButtonStyle.light,
                          label: Text(
                            'Upload',
                            style: TextStyle(color: ClerkColors.darkJungleGreen),
                          ),
                        ),
                      ),
                    ),
                    verticalMargin10,
                    Text(
                      'Recommend size 1:1, up to 5MB.',
                      maxLines: 2,
                      style: ClerkTextStyle.subtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalMargin28,
          const ClerkTextFormField(label: 'Name'),
          verticalMargin28,
          const ClerkTextFormField(label: 'Slug URL'),
          verticalMargin28,
          const Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 150.0,
              child: ClerkMaterialButton(
                label: Text('Create Organization'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
