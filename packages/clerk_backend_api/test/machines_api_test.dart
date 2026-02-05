//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

/// tests for MachinesApi
void main() {
  // final instance = MachinesApi();

  group('tests for MachinesApi', () {
    // Create a machine
    //
    // Creates a new machine.
    //
    //Future<CreateMachine200Response> createMachine({ CreateMachineRequest createMachineRequest }) async
    test('test createMachine', () async {
      // TODO
    });

    // Create a machine scope
    //
    // Creates a new machine scope, allowing the specified machine to access another machine. Maximum of 150 scopes per machine.
    //
    //Future<MachineScope> createMachineScope(String machineId, { CreateMachineScopeRequest createMachineScopeRequest }) async
    test('test createMachineScope', () async {
      // TODO
    });

    // Delete a machine
    //
    // Deletes a machine.
    //
    //Future<DeleteMachine200Response> deleteMachine(String machineId) async
    test('test deleteMachine', () async {
      // TODO
    });

    // Delete a machine scope
    //
    // Deletes a machine scope, removing access from one machine to another.
    //
    //Future<DeleteMachineScope200Response> deleteMachineScope(String machineId, String otherMachineId) async
    test('test deleteMachineScope', () async {
      // TODO
    });

    // Retrieve a machine
    //
    // Returns the details of a machine.
    //
    //Future<Machine> getMachine(String machineId) async
    test('test getMachine', () async {
      // TODO
    });

    // Retrieve a machine secret key
    //
    // Returns the secret key for a machine.
    //
    //Future<GetMachineSecretKey200Response> getMachineSecretKey(String machineId) async
    test('test getMachineSecretKey', () async {
      // TODO
    });

    // Get a list of machines for an instance
    //
    // This request returns the list of machines for an instance. The machines are ordered by descending creation date (i.e. most recent machines will be returned first)
    //
    //Future<ListMachines200Response> listMachines({ int limit, int offset, String query, String orderBy }) async
    test('test listMachines', () async {
      // TODO
    });

    // Rotate a machine's secret key
    //
    // Rotates the machine's secret key. When the secret key is rotated, make sure to update it in your machine/application. The previous secret key will remain valid for the duration specified by the previous_token_ttl parameter.
    //
    //Future<GetMachineSecretKey200Response> rotateMachineSecretKey(String machineId, RotateMachineSecretKeyRequest rotateMachineSecretKeyRequest) async
    test('test rotateMachineSecretKey', () async {
      // TODO
    });

    // Update a machine
    //
    // Updates an existing machine. Only the provided fields will be updated.
    //
    //Future<Machine> updateMachine(String machineId, { UpdateMachineRequest updateMachineRequest }) async
    test('test updateMachine', () async {
      // TODO
    });
  });
}
