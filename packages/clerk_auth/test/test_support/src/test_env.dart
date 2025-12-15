import 'dart:convert';

import 'package:dart_dotenv/dart_dotenv.dart';

// This adheres to the required Clerk publishable key format, and contains
// a base64 encoding of the domain `somedomain.com`
const _testPublishableKey = r'pk_c29tZWRvbWFpbi5jb20K';

class TestEnv {
  TestEnv._(this._map, {this.useOpenIdentifiers = false});

  factory TestEnv(String filename) {
    final dotEnv = DotEnv(filePath: filename);
    return TestEnv._(dotEnv.getDotEnv());
  }

  factory TestEnv.withOpenIdentifiers(String filename, String name) {
    final dotEnv = DotEnv(filePath: filename);
    final id = base64Encode(name.codeUnits).replaceAll('=', '').toLowerCase();
    return TestEnv._(
      {
        ...dotEnv.getDotEnv(),
        'password': 'Ab$id%',
        'username': 'user-$id',
        'first_name': 'User',
        'last_name': id[0].toUpperCase() + id.substring(1),
        'email': 'user-$id+clerk_test@somedomain.com',
        'phone_number': '+155555501${(name.hashCode % 90) + 10}',
      },
      useOpenIdentifiers: true,
    );
  }

  final Map<String, String> _map;
  final bool useOpenIdentifiers;

  bool get recording => _map['recording'] == r'true';

  String get email => _map['email'] ?? r'user+clerk_test@somedomain.com';

  String get emailForLink => _map['email_for_link'] ?? email;

  String get phoneNumber => _map['phone_number'] ?? r'+5555550169';

  String get password => _map['password'] ?? r'Password8$';

  String get code => _map['code'] ?? r'424242';

  String get publishableKey => _map['publishable_key'] ?? _testPublishableKey;

  String get username => _map['username'] ?? r'testuser';

  String get firstName => _map['first_name'] ?? r'Firstname';

  String get lastName => _map['last_name'] ?? r'Lastname';
}
