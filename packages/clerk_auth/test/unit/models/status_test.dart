import 'package:clerk_auth/src/models/enums.dart';
import 'package:clerk_auth/src/models/status.dart';

import '../../test_helpers.dart';

void main() {
  group('Status', () {
    test('can be created from a name', () {
      final status = Status(name: 'active');
      expect(status, Status.active);
    });

    test('can be created from JSON', () {
      final status = Status.fromJson('verified');
      expect(status, Status.verified);
    });

    test('returns existing status for known names', () {
      expect(Status(name: 'unknown'), Status.unknown);
      expect(Status(name: 'abandoned'), Status.abandoned);
      expect(Status(name: 'active'), Status.active);
      expect(Status(name: 'missing_requirements'), Status.missingRequirements);
      expect(Status(name: 'needs_identifier'), Status.needsIdentifier);
      expect(Status(name: 'needs_first_factor'), Status.needsFirstFactor);
      expect(Status(name: 'needs_second_factor'), Status.needsSecondFactor);
      expect(Status(name: 'transferable'), Status.transferable);
      expect(Status(name: 'unverified'), Status.unverified);
      expect(Status(name: 'verified'), Status.verified);
      expect(Status(name: 'complete'), Status.complete);
      expect(Status(name: 'expired'), Status.expired);
      expect(Status(name: 'failed'), Status.failed);
      expect(Status(name: 'pending'), Status.pending);
    });

    test('creates new status for unknown names', () {
      final customStatus = Status(name: 'custom_status');
      expect(customStatus.name, 'custom_status');
      // Subsequent calls should return the same instance
      expect(Status(name: 'custom_status'), customStatus);
    });

    test('isActive returns true only for active status', () {
      expect(Status.active.isActive);
      expect(Status.verified.isActive, false);
      expect(Status.unknown.isActive, false);
    });

    test('isVerified returns true only for verified status', () {
      expect(Status.verified.isVerified);
      expect(Status.active.isVerified, false);
      expect(Status.unverified.isVerified, false);
    });

    test('isExpired returns true only for expired status', () {
      expect(Status.expired.isExpired);
      expect(Status.active.isExpired, false);
    });

    test('isUnknown returns true only for unknown status', () {
      expect(Status.unknown.isUnknown);
      expect(Status.active.isUnknown, false);
    });

    test('isTransferable returns true only for transferable status', () {
      expect(Status.transferable.isTransferable);
      expect(Status.active.isTransferable, false);
    });

    test('needsFactor returns true for first and second factor statuses', () {
      expect(Status.needsFirstFactor.needsFactor);
      expect(Status.needsSecondFactor.needsFactor);
      expect(Status.active.needsFactor, false);
      expect(Status.verified.needsFactor, false);
    });

    test('needsFactorFor returns correct value for each stage', () {
      expect(Status.needsFirstFactor.needsFactorFor(Stage.first));
      expect(Status.needsFirstFactor.needsFactorFor(Stage.second), false);
      expect(Status.needsSecondFactor.needsFactorFor(Stage.second));
      expect(Status.needsSecondFactor.needsFactorFor(Stage.first), false);
      expect(Status.active.needsFactorFor(Stage.first), false);
      expect(Status.active.needsFactorFor(Stage.second), false);
    });

    test('toString returns the name', () {
      expect(Status.active.toString(), 'active');
      expect(Status.needsFirstFactor.toString(), 'needs_first_factor');
    });

    test('toJson returns the name', () {
      expect(Status.active.toJson(), 'active');
      expect(Status.missingRequirements.toJson(), 'missing_requirements');
    });

    test('title replaces underscores with spaces', () {
      expect(Status.active.title, 'active');
      expect(Status.needsFirstFactor.title, 'needs first factor');
      expect(Status.missingRequirements.title, 'missing requirements');
    });

    test('values returns all known statuses', () {
      final values = Status.values;
      expect(values.contains(Status.active));
      expect(values.contains(Status.verified));
      expect(values.contains(Status.unknown));
      expect(values.length >= 14); // At least the predefined ones
    });

    test('index returns correct position in values list', () {
      final values = Status.values;
      for (int i = 0; i < values.length; i++) {
        expect(values[i].index, i);
      }
    });
  });
}

