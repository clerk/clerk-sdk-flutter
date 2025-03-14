import 'dart:io';

import 'package:clerk_flutter/src/widgets/control/clerk_auth.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_avatar.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_row_label.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// A [Function] that accepts and acts on edited data
typedef EditableDataSubmitter = Future<void> Function(String name, File? image);

/// A widget that allows user or organization profile data to
/// be edited
///
class EditableProfileData extends StatefulWidget {
  /// Construct an [EditableProfileData]
  const EditableProfileData({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onSubmit,
    this.avatarBorderRadius,
    this.editable = true,
  });

  /// profile name
  final String name;

  /// profile imageUrl
  final String? imageUrl;

  /// The callback to which to submit edited data
  final EditableDataSubmitter onSubmit;

  /// A [BorderRadius] to apply to the avatar
  final BorderRadius? avatarBorderRadius;

  /// can we edit this data?
  final bool editable;

  @override
  State<EditableProfileData> createState() => _EditableProfileDataState();
}

class _EditableProfileDataState extends State<EditableProfileData> {
  bool isEditing = false;

  late final TextEditingController _controller;
  File? image;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _chooseImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (context.mounted && image != null) {
      setState(() => this.image = File(image.path));
    }
  }

  Future<void> _update([_]) async {
    await widget.onSubmit(_controller.text, image);
    if (context.mounted) {
      setState(() => isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox.square(
          dimension: 32,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClerkAvatar(
                name: widget.name,
                imageUrl: widget.imageUrl,
                borderRadius: widget.avatarBorderRadius,
                file: image,
              ),
              if (isEditing) ...[
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: _ImageUploadButton(
                    icon: Icons.camera_alt,
                    onChooseImage: () {
                      _chooseImage(context, ImageSource.camera);
                    },
                  ),
                ),
                Positioned(
                  bottom: -4,
                  left: -4,
                  child: _ImageUploadButton(
                    icon: Icons.image,
                    onChooseImage: () {
                      _chooseImage(context, ImageSource.gallery);
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
        if (isEditing) //
          horizontalMargin4
        else //
          horizontalMargin12,
        Expanded(
          child: isEditing
              ? TextFormField(
                  controller: _controller,
                  style: ClerkTextStyle.inputLabel,
                  autofocus: true,
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    border: outlineInputBorder,
                    contentPadding: horizontalPadding8,
                  ),
                  onFieldSubmitted: _update,
                )
              : Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ClerkTextStyle.inputLabel,
                ),
        ),
        if (widget.editable) ...[
          horizontalMargin8,
          if (isEditing) ...[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _update,
              child: const Icon(Icons.check, size: 16),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => isEditing = false),
              child: const Icon(Icons.close, size: 16),
            )
          ] else
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => isEditing = true),
              child: ClerkRowLabel(label: localizations.edit),
            ),
        ],
      ],
    );
  }
}

class _ImageUploadButton extends StatelessWidget {
  const _ImageUploadButton({
    required this.onChooseImage,
    required this.icon,
  });

  final VoidCallback onChooseImage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onChooseImage,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ClerkColors.dawnPink,
        ),
        child: SizedBox.square(
          dimension: 15,
          child: Icon(
            icon,
            size: 12,
            color: ClerkColors.charcoalGrey,
          ),
        ),
      ),
    );
  }
}
