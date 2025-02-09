import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import '../utils/logger/logger.dart';

/// An abstract class representing the state of data, which can either be a
/// success or a failure.
///
/// [T] is the type of data being handled.
abstract class DataState<T> {
  /// Constructs a [DataState] with an optional [errorMessage] and [resultData].
  DataState({
    this.errorMessage,
    this.resultData,
  });

  /// An optional exception message if the data state represents a failure.
  final String? errorMessage;

  /// The data being handled, if the data state represents a success.
  final T? resultData;

  /// A static method to handle the state of data asynchronously.
  ///
  /// Takes a function [func] that returns a [FutureOr] of type [T].
  ///
  /// Returns a [DataSuccess] if the function completes successfully with data,
  /// or a [DataFailed] if an exception is thrown.
  static Future<DataState<T>> handleDataState<T>(
    FutureOr<T> Function() func,
  ) async {
    try {
      final data = await func();

      return DataSuccess(data);
    } on FirebaseException catch (e, stackTrace) {
      Log.error(e.code, stackTrace);
      return DataFailed(e.code);
    } catch (e, stackTrace) {
      Log.error(e.toString(), stackTrace);
      return DataFailed(e.toString());
    }
  }

  /// A static method to call a function based on the given [DataState] object.
  ///
  /// Takes a [DataState] object and two functions, [onSuccess] and [onFailure],
  /// that return a [FutureOr] of type [T].
  static FutureOr<void> handleDataStateBasedAction<T>(
    DataState<T> dataState, {
    required FutureOr<void> Function(DataSuccess<T>) onSuccess,
    required FutureOr<void> Function(DataFailed?) onFailure,
  }) async {
    if (dataState is DataSuccess<T>) {
      await onSuccess(dataState);
    } else {
      onFailure(dataState as DataFailed);
    }
  }
}

/// A class representing a successful data state.
///
/// [T] is the type of data being handled.
final class DataSuccess<T> extends DataState<T> {
  /// Constructs a [DataSuccess] with the given [resultData].
  DataSuccess([T? resultData]) : super(resultData: resultData);
}

/// A class representing a failed data state.
///
/// [T] is the type of data being handled.
final class DataFailed<T> extends DataState<T> {
  /// Constructs a [DataFailed] with the given [errorMessage] message.
  DataFailed(String errorMessage) : super(errorMessage: errorMessage);
}
