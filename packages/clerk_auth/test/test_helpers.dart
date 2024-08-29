import 'dart:core' as core show print;
import 'dart:core' hide print;

import 'package:common/common.dart';

class TestEnv {
  final map = <String, String>{};

  void addAll(Map<String, String> map) => this.map.addAll(map);

  String get email => map['email'] ?? '';
  String get phoneNumber => map['phone_number'] ?? '';
  String get password => map['password'] ?? '';
  String get code => map['code'] ?? '';
  String get publicKey => map['public_key']?.replaceAll('\\n', '\n') ?? '';
  String get publishableKey => map['publishable_key'] ?? '';
}

class TestLogPrinter extends Printer {
  @override
  void print(String output) {
    core.print(output);
  }
}
