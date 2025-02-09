import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// A utility class for parsing Firebase `Timestamp` objects to `DateTime`
/// objects and vice versa.
///
/// This class is immutable and cannot be instantiated.
///
/// Usage:
/// ```dart
/// DateTime? dateTime = FirebaseTimeParser.datetimeFromTimestamp(timestamp);
/// Timestamp? timestamp = FirebaseTimeParser.dateTimeToTimestamp(dateTime);
/// ```
@immutable
final class FirebaseTimeParser {
  const FirebaseTimeParser._();

  /// Converts a Firebase `Timestamp` to a `DateTime`.
  ///
  /// Returns a `DateTime` object if the provided [timestamp] is not null,
  /// otherwise returns null.
  ///
  /// Example:
  /// ```dart
  /// DateTime? dateTime = FirebaseTimeParser.datetimeFromTimestamp(timestamp);
  /// ```
  static DateTime? datetimeFromTimestamp(Timestamp? timestamp) {
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
        : null;
  }

  /// Converts a `DateTime` to a Firebase `Timestamp`.
  ///
  /// Returns a `Timestamp` object if the provided [datetime] is not null,
  /// otherwise returns null.
  ///
  /// Example:
  /// ```dart
  /// Timestamp? timestamp = FirebaseTimeParser.dateTimeToTimestamp(dateTime);
  /// ```
  static Timestamp? dateTimeToTimestamp(DateTime? datetime) {
    return datetime != null ? Timestamp.fromDate(datetime) : null;
  }
}
