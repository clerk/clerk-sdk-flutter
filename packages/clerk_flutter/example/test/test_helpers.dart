import 'dart:io';

import 'package:clerk_auth/clerk_auth.dart' as clerk show AuthConfig;
import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:clerk_flutter/src/utils/clerk_file_cache.dart';
import 'package:flutter/foundation.dart';
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

FlutterExceptionHandler setIgnoreOverflowErrors(
  FlutterExceptionHandler? override,
) {
  return (FlutterErrorDetails details, {bool forceReport = false}) {
    final hasReportableError = switch (details.exception) {
      FlutterError exception => exception.diagnostics.any(
          (e) {
            final value = e.toString();
            return value.startsWith('A RenderFlex overflowed by') == false &&
                value.startsWith('Unable to load asset') == false;
          },
        ),
      _ => true,
    };

    if (hasReportableError) {
      if (override case FlutterExceptionHandler override) {
        override(details);
      } else {
        FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
      }
    }
  };
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
