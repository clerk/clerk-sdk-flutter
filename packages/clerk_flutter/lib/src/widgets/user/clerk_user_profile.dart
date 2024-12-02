import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// [ClerkUserProfile] displays user details
/// and allows their editing
///

class ClerkUserProfile extends StatelessWidget {
  /// Construct a [ClerkUserProfile]
  const ClerkUserProfile({super.key});

  static const _paddedDivider = Padding(padding: hor32ver20, child: divider);

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);

    return ClerkPanel(
      child: ClerkAuthBuilder(
          builder: (_, __) => emptyWidget,
          signedInBuilder: (context, auth) {
            final user = auth.user!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalMargin32,
                Padding(
                  padding: horizontalPadding32,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      translator.translate('Profile details'),
                      maxLines: 1,
                      style: ClerkTextStyle.title,
                    ),
                  ),
                ),
                _paddedDivider,
                _ProfileRow(
                  title: translator.translate('Profile'),
                  child: _EditableUserData(user: user),
                ),
                _paddedDivider,
                _ProfileRow(
                  title: translator.translate('Email address'),
                  child: _IdentifierData(
                    user: user,
                    identifiers: user.emailAddresses,
                    addLine: translator.translate('Add email address'),
                  ),
                ),
                _paddedDivider,
                _ProfileRow(
                  title: translator.translate('Phone numbers'),
                  child: _IdentifierData(
                    user: user,
                    identifiers: user.phoneNumbers,
                    addLine: translator.translate('Add phone number'),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class _IdentifierData extends StatelessWidget {
  const _IdentifierData({
    required this.user,
    required this.addLine,
    this.identifiers,
  });

  final clerk.User user;
  final List<clerk.UserIdentifyingData>? identifiers;
  final String addLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (identifiers case List<clerk.UserIdentifyingData> identifiers)
          for (final identifier in identifiers) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    identifier.identifier,
                    maxLines: 2,
                  ),
                ),
                if (user.isPrimary(identifier))
                  const Padding(
                    padding: leftPadding4,
                    child: Icon(Icons.check, size: 16),
                  ),
              ],
            ),
            verticalMargin20,
          ],
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10),
            horizontalMargin12,
            Text(
              addLine,
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPadding32,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text(title, maxLines: 2)),
          Expanded(flex: 3, child: child),
        ],
      ),
    );
  }
}

class _EditableUserData extends StatefulWidget {
  const _EditableUserData({required this.user});

  final clerk.User user;

  @override
  State<_EditableUserData> createState() => _EditableUserDataState();
}

class _EditableUserDataState extends State<_EditableUserData> {
  bool isEditing = false;

  late final TextEditingController _controller;
  File? image;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.user.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _chooseImage(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image case XFile image) {
      setState(() => this.image = File(image.path));
    }
  }

  Future<void> _update([_]) async {
    if (isEditing) {
      final auth = ClerkAuth.above(context);
      if (_controller.text != widget.user.name) {
        await auth.updateUserName(_controller.text);
      }
      if (image case File image) {
        await auth.updateUserImage(image);
      }
    }
    setState(() => isEditing = !isEditing);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox.square(
          dimension: 32,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClerkAvatar(user: widget.user, file: image),
              if (isEditing)
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _chooseImage(context),
                    child: const ClerkCircleIcon(
                      diameter: 16,
                      icon: Icons.camera_alt,
                      color: ClerkColors.charcoalGrey,
                      backgroundColor: ClerkColors.white,
                      borderColor: Colors.transparent,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (isEditing) horizontalMargin4 else horizontalMargin12,
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
                  widget.user.name,
                  maxLines: 1,
                  style: ClerkTextStyle.inputLabel,
                ),
        ),
        horizontalMargin8,
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _update,
          child: Icon(isEditing ? Icons.check : Icons.edit, size: 16),
        ),
        if (isEditing)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => isEditing = false),
            child: const Icon(Icons.close, size: 16),
          ),
      ],
    );
  }
}
