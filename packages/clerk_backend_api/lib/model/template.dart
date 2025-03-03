//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Template {
  /// Returns a new [Template] instance.
  Template({
    this.id,
    this.object,
    this.instanceId,
    this.resourceType,
    this.templateType,
    this.name,
    this.slug,
    this.position,
    this.canRevert,
    this.canDelete,
    this.canToggle,
    this.subject,
    this.markup,
    this.body,
    this.availableVariables = const [],
    this.requiredVariables = const [],
    this.fromEmailName,
    this.replyToEmailName,
    this.deliveredByClerk,
    this.enabled,
    this.updatedAt,
    this.createdAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// String representing the object's type. Objects of the same type share the same value.
  TemplateObjectEnum? object;

  /// the id of the instance the template belongs to
  String? instanceId;

  /// whether this is a system (default) or user overridden) template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resourceType;

  /// whether this is an email or SMS template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? templateType;

  /// user-friendly name of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// machine-friendly name of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? slug;

  /// position with the listing of templates
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? position;

  /// whether this template can be reverted to the corresponding system default
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? canRevert;

  /// whether this template can be deleted
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? canDelete;

  /// whether this template can be enabled or disabled, true only for notification SMS templates
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? canToggle;

  /// email subject
  String? subject;

  /// the editor markup used to generate the body of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? markup;

  /// the template body before variable interpolation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? body;

  /// list of variables that are available for use in the template body
  List<String> availableVariables;

  /// list of variables that must be contained in the template body
  List<String> requiredVariables;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fromEmailName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? replyToEmailName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deliveredByClerk;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enabled;

  /// Unix timestamp of last update.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedAt;

  /// Unix timestamp of creation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Template &&
          other.id == id &&
          other.object == object &&
          other.instanceId == instanceId &&
          other.resourceType == resourceType &&
          other.templateType == templateType &&
          other.name == name &&
          other.slug == slug &&
          other.position == position &&
          other.canRevert == canRevert &&
          other.canDelete == canDelete &&
          other.canToggle == canToggle &&
          other.subject == subject &&
          other.markup == markup &&
          other.body == body &&
          _deepEquality.equals(other.availableVariables, availableVariables) &&
          _deepEquality.equals(other.requiredVariables, requiredVariables) &&
          other.fromEmailName == fromEmailName &&
          other.replyToEmailName == replyToEmailName &&
          other.deliveredByClerk == deliveredByClerk &&
          other.enabled == enabled &&
          other.updatedAt == updatedAt &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (object == null ? 0 : object!.hashCode) +
      (instanceId == null ? 0 : instanceId!.hashCode) +
      (resourceType == null ? 0 : resourceType!.hashCode) +
      (templateType == null ? 0 : templateType!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (slug == null ? 0 : slug!.hashCode) +
      (position == null ? 0 : position!.hashCode) +
      (canRevert == null ? 0 : canRevert!.hashCode) +
      (canDelete == null ? 0 : canDelete!.hashCode) +
      (canToggle == null ? 0 : canToggle!.hashCode) +
      (subject == null ? 0 : subject!.hashCode) +
      (markup == null ? 0 : markup!.hashCode) +
      (body == null ? 0 : body!.hashCode) +
      (availableVariables.hashCode) +
      (requiredVariables.hashCode) +
      (fromEmailName == null ? 0 : fromEmailName!.hashCode) +
      (replyToEmailName == null ? 0 : replyToEmailName!.hashCode) +
      (deliveredByClerk == null ? 0 : deliveredByClerk!.hashCode) +
      (enabled == null ? 0 : enabled!.hashCode) +
      (updatedAt == null ? 0 : updatedAt!.hashCode) +
      (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() =>
      'Template[id=$id, object=$object, instanceId=$instanceId, resourceType=$resourceType, templateType=$templateType, name=$name, slug=$slug, position=$position, canRevert=$canRevert, canDelete=$canDelete, canToggle=$canToggle, subject=$subject, markup=$markup, body=$body, availableVariables=$availableVariables, requiredVariables=$requiredVariables, fromEmailName=$fromEmailName, replyToEmailName=$replyToEmailName, deliveredByClerk=$deliveredByClerk, enabled=$enabled, updatedAt=$updatedAt, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.object != null) {
      json[r'object'] = this.object;
    } else {
      json[r'object'] = null;
    }
    if (this.instanceId != null) {
      json[r'instance_id'] = this.instanceId;
    } else {
      json[r'instance_id'] = null;
    }
    if (this.resourceType != null) {
      json[r'resource_type'] = this.resourceType;
    } else {
      json[r'resource_type'] = null;
    }
    if (this.templateType != null) {
      json[r'template_type'] = this.templateType;
    } else {
      json[r'template_type'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.slug != null) {
      json[r'slug'] = this.slug;
    } else {
      json[r'slug'] = null;
    }
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    if (this.canRevert != null) {
      json[r'can_revert'] = this.canRevert;
    } else {
      json[r'can_revert'] = null;
    }
    if (this.canDelete != null) {
      json[r'can_delete'] = this.canDelete;
    } else {
      json[r'can_delete'] = null;
    }
    if (this.canToggle != null) {
      json[r'can_toggle'] = this.canToggle;
    } else {
      json[r'can_toggle'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.markup != null) {
      json[r'markup'] = this.markup;
    } else {
      json[r'markup'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    json[r'available_variables'] = this.availableVariables;
    json[r'required_variables'] = this.requiredVariables;
    if (this.fromEmailName != null) {
      json[r'from_email_name'] = this.fromEmailName;
    } else {
      json[r'from_email_name'] = null;
    }
    if (this.replyToEmailName != null) {
      json[r'reply_to_email_name'] = this.replyToEmailName;
    } else {
      json[r'reply_to_email_name'] = null;
    }
    if (this.deliveredByClerk != null) {
      json[r'delivered_by_clerk'] = this.deliveredByClerk;
    } else {
      json[r'delivered_by_clerk'] = null;
    }
    if (this.enabled != null) {
      json[r'enabled'] = this.enabled;
    } else {
      json[r'enabled'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt;
    } else {
      json[r'updated_at'] = null;
    }
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt;
    } else {
      json[r'created_at'] = null;
    }
    return json;
  }

  /// Returns a new [Template] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Template? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Template[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Template[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Template(
        id: mapValueOfType<String>(json, r'id'),
        object: TemplateObjectEnum.fromJson(json[r'object']),
        instanceId: mapValueOfType<String>(json, r'instance_id'),
        resourceType: mapValueOfType<String>(json, r'resource_type'),
        templateType: mapValueOfType<String>(json, r'template_type'),
        name: mapValueOfType<String>(json, r'name'),
        slug: mapValueOfType<String>(json, r'slug'),
        position: mapValueOfType<int>(json, r'position'),
        canRevert: mapValueOfType<bool>(json, r'can_revert'),
        canDelete: mapValueOfType<bool>(json, r'can_delete'),
        canToggle: mapValueOfType<bool>(json, r'can_toggle'),
        subject: mapValueOfType<String>(json, r'subject'),
        markup: mapValueOfType<String>(json, r'markup'),
        body: mapValueOfType<String>(json, r'body'),
        availableVariables: json[r'available_variables'] is Iterable
            ? (json[r'available_variables'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        requiredVariables: json[r'required_variables'] is Iterable
            ? (json[r'required_variables'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        fromEmailName: mapValueOfType<String>(json, r'from_email_name'),
        replyToEmailName: mapValueOfType<String>(json, r'reply_to_email_name'),
        deliveredByClerk: mapValueOfType<bool>(json, r'delivered_by_clerk'),
        enabled: mapValueOfType<bool>(json, r'enabled'),
        updatedAt: mapValueOfType<int>(json, r'updated_at'),
        createdAt: mapValueOfType<int>(json, r'created_at'),
      );
    }
    return null;
  }

  static List<Template> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Template>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Template.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Template> mapFromJson(dynamic json) {
    final map = <String, Template>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Template.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Template-objects as value to a dart map
  static Map<String, List<Template>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Template>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Template.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}

/// String representing the object's type. Objects of the same type share the same value.
class TemplateObjectEnum {
  /// Instantiate a new enum with the provided [value].
  const TemplateObjectEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const template = TemplateObjectEnum._(r'template');

  /// List of all possible values in this [enum][TemplateObjectEnum].
  static const values = <TemplateObjectEnum>[
    template,
  ];

  static TemplateObjectEnum? fromJson(dynamic value) =>
      TemplateObjectEnumTypeTransformer().decode(value);

  static List<TemplateObjectEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TemplateObjectEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TemplateObjectEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TemplateObjectEnum] to String,
/// and [decode] dynamic data back to [TemplateObjectEnum].
class TemplateObjectEnumTypeTransformer {
  factory TemplateObjectEnumTypeTransformer() =>
      _instance ??= const TemplateObjectEnumTypeTransformer._();

  const TemplateObjectEnumTypeTransformer._();

  String encode(TemplateObjectEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TemplateObjectEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TemplateObjectEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'template':
          return TemplateObjectEnum.template;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TemplateObjectEnumTypeTransformer] instance.
  static TemplateObjectEnumTypeTransformer? _instance;
}
