import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

/// The [ClerkSignUpPanel] renders a UI for signing up users.
///
/// The functionality of the [ClerkSignUpPanel] is controlled by the instance settings
/// you specify in your Clerk Dashboard, such as sign-in and social connections. You can
/// further customize your [ClerkSignUpPanel] by passing additional properties.
///
/// https://clerk.com/docs/components/authentication/sign-up
///
///
@immutable
class ClerkSignUpPanel extends StatefulWidget {
  const ClerkSignUpPanel({super.key});

  @override
  State<ClerkSignUpPanel> createState() => _ClerkSignUpPanelState();
}

class _ClerkSignUpPanelState extends State<ClerkSignUpPanel> {
  static final _phoneNumberRE = RegExp(r'[^0-9+]');

  final _values = <clerk.UserAttribute, String>{};
  bool _obscurePassword = true;

  Future<void> _continue(ClerkAuthProvider auth,
      {String? code, clerk.Strategy? strategy}) async {
    await auth.call(context, () async {
      final password = _values[clerk.UserAttribute.password];
      final passwordConfirmation =
          _values[clerk.UserAttribute.passwordConfirmation];
      if (auth.checkPassword(password, passwordConfirmation)
          case String errorMessage) {
        auth.addError(errorMessage);
      } else {
        await auth.attemptSignUp(
          strategy: strategy ?? clerk.Strategy.password,
          firstName: _values[clerk.UserAttribute.firstName],
          lastName: _values[clerk.UserAttribute.lastName],
          username: _values[clerk.UserAttribute.username],
          emailAddress: _values[clerk.UserAttribute.emailAddress],
          phoneNumber: _values[clerk.UserAttribute.phoneNumber]
              ?.replaceAll(_phoneNumberRE, ''),
          password: password,
          passwordConfirmation: passwordConfirmation,
          code: code,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ClerkAuth.of(context);
    final translator = auth.translator;
    final env = auth.env;
    final attributes = [
      ...env.user.attributes.entries
          .where((a) => a.value.isEnabled)
          .map(_Attribute.fromMapEntry),
      const _Attribute(clerk.UserAttribute.passwordConfirmation, true),
    ]..sort((a, b) => a.index - b.index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClerkCodeInput(
          key: const Key('phone_code'),
          open: auth.signUp?.unverified(clerk.Field.phoneNumber) == true,
          title: translator.translate('Verify your phone number'),
          subtitle: translator.translate(
            'Enter code sent to ###',
            substitution: _values[clerk.UserAttribute.phoneNumber],
          ),
          onSubmit: (code) async {
            await _continue(auth,
                strategy: clerk.Strategy.phoneCode, code: code);
            return false;
          },
        ),
        ClerkCodeInput(
          key: const Key('email_code'),
          open: auth.signUp?.unverified(clerk.Field.emailAddress) == true,
          title: translator.translate('Verify your email address'),
          subtitle: translator.translate(
            'Enter code sent to ###',
            substitution: _values[clerk.UserAttribute.emailAddress],
          ),
          onSubmit: (code) async {
            await _continue(auth,
                strategy: clerk.Strategy.emailCode, code: code);
            return false;
          },
        ),
        Closeable(
          closed: auth.signUp?.unverifiedFields.isNotEmpty == true,
          child: Column(
            children: [
              for (final attribute in attributes)
                Padding(
                  padding: horizontalPadding32 + bottomPadding24,
                  child: attribute.isPhoneNumber
                      ? ClerkPhoneNumberFormField(
                          initial: _values[attribute.attr],
                          label: attribute.title,
                          optional: attribute.isOptional,
                          onChanged: (value) => _values[attribute.attr] = value,
                        )
                      : ClerkTextFormField(
                          initial: _values[attribute.attr],
                          label: attribute.title,
                          optional: attribute.isOptional,
                          obscureText:
                              attribute.needsObscuring && _obscurePassword,
                          onObscure: attribute.needsObscuring
                              ? () => setState(
                                  () => _obscurePassword = !_obscurePassword)
                              : null,
                          onChanged: (value) => _values[attribute.attr] = value,
                        ),
                ),
            ],
          ),
        ),
        Padding(
          padding: horizontalPadding32,
          child: ClerkMaterialButton(
            onPressed: () => _continue(auth),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text(translator.translate('Continue'))),
                horizontalMargin4,
                const Icon(Icons.arrow_right_sharp),
              ],
            ),
          ),
        ),
        verticalMargin32,
      ],
    );
  }
}

class _Attribute {
  final clerk.UserAttribute attr;
  final bool isRequired;

  const _Attribute(this.attr, this.isRequired);

  factory _Attribute.fromMapEntry(
          MapEntry<clerk.UserAttribute, clerk.UserAttributeData> entry) =>
      _Attribute(entry.key, entry.value.isRequired);

  int get index => attr.index;

  bool get needsObscuring => attr.obscure;

  bool get isPhoneNumber => attr == clerk.UserAttribute.phoneNumber;

  bool get isOptional => isRequired == false;

  String get title => attr.title;
}
