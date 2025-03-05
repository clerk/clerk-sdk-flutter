// ignore_for_file: public_member_api_docs

import 'package:clerk_flutter/src/assets.dart';
import 'package:clerk_flutter/src/widgets/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phone_input/phone_input_package.dart';

extension PhoneNumberExtension on PhoneNumber {
  String get intlFormattedNsn => '(+$countryCode) ${getFormattedNsn()}';
}

final defaultOrgLogo = SvgPicture.asset(
  ClerkAssets.defaultOrganizationLogo,
  package: 'clerk_flutter',
);

const defaultLoadingWidget = Positioned.fill(
  child: ColoredBox(
    color: Colors.black26,
    child: Center(child: CircularProgressIndicator()),
  ),
);

const emptyWidget = SizedBox();
const emptyWidgetWide = SizedBox(width: double.infinity);

const spacer = Spacer();

const outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
);

const inputBoxBorderDecoration = ShapeDecoration(
  color: ClerkColors.white,
  shape: RoundedRectangleBorder(
    side: BorderSide(color: ClerkColors.dawnPink, width: 0.5),
    borderRadius: borderRadius4,
  ),
);

const firstColumnWidth = 215.0;
const secondColumnWidth = 280.0;

const divider =
    Divider(color: ClerkColors.dawnPink, thickness: 2.0, height: 2.0);

const narrowDivider =
    Divider(color: ClerkColors.dawnPink, thickness: 0, height: 1);

// Margins

const horizontalMargin4 = SizedBox(width: 4.0);
const horizontalMargin8 = SizedBox(width: 8.0);
const horizontalMargin12 = SizedBox(width: 12.0);
const horizontalMargin14 = SizedBox(width: 14.0);
const horizontalMargin16 = SizedBox(width: 16.0);
const horizontalMargin24 = SizedBox(width: 24.0);
const horizontalMargin32 = SizedBox(width: 32.0);
const horizontalMargin48 = SizedBox(width: 48.0);

const verticalMargin2 = SizedBox(height: 2.0);
const verticalMargin4 = SizedBox(height: 4.0);
const verticalMargin8 = SizedBox(height: 8.0);
const verticalMargin10 = SizedBox(height: 10.0);
const verticalMargin12 = SizedBox(height: 12.0);
const verticalMargin16 = SizedBox(height: 16.0);
const verticalMargin20 = SizedBox(height: 20.0);
const verticalMargin24 = SizedBox(height: 24.0);
const verticalMargin28 = SizedBox(height: 28.0);
const verticalMargin32 = SizedBox(height: 32.0);
const verticalMargin48 = SizedBox(height: 48.0);
const verticalMargin64 = SizedBox(height: 64.0);
const verticalMargin96 = SizedBox(height: 96.0);

const sliverVerticalMargin4 = SliverToBoxAdapter(child: SizedBox(height: 4.0));
const sliverVerticalMargin8 = SliverToBoxAdapter(child: SizedBox(height: 8.0));
const sliverVerticalMargin12 =
    SliverToBoxAdapter(child: SizedBox(height: 12.0));
const sliverVerticalMargin16 =
    SliverToBoxAdapter(child: SizedBox(height: 16.0));
const sliverVerticalMargin24 =
    SliverToBoxAdapter(child: SizedBox(height: 24.0));
const sliverVerticalMargin32 =
    SliverToBoxAdapter(child: SizedBox(height: 32.0));
const sliverVerticalMargin48 =
    SliverToBoxAdapter(child: SizedBox(height: 48.0));

// Paddings

const emptyPadding = EdgeInsets.zero;

const hor8ver4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
const hor32top20 = EdgeInsets.fromLTRB(32, 20, 32, 0);
const hor24bottom16 = EdgeInsets.fromLTRB(24, 0, 24, 16);

const horizontalPadding4 = EdgeInsets.symmetric(horizontal: 4.0);
const horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8.0);
const horizontalPadding12 = EdgeInsets.symmetric(horizontal: 12.0);
const horizontalPadding14 = EdgeInsets.symmetric(horizontal: 14.0);
const horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.0);
const horizontalPadding20 = EdgeInsets.symmetric(horizontal: 20.0);
const horizontalPadding24 = EdgeInsets.symmetric(horizontal: 24.0);
const horizontalPadding32 = EdgeInsets.symmetric(horizontal: 32.0);
const horizontalPadding48 = EdgeInsets.symmetric(horizontal: 48.0);

const verticalPadding2 = EdgeInsets.symmetric(vertical: 2.0);
const verticalPadding4 = EdgeInsets.symmetric(vertical: 4.0);
const verticalPadding8 = EdgeInsets.symmetric(vertical: 8.0);
const verticalPadding12 = EdgeInsets.symmetric(vertical: 12.0);
const verticalPadding16 = EdgeInsets.symmetric(vertical: 16.0);
const verticalPadding24 = EdgeInsets.symmetric(vertical: 24.0);
const verticalPadding32 = EdgeInsets.symmetric(vertical: 32.0);
const verticalPadding48 = EdgeInsets.symmetric(vertical: 48.0);

const allPadding4 = EdgeInsets.all(4.0);
const allPadding8 = EdgeInsets.all(8.0);
const allPadding12 = EdgeInsets.all(12.0);
const allPadding16 = EdgeInsets.all(16.0);
const allPadding20 = EdgeInsets.all(20.0);
const allPadding24 = EdgeInsets.all(24.0);
const allPadding32 = EdgeInsets.all(32.0);
const allPadding48 = EdgeInsets.all(48.0);

const topPadding1 = EdgeInsets.only(top: 1.0);
const topPadding2 = EdgeInsets.only(top: 2.0);
const topPadding4 = EdgeInsets.only(top: 4.0);
const topPadding8 = EdgeInsets.only(top: 8.0);
const topPadding12 = EdgeInsets.only(top: 12.0);
const topPadding16 = EdgeInsets.only(top: 16.0);
const topPadding24 = EdgeInsets.only(top: 24.0);
const topPadding32 = EdgeInsets.only(top: 32.0);
const topPadding48 = EdgeInsets.only(top: 48.0);
const topPadding72 = EdgeInsets.only(top: 72.0);
const topPadding96 = EdgeInsets.only(top: 96.0);

const bottomPadding1 = EdgeInsets.only(bottom: 1.0);
const bottomPadding2 = EdgeInsets.only(bottom: 2.0);
const bottomPadding4 = EdgeInsets.only(bottom: 4.0);
const bottomPadding8 = EdgeInsets.only(bottom: 8.0);
const bottomPadding12 = EdgeInsets.only(bottom: 12.0);
const bottomPadding16 = EdgeInsets.only(bottom: 16.0);
const bottomPadding24 = EdgeInsets.only(bottom: 24.0);
const bottomPadding32 = EdgeInsets.only(bottom: 32.0);
const bottomPadding48 = EdgeInsets.only(bottom: 48.0);

const leftPadding4 = EdgeInsets.only(left: 4.0);
const leftPadding8 = EdgeInsets.only(left: 8.0);
const leftPadding12 = EdgeInsets.only(left: 12.0);
const leftPadding16 = EdgeInsets.only(left: 16.0);
const leftPadding24 = EdgeInsets.only(left: 24.0);
const leftPadding32 = EdgeInsets.only(left: 32.0);
const leftPadding48 = EdgeInsets.only(left: 48.0);

const rightPadding2 = EdgeInsets.only(right: 2.0);
const rightPadding4 = EdgeInsets.only(right: 4.0);
const rightPadding8 = EdgeInsets.only(right: 8.0);
const rightPadding12 = EdgeInsets.only(right: 12.0);
const rightPadding16 = EdgeInsets.only(right: 16.0);
const rightPadding24 = EdgeInsets.only(right: 24.0);
const rightPadding32 = EdgeInsets.only(right: 32.0);
const rightPadding48 = EdgeInsets.only(right: 48.0);

const startPadding4 = EdgeInsetsDirectional.only(start: 4.0);
const startPadding8 = EdgeInsetsDirectional.only(start: 8.0);
const startPadding12 = EdgeInsetsDirectional.only(start: 12.0);
const startPadding16 = EdgeInsetsDirectional.only(start: 16.0);
const startPadding24 = EdgeInsetsDirectional.only(start: 24.0);
const startPadding32 = EdgeInsetsDirectional.only(start: 32.0);
const startPadding48 = EdgeInsetsDirectional.only(start: 48.0);

const endPadding4 = EdgeInsetsDirectional.only(end: 4.0);
const endPadding8 = EdgeInsetsDirectional.only(end: 8.0);
const endPadding12 = EdgeInsetsDirectional.only(end: 12.0);
const endPadding16 = EdgeInsetsDirectional.only(end: 16.0);
const endPadding24 = EdgeInsetsDirectional.only(end: 24.0);
const endPadding32 = EdgeInsetsDirectional.only(end: 32.0);
const endPadding48 = EdgeInsetsDirectional.only(end: 48.0);

const borderRadius4 = BorderRadius.all(Radius.circular(4.0));
const borderRadius6 = BorderRadius.all(Radius.circular(6.0));
const borderRadius8 = BorderRadius.all(Radius.circular(8.0));
const borderRadius12 = BorderRadius.all(Radius.circular(12.0));
const borderRadius16 = BorderRadius.all(Radius.circular(16.0));
const borderRadius18 = BorderRadius.all(Radius.circular(18.0));
const borderRadius24 = BorderRadius.all(Radius.circular(24.0));
const borderRadius28 = BorderRadius.all(Radius.circular(28.0));
const borderRadius32 = BorderRadius.all(Radius.circular(32.0));
const borderRadius36 = BorderRadius.all(Radius.circular(36.0));
const borderRadius48 = BorderRadius.all(Radius.circular(48.0));
