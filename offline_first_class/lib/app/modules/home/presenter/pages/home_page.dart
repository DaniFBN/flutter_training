// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:offline_first_class/app/core/offline_sync/presenter/stores/sync_store.dart';
import 'package:offline_first_class/app/core/shared/services/connection/i_connection_service.dart';
import 'package:offline_first_class/app/modules/home/presenter/stores/task_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.taskStore,
    required this.syncStore,
    required this.connectionService,
  }) : super(key: key);

  final TaskStore taskStore;
  final SyncStore syncStore;
  final IConnectionService connectionService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.syncStore.loadSyncs();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Home Page',
      action: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ValueListenableBuilder(
              valueListenable: widget.connectionService.hasConnection,
              builder: (_, isConnected, __) {
                return Icon(
                  isConnected ? Icons.wifi_rounded : Icons.wifi_off_rounded,
                );
              },
            ),
            const SizedBox(width: 8),
            ValueListenableBuilder(
              valueListenable: widget.syncStore,
              builder: (_, state, __) {
                return Row(
                  children: [
                    Text(state.syncs.length.toString()),
                    const SizedBox(width: 8),
                    Text(state.notSynchronized.length.toString()),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.taskStore,
        builder: (_, state, __) {
          return ListView.separated(
            itemCount: state.tasks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) {
              final task = state.tasks.elementAt(index);

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    task.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              );
            },
          );
        },
      ),
      fab: FloatingActionButton(
        onPressed: widget.taskStore.create,
        child: const Icon(Icons.add),
      ),
    );
  }
}
