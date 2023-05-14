import 'package:flutter_triple/flutter_triple.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';

class FormTriple extends Store<bool> {
  FormTriple(this._createTodoUsecase) : super(false);
  final CreateTodoUsecase _createTodoUsecase;

  bool get isSuccess => state;

  Future<void> create(CreateTodoParam param) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createTodoUsecase(param);

    result.fold(
      setError,
      (r) => update(true),
    );

    setLoading(false);
  }
}
