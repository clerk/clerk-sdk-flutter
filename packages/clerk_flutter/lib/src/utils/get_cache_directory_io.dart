import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Returns [getApplicationDocumentsDirectory] for native platforms.
Future<Directory> Function() getCacheDirectory() =>
    getApplicationDocumentsDirectory;
