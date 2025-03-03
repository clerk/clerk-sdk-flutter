//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBulkInvitationsRequestInner {
  /// Returns a new [CreateBulkInvitationsRequestInner] instance.
  CreateBulkInvitationsRequestInner({
    required this.emailAddress,
    this.publicMetadata = const {},
    this.redirectUrl,
    this.notify = true,
    this.ignoreExisting = false,
    this.expiresInDays,
    this.templateSlug =
        const CreateBulkInvitationsRequestInnerTemplateSlugEnum._('invitation'),
  });

  /// The email address the invitation will be sent to
  String emailAddress;

  /// Metadata that will be attached to the newly created invitation. The value of this property should be a well-formed JSON object. Once the user accepts the invitation and signs up, these metadata will end up in the user's public metadata.
  Map<String, Object>? publicMetadata;

  /// The URL where the user is redirected upon visiting the invitation link, where they can accept the invitation. Required if you have implemented a [custom flow for handling application invitations](/docs/custom-flows/invitations).
  String? redirectUrl;

  /// Optional flag which denotes whether an email invitation should be sent to the given email address. Defaults to true.
  bool? notify;

  /// Whether an invitation should be created if there is already an existing invitation for this email address, or it's claimed by another user.
  bool? ignoreExisting;

  /// The number of days the invitation will be valid for. By default, the invitation expires after 30 days.
  ///
  /// Minimum value: 1
  /// Maximum value: 365
  int? expiresInDays;

  /// The slug of the email template to use for the invitation email.
  CreateBulkInvitationsRequestInnerTemplateSlugEnum templateSlug;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateBulkInvitationsRequestInner &&
          other.emailAddress == emailAddress &&
          _deepEquality.equals(other.publicMetadata, publicMetadata) &&
          other.redirectUrl == redirectUrl &&
          other.notify == notify &&
          other.ignoreExisting == ignoreExisting &&
          other.expiresInDays == expiresInDays &&
          other.templateSlug == templateSlug;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (emailAddress.hashCode) +
      (publicMetadata == null ? 0 : publicMetadata!.hashCode) +
      (redirectUrl == null ? 0 : redirectUrl!.hashCode) +
      (notify == null ? 0 : notify!.hashCode) +
      (ignoreExisting == null ? 0 : ignoreExisting!.hashCode) +
      (expiresInDays == null ? 0 : expiresInDays!.hashCode) +
      (templateSlug.hashCode);

  @override
  String toString() =>
      'CreateBulkInvitationsRequestInner[emailAddress=$emailAddress, publicMetadata=$publicMetadata, redirectUrl=$redirectUrl, notify=$notify, ignoreExisting=$ignoreExisting, expiresInDays=$expiresInDays, templateSlug=$templateSlug]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'email_address'] = this.emailAddress;
    if (this.publicMetadata != null) {
      json[r'public_metadata'] = this.publicMetadata;
    } else {
      json[r'public_metadata'] = null;
    }
    if (this.redirectUrl != null) {
      json[r'redirect_url'] = this.redirectUrl;
    } else {
      json[r'redirect_url'] = null;
    }
    if (this.notify != null) {
      json[r'notify'] = this.notify;
    } else {
      json[r'notify'] = null;
    }
    if (this.ignoreExisting != null) {
      json[r'ignore_existing'] = this.ignoreExisting;
    } else {
      json[r'ignore_existing'] = null;
    }
    if (this.expiresInDays != null) {
      json[r'expires_in_days'] = this.expiresInDays;
    } else {
      json[r'expires_in_days'] = null;
    }
    json[r'template_slug'] = this.templateSlug;
    return json;
  }

  /// Returns a new [CreateBulkInvitationsRequestInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBulkInvitationsRequestInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateBulkInvitationsRequestInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateBulkInvitationsRequestInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateBulkInvitationsRequestInner(
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        redirectUrl: mapValueOfType<String>(json, r'redirect_url'),
        notify: mapValueOfType<bool>(json, r'notify') ?? true,
        ignoreExisting: mapValueOfType<bool>(json, r'ignore_existing') ?? false,
        expiresInDays: mapValueOfType<int>(json, r'expires_in_days'),
        templateSlug:
            CreateBulkInvitationsRequestInnerTemplateSlugEnum.fromJson(
                    json[r'template_slug']) ??
                CreateBulkInvitationsRequestInnerTemplateSlugEnum.invitation,
      );
    }
    return null;
  }

  static List<CreateBulkInvitationsRequestInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateBulkInvitationsRequestInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBulkInvitationsRequestInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBulkInvitationsRequestInner> mapFromJson(
      dynamic json) {
    final map = <String, CreateBulkInvitationsRequestInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateBulkInvitationsRequestInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBulkInvitationsRequestInner-objects as value to a dart map
  static Map<String, List<CreateBulkInvitationsRequestInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateBulkInvitationsRequestInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBulkInvitationsRequestInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email_address',
  };
}

/// The slug of the email template to use for the invitation email.
class CreateBulkInvitationsRequestInnerTemplateSlugEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateBulkInvitationsRequestInnerTemplateSlugEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const invitation =
      CreateBulkInvitationsRequestInnerTemplateSlugEnum._(r'invitation');
  static const waitlistInvitation =
      CreateBulkInvitationsRequestInnerTemplateSlugEnum._(
          r'waitlist_invitation');

  /// List of all possible values in this [enum][CreateBulkInvitationsRequestInnerTemplateSlugEnum].
  static const values = <CreateBulkInvitationsRequestInnerTemplateSlugEnum>[
    invitation,
    waitlistInvitation,
  ];

  static CreateBulkInvitationsRequestInnerTemplateSlugEnum? fromJson(
          dynamic value) =>
      CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer()
          .decode(value);

  static List<CreateBulkInvitationsRequestInnerTemplateSlugEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateBulkInvitationsRequestInnerTemplateSlugEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            CreateBulkInvitationsRequestInnerTemplateSlugEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateBulkInvitationsRequestInnerTemplateSlugEnum] to String,
/// and [decode] dynamic data back to [CreateBulkInvitationsRequestInnerTemplateSlugEnum].
class CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer {
  factory CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer() =>
      _instance ??=
          const CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer
              ._();

  const CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer._();

  String encode(CreateBulkInvitationsRequestInnerTemplateSlugEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a CreateBulkInvitationsRequestInnerTemplateSlugEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateBulkInvitationsRequestInnerTemplateSlugEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'invitation':
          return CreateBulkInvitationsRequestInnerTemplateSlugEnum.invitation;
        case r'waitlist_invitation':
          return CreateBulkInvitationsRequestInnerTemplateSlugEnum
              .waitlistInvitation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer] instance.
  static CreateBulkInvitationsRequestInnerTemplateSlugEnumTypeTransformer?
      _instance;
}
