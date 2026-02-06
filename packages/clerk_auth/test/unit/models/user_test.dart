import 'package:clerk_auth/src/models/client/email.dart';
import 'package:clerk_auth/src/models/client/phone_number.dart';
import 'package:clerk_auth/src/models/client/user.dart';
import 'package:clerk_auth/src/models/client/verification.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/extensions.dart';

import '../../test_helpers.dart';

User _createTestUser({
  String id = 'user_123',
  String? firstName,
  String? lastName,
  String? username,
  String? primaryEmailAddressId,
  String? primaryPhoneNumberId,
  List<Email>? emailAddresses,
  List<PhoneNumber>? phoneNumbers,
  Map<String, dynamic>? unsafeMetadata,
}) {
  return User(
    id: id,
    externalId: null,
    username: username,
    firstName: firstName,
    lastName: lastName,
    profileImageUrl: null,
    imageUrl: null,
    hasImage: false,
    primaryEmailAddressId: primaryEmailAddressId,
    primaryPhoneNumberId: primaryPhoneNumberId,
    primaryWeb3WalletId: null,
    publicMetadata: null,
    privateMetadata: {},
    unsafeMetadata: unsafeMetadata,
    emailAddresses: emailAddresses,
    phoneNumbers: phoneNumbers,
    web3Wallets: null,
    passkeys: null,
    organizationMemberships: null,
    createOrganizationEnabled: false,
    externalAccounts: null,
    passwordEnabled: false,
    twoFactorEnabled: false,
    totpEnabled: false,
    backupCodeEnabled: false,
    lastSignInAt: DateTimeExt.epoch,
    banned: false,
    locked: false,
    lockoutExpiresInSeconds: null,
    verificationAttemptsRemaining: null,
    updatedAt: DateTimeExt.epoch,
    createdAt: DateTimeExt.epoch,
    lastActiveAt: DateTimeExt.epoch,
    deleteSelfEnabled: false,
  );
}

Email _createTestEmail({
  required String id,
  required String emailAddress,
}) {
  return Email(
    id: id,
    emailAddress: emailAddress,
    verification: Verification(
      status: Status.verified,
      strategy: Strategy.emailCode,
      attempts: 0,
      expireAt: DateTimeExt.epoch,
    ),
    reserved: false,
    updatedAt: DateTimeExt.epoch,
    createdAt: DateTimeExt.epoch,
  );
}

PhoneNumber _createTestPhoneNumber({
  required String id,
  required String phoneNumber,
}) {
  return PhoneNumber(
    id: id,
    phoneNumber: phoneNumber,
    verification: Verification(
      status: Status.verified,
      strategy: Strategy.phoneCode,
      attempts: 0,
      expireAt: DateTimeExt.epoch,
    ),
    reserved: false,
    reservedForSecondFactor: false,
    defaultSecondFactor: false,
    updatedAt: DateTimeExt.epoch,
    createdAt: DateTimeExt.epoch,
  );
}

void main() {
  group('User', () {
    group('name', () {
      test('returns full name when both first and last name exist', () {
        final user = _createTestUser(firstName: 'John', lastName: 'Doe');
        expect(user.name, 'John Doe');
      });

      test('returns first name only when last name is null', () {
        final user = _createTestUser(firstName: 'John');
        expect(user.name, 'John');
      });

      test('returns last name only when first name is null', () {
        final user = _createTestUser(lastName: 'Doe');
        expect(user.name, 'Doe');
      });

      test('returns empty string when both names are null', () {
        final user = _createTestUser();
        expect(user.name, '');
      });

      test('returns empty string when names are empty strings', () {
        final user = _createTestUser(firstName: '', lastName: '');
        expect(user.name, '');
      });
    });

    group('hasName', () {
      test('returns true when first name exists', () {
        final user = _createTestUser(firstName: 'John');
        expect(user.hasName);
      });

      test('returns true when last name exists', () {
        final user = _createTestUser(lastName: 'Doe');
        expect(user.hasName);
      });

      test('returns false when both names are null', () {
        final user = _createTestUser();
        expect(user.hasName, false);
      });

      test('returns false when both names are empty', () {
        final user = _createTestUser(firstName: '', lastName: '');
        expect(user.hasName, false);
      });
    });

    group('hasMetadata', () {
      test('returns true when unsafeMetadata is not empty', () {
        final user = _createTestUser(unsafeMetadata: {'key': 'value'});
        expect(user.hasMetadata);
      });

      test('returns false when unsafeMetadata is null', () {
        final user = _createTestUser();
        expect(user.hasMetadata, false);
      });

      test('returns false when unsafeMetadata is empty', () {
        final user = _createTestUser(unsafeMetadata: {});
        expect(user.hasMetadata, false);
      });
    });

    group('email', () {
      test('returns email when primary email exists', () {
        final email = _createTestEmail(
          id: 'email_1',
          emailAddress: 'test@example.com',
        );
        final user = _createTestUser(
          primaryEmailAddressId: 'email_1',
          emailAddresses: [email],
        );
        expect(user.email, 'test@example.com');
      });

      test('returns null when no primary email id', () {
        final email = _createTestEmail(
          id: 'email_1',
          emailAddress: 'test@example.com',
        );
        final user = _createTestUser(emailAddresses: [email]);
        expect(user.email, isNull);
      });

      test('returns null when primary email id not found', () {
        final email = _createTestEmail(
          id: 'email_1',
          emailAddress: 'test@example.com',
        );
        final user = _createTestUser(
          primaryEmailAddressId: 'email_nonexistent',
          emailAddresses: [email],
        );
        expect(user.email, isNull);
      });
    });

    group('phoneNumber', () {
      test('returns phone number when primary phone exists', () {
        final phone = _createTestPhoneNumber(
          id: 'phone_1',
          phoneNumber: '+1234567890',
        );
        final user = _createTestUser(
          primaryPhoneNumberId: 'phone_1',
          phoneNumbers: [phone],
        );
        expect(user.phoneNumber, '+1234567890');
      });

      test('returns null when no primary phone id', () {
        final phone = _createTestPhoneNumber(
          id: 'phone_1',
          phoneNumber: '+1234567890',
        );
        final user = _createTestUser(phoneNumbers: [phone]);
        expect(user.phoneNumber, isNull);
      });
    });

    group('isPrimary', () {
      test('returns true for primary email', () {
        final email = _createTestEmail(
          id: 'email_1',
          emailAddress: 'test@example.com',
        );
        final user = _createTestUser(
          primaryEmailAddressId: 'email_1',
          emailAddresses: [email],
        );
        expect(user.isPrimary(email));
      });

      test('returns false for non-primary email', () {
        final email = _createTestEmail(
          id: 'email_1',
          emailAddress: 'test@example.com',
        );
        final user = _createTestUser(
          primaryEmailAddressId: 'email_other',
          emailAddresses: [email],
        );
        expect(user.isPrimary(email), false);
      });
    });

    group('identifierFrom', () {
      test('finds email by address', () {
        final email = _createTestEmail(
          id: 'email_1',
          emailAddress: 'test@example.com',
        );
        final user = _createTestUser(emailAddresses: [email]);
        expect(user.identifierFrom('test@example.com'), email);
      });

      test('returns null for unknown identifier', () {
        final user = _createTestUser();
        expect(user.identifierFrom('unknown@example.com'), isNull);
      });
    });

    group('copyWith', () {
      test('creates copy with updated firstName', () {
        final user = _createTestUser(firstName: 'John', lastName: 'Doe');
        final copy = user.copyWith(firstName: 'Jane');
        expect(copy.firstName, 'Jane');
        expect(copy.lastName, 'Doe');
        expect(copy.id, user.id);
      });

      test('creates copy with updated lastName', () {
        final user = _createTestUser(firstName: 'John', lastName: 'Doe');
        final copy = user.copyWith(lastName: 'Smith');
        expect(copy.firstName, 'John');
        expect(copy.lastName, 'Smith');
      });

      test('preserves original values when not specified', () {
        final user = _createTestUser(
          firstName: 'John',
          lastName: 'Doe',
          username: 'johndoe',
        );
        final copy = user.copyWith(firstName: 'Jane');
        expect(copy.username, 'johndoe');
      });
    });

    group('hasOrganizations', () {
      test('returns false when organizationMemberships is null', () {
        final user = _createTestUser();
        expect(user.hasOrganizations, false);
      });

      test('returns false when organizationMemberships is empty', () {
        final user = User(
          id: 'user_123',
          externalId: null,
          username: null,
          firstName: null,
          lastName: null,
          profileImageUrl: null,
          imageUrl: null,
          hasImage: false,
          primaryEmailAddressId: null,
          primaryPhoneNumberId: null,
          primaryWeb3WalletId: null,
          publicMetadata: null,
          privateMetadata: {},
          unsafeMetadata: null,
          emailAddresses: null,
          phoneNumbers: null,
          web3Wallets: null,
          passkeys: null,
          organizationMemberships: [],
          createOrganizationEnabled: false,
          externalAccounts: null,
          passwordEnabled: false,
          twoFactorEnabled: false,
          totpEnabled: false,
          backupCodeEnabled: false,
          lastSignInAt: DateTimeExt.epoch,
          banned: false,
          locked: false,
          lockoutExpiresInSeconds: null,
          verificationAttemptsRemaining: null,
          updatedAt: DateTimeExt.epoch,
          createdAt: DateTimeExt.epoch,
          lastActiveAt: DateTimeExt.epoch,
          deleteSelfEnabled: false,
        );
        expect(user.hasOrganizations, false);
      });
    });
  });
}

