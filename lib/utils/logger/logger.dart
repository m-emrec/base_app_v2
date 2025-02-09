import 'package:logger/logger.dart';

/// This file sets up a logger instance using the `logger` package.
///
/// The `logger` instance can be used throughout the application for logging
/// messages, errors, and other information.
///
/// Usage:
/// ```dart
/// logger.d("Debug message");
/// logger.i("Info message");
/// logger.w("Warning message");
/// logger.e("Error message");
/// ```
///
/// The logger provides various methods for different log levels:
/// - `d` for debug
/// - `i` for info
/// - `w` for warning
/// - `e` for error
///
/// For more advanced usage and customization, refer to the `logger` package
abstract class Log {
  /// Logger instance from the `logger` package.
  static final Logger _logger = Logger();

  /// Logs a debug message.
  ///
  /// [message] The message to log.
  static void debug(dynamic message, [StackTrace? stackTrace]) {
    _logger.d(
      message.toString(),
      stackTrace: stackTrace ?? StackTrace.current,
      time: DateTime.now(),
    );
  }

  /// Logs an info message.
  ///
  /// [message] The message to log.
  static void info(dynamic message, [StackTrace? stackTrace]) {
    _logger.i(
      message.toString(),
      time: DateTime.now(),
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }

  /// Logs a warning message.
  ///
  /// [message] The message to log.
  static void warning(dynamic message) {
    _logger.w(
      message.toString(),
      stackTrace: StackTrace.current,
      time: DateTime.now(),
    );
  }

  /// Logs an error message.
  ///
  /// [message] The message to log.
  static void error(dynamic message, [StackTrace? stackTrace]) {
    _logger.e(
      message.toString(),
      time: DateTime.now(),
      stackTrace: stackTrace ?? StackTrace.current,
    );
  }
}
