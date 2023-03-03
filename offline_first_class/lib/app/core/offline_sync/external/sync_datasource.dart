import 'package:offline_first_class/app/core/offline_sync/domain/entities/sync_entity.dart';
import 'package:offline_first_class/app/core/offline_sync/infra/datasources/sync_datasource.dart';
import 'package:offline_first_class/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:offline_first_class/app/core/shared/services/local_storage/i_local_storage_service.dart';

class SyncDatasource implements ISyncDatasource {
  final ILocalStorageService _localStorageService;
  static const _localStorageKey = 'syncs';

  const SyncDatasource(this._localStorageService);

  @override
  Future<bool> create(Map<String, dynamic> data) async {
    final spreadParam = SpreadLocalStorageParam(
      key: _localStorageKey,
      data: data,
    );

    await _localStorageService.spread(spreadParam);
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> getSyncs() async {
    const param = GetLocalStorageParam(key: _localStorageKey);
    return _localStorageService.get(param);
  }

  @override
  Future<List<SyncEntity>> syncCreate(List<SyncEntity> syncs) {
    // TODO: implement syncCreate
    throw UnimplementedError();
  }

  @override
  Future<List<SyncEntity>> syncDelete(List<SyncEntity> syncs) {
    // TODO: implement syncDelete
    throw UnimplementedError();
  }

  @override
  Future<List<SyncEntity>> syncUpdate(List<SyncEntity> syncs) {
    // TODO: implement syncUpdate
    throw UnimplementedError();
  }
}
