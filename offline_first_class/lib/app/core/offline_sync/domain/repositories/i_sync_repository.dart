import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../entities/sync_entity.dart';

abstract class ISyncRepository {
  Future<Either<IAppException, SyncEntity>> create(SyncEntity sync);
  Future<Either<IAppException, List<SyncEntity>>> get();

  Future<Either<IAppException, List<SyncEntity>>> sync(List<SyncEntity> sync);
}
