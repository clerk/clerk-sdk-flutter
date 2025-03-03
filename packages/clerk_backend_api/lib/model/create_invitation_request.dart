//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateInvitationRequest {
  /// Returns a new [CreateInvitationRequest] instance.
  CreateInvitationRequest({
    required this.emailAddress,
    this.publicMetadata = const {},
    this.redirectUrl,
    this.notify = true,
    this.ignoreExisting = false,
    this.expiresInDays,
    this.templateSlug,
  });

  /// The email address the invitation will be sent to
  String emailAddress;

  /// Metadata that will be attached to the newly created invitation. The value of this property should be a well-formed JSON object. Once the user accepts the invitation and signs up, these metadata will end up in the user's public metadata.
  Map<String, Object> publicMetadata;

  /// Optional URL which specifies where to redirect the user once they click the invitation link. This is only required if you have implemented a [custom flow](https://clerk.com/docs/authentication/invitations#custom-flow) and you're not using Clerk Hosted Pages or Clerk Components.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? redirectUrl;

  /// Optional flag which denotes whether an email invitation should be sent to the given email address. Defaults to `true`.
  bool? notify;

  /// Whether an invitation should be created if there is already an existing invitation for this email address, or it's claimed by another user.
  bool? ignoreExisting;

  /// The number of days the invitation will be valid for. By default, the invitation expires after 30 days.
  ///
  /// Minimum value: 1
  /// Maximum value: 365
  int? expiresInDays;

  /// The slug of the email template to use for the invitation email.
  CreateInvitationRequestTemplateSlugEnum? templateSlug;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateInvitationRequest &&
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
      (publicMetadata.hashCode) +
      (redirectUrl == null ? 0 : redirectUrl!.hashCode) +
      (notify == null ? 0 : notify!.hashCode) +
      (ignoreExisting == null ? 0 : ignoreExisting!.hashCode) +
      (expiresInDays == null ? 0 : expiresInDays!.hashCode) +
      (templateSlug == null ? 0 : templateSlug!.hashCode);

  @override
  String toString() =>
      'CreateInvitationRequest[emailAddress=$emailAddress, publicMetadata=$publicMetadata, redirectUrl=$redirectUrl, notify=$notify, ignoreExisting=$ignoreExisting, expiresInDays=$expiresInDays, templateSlug=$templateSlug]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'email_address'] = this.emailAddress;
    json[r'public_metadata'] = this.publicMetadata;
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
    if (this.templateSlug != null) {
      json[r'template_slug'] = this.templateSlug;
    } else {
      json[r'template_slug'] = null;
    }
    return json;
  }

  /// Returns a new [CreateInvitationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateInvitationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "CreateInvitationRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "CreateInvitationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateInvitationRequest(
        emailAddress: mapValueOfType<String>(json, r'email_address')!,
        publicMetadata:
            mapCastOfType<String, Object>(json, r'public_metadata') ?? const {},
        redirectUrl: mapValueOfType<String>(json, r'redirect_url'),
        notify: mapValueOfType<bool>(json, r'notify') ?? true,
        ignoreExisting: mapValueOfType<bool>(json, r'ignore_existing') ?? false,
        expiresInDays: mapValueOfType<int>(json, r'expires_in_days'),
        templateSlug: CreateInvitationRequestTemplateSlugEnum.fromJson(
            json[r'template_slug']),
      );
    }
    return null;
  }

  static List<CreateInvitationRequest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateInvitationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateInvitationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateInvitationRequest> mapFromJson(dynamic json) {
    final map = <String, CreateInvitationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateInvitationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateInvitationRequest-objects as value to a dart map
  static Map<String, List<CreateInvitationRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<CreateInvitationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateInvitationRequest.listFromJson(
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
class CreateInvitationRequestTemplateSlugEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateInvitationRequestTemplateSlugEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const invitation =
      CreateInvitationRequestTemplateSlugEnum._(r'invitation');
  static const waitlistInvitation =
      CreateInvitationRequestTemplateSlugEnum._(r'waitlist_invitation');

  /// List of all possible values in this [enum][CreateInvitationRequestTemplateSlugEnum].
  static const values = <CreateInvitationRequestTemplateSlugEnum>[
    invitation,
    waitlistInvitation,
  ];

  static CreateInvitationRequestTemplateSlugEnum? fromJson(dynamic value) =>
      CreateInvitationRequestTemplateSlugEnumTypeTransformer().decode(value);

  static List<CreateInvitationRequestTemplateSlugEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <CreateInvitationRequestTemplateSlugEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateInvitationRequestTemplateSlugEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateInvitationRequestTemplateSlugEnum] to String,
/// and [decode] dynamic data back to [CreateInvitationRequestTemplateSlugEnum].
class CreateInvitationRequestTemplateSlugEnumTypeTransformer {
  factory CreateInvitationRequestTemplateSlugEnumTypeTransformer() =>
      _instance ??=
          const CreateInvitationRequestTemplateSlugEnumTypeTransformer._();

  const CreateInvitationRequestTemplateSlugEnumTypeTransformer._();

  String encode(CreateInvitationRequestTemplateSlugEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateInvitationRequestTemplateSlugEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateInvitationRequestTemplateSlugEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'invitation':
          return CreateInvitationRequestTemplateSlugEnum.invitation;
        case r'waitlist_invitation':
          return CreateInvitationRequestTemplateSlugEnum.waitlistInvitation;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateInvitationRequestTemplateSlugEnumTypeTransformer] instance.
  static CreateInvitationRequestTemplateSlugEnumTypeTransformer? _instance;
}
