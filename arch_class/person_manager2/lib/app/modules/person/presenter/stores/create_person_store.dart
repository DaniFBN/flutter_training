import 'dart:async';

import 'package:person_manager2/app/modules/person/domain/usecases/create_person_usecase.dart';
import 'package:person_manager2/app/modules/person/presenter/stores/states/create_person_state.dart';

import '../../../../core/reactivity/custom_notifier.dart';
import '../../domain/params/create_person_param.dart';

class CreatePersonStore extends CustomNotifier<CreatePersonState> {
  final ICreatePersonUsecase _createPersonUsecase;

  CreatePersonStore(this._createPersonUsecase)
      : super(const InitialCreatePersonState());

  Future<void> create(CreatePersonParam param) async {
    value = const LoadingCreatePersonState();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(param);

    result.fold(
      (success) => value = SuccessCreatePersonState(success),
      (failure) => value = ErrorCreatePersonState(failure),
    );

    // CustomNotifier
    //
    // execute(
    //   () async {
    //     value = const LoadingCreatePersonState();

    //     await Future.delayed(const Duration(seconds: 2));

    //     final person = await _createPersonUsecase(param);

    //     value = SuccessCreatePersonState(person);
    //   },
    //   (exception) => value = ErrorCreatePersonState(exception),
    // );

    // Try Catch
    //
    // try {
    //   value = const LoadingCreatePersonState();

    //   await Future.delayed(const Duration(seconds: 2));

    //   final person = await _createPersonUsecase(param);

    //   value = SuccessCreatePersonState(person);
    // } on AppException catch (e) {
    //   value = ErrorCreatePersonState(e);
    // }
  }
}
