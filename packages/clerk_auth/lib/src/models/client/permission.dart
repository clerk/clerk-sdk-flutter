import 'package:meta/meta.dart';

/// Pseudo-enum representing permissions
///
@immutable
class Permission {
  const Permission._(this.name);

  /// Create a [Permission]
  factory Permission({required String name}) {
    return _values[name] ??= Permission._(name);
  }

  /// fromJson factory for JsonSerializable
  factory Permission.fromJson(dynamic name) => Permission(name: name as String);

  /// profile manage
  static const profileManage = Permission._('org:sys_profile:manage');

  /// profile delete
  static const profileDelete = Permission._('org:sys_profile:delete');

  /// memberships read
  static const membershipsRead = Permission._('org:sys_memberships:read');

  /// memberships manage
  static const membershipsManage = Permission._('org:sys_memberships:manage');

  /// domains read
  static const domainsRead = Permission._('org:sys_domains:read');

  /// domains manage
  static const domainsManage = Permission._('org:sys_domains:manage');

  static final _values = <String, Permission>{
    profileManage.name: profileManage,
    profileDelete.name: profileDelete,
    membershipsRead.name: membershipsRead,
    membershipsManage.name: membershipsManage,
    domainsRead.name: domainsRead,
    domainsManage.name: domainsManage,
  };

  /// The [values] of the Permissions
  static List<Permission> get values => _values.values.toList(growable: false);

  /// The index of this field
  int get index => values.indexOf(this);

  /// the [name] of the [Permission]
  final String name;

  /// toJson
  String toJson() => name;

  /// toJson
  @override
  String toString() => name;
}
