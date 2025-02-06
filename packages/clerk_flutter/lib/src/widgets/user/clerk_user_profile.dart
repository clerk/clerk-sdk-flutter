import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_input/phone_input_package.dart';

/// [ClerkUserProfile] displays user details
/// and allows their editing
///
class ClerkUserProfile extends StatefulWidget {
  /// Construct a [ClerkUserProfile]
  const ClerkUserProfile({super.key});

  @override
  State<ClerkUserProfile> createState() => _ClerkUserProfileState();
}

class _ClerkUserProfileState extends State<ClerkUserProfile>
    with ClerkTelemetryStateMixin {
  bool _validate(String? identifier, clerk.IdentifierType type) {
    if (identifier?.trim() case String identifier when identifier.isNotEmpty) {
      switch (type) {
        case clerk.IdentifierType.emailAddress:
          return EmailValidator.validate(identifier);
        case clerk.IdentifierType.phoneNumber:
          return PhoneNumber.parse(identifier).isValid();
        default:
          throw clerk.AuthError(
            message: "Type '###' invalid",
            substitution: type.name,
          );
      }
    }
    return false;
  }

  Future<void> _verifyIdentifyingData(
    BuildContext context,
    ClerkAuthState auth,
    String identifier,
  ) async {
    final translator = auth.translator;

    final uid = auth.user?.identifierFrom(identifier);
    if (uid case clerk.UserIdentifyingData uid when uid.isUnverified) {
      final title = uid.type.name.replaceAll('_', ' ').capitalized;
      await ClerkInputDialog.show(
        context,
        showOk: false,
        child: ClerkCodeInput(
          title: translator.translate('$title verification'),
          subtitle: translator.translate(
            'Enter the code sent to ###',
            substitution: identifier,
          ),
          onSubmit: (code) async {
            await auth.verifyIdentifyingData(uid, code);
            final newUid = auth.user!.identifierFrom(uid.identifier);
            if (context.mounted) Navigator.of(context).pop(true);
            return newUid?.isVerified == true;
          },
        ),
      );
    }
  }

  Future<void> _addIdentifyingData(
    BuildContext context,
    ClerkAuthState auth,
    clerk.IdentifierType type,
  ) async {
    final authState = ClerkAuth.of(context, listen: false);
    final translator = authState.translator;
    final title = type.name.replaceAll('_', ' ').capitalized;

    String identifier = '';

    final submitted = await ClerkInputDialog.show(
      context,
      child: switch (type) {
        clerk.IdentifierType.emailAddress => ClerkTextFormField(
            label: translator.translate(title),
            autofocus: true,
            onChanged: (text) => identifier = text,
            onSubmit: (_) => Navigator.of(context).pop(true),
            validator: (text) => _validate(text, type),
          ),
        clerk.IdentifierType.phoneNumber => ClerkPhoneNumberFormField(
            label: translator.translate(title),
            onChanged: (text) => identifier = text,
            onSubmit: (_) => Navigator.of(context).pop(true),
          ),
        _ => throw clerk.AuthError(
            message: "Type '###' invalid",
            substitution: type.name,
          ),
      },
    );

    identifier = identifier.trim();

    if (submitted) {
      if (_validate(identifier, type)) {
        await authState.addIdentifyingData(identifier, type);
        if (context.mounted) {
          await _verifyIdentifyingData(context, authState, identifier);
        }
      } else {
        throw clerk.AuthError(
          message: "$title '###' is invalid",
          substitution: identifier,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);

    return ClerkPanel(
      padding: horizontalPadding24,
      child: ClerkAuthBuilder(
        builder: (_, __) => emptyWidget,
        signedInBuilder: (context, auth) {
          final user = auth.user!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalMargin32,
              Text(
                translator.translate('Profile details'),
                maxLines: 1,
                style: ClerkTextStyle.title,
              ),
              const Padding(padding: topPadding16, child: divider),
              Expanded(
                child: ListView(
                  children: [
                    _ProfileRow(
                      title: translator.translate('Profile'),
                      child: _EditableUserData(user: user),
                    ),
                    if (auth.env.config.allowsEmailAddress) ...[
                      const Padding(padding: topPadding16, child: divider),
                      _ProfileRow(
                        title: translator.translate('Email address'),
                        child: _IdentifierList(
                          user: user,
                          identifiers: user.emailAddresses,
                          addLine: translator.translate('Add email address'),
                          onAddNew: () => _addIdentifyingData(
                            context,
                            auth,
                            clerk.IdentifierType.emailAddress,
                          ),
                          onIdentifierUnverified: (emailAddress) {
                            _verifyIdentifyingData(context, auth, emailAddress);
                          },
                        ),
                      ),
                    ],
                    if (auth.env.config.allowsPhoneNumber) ...[
                      const Padding(padding: topPadding16, child: divider),
                      _ProfileRow(
                        title: translator.translate('Phone numbers'),
                        child: _IdentifierList(
                          user: user,
                          identifiers: user.phoneNumbers,
                          format: (number) {
                            return PhoneNumber.parse(number).intlFormattedNsn;
                          },
                          addLine: translator.translate('Add phone number'),
                          onAddNew: () => _addIdentifyingData(
                            context,
                            auth,
                            clerk.IdentifierType.phoneNumber,
                          ),
                          onIdentifierUnverified: (phoneNumber) {
                            _verifyIdentifyingData(context, auth, phoneNumber);
                          },
                        ),
                      ),
                    ],
                    const Padding(padding: topPadding16, child: divider),
                    _ProfileRow(
                      title: translator.translate('Connected accounts'),
                      child: _ExternalAccountList(
                        user: user,
                        env: auth.env,
                        onAddNew: () => ConnectAccountScreen.show(context),
                      ),
                    ),
                  ],
                ),
              ),
              verticalMargin20,
            ],
          );
        },
      ),
    );
  }
}

class _ExternalAccountList extends StatelessWidget {
  const _ExternalAccountList({
    required this.user,
    required this.env,
    required this.onAddNew,
  });

  final clerk.User user;
  final clerk.Environment env;
  final VoidCallback onAddNew;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (user.externalAccounts case List<clerk.ExternalAccount> accounts) //
          for (final account in accounts.where((a) => a.isVerified)) //
            Padding(
              padding: bottomPadding16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (env.user.socialSettings[account.provider]
                      case clerk.SocialConnection social) ...[
                    Image.network(social.logoUrl, width: 14),
                    horizontalMargin4,
                    Text(social.name),
                  ],
                  horizontalMargin4,
                  Expanded(
                    child: Text(
                      account.emailAddress,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ClerkTextStyle.subtitle,
                    ),
                  ),
                ],
              ),
            ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onAddNew,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10),
              horizontalMargin12,
              Expanded(child: Text(translator.translate('Connect account'))),
            ],
          ),
        ),
      ],
    );
  }
}

class _IdentifierList extends StatelessWidget {
  const _IdentifierList({
    required this.user,
    required this.addLine,
    required this.onAddNew,
    required this.onIdentifierUnverified,
    this.identifiers,
    this.format,
  });

  final clerk.User user;
  final List<clerk.UserIdentifyingData>? identifiers;
  final String addLine;
  final VoidCallback onAddNew;
  final ValueChanged<String> onIdentifierUnverified;
  final String Function(String)? format;

  @override
  Widget build(BuildContext context) {
    final translator = ClerkAuth.translatorOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (identifiers case List<clerk.UserIdentifyingData> identifiers) //
          for (final ident in identifiers) //
            Padding(
              padding: bottomPadding16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      format?.call(ident.identifier) ?? ident.identifier,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (ident.isUnverified) //
                    _RowLabel(
                      label: translator.translate('UNVERIFIED'),
                      color: ClerkColors.incarnadine,
                      onTap: () =>
                          onIdentifierUnverified.call(ident.identifier),
                    ),
                  if (user.isPrimary(ident)) //
                    _RowLabel(label: translator.translate('PRIMARY')),
                ],
              ),
            ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onAddNew,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10),
              horizontalMargin12,
              Expanded(child: Text(addLine)),
            ],
          ),
        ),
      ],
    );
  }
}

class _RowLabel extends StatelessWidget {
  const _RowLabel({
    this.color = ClerkColors.charcoalGrey,
    required this.label,
    this.onTap,
  });

  final Color color;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: topPadding2,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: DecoratedBox(
          decoration:
              BoxDecoration(border: Border.all(color: color, width: 0.5)),
          child: Center(
            child: Padding(
              padding: horizontalPadding4 + verticalPadding2,
              child: Text(
                label,
                style: ClerkTextStyle.rowLabel.copyWith(color: color),
              ),
            ),
          ),
        ),
      ),
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
      padding: topPadding16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(title, maxLines: 2),
          ),
          horizontalMargin8,
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
    if (context.mounted && image != null) {
      setState(() => this.image = File(image.path));
    }
  }

  Future<void> _update([_]) async {
    if (isEditing) {
      final authState = ClerkAuth.of(context, listen: false);
      final name = _controller.text;
      if (name != widget.user.name && name.isNotEmpty) {
        final names = name.split(' ').where((s) => s.isNotEmpty).toList();
        final lastName = names.length > 1 ? names.removeLast() : '';
        final firstName = names.join(' ');
        await authState.updateUser(firstName: firstName, lastName: lastName);
      }
      if (image case File image) {
        await authState.updateUserImage(image);
      }
    }
    if (context.mounted) {
      setState(() => isEditing = !isEditing);
    }
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
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ClerkColors.dawnPink,
                      ),
                      child: SizedBox.square(
                        dimension: 15,
                        child: Icon(
                          Icons.camera_alt,
                          size: 12,
                          color: ClerkColors.charcoalGrey,
                        ),
                      ),
                    ),
                  ),
                ),
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
                  widget.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
