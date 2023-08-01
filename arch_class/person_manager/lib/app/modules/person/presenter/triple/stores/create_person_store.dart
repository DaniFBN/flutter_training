import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/params/create_person_param.dart';
import '../../../domain/usecases/create_person_usecase.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends Store<CreatePersonState> {
  CreatePersonStore(
    this._createPersonUsecase,
  ) : super(const InitialCreatePersonState());

  final ICreatePersonUsecase _createPersonUsecase;

  Future<void> create(CreatePersonParam param) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(param);

    result.fold(
      (success) => update(const SuccessCreatePersonState()),
      (failure) => setError(failure),
    );
  }
}
