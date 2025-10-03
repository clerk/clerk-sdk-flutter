import 'dart:convert';

import 'package:clerk_auth/src/clerk_api/api.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/models/api/api_response.dart';
import 'package:clerk_auth/src/models/client/strategy.dart';
import 'package:clerk_auth/src/models/status.dart';
import 'package:clerk_auth/src/utils/logging.dart';
import 'package:test/test.dart';

import '../../test_helpers.dart';

void main() {
  late Api api;
  late TestEnv env;
  late TestHttpService httpService;

  setUpAll(() async {
    await setUpLogging(printer: TestLogPrinter(), level: Level.INFO);
  });

  tearDown(() async {
    httpService.expect(HttpMethod.delete, '/v1/me');
    await api.deleteUser();
  });

  Future<void> initialiseForTest(String testName) async {
    final id = base64Encode(testName.codeUnits).replaceAll('=', '');
    env = TestEnv(
      '.env.test',
      overrides: {
        'password': 'Ab$id%',
        'username': 'user-$id',
        'email': 'user-$id+clerk_test@somedomain.com',
        'phone_number': '+155555501${(testName.hashCode % 90) + 10}',
        'use_open_identifiers': true,
      },
    );
    httpService = TestHttpService('clerk_api/sign_up_test', env)
      ..recordPath = testName;

    httpService.expect(HttpMethod.post, '/v1/client');
    httpService.expect(HttpMethod.get, '/v1/environment');

    api = Api(
        config: TestAuthConfig(
      publishableKey: env.publishableKey,
      httpService: httpService,
    ));
    await api.initialize();
  }

  group('Can sign up:', () {
    test('with email code', () async {
      await runWithLogging(() async {
        await initialiseForTest('email_code');

        late ApiResponse response;

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups',
          params: {
            'strategy': 'email_code',
            'username': env.username,
            'email_address': env.email,
            'phone_number': env.phoneNumber,
            'password': env.password,
            'first_name': env.username,
            'last_name': env.username,
            'legal_accepted': true,
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/prepare_verification',
          params: {'strategy': 'email_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification',
          params: {'strategy': 'email_code', 'code': '424242'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/prepare_verification',
          params: {'strategy': 'phone_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification',
          params: {'strategy': 'phone_code', 'code': '424242'},
        );

        response = await api.createSignUp(
          strategy: Strategy.emailCode,
          emailAddress: env.email,
          phoneNumber: env.phoneNumber,
          username: env.username,
          password: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        final client = response.client;
        expect(client?.signUp, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });

    test('with phone code', () async {
      await runWithLogging(() async {
        await initialiseForTest('phone_code');

        late ApiResponse response;

        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups',
          params: {
            'strategy': 'phone_code',
            'username': env.username,
            'email_address': env.email,
            'phone_number': env.phoneNumber,
            'password': env.password,
            'first_name': env.username,
            'last_name': env.username,
            'legal_accepted': true,
          },
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/prepare_verification',
          params: {'strategy': 'phone_code'},
        );
        httpService.expect(
          HttpMethod.post,
          '/v1/client/sign_ups/SIGN_UP_ATTEMPT_ID/attempt_verification',
          params: {'strategy': 'phone_code', 'code': '424242'},
        );

        response = await api.createSignUp(
          strategy: Strategy.phoneCode,
          emailAddress: env.email,
          phoneNumber: env.phoneNumber,
          username: env.username,
          password: env.password,
          firstName: env.username,
          lastName: env.username,
          legalAccepted: true,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.phoneCode,
          code: env.code,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.prepareSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
        );
        expect(response.client?.signUp?.status, Status.missingRequirements);

        response = await api.attemptSignUp(
          response.client!.signUp!,
          strategy: Strategy.emailCode,
          code: env.code,
        );
        final client = response.client;
        expect(client?.signUp, null);
        expect(client?.activeSession?.status, Status.active);
        expect(
            client?.activeSession?.publicUserData.identifier?.isNotEmpty, true);
      });
    });
  });
}
