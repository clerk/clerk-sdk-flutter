import 'package:clerk_auth/clerk_auth.dart' as clerk;
import 'package:clerk_flutter/generated/clerk_sdk_localizations.dart';
import 'package:clerk_flutter/generated/clerk_sdk_localizations_en.dart';
import 'package:clerk_flutter/src/utils/localization_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ClerkSdkLocalizations l10ns;

  setUp(() {
    l10ns = ClerkSdkLocalizationsEn();
  });

  group('ClerkAuthErrorExtension', () {
    test('localizedMessage returns cannotDeleteSelf for cannotDeleteSelf code', () {
      final error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.cannotDeleteSelf,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.cannotDeleteSelf);
    });

    test('localizedMessage returns jwtPoorlyFormatted with argument', () {
      final error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.jwtPoorlyFormatted,
        message: 'test',
        argument: 'bad_token',
      );
      expect(error.localizedMessage(l10ns), l10ns.jwtPoorlyFormatted('bad_token'));
    });

    test('localizedMessage returns noSessionTokenRetrieved', () {
      final error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.noSessionTokenRetrieved,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.noSessionTokenRetrieved);
    });

    test('localizedMessage returns passwordMatchError', () {
      final error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.passwordMatchError,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.passwordMatchError);
    });

    test('localizedMessage returns tooManyRetries', () {
      final error = clerk.ClerkError(
        code: clerk.ClerkErrorCode.tooManyRetries,
        message: 'test',
      );
      expect(error.localizedMessage(l10ns), l10ns.tooManyRetries);
    });

    test('localizedMessage returns toString for clientAppError', () {
      final error = clerk.ClerkError.clientAppError(message: 'Custom error');
      final result = error.localizedMessage(l10ns);
      expect(result, contains('Custom error'));
    });
  });

  group('ClerkEnrollmentTypeExtension', () {
    test('viaInvitationMessage returns correct message for manualInvitation', () {
      expect(
        clerk.EnrollmentMode.manualInvitation.viaInvitationMessage(l10ns),
        l10ns.viaManualInvitation,
      );
    });

    test('viaInvitationMessage returns correct message for automaticInvitation', () {
      expect(
        clerk.EnrollmentMode.automaticInvitation.viaInvitationMessage(l10ns),
        l10ns.viaAutomaticInvitation,
      );
    });

    test('viaInvitationMessage returns correct message for automaticSuggestion', () {
      expect(
        clerk.EnrollmentMode.automaticSuggestion.viaInvitationMessage(l10ns),
        l10ns.viaAutomaticSuggestion,
      );
    });

    test('localizedName returns correct name for manualInvitation', () {
      expect(
        clerk.EnrollmentMode.manualInvitation.localizedName(l10ns),
        l10ns.manualInvitation,
      );
    });

    test('localizedName returns correct name for automaticInvitation', () {
      expect(
        clerk.EnrollmentMode.automaticInvitation.localizedName(l10ns),
        l10ns.automaticInvitation,
      );
    });

    test('localizedName returns correct name for automaticSuggestion', () {
      expect(
        clerk.EnrollmentMode.automaticSuggestion.localizedName(l10ns),
        l10ns.automaticSuggestion,
      );
    });
  });

  group('ClerkStatusLocalization', () {
    test('localizedMessage returns correct message for abandoned', () {
      expect(clerk.Status.abandoned.localizedMessage(l10ns), l10ns.abandoned);
    });

    test('localizedMessage returns correct message for active', () {
      expect(clerk.Status.active.localizedMessage(l10ns), l10ns.active);
    });

    test('localizedMessage returns correct message for complete', () {
      expect(clerk.Status.complete.localizedMessage(l10ns), l10ns.complete);
    });

    test('localizedMessage returns correct message for expired', () {
      expect(clerk.Status.expired.localizedMessage(l10ns), l10ns.expired);
    });

    test('localizedMessage returns correct message for failed', () {
      expect(clerk.Status.failed.localizedMessage(l10ns), l10ns.failed);
    });

    test('localizedMessage returns correct message for pending', () {
      expect(clerk.Status.pending.localizedMessage(l10ns), l10ns.pending);
    });

    test('localizedMessage returns correct message for verified', () {
      expect(clerk.Status.verified.localizedMessage(l10ns), l10ns.verified);
    });

    test('localizedMessage returns correct message for unverified', () {
      expect(clerk.Status.unverified.localizedMessage(l10ns), l10ns.unverified);
    });
  });

  group('ClerkStrategyLocalization', () {
    test('localizedMessage returns emailAddress for emailAddress strategy', () {
      expect(
        clerk.Strategy.emailAddress.localizedMessage(l10ns),
        l10ns.emailAddress,
      );
    });

    test('localizedMessage returns concise emailAddress when concise is true', () {
      expect(
        clerk.Strategy.emailAddress.localizedMessage(l10ns, concise: true),
        l10ns.emailAddressConcise,
      );
    });

    test('localizedMessage returns phoneNumber for phoneNumber strategy', () {
      expect(
        clerk.Strategy.phoneNumber.localizedMessage(l10ns),
        l10ns.phoneNumber,
      );
    });
  });
}

