import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';

import '../entities/sync_entity.dart';
import '../repositories/i_sync_repository.dart';

abstract class IGetNotSynchronizedUsecase {
  Future<Either<IAppException, List<SyncEntity>>> call();
}

class GetNotSynchronizedUsecase implements IGetNotSynchronizedUsecase {
  final ISyncRepository _repository;

  const GetNotSynchronizedUsecase(this._repository);

  @override
  Future<Either<IAppException, List<SyncEntity>>> call() async {
    final syncs = await _repository.get();
    
    final notSynchronized = syncs.map((syncs) {
      return syncs.where((e) => e.executedAt == null).toList();
    });

    return notSynchronized;
  }
}
