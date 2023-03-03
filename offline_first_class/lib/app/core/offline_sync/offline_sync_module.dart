import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/usecases/create_sync_usecase.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/usecases/get_not_synced_usecase.dart';
import 'package:offline_first_class/app/core/offline_sync/external/sync_datasource.dart';
import 'package:offline_first_class/app/core/offline_sync/infra/repositories/sync_repository.dart';
import 'package:offline_first_class/app/core/offline_sync/presenter/stores/sync_store.dart';

import 'domain/usecases/get_syncs_usecase.dart';

class OfflineSyncModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Usecases
    Bind.factory((i) => GetNotSynchronizedUsecase(i()), export: true),
    Bind.factory((i) => CreateSyncUsecase(i()), export: true),
    Bind.factory((i) => GetSyncsUsecase(i()), export: true),

    // Infra & External
    Bind.factory((i) => SyncRepository(i()), export: true),
    Bind.factory((i) => SyncDatasource(i()), export: true),

    // Store
    Bind.lazySingleton((i) => SyncStore(i(), i()), export: true),
  ];
}
