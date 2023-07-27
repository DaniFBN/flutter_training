import 'package:flutter/foundation.dart';
import 'package:person_manager/app/core/failures/app_failure.dart';

import '../../domain/params/create_person_param.dart';
import '../../domain/usecases/create_person_usecase.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends ValueNotifier<CreatePersonState> {
  CreatePersonStore(
    this._createPersonUsecase,
  ) : super(const InitialCreatePersonState());

  final ICreatePersonUsecase _createPersonUsecase;

  Future<void> create(CreatePersonParam param) async {
    value = const LoadingCreatePersonState();

    await Future.delayed(const Duration(seconds: 2));

    try {
      await _createPersonUsecase(param);
      value = const SuccessCreatePersonState();
    } on AppFailure catch (failure) {
      value = ErrorCreatePersonState(failure);
    }
  }
}
