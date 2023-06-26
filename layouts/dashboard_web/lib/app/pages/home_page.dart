import 'package:dashboard_web/app/widgets/app_bar/app_bar_widget.dart';
import 'package:dashboard_web/app/widgets/table/table_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_widget.dart';
import '../widgets/table_action/table_action_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const AppBarWidget(),
      body: Row(
        children: [
          const DrawerWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.zero,
                    color: theme.primaryColor,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Usuários'.toUpperCase(),
                        style: theme.primaryTextTheme.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const TableActionWidget(),
                  const SizedBox(height: 20),
                  const Expanded(child: TableWidget()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
