//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WaitlistEntry {
  /// Returns a new [WaitlistEntry] instance.
  WaitlistEntry({
    required this.object,
    required this.id,
    required this.emailAddress,
    required this.status,
    this.isLocked,
    required this.createdAt,
    required this.updatedAt,
    this.invitation,
  });

  WaitlistEntryObjectEnum object;

  String id;

  String emailAddress;

  WaitlistEntryStatusEnum status;

  /// Indicates if the waitlist entry is locked. Locked entries are being processed in a batch action and are unavailable for other actions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isLocked;

  /// Unix timestamp of creation.
  int createdAt;

  /// Unix timestamp of last update.
  int updatedAt;

  WaitlistEntryInvitation? invitation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaitlistEntry &&
          other.object == object &&
          other.id == id &&
          other.emailAddress == emailAddress &&
          other.status == status &&
          other.isLocked == isLocked &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.invitation == invitation;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) +
      (id.hashCode) +
      (emailAddress.hashCode) +
      (status.hashCode) +
      (isLocked == null ? 0 : isLocked!.hashCode) +
      (createdAt.hashCode) +
      (updatedAt.hashCode) +
      (invitation == null ? 0 : invitation!.hashCode);

  @override
  String toString() =>
      'WaitlistEntry[object=$object, id=$id, emailAddress=$emailAddress, status=$status, isLocked=$isLocked, createdAt=$createdAt, updatedAt=$updatedAt, invitation=$invitation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = this.object;
    json[r'id'] = this.id;
    json[r'email_address'] = this.emailAddress;
    json[r'status'] = this.status;
    if (this.isLocked != null) {
      json[r'is_locked'] = this.isLocked;
    } else {
      json[r'is_locked'] = null;
    }
    json[r'created_at'] = this.createdAt;
    json[r'updated_at'] = this.updatedAt;
    if (this.invitation != null) {
      json[r'invitation'] = this.invitation;
    } else {
      json[r'invitation'] = null;
    }
    return json;
  }

  /// Returns a new [WaitlistEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WaitlistEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "WaitlistEntry[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "WaitlistEntry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WaitlistEntry(
        object: WaitlistEntryObjectEnum.fromJson(json[r'object'])!,
        id: mapValueOfType<String>(json, r'id')!,
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        status: WaitlistEntryStatusEnum.fromJson(json[r'status'])!,
        isLocked: mapValueOfType<bool>(json, r'is_locked'),
        createdAt: mapValueOfType<int>(json, r'created_at')!,
        updatedAt: mapValueOfType<int>(json, r'updated_at')!,
        invitation: WaitlistEntryInvitation.fromJson(json[r'invitation']),
      );
    }
    return null;
  }

  static List<WaitlistEntry> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <WaitlistEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WaitlistEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WaitlistEntry> mapFromJson(dynamic json) {
    final map = <String, WaitlistEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WaitlistEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WaitlistEntry-objects as value to a dart map
  static Map<String, List<WaitlistEntry>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<WaitlistEntry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WaitlistEntry.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'object',
    'id',
    'email_address',
    'status',
    'created_at',
    'updated_at',
  };
}

class WaitlistEntryObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const WaitlistEntryObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const waitlistEntry = WaitlistEntryObjectEnum._(r'waitlist_entry');

  /// List of all possible values in this [enum][WaitlistEntryObjectEnum].
  static const values = <WaitlistEntryObjectEnum>[
    waitlistEntry,
  ];

  static WaitlistEntryObjectEnum? fromJson(dynamic value) =>
      WaitlistEntryObjectEnumTypeTransformer().decode(value);

  static List<WaitlistEntryObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <WaitlistEntryObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WaitlistEntryObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WaitlistEntryObjectEnum] to String,
/// and [decode] dynamic data back to [WaitlistEntryObjectEnum].
class WaitlistEntryObjectEnumTypeTransformer {
  factory WaitlistEntryObjectEnumTypeTransformer() =>
      _instance ??= const WaitlistEntryObjectEnumTypeTransformer._();

  const WaitlistEntryObjectEnumTypeTransformer._();

  String encode(WaitlistEntryObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a WaitlistEntryObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WaitlistEntryObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'waitlist_entry':
          return WaitlistEntryObjectEnum.waitlistEntry;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WaitlistEntryObjectEnumTypeTransformer] instance.
  static WaitlistEntryObjectEnumTypeTransformer? _instance;
}

class WaitlistEntryStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const WaitlistEntryStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = WaitlistEntryStatusEnum._(r'pending');
  static const invited = WaitlistEntryStatusEnum._(r'invited');
  static const rejected = WaitlistEntryStatusEnum._(r'rejected');
  static const completed = WaitlistEntryStatusEnum._(r'completed');

  /// List of all possible values in this [enum][WaitlistEntryStatusEnum].
  static const values = <WaitlistEntryStatusEnum>[
    pending,
    invited,
    rejected,
    completed,
  ];

  static WaitlistEntryStatusEnum? fromJson(dynamic value) =>
      WaitlistEntryStatusEnumTypeTransformer().decode(value);

  static List<WaitlistEntryStatusEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <WaitlistEntryStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WaitlistEntryStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WaitlistEntryStatusEnum] to String,
/// and [decode] dynamic data back to [WaitlistEntryStatusEnum].
class WaitlistEntryStatusEnumTypeTransformer {
  factory WaitlistEntryStatusEnumTypeTransformer() =>
      _instance ??= const WaitlistEntryStatusEnumTypeTransformer._();

  const WaitlistEntryStatusEnumTypeTransformer._();

  String encode(WaitlistEntryStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a WaitlistEntryStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WaitlistEntryStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending':
          return WaitlistEntryStatusEnum.pending;
        case r'invited':
          return WaitlistEntryStatusEnum.invited;
        case r'rejected':
          return WaitlistEntryStatusEnum.rejected;
        case r'completed':
          return WaitlistEntryStatusEnum.completed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [WaitlistEntryStatusEnumTypeTransformer] instance.
  static WaitlistEntryStatusEnumTypeTransformer? _instance;
}
