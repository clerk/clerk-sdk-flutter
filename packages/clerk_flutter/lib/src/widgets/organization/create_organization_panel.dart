import 'dart:io';

import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/clerk_auth_state.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_vertical_card.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

/// A transport class for [Organization] meta data
class OrganizationData {
  /// name
  String name = '';

  /// slug
  String slug = '';

  /// Logo file
  File? image;
}

/// The [CreateOrganizationPanel] component is used to render an organization
/// creation UI that allows users to create brand new organizations within
/// your application.
///
@immutable
class CreateOrganizationPanel extends StatefulWidget {
  /// Constructs a const [CreateOrganizationPanel].
  const CreateOrganizationPanel._({
    required this.authState,
  });

  /// An injected [ClerkAuthState]
  final ClerkAuthState authState;

  /// Display an input box containing a [CreateOrganizationPanel]
  static Future<OrganizationData?> show(BuildContext context) async {
    final authState = ClerkAuth.of(context, listen: false);
    return await showDialog(
      context: context,
      builder: (_) => CreateOrganizationPanel._(authState: authState),
    );
  }

  @override
  State<CreateOrganizationPanel> createState() =>
      _CreateOrganizationPanelState();
}

class _CreateOrganizationPanelState extends State<CreateOrganizationPanel> {
  final _data = OrganizationData();

  Future<void> _chooseImage(
    BuildContext context, {
    ImageSource source = ImageSource.camera,
  }) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (context.mounted && image != null) {
      setState(() => _data.image = File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    return Padding(
      padding: allPadding16 + MediaQuery.viewInsetsOf(context),
      child: Center(
        child: ClerkVerticalCard(
          topPortion: Padding(
            padding: allPadding24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localizations.createOrganization,
                  style: ClerkTextStyle.title,
                  maxLines: 1,
                ),
                verticalMargin32,
                Text(
                  localizations.logo,
                  style: ClerkTextStyle.subtitle,
                  maxLines: 1,
                ),
                verticalMargin10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _chooseImage(context),
                      child: SizedBox.square(
                        dimension: 64,
                        child: _data.image is File
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.file(
                                  _data.image!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SvgPicture.asset(
                                ClerkAssets.uploadLogoPlaceholder,
                                package: 'clerk_flutter',
                              ),
                      ),
                    ),
                    horizontalMargin16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 40,
                                child: ClerkMaterialButton(
                                  style: ClerkMaterialButtonStyle.light,
                                  onPressed: () => _chooseImage(context),
                                  label: const Icon(
                                    Icons.camera_alt,
                                    color: ClerkColors.midGrey,
                                  ),
                                ),
                              ),
                              horizontalMargin8,
                              SizedBox(
                                height: 20,
                                width: 40,
                                child: ClerkMaterialButton(
                                  style: ClerkMaterialButtonStyle.light,
                                  onPressed: () => _chooseImage(
                                    context,
                                    source: ImageSource.gallery,
                                  ),
                                  label: const Icon(
                                    Icons.collections,
                                    color: ClerkColors.midGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalMargin10,
                          Text(
                            localizations.recommendSize,
                            maxLines: 2,
                            style: ClerkTextStyle.buttonTitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalMargin28,
                ClerkTextFormField(
                  label: localizations.name,
                  onChanged: (name) => _data.name = name,
                ),
                verticalMargin28,
                ClerkTextFormField(
                  label: localizations.slugUrl,
                  onChanged: (slug) => _data.slug = slug,
                ),
                verticalMargin28,
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 150.0,
                    child: ClerkMaterialButton(
                      onPressed: () => Navigator.of(context).pop(_data),
                      label: Text(localizations.createOrganization),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
