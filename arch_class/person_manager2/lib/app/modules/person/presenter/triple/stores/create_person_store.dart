import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/create_person_usecase.dart';

import '../../../domain/entities/person_entity.dart';
import '../../../domain/params/create_person_param.dart';

class CreatePersonStore extends Store<PersonEntity?> {
  final ICreatePersonUsecase _createPersonUsecase;

  CreatePersonStore(this._createPersonUsecase) : super(null);

  bool get isSuccess => state != null;

  Future<void> create(CreatePersonParam param) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(param);

    result.fold(update, setError);
  }
}
