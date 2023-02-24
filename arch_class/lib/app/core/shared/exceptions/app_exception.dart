abstract class AppException {
  final String message;
  final StackTrace stackTrace;

  const AppException(this.message, {required this.stackTrace});
}
