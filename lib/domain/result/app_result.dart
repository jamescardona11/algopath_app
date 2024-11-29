import 'app_exception.dart';

/// Utility class to wrap result data
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
/// }
/// ```
sealed class AppResult<T> {
  const AppResult();

  /// Creates an instance of Result containing a value
  factory AppResult.ok(T value) => Ok(value);

  /// Create an instance of Result containing an error
  factory AppResult.error(AppException error) => Error(error);

  /// Convenience method to cast to Ok
  Ok<T> get asOk => this as Ok<T>;

  /// Convenience method to cast to Error
  Error get asError => this as Error<T>;

  /// Returns a nullable value if the result is Ok
  bool get isError => this is Error;

  /// Returns a nullable value if the result is Ok
  bool get isOk => this is Ok;
}

typedef SuccessCompletion<V, T> = T Function(V value);
typedef ErrorCompletion<V, T> = T Function(V error);

extension ResultFold<T> on AppResult<T> {
  /// Returns a new value of [AppResult] from closure
  R fold<R>(ErrorCompletion<AppException, R> failure, SuccessCompletion<T, R> success) {
    if (isOk) {
      final right = this as Ok<T>;
      return success(right.value);
    } else {
      final left = this as Error;
      return failure(left.error);
    }
  }
}

/// Subclass of Result for values
final class Ok<T> extends AppResult<T> {
  const Ok(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of Result for errors
final class Error<T> extends AppResult<T> {
  const Error(this.error);

  final AppException error;

  @override
  String toString() => 'Result<$T>.error($error)';
}

final class Unit {
  const Unit._();

  factory Unit() => const Unit._();
}
