import 'dart:async';

import 'package:clerk_auth/src/utils/logging.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  late final Printer printer;
  late final LoggingTester tester;

  setUpAll(() async {
    printer = MockPrinter();
    tester = LoggingTester._();
    await setUpLogging(printer: printer);
  });

  test('uses the given Printer to print message', () async {
    await runWithLogging(() async {
      tester.test(Level.INFO, 'message');
      verify(() => printer.print(any(that: isA<String>()))).called(1);
    });
  });
}

class MockPrinter extends Mock implements Printer {}

class LoggingTester with Logging {
  LoggingTester._();

  void test(Level logLevel, Object? message, [Object? error, StackTrace? stackTrace, Zone? zone]) {
    log(logLevel, message, error, stackTrace, zone);
  }
}
