class AppFailure implements Exception {
  AppFailure(this.message, {StackTrace? stackTrace})
      : stackTrace = stackTrace ?? StackTrace.current;

  final String message;
  final StackTrace stackTrace;

  @override
  String toString() {
    return message;
  }
}
