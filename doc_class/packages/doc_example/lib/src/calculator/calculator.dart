import 'package:doc_example/src/calculator/domain/usecases/sum_usecase.dart';

import 'domain/usecases/division_usecase.dart';

/// A Calculator
class Calculator {
  final ISumUsecase _sumUsecase;
  final IDivisionUsecase _divisionUsecase;

  Calculator._(this._sumUsecase, this._divisionUsecase);

  /// An instance of [Calculator] with your injections
  static Calculator instance = Calculator._(
    SumUsecase(),
    DivisionUsecase(),
  );

  /// Sum 2 values
  double sum2Values(double first, double second) {
    return _sumUsecase([first, second]);
  }

  /// Percorre a lista e soma todos os seus valores
  double sumList(List<double> values) {
    return _sumUsecase(values);
  }

  /// Divide [first] by the [second]
  double division(double first, double second) {
    return _divisionUsecase(first, second);
  }
}
