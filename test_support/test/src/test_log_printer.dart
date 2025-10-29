import 'dart:async';

import 'package:clerk_auth/clerk_auth.dart';

class TestLogPrinter extends Printer {
  @override
  void print(String output) {
    Zone.root.print(output);
  }
}
