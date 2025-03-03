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

/// tests for DomainsApi
void main() {
  // final instance = DomainsApi();

  group('tests for DomainsApi', () {
    // Add a domain
    //
    // Add a new domain for your instance. Useful in the case of multi-domain instances, allows adding satellite domains to an instance. The new domain must have a `name`. The domain name can contain the port for development instances, like `localhost:3000`. At the moment, instances can have only one primary domain, so the `is_satellite` parameter must be set to `true`. If you're planning to configure the new satellite domain to run behind a proxy, pass the `proxy_url` parameter accordingly.
    //
    //Future<Domain> addDomain({ AddDomainRequest addDomainRequest }) async
    test('test addDomain', () async {
      // TODO
    });

    // Delete a satellite domain
    //
    // Deletes a satellite domain for the instance. It is currently not possible to delete the instance's primary domain.
    //
    //Future<DeletedObject> deleteDomain(String domainId) async
    test('test deleteDomain', () async {
      // TODO
    });

    // List all instance domains
    //
    // Use this endpoint to get a list of all domains for an instance. The response will contain the primary domain for the instance and any satellite domains. Each domain in the response contains information about the URLs where Clerk operates and the required CNAME targets.
    //
    //Future<Domains> listDomains() async
    test('test listDomains', () async {
      // TODO
    });

    // Update a domain
    //
    // The `proxy_url` can be updated only for production instances. Update one of the instance's domains. Both primary and satellite domains can be updated. If you choose to use Clerk via proxy, use this endpoint to specify the `proxy_url`. Whenever you decide you'd rather switch to DNS setup for Clerk, simply set `proxy_url` to `null` for the domain. When you update a production instance's primary domain name, you have to make sure that you've completed all the necessary setup steps for DNS and emails to work. Expect downtime otherwise. Updating a primary domain's name will also update the instance's home origin, affecting the default application paths.
    //
    //Future<Domain> updateDomain(String domainId, UpdateDomainRequest updateDomainRequest) async
    test('test updateDomain', () async {
      // TODO
    });
  });
}
