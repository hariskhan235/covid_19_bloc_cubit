import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final int? statusCode;
  final StackTrace stackTrace;
  final Exception? exception;
  const Failure(
      {required this.message,
      this.statusCode,
      this.stackTrace = StackTrace.empty,
      this.exception});
  @override
  List<Object?> get props => [message, stackTrace, statusCode, exception];

  @override
  String toString() {
    return 'Failure(message : $message, statusCode : $statusCode, stackTrace: $stackTrace, Exception: $exception)';
  }
}
