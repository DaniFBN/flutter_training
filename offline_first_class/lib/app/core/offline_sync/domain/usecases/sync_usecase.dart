import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/entities/sync_entity.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/repositories/i_sync_repository.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';

abstract class ISyncUsecase {
  Future<Either<IAppException, List<SyncEntity>>> call(List<SyncEntity> syncs);
}

class SyncUsecase implements ISyncUsecase {
  final ISyncRepository _repository;

  SyncUsecase(this._repository);

  @override
  Future<Either<IAppException, List<SyncEntity>>> call(
    List<SyncEntity> syncs,
  ) {
    return _repository.sync(syncs);
  }
}
