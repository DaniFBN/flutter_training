/// An Exception to use when division values is invalid
class InvalidDivisionException implements Exception {}

/// An Usecase the Division the values of an List
abstract class IDivisionUsecase {
  /// A called method to Division the [firstValue] by the [secondValue].
  ///
  /// Example:
  /// ```
  /// call(10, 2); // 5
  /// call(10, 0); // throw [InvalidDivisionException]
  /// ```
  ///
  double call(double firstValue, double secondValue);
}

// ignore: public_member_api_docs
class DivisionUsecase implements IDivisionUsecase {
  @override
  double call(double firstValue, double secondValue) {
    if (secondValue == 0) {
      throw InvalidDivisionException();
    }

    final division = firstValue / secondValue;
    return division;
  }
}
