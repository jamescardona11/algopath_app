import 'package:algopath_app/domain/result/app_exception.dart';

/// Extension that adds a WHEN method to all enums
extension EnumWhen<T extends Enum> on T {
  /// Pattern matching for enums
  ///
  /// Example usage:
  /// ```dart
  /// enum Status { success, error, loading }
  ///
  /// final status = Status.success;
  /// final message = status.when(
  ///   success: () => 'Success!',
  ///   error: () => 'Error occurred',
  ///   loading: () => 'Loading...',
  /// );
  /// ```
  R when<R>(
    Map<T, R Function()> fns, {
    R Function()? orElse,
  }) {
    final fn = fns[this];
    if (fn != null) {
      return fn();
    }
    if (orElse != null) {
      return orElse();
    }
    throw UnexpectedError(
      message: 'No function provided for enum value "$this" and no orElse handler given.',
    );
  }
}
