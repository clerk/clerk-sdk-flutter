// ignore_for_file: avoid_print

import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    config: AuthConfig(
      publishableKey: '<YOUR-PUBLISHABLE-KEY>',
      persistor: DefaultPersistor(directoryGetter: () => Directory.current),
    ),
  );

  await auth.initialize();

  await auth.attemptSignIn(
    strategy: Strategy.password,
    identifier: '<USER-EMAIL>',
    password: '<PASSWORD>',
  );

  print('Signed in as ${auth.user}');

  await auth.signOut();

  auth.terminate();
}
