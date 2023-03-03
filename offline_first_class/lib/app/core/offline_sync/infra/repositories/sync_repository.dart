import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/entities/sync_entity.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/repositories/i_sync_repository.dart';
import 'package:offline_first_class/app/core/offline_sync/infra/mappers/sync_mapper.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';

import '../datasources/sync_datasource.dart';

class SyncRepository implements ISyncRepository {
  final ISyncDatasource _datasource;

  SyncRepository(this._datasource);

  @override
  Future<Either<IAppException, SyncEntity>> create(SyncEntity sync) async {
    try {
      final map = SyncMapper.toMap(sync);
      await _datasource.create(map);

      return Right(sync);
    } on IAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IAppException, List<SyncEntity>>> get() async {
    try {
      final response = await _datasource.getSyncs();
      final data = response.map(SyncMapper.fromMap).toList();

      return Right(data);
    } on IAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<IAppException, List<SyncEntity>>> sync(
    List<SyncEntity> syncs,
  ) async {
    final createSyncs = syncs.where((e) => e.operation == SyncOperation.create);
    final updSyncs = syncs.where((e) => e.operation == SyncOperation.update);
    final delSyncs = syncs.where((e) => e.operation == SyncOperation.delete);

    try {
      final cSyncs = await _datasource.syncCreate(createSyncs.toList());
      final uSyncs = await _datasource.syncUpdate(updSyncs.toList());
      final dSyncs = await _datasource.syncDelete(delSyncs.toList());

      return Right([...cSyncs, ...uSyncs, ...dSyncs]);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
