import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/utils/clerk_sdk_localization_ext.dart';
import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_material_button.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel_header.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

/// The [CreateOrganizationPanel] component is used to render an organization
/// creation UI that allows users to create brand new organizations within
/// your application.
///
@immutable
class CreateOrganizationPanel extends StatefulWidget {
  /// Constructs a const [CreateOrganizationPanel].
  const CreateOrganizationPanel({super.key, required this.onSubmit});

  /// The function to be called once editing of the
  /// org data has completed
  final Future<void> Function(String, String, File?) onSubmit;

  @override
  State<CreateOrganizationPanel> createState() =>
      _CreateOrganizationPanelState();
}

class _CreateOrganizationPanelState extends State<CreateOrganizationPanel> {
  late final _l10ns = ClerkAuth.localizationsOf(context);
  late final _slugFormatter = TextInputFormatter.withFunction(
    (_, value) => value.copyWith(text: _l10ns.grammar.toSlug(value.text)),
  );

  String _name = '';
  String _slug = '';
  File? _image;

  Future<void> _chooseImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (context.mounted && image != null) {
      setState(() => _image = File(image.path));
    }
  }

  String _generateSlug(String name) {
    name = name.orNullIfEmpty ?? _l10ns.myOrganization;
    return _l10ns.grammar.toSlug(name);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: allPadding24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClerkPanelHeader(
              title: _l10ns.setUpYourOrganization,
              subtitle: _l10ns.enterYourOrganizationDetailsToContinue,
            ),
            Text(
              _l10ns.logo,
              style: ClerkTextStyle.inputBoxLabel,
              maxLines: 1,
            ),
            verticalMargin4,
            _LogoPicker(
              imageFile: _image,
              openPicker: (source) => _chooseImage(context, source),
            ),
            verticalMargin28,
            ClerkTextFormField(
              label: _l10ns.name,
              initial: _name,
              hint: _l10ns.myOrganization,
              onChanged: (name) => setState(() => _name = name),
            ),
            verticalMargin16,
            ClerkTextFormField(
              label: _l10ns.slug,
              initial: _slug,
              hint: _generateSlug(_name),
              inputFormatter: _slugFormatter,
              onChanged: (slug) => _slug = slug,
            ),
            verticalMargin28,
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 150.0,
                child: ClerkMaterialButton(
                  onPressed: () => widget.onSubmit(_name, _slug, _image),
                  label: Text(_l10ns.createOrganization),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoPicker extends StatelessWidget {
  const _LogoPicker({this.imageFile, required this.openPicker});

  final File? imageFile;
  final ValueChanged<ImageSource> openPicker;

  @override
  Widget build(BuildContext context) {
    final l10ns = ClerkAuth.localizationsOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => openPicker(ImageSource.camera),
          child: SizedBox.square(
            dimension: 64,
            child: imageFile is File
                ? ClipRRect(
                    borderRadius: borderRadius4,
                    child: Image.file(
                      imageFile!,
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
                      onPressed: () => openPicker(ImageSource.camera),
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
                      onPressed: () => openPicker(ImageSource.gallery),
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
                l10ns.recommendSize,
                maxLines: 2,
                style: ClerkTextStyle.buttonTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
