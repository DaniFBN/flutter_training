import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_manager3/app/domain/params/create_person_param.dart';
import 'package:person_manager3/app/domain/usecases/create_person_usecase.dart';

import 'state/add_person_state.dart';

class AddPersonCubit extends Cubit<AddPersonState> {
  AddPersonCubit(this._createPersonUsecase)
      : super(const InitialAddPersonState());

  final ICreatePersonUsecase _createPersonUsecase;

  Future<void> create(CreatePersonParam param) async {
    emit(const LoadingAddPersonState());

    await Future.delayed(const Duration(seconds: 3));

    try {
      final newPerson = await _createPersonUsecase(param);
      emit(SuccessAddPersonState(newPerson));
    } catch (e) {
      emit(FailureAddPersonState(e.toString()));
    }
  }
}
