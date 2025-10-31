import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk show AuthConfig;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart' as test show expect;

export 'package:flutter_test/flutter_test.dart';

export 'test_support/test_support.dart';

void expectThat(bool result, {String? reason}) =>
    test.expect(result, true, reason: reason);

extension AuthConfigExt on clerk.AuthConfig {
  ClerkAuthConfig toClerkAuthConfig() {
    return ClerkAuthConfig(
      publishableKey: publishableKey,
      sessionTokenPolling: sessionTokenPolling,
      isTestMode: isTestMode,
      telemetryEndpoint: telemetryEndpoint,
      telemetryPeriod: telemetryPeriod,
      clientRefreshPeriod: clientRefreshPeriod,
      httpService: httpService,
      httpConnectionTimeout: httpConnectionTimeout,
      persistor: persistor,
      fileCache: const _NoneFileCache(),
    );
  }
}

class _NoneFileCache implements ClerkFileCache {
  const _NoneFileCache();

  @override
  Future<void> initialize() async {}

  @override
  void terminate() {}

  @override
  Stream<File> stream(
    Uri uri, {
    Duration ttl = ClerkFileCache.defaultTTL,
    Map<String, String>? headers,
  }) async* {}
}

class ClerkFlutterTestApp extends StatelessWidget {
  const ClerkFlutterTestApp({super.key, required this.config});

  final ClerkAuthConfig config;

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: config,
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: ClerkErrorListener(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClerkAuthBuilder(
                  signedInBuilder: (_, __) => const ClerkUserButton(),
                  signedOutBuilder: (_, __) => const ClerkAuthentication(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
