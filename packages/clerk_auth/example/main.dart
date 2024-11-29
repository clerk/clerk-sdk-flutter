import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final api = Api(
    publishableKey: '<YOUR-PUBLISHABLE-KEY>',
  );

  final response = await api.createSignIn(identifier: '<USER-EMAIL>');
  assert(response.client?.signIn?.status == Status.needsFirstFactor);

  final signIn = response.client!.signIn!;
  final attemptResponse = await api.attemptSignIn(
    signIn,
    stage: Stage.first,
    strategy: Strategy.password,
    password: '<PASSWORD>',
  );

  final client = attemptResponse.client;
  assert(client?.signIn == null);
  assert(client?.activeSession?.status == Status.active);
  assert(client?.activeSession?.publicUserData.identifier.isNotEmpty == true);
}
