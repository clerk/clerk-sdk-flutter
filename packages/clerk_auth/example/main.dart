// ignore_for_file: avoid_print

import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart';

Future<void> main() async {
  final auth = Auth(
    config: AuthConfig(
      publishableKey: '<YOUR-PUBLISHABLE-KEY>',
      persistor: DefaultPersistor(
        getCacheDirectory: () => Directory.current,
      ),
      // To enable running of the example in e.g. Flutter environments where
      // [Directory.current] causes problems, use the `clerk_flutter` package and
      // use:
      // persistor: DefaultCachingPersistor(
      //   getCacheDirectory: getApplicationDocumentsDirectory,
      // )
      // Which will use the correct directory for the platform your Flutter app
      // is running on. You can also implement a bespoke [Persistor] specific
      // to your applications storage mechanism,
      //
      // or replace the above line with...
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
