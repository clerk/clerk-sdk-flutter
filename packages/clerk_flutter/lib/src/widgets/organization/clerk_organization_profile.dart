import 'dart:async';
import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/utils/clerk_telemetry.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_icon.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_input_dialog.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_panel.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_row_label.dart';
import 'package:clerk_flutter/src/widgets/ui/clerk_text_form_field.dart';
import 'package:clerk_flutter/src/widgets/ui/closeable.dart';
import 'package:clerk_flutter/src/widgets/ui/common.dart';
import 'package:clerk_flutter/src/widgets/ui/editable_profile_data.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:clerk_flutter/src/widgets/ui/style/text_style.dart';
import 'package:flutter/material.dart';

/// [ClerkOrganizationProfile] displays user details
/// and allows their editing
///
class ClerkOrganizationProfile extends StatefulWidget {
  /// Construct a [ClerkOrganizationProfile]
  const ClerkOrganizationProfile({super.key, required this.membership});

  /// The membership for the current user
  final clerk.OrganizationMembership membership;

  @override
  State<ClerkOrganizationProfile> createState() =>
      _ClerkOrganizationProfileState();
}

class _ClerkOrganizationProfileState extends State<ClerkOrganizationProfile>
    with ClerkTelemetryStateMixin {
  late final _localizations = ClerkAuth.localizationsOf(context);

  Future<void> _update(clerk.Organization org, String name, File? logo) async {
    final authState = ClerkAuth.of(context, listen: false);
    await authState.safelyCall(context, () async {
      await authState.updateOrganization(
        organization: org,
        name: name,
        logo: logo,
      );
    });
  }

  Future<void> _leaveOrganization(clerk.Organization org) async {
    final authState = ClerkAuth.of(context);
    final localizations = ClerkAuth.localizationsOf(context);
    final result = await showOkCancelAlertDialog(
      context: context,
      title: localizations.leaveOrg(org.name),
      message: localizations.areYouSure,
      okLabel: localizations.ok,
      cancelLabel: localizations.cancel,
    );
    if (result == OkCancelResult.ok && context.mounted) {
      final hasLeftSuccessfully = await authState.safelyCall(
        context,
        () => authState.leaveOrganization(organization: org),
      );
      if (hasLeftSuccessfully == true && context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClerkPanel(
      padding: horizontalPadding24,
      child: ClerkAuthBuilder(
        builder: (_, __) => emptyWidget,
        signedInBuilder: (context, authState) {
          final membership =
              authState.user!.organizationMemberships!.firstWhere(
            (o) => o.id == widget.membership.id,
          );
          final org = membership.organization;
          final showDomains = authState.env.organization.domains.isEnabled &&
              membership.hasPermission(clerk.Permission.domainsManage);
          return ListView(
            children: [
              verticalMargin32,
              Text(
                _localizations.generalDetails,
                maxLines: 1,
                style: ClerkTextStyle.title,
              ),
              const Padding(padding: topPadding16, child: divider),
              _ProfileRow(
                title: _localizations.organizationProfile,
                child: EditableProfileData(
                  name: org.name,
                  imageUrl: org.imageUrl,
                  avatarBorderRadius: borderRadius4,
                  editable: membership.hasPermission(
                    clerk.Permission.membershipsManage,
                  ),
                  onSubmit: (name, file) => _update(org, name, file),
                ),
              ),
              if (showDomains) ...[
                const Padding(padding: topPadding16, child: divider),
                _ProfileRow(
                  title: _localizations.verifiedDomains,
                  child: _DomainsList(membership),
                ),
              ],
              const Padding(padding: topPadding16, child: divider),
              _ProfileRow(
                title: _localizations.leaveOrganization,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _leaveOrganization(org),
                  child: Text(
                    _localizations.leave,
                    style: ClerkTextStyle.error,
                  ),
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
          SizedBox(
            width: 96,
            child: Text(title, maxLines: 2),
          ),
          horizontalMargin8,
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _DomainsList extends StatefulWidget {
  const _DomainsList(this.membership);

  final clerk.OrganizationMembership membership;

  @override
  State<_DomainsList> createState() => _DomainsListState();
}

class _DomainsListState extends State<_DomainsList> {
  static const _debounceDuration = Duration(seconds: 5);

  clerk.Organization get _org => widget.membership.organization;

  DateTime _nextFetch = DateTime(0);
  List<clerk.OrganizationDomain> _currentDomains = [];
  final _domains = <clerk.OrganizationDomain>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (DateTime.timestamp().isAfter(_nextFetch)) {
      _fetchDomains();
    }
  }

  Future<void> _fetchDomains() async {
    _nextFetch = DateTime.timestamp().add(_debounceDuration);
    final auth = ClerkAuth.of(context);
    final domains = await auth.fetchOrganizationDomains(organization: _org);
    _domains.removeWhere(
      (domain) => _currentDomains.contains(domain) == false,
    );
    _domains.addOrReplaceAll(domains, by: (d) => d.id);
    setState(() => _currentDomains = domains);
  }

  Future<void> _addDomain(BuildContext context) async {
    final authState = ClerkAuth.of(context, listen: false);
    final localizations = authState.localizationsOf(context);

    String domainName = '';
    clerk.EnrollmentMode mode = clerk.EnrollmentMode.manualInvitation;

    final modes = clerk.EnrollmentMode.values.toList();
    if (_org.hasUnlimitedMembership == false) {
      modes.remove(clerk.EnrollmentMode.automaticInvitation);
    }

    final submitted = await ClerkInputDialog.show(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClerkTextFormField(
            label: localizations.domainName,
            autofocus: true,
            onChanged: (text) => domainName = text,
            onSubmit: (_) => Navigator.of(context).pop(true),
          ),
          verticalMargin4,
          Row(
            children: [
              Expanded(
                child: Text(
                  localizations.enrollmentMode,
                  style: ClerkTextStyle.subtitleDark,
                  maxLines: 4,
                ),
              ),
              horizontalMargin4,
              _ModeSelector(
                mode: mode,
                modes: modes,
                onChange: (newMode) => mode = newMode,
              ),
            ],
          ),
        ],
      ),
    );

    if (submitted && context.mounted) {
      domainName = domainName.trim().toLowerCase();
      await authState.safelyCall(context, () async {
        await authState.createDomain(
          organization: _org,
          name: domainName,
          mode: mode,
        );
        await _fetchDomains();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final domain in _domains) //
          Closeable(
            closed: _currentDomains.contains(domain) == false,
            startsClosed: true,
            child: _DomainRow(domain: domain),
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _addDomain(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ClerkIcon(ClerkAssets.addIconSimpleLight, size: 10),
              horizontalMargin12,
              Expanded(child: Text(localizations.addDomain)),
            ],
          ),
        ),
      ],
    );
  }
}

class _DomainRow extends StatelessWidget {
  const _DomainRow({required this.domain});

  final clerk.OrganizationDomain domain;

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(domain.name, style: ClerkTextStyle.subtitleDark),
            ),
            if (domain.isVerified == false) //
              ClerkRowLabel(
                label: localizations.unverified.toUpperCase(),
                color: ClerkColors.incarnadine,
              ),
          ],
        ),
        verticalMargin2,
        Text(
          domain.enrollmentMode.viaInvitationMessage(localizations),
          style: ClerkTextStyle.buttonSubtitle,
        ),
        verticalMargin8,
      ],
    );
  }
}

class _ModeSelector extends StatefulWidget {
  const _ModeSelector({
    required this.mode,
    required this.modes,
    required this.onChange,
  });

  final clerk.EnrollmentMode mode;
  final List<clerk.EnrollmentMode> modes;
  final ValueChanged<clerk.EnrollmentMode> onChange;

  @override
  State<_ModeSelector> createState() => _ModeSelectorState();
}

class _ModeSelectorState extends State<_ModeSelector> {
  late clerk.EnrollmentMode mode = widget.mode;

  @override
  Widget build(BuildContext context) {
    final localizations = ClerkAuth.localizationsOf(context);
    return DropdownButton<clerk.EnrollmentMode>(
      value: mode,
      items: [
        for (final mode in widget.modes) //
          DropdownMenuItem(
            value: mode,
            child: Text(mode.localizedName(localizations)),
          ),
      ],
      style: ClerkTextStyle.subtitleDark,
      onChanged: (mode) {
        if (mode is clerk.EnrollmentMode) {
          widget.onChange(mode);
          setState(() => this.mode = mode);
        }
      },
    );
  }
}
