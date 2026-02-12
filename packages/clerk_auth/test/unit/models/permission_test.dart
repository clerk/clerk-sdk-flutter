import 'package:clerk_auth/src/models/client/permission.dart';

import '../../test_helpers.dart';

void main() {
  group('Permission', () {
    test('profileManage has correct name', () {
      expect(Permission.profileManage.name, 'org:sys_profile:manage');
    });

    test('profileDelete has correct name', () {
      expect(Permission.profileDelete.name, 'org:sys_profile:delete');
    });

    test('membershipsRead has correct name', () {
      expect(Permission.membershipsRead.name, 'org:sys_memberships:read');
    });

    test('membershipsManage has correct name', () {
      expect(Permission.membershipsManage.name, 'org:sys_memberships:manage');
    });

    test('domainsRead has correct name', () {
      expect(Permission.domainsRead.name, 'org:sys_domains:read');
    });

    test('domainsManage has correct name', () {
      expect(Permission.domainsManage.name, 'org:sys_domains:manage');
    });

    test('factory constructor returns existing permission for known name', () {
      final permission = Permission(name: 'org:sys_profile:manage');
      expect(permission, Permission.profileManage);
    });

    test('factory constructor creates new permission for unknown name', () {
      final permission = Permission(name: 'org:custom:permission');
      expect(permission.name, 'org:custom:permission');
    });

    test('fromJson creates permission from string', () {
      final permission = Permission.fromJson('org:sys_memberships:read');
      expect(permission, Permission.membershipsRead);
    });

    test('toJson returns permission name', () {
      expect(Permission.profileManage.toJson(), 'org:sys_profile:manage');
    });

    test('toString returns permission name', () {
      expect(Permission.domainsManage.toString(), 'org:sys_domains:manage');
    });

    test('values contains all predefined permissions', () {
      final values = Permission.values;
      expect(values.contains(Permission.profileManage), true);
      expect(values.contains(Permission.profileDelete), true);
      expect(values.contains(Permission.membershipsRead), true);
      expect(values.contains(Permission.membershipsManage), true);
      expect(values.contains(Permission.domainsRead), true);
      expect(values.contains(Permission.domainsManage), true);
    });

    test('index returns correct position in values list', () {
      expect(Permission.profileManage.index >= 0, true);
      expect(Permission.profileDelete.index >= 0, true);
    });
  });
}

