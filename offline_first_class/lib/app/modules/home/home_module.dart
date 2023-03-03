import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_class/app/core/offline_sync/presenter/stores/sync_store.dart';
import 'package:offline_first_class/app/core/shared/services/connection/i_connection_service.dart';
import 'package:offline_first_class/app/modules/home/domain/usecases/create_task_usecase.dart';
import 'package:offline_first_class/app/modules/home/external/task_datasource.dart';
import 'package:offline_first_class/app/modules/home/infra/repositories/task_repository.dart';
import 'package:offline_first_class/app/modules/home/presenter/stores/task_store.dart';

import 'presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory((i) => CreateTaskUsecase(i())),
    Bind.factory((i) => TaskRepository(i(), i())),
    Bind.factory((i) => LocalTaskDatasource(i())),

    // Store
    Bind.lazySingleton((i) => TaskStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomePage(
        connectionService: Modular.get<IConnectionService>(),
        taskStore: Modular.get<TaskStore>(),
        syncStore: Modular.get<SyncStore>(),
      ),
    )
  ];
}
