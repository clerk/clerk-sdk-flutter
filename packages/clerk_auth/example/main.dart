// ignore_for_file: avoid_print

import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    config: AuthConfig(
      publishableKey: '<YOUR-PUBLISHABLE-KEY>',
      persistor: DefaultPersistor(getCacheDirectory: () => Directory.current),

      // To enable running of the example in e.g. Flutter environments where
      // [Directory.current] causes problems, implement a bespoke [Persistor]
      // for your environment, or replace the above line with...
      //
      // persistor: Persistor.none,
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
