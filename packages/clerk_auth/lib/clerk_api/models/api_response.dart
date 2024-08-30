import 'dart:io';

import 'models.dart';

class ApiResponse {
  final int status;
  final Client? client;
  final String? errorDetail;

  const ApiResponse({
    required this.status,
    this.client,
    this.errorDetail,
  });

  bool get isOkay => status == HttpStatus.ok;
  bool get isError => isOkay == false;

  Map<String, dynamic> toJson() => {
        'status': status,
        'client': client?.toJson(),
        'errorDetail': errorDetail,
      };
}
