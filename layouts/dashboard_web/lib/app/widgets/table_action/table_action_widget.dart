import 'package:dashboard_web/app/widgets/table_action/table_action_button_widget.dart';
import 'package:dashboard_web/app/widgets/table_action/table_action_dropdown_widget.dart';
import 'package:flutter/material.dart';

class TableActionWidget extends StatelessWidget {
  const TableActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        children: [
          const TableActionDropdownWidget(
            icon: Icons.settings,
            title: 'Gerenciar',
          ),
          const SizedBox(width: 20),
          const TableActionButtonWidget(
            color: Colors.blue,
            icon: Icons.content_paste_go_rounded,
            title: 'Transferir',
          ),
          const SizedBox(width: 20),
          const TableActionButtonWidget(
            color: Colors.green,
            icon: Icons.volunteer_activism_outlined,
            title: 'Receber',
          ),
          const SizedBox(width: 20),
          TableActionButtonWidget(
            color: Colors.red.shade800,
            icon: Icons.edit_document,
            title: 'Autorizar',
          ),
          const SizedBox(width: 20),
          TableActionButtonWidget(
            color: Colors.blue.shade800,
            icon: Icons.check_circle_outlined,
            title: 'Concluir',
          ),
          const Spacer(),
          const TableActionButtonWidget(
            color: Colors.black54,
            icon: Icons.search,
          ),
          const SizedBox(width: 20),
          TableActionButtonWidget(
            color: Colors.blue.shade800,
            icon: Icons.sync,
          ),
          const SizedBox(width: 20),
          const TableActionDropdownWidget(
            icon: Icons.filter_alt,
            title: 'Filtrar',
          ),
        ],
      ),
    );
  }
}
