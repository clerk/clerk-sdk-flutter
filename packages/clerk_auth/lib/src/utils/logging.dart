import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:logging/logging.dart';

// ignore: constant_identifier_names
const Level _NOTICE = Level('NOTICE', 850);

/// Mixin to hide some of the boilerplate around initializing and using a logger.
mixin Logging {
  late final logger = Logger('$runtimeType');

  late final loggerZoneSpec = ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      logInfo(line);
    },
  );

  /// Adds a log record for a [message] at a particular [logLevel] if
  /// `isLoggable(logLevel)` is true.
  ///
  /// Use this method to create log entries for user-defined levels. To record a
  /// message at a predefined level (e.g. [Level.INFO], [Level.WARNING], etc)
  /// you can use their specialized methods instead (e.g. [info], [warning],
  /// etc).
  ///
  /// If [message] is a [Function], it will be lazy evaluated. Additionally, if
  /// [message] or its evaluated value is not a [String], then 'toString()' will
  /// be called on the object and the result will be logged. The log record will
  /// contain a field holding the original object.
  ///
  /// The log record will also contain a field for the zone in which this call
  /// was made. This can be advantageous if a log listener wants to handler
  /// records of different zones differently (e.g. group log records by HTTP
  /// request if each HTTP request handler runs in it's own zone).
  void log(Level logLevel, Object? message, [Object? error, StackTrace? stackTrace, Zone? zone]) {
    if (message is Map) {
      message = const JsonEncoder.withIndent('  ').convert(message);
    }
    logger.log(logLevel, message, error, stackTrace, zone);
  }

  /// Log message at level [Level.FINEST].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logFinest(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.FINEST, message, error, stackTrace);

  /// Log message at level [Level.FINER].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logFiner(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.FINER, message, error, stackTrace);

  /// Log message at level [Level.FINE].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logFine(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.FINE, message, error, stackTrace);

  /// Log message at level [Level.CONFIG].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logConfig(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.CONFIG, message, error, stackTrace);

  /// Log message at level [Level.INFO].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logInfo(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.INFO, message, error, stackTrace);

  /// Log message at level [_NOTICE].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logNotice(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(_NOTICE, message, error, stackTrace);

  /// Log message at level [Level.WARNING].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logWarning(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.WARNING, message, error, stackTrace);

  /// Log message at level [Level.SEVERE].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logSevere(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.SEVERE, message, error, stackTrace);

  /// Log message at level [Level.SHOUT].
  ///
  /// See [log] for information on how non-String [message] arguments are
  /// handled.
  void logShout(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(Level.SHOUT, message, error, stackTrace);
}

Future<void> runWithLogging(Future<void> Function() fn) async {
  await runZoned(
    fn,
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        Logger.root.info(line);
      },
    ),
  );
}

Future<void> setUpLogging({
  required Printer printer,
  bool structuredLogging = false,
  Level level = Level.ALL,
}) async {
  /// Setup logging
  hierarchicalLoggingEnabled = true;
  Logger.root.level = level;
  Logger.root.onRecord.listen((record) {
    if (structuredLogging) {
      final jsonString = json.encode({
        'datetime': record.time.toIso8601String(),
        'level': record.level.name,
        'name': record.loggerName,
        'message': record.message,
        if (record.error != null) //
          'error': record.error.toString(),
        if (record.stackTrace != null) //
          'stack_trace': record.stackTrace.toString(),
      });
      printer.print(jsonString);
    } else {
      final level = record.level.name //
          .substring(0, math.min(record.level.name.length, 7))
          .padRight(8);
      final loggerName = record.loggerName //
          .substring(0, math.min(record.loggerName.length, 21))
          .padRight(22);
      var output = '${record.time} $level $loggerName ${record.message}';
      if (record.error != null) {
        output += '\nError: ';
        output += record.error.toString().split('\n').join('\n\t');
      }
      if (record.stackTrace != null) {
        output += '\n${record.stackTrace}'.split('\n').join('\n\t');
      }
      printer.print(_withColor(output, record.level));
      stdout.flush();
    }
  });
}

/// Colors from: https://www.ditig.com/publications/256-colors-cheat-sheet
enum _Colors {
  red(9),
  white(15),
  dodgerBlue1(33),
  lightSeaGreen(37),
  skyBlue3(74),
  skyBlue2(111),
  skyBlue1(117),
  red2(160),
  orange3(172),
  mediumPurple1(141);

  const _Colors(this.value);

  final int value;
}

String _withColor(String text, Level level) {
  final color = switch (level) {
    Level.FINEST => _Colors.skyBlue1,
    Level.FINER => _Colors.skyBlue2,
    Level.FINE => _Colors.skyBlue3,
    Level.CONFIG => _Colors.lightSeaGreen,
    Level.INFO => _Colors.dodgerBlue1,
    _NOTICE => _Colors.mediumPurple1,
    Level.WARNING => _Colors.orange3,
    Level.SEVERE => _Colors.red,
    Level.SHOUT => _Colors.red2,
    _ => _Colors.white,
  };

  return '\x1B[38;5;${color.value}m$text\x1B[0m';
}

/// A class which is responsible for outputting to the console.
/// Must implement a [print] method.
///
abstract class Printer {
  const Printer();

  /// Takes a string and logs it to the console.
  void print(String output);
}
