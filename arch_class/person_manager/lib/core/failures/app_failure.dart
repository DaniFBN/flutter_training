abstract class AppFailure implements Exception {
  final String message;
  final StackTrace stackTrace;

  AppFailure(this.message, {StackTrace? stackTrace})
      : stackTrace = stackTrace ?? StackTrace.current;
}
