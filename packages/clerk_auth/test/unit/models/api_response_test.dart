import 'dart:io';

import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/api/external_error.dart';
import 'package:clerk_auth/src/models/client/client.dart';

import '../../test_helpers.dart';

void main() {
  group('ApiResponse', () {
    group('constructor', () {
      test('creates response with required status', () {
        const response = ApiResponse(status: 200);
        expect(response.status, 200);
      });

      test('creates response with empty error collection by default', () {
        const response = ApiResponse(status: 200);
        expect(response.errorCollection.errors, isNull);
      });

      test('creates response with provided error collection', () {
        const error = ExternalError(message: 'Test error', code: 'test_error');
        const errorCollection = ExternalErrorCollection(errors: [error]);
        const response = ApiResponse(
          status: 400,
          errorCollection: errorCollection,
        );
        expect(response.errorCollection.errors, isNotNull);
        expect(response.errorCollection.errors!.length, 1);
      });

      test('creates response with client', () {
        const response = ApiResponse(
          status: 200,
          client: Client.empty,
        );
        expect(response.client, isNotNull);
      });

      test('creates response with response data', () {
        const response = ApiResponse(
          status: 200,
          response: {'key': 'value'},
        );
        expect(response.response, isNotNull);
        expect(response.response!['key'], 'value');
      });
    });

    group('fatal factory', () {
      test('creates response with status 0', () {
        const error = ExternalError(message: 'Fatal error', code: 'fatal');
        final response = ApiResponse.fatal(error: error);
        expect(response.status, 0);
      });

      test('creates response with provided error', () {
        const error = ExternalError(message: 'Fatal error', code: 'fatal');
        final response = ApiResponse.fatal(error: error);
        expect(response.errorCollection.errors!.length, 1);
        expect(response.errorCollection.errors!.first.message, 'Fatal error');
      });

      test('creates response with null client', () {
        const error = ExternalError(message: 'Fatal error', code: 'fatal');
        final response = ApiResponse.fatal(error: error);
        expect(response.client, isNull);
      });

      test('creates response with null response data', () {
        const error = ExternalError(message: 'Fatal error', code: 'fatal');
        final response = ApiResponse.fatal(error: error);
        expect(response.response, isNull);
      });
    });

    group('isOkay', () {
      test('returns true for status 200', () {
        const response = ApiResponse(status: HttpStatus.ok);
        expect(response.isOkay);
      });

      test('returns false for status 400', () {
        const response = ApiResponse(status: 400);
        expect(response.isOkay, false);
      });

      test('returns false for status 500', () {
        const response = ApiResponse(status: 500);
        expect(response.isOkay, false);
      });

      test('returns false for status 0', () {
        const response = ApiResponse(status: 0);
        expect(response.isOkay, false);
      });
    });

    group('isError', () {
      test('returns false for status 200', () {
        const response = ApiResponse(status: HttpStatus.ok);
        expect(response.isError, false);
      });

      test('returns true for status 400', () {
        const response = ApiResponse(status: 400);
        expect(response.isError);
      });

      test('returns true for status 0', () {
        const response = ApiResponse(status: 0);
        expect(response.isError);
      });
    });

    group('hasClient', () {
      test('returns true when status is ok and client exists', () {
        const response = ApiResponse(
          status: HttpStatus.ok,
          client: Client.empty,
        );
        expect(response.hasClient);
      });

      test('returns false when status is not ok', () {
        const response = ApiResponse(
          status: 400,
          client: Client.empty,
        );
        expect(response.hasClient, false);
      });

      test('returns false when client is null', () {
        const response = ApiResponse(status: HttpStatus.ok);
        expect(response.hasClient, false);
      });
    });

    group('toJson', () {
      test('returns map with status', () {
        const response = ApiResponse(status: 200);
        final json = response.toJson();
        expect(json['status'], 200);
      });

      test('returns map with errors', () {
        const response = ApiResponse(status: 200);
        final json = response.toJson();
        expect(json.containsKey('errors'));
      });

      test('returns map with client', () {
        const response = ApiResponse(status: 200, client: Client.empty);
        final json = response.toJson();
        expect(json.containsKey('client'));
      });
    });
  });
}
