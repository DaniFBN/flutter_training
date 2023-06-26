import 'package:dashboard_web/app/widgets/table/table_content_widget.dart';
import 'package:dashboard_web/app/widgets/table/table_footer_item_widget.dart';
import 'package:dashboard_web/app/widgets/table/table_header_widget.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: const Column(
        children: [
          TableHeaderWidget(),
          SizedBox(height: 8),
          Expanded(child: TableContentWidget()),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableFooterItemWidget(
                child: Icon(Icons.keyboard_arrow_left_rounded),
              ),
              TableFooterItemWidget(
                child: Text('1'),
              ),
              TableFooterItemWidget(
                child: Text('2'),
              ),
              TableFooterItemWidget(
                child: Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
