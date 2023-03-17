abstract class AppException implements Exception {
  AppException({
    required this.message,
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.current;

  final String message;
  final StackTrace stackTrace;

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}
