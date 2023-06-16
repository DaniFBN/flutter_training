// ignore_for_file: public_member_api_docs, sort_constructors_first
void dartErrorHandling() {
  try {
    throw 43;
    // throw Exception('Whatever');

    // Else
  } on AppException catch (e) {
    print(e);
  } on bool catch (exception, stackTrace) {
    print('bool - $exception');
    print(stackTrace.toString());

    // throw exception;
    rethrow;
  } on int catch (exception, stackTrace) {
    print('int - $exception');
    print(stackTrace.toString());

    // throw exception;
    rethrow;
  } catch (exception, stackTrace) {
    print('default - $exception');
    print(stackTrace.toString());

    // throw exception;
    rethrow;
  } finally {
    print('finally');
  }

  // Else
}

class AppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const AppException({
    required this.message,
    required this.stackTrace,
  });
}

class DomainException extends AppException {
  const DomainException({required super.message, required super.stackTrace});
}
