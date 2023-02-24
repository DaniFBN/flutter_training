/// An Usecase the sum the values of an List
abstract class ISumUsecase {
  /// A called method to sum values of an List
  double call(List<double> numbers);
}

// ignore: public_member_api_docs
class SumUsecase implements ISumUsecase {
  @override
  double call(List<double> numbers) {
    final sum = numbers.reduce((value, element) => value + element);
    return sum;
  }
}
