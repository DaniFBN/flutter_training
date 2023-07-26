import 'package:flutter/foundation.dart';
import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/domain/usecases/create_person_usecase.dart';
import 'package:person_manager2/app/presenter/stores/states/create_person_state.dart';

import '../../domain/params/create_person_param.dart';

class CreatePersonStore extends ValueNotifier<CreatePersonState> {
  final ICreatePersonUsecase _createPersonUsecase;

  CreatePersonStore(this._createPersonUsecase)
      : super(const InitialCreatePersonState());

  Future<void> create(CreatePersonParam param) async {
    try {
      value = const LoadingCreatePersonState();

      await Future.delayed(const Duration(seconds: 2));

      final person = await _createPersonUsecase(param);

      value = SuccessCreatePersonState(person);
    } on AppException catch (e) {
      value = ErrorCreatePersonState(e);
    }
  }
}
