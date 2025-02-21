import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    publishableKey: '<YOUR-PUBLISHABLE-KEY>',
    persistor: await DefaultPersistor.create(
      storageDirectory: Directory.current,
    ),
  );

  Client client;

  client = await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: '<USER-EMAIL>',
  );
  assert(client.signIn?.status == Status.needsFirstFactor);

  client = await auth.attemptSignIn(
    strategy: Strategy.password,
    password: '<PASSWORD>',
  );

  assert(client.signIn == null);
  assert(client.activeSession?.status == Status.active);
  assert(client.activeSession?.publicUserData.identifier.isNotEmpty == true);
}
