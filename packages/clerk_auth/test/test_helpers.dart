import 'dart:async';

import 'package:clerk_auth/src/utils/logging.dart';
import 'package:dart_dotenv/dart_dotenv.dart';

class TestEnv {
  TestEnv._(this._map);

  factory TestEnv(String filename) {
    final dotEnv = DotEnv(filePath: filename);
    return TestEnv._(dotEnv.getDotEnv());
  }

  final Map<String, String> _map;

  String get email => _map['email'] ?? '';

  String get phoneNumber => _map['phone_number'] ?? '';

  String get password => _map['password'] ?? '';

  String get code => _map['code'] ?? '';

  String get publicKey => _map['public_key']?.replaceAll('\\n', '\n') ?? '';

  String get publishableKey => _map['publishable_key'] ?? '';
}

class TestLogPrinter extends Printer {
  @override
  void print(String output) {
    Zone.root.print(output);
  }
}
