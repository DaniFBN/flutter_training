import 'package:offline_first_class/app/core/offline_sync/domain/entities/sync_entity.dart';

abstract class ISyncDatasource {
  Future<bool> create(Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getSyncs();

  Future<List<SyncEntity>> syncCreate(List<SyncEntity> syncs);
  Future<List<SyncEntity>> syncUpdate(List<SyncEntity> syncs);
  Future<List<SyncEntity>> syncDelete(List<SyncEntity> syncs);
}
