import 'package:clerk_auth/src/models/enums.dart';
import 'package:meta/meta.dart';

/// Pseudo-enum representing fields
///
@immutable
class Status {
  const Status._(this.name);

  /// Create a [Status]
  factory Status({required String name}) {
    return _values[name] ??= Status._(name);
  }

  /// fromJson factory for JsonSerializable
  factory Status.fromJson(String name) => Status(name: name);

  /// unknown
  static const unknown = Status._('unknown');

  /// abandoned
  static const abandoned = Status._('abandoned');

  /// active
  static const active = Status._('active');

  /// missing requirements
  static const missingRequirements = Status._('missing_requirements');

  /// needs identifier
  static const needsIdentifier = Status._('needs_identifier');

  /// needs first factor
  static const needsFirstFactor = Status._('needs_first_factor');

  /// needs second factor
  static const needsSecondFactor = Status._('needs_second_factor');

  /// transferable
  static const transferable = Status._('transferable');

  /// unverified
  static const unverified = Status._('unverified');

  /// verified
  static const verified = Status._('verified');

  /// complete
  static const complete = Status._('complete');

  /// expired
  static const expired = Status._('expired');

  /// failed
  static const failed = Status._('failed');

  /// pending
  static const pending = Status._('pending');

  static final _values = <String, Status>{
    unknown.name: unknown,
    abandoned.name: abandoned,
    active.name: active,
    missingRequirements.name: missingRequirements,
    needsIdentifier.name: needsIdentifier,
    needsFirstFactor.name: needsFirstFactor,
    needsSecondFactor.name: needsSecondFactor,
    transferable.name: transferable,
    unverified.name: unverified,
    verified.name: verified,
    complete.name: complete,
    expired.name: expired,
    failed.name: failed,
    pending.name: pending,
  };

  /// The [values] of the [Status]es
  static List<Status> get values => _values.values.toList(growable: false);

  /// The index of this field
  int get index => values.indexOf(this);

  /// the [name] of the [Status]
  final String name;

  /// is active?
  bool get isActive => this == active;

  /// is verified?
  bool get isVerified => this == verified;

  /// is expired?
  bool get isExpired => this == expired;

  /// is unknown?
  bool get isUnknown => this == unknown;

  /// is transferable?
  bool get isTransferable => this == transferable;

  /// needs factor?
  bool get needsFactor => this == needsFirstFactor || this == needsSecondFactor;

  /// Do we need factors for this stage?
  bool needsFactorFor(Stage stage) => switch (stage) {
        Stage.first => this == needsFirstFactor,
        Stage.second => this == needsSecondFactor,
      };

  /// toString
  @override
  String toString() => name;

  /// toJson
  String toJson() => name;

  /// A display title for this attribute
  String get title => name.replaceAll('_', ' ');
}
