import 'package:flutter/material.dart';

class TableFooterItemWidget extends StatelessWidget {
  const TableFooterItemWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(child: child),
    );
  }
}
