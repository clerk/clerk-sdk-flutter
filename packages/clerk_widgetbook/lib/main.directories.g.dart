// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:clerk_widgetbook/widgets/authentication/clerk_sign_in_widget.dart' as _i3;
import 'package:clerk_widgetbook/widgets/authentication/clerk_sign_up_widget.dart' as _i4;
import 'package:clerk_widgetbook/widgets/organization/clerk_create_organization_widget.dart'
    as _i5;
import 'package:clerk_widgetbook/widgets/organization/clerk_organization_profile_widget.dart'
    as _i6;
import 'package:clerk_widgetbook/widgets/organization/clerk_organization_switcher_widget.dart'
    as _i7;
import 'package:clerk_widgetbook/widgets/user/clerk_user_button.dart' as _i8;
import 'package:clerk_widgetbook/widgets/user/clerk_user_profile_widget.dart' as _i9;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'authentication',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ClerkSignInWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'Authentication',
              builder: _i3.buildClerkSignInWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ClerkSignUpWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'Authentication',
              builder: _i4.buildClerkSignUpWidgetUseCase,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'organization',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ClerkCreateOrganizationWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'Organization',
              builder: _i5.buildClerkCreateOrganizationWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ClerkOrganizationProfileWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'Organization',
              builder: _i6.buildClerkOrganizationProfileWidgetUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ClerkOrganizationSwitcherWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'Organization',
              builder: _i7.buildClerkOrganizationSwitcherWidgetUseCase,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'user',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ClerkUserButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'User',
              builder: _i8.buildClerkUserButtonUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'ClerkUserProfileWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'User',
              builder: _i9.buildClerkUserProfileWidgetUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
