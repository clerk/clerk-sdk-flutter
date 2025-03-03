//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

// tests for UpdateDomainRequest
void main() {
  // final instance = UpdateDomainRequest();

  group('test UpdateDomainRequest', () {
    // The new domain name. For development instances, can contain the port, i.e `myhostname:3000`. For production instances, must be a valid FQDN, i.e `mysite.com`. Cannot contain protocol scheme.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // The full URL of the proxy that will forward requests to Clerk's Frontend API. Can only be updated for production instances.
    // String proxyUrl
    test('to test the property `proxyUrl`', () async {
      // TODO
    });

    // Whether this is a domain for a secondary app, meaning that any subdomain provided is significant and will be stored as part of the domain. This is useful for supporting multiple apps (one primary and multiple secondaries) on the same root domain (eTLD+1).
    // bool isSecondary
    test('to test the property `isSecondary`', () async {
      // TODO
    });
  });
}
