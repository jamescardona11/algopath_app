extension AppExceptionX on AppException {
  bool get isUnexpectedError => this is UnexpectedError;
}

abstract class AppException {
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  const AppException(this.message, {this.error, this.stackTrace});

  @override
  String toString() {
    var msg = 'ErrorType [$runtimeType], \n message: $message,';
    if (error is Error) {
      msg += '\n${(error as Error).stackTrace}';
    }
    if (stackTrace != null) {
      msg += '\nSource stack:\n$stackTrace';
    }

    return Error.safeToString(msg);
  }

  @override
  bool operator ==(covariant AppException other) {
    if (identical(this, other)) return true;

    return other.message == message && other.error == error && other.stackTrace == stackTrace;
  }

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ stackTrace.hashCode;
}

final class UnexpectedError extends AppException {
  const UnexpectedError({String? message}) : super(message ?? 'Encountered a Unexpected at an unrecoverable point. Terminating.');
}

final class FetchingDataError extends AppException {
  const FetchingDataError(super.message);
}

final class UpsertError extends AppException {
  const UpsertError() : super('Upsert Error');
}

final class ValueObjectError extends AppException {
  const ValueObjectError() : super('Encountered a Unexpected Value Object');
}
