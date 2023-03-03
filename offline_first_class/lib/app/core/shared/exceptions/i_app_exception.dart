class IAppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const IAppException({
    required this.message,
    required this.stackTrace,
  });

  @override
  String toString() => '$runtimeType: $message';
}
