class AppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  AppException(this.message, {StackTrace? stackTrace})
      : stackTrace = stackTrace ?? StackTrace.current;
}
