import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';

import '../entities/sync_entity.dart';
import '../repositories/i_sync_repository.dart';

abstract class IGetSyncsUsecase {
  Future<Either<IAppException, List<SyncEntity>>> call();
}

class GetSyncsUsecase implements IGetSyncsUsecase {
  final ISyncRepository _repository;

  const GetSyncsUsecase(this._repository);

  @override
  Future<Either<IAppException, List<SyncEntity>>> call() async {
    return await _repository.get();
  }
}
