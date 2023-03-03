import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';

import '../entities/sync_entity.dart';
import '../repositories/i_sync_repository.dart';

abstract class ICreateSyncUsecase {
  Future<Either<IAppException, SyncEntity>> call(SyncEntity sync);
}

class CreateSyncUsecase implements ICreateSyncUsecase {
  final ISyncRepository _repository;

  const CreateSyncUsecase(this._repository);

  @override
  Future<Either<IAppException, SyncEntity>> call(SyncEntity sync) async {
    return _repository.create(sync);
  }
}
