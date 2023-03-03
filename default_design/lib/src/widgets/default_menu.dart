import 'package:default_design/src/widgets/default_navigation_button.dart';
import 'package:flutter/material.dart';

class DefaultMenu extends StatelessWidget {
  const DefaultMenu({
    Key? key,
    required this.options,
  }) : super(key: key);

  final List<DefaultNavigationButton> options;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width > 1200 ? size.width * 0.5 : size.width * 0.8;

    return SizedBox(
      width: width,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, index) {
          final option = options.elementAt(index);

          return option;
        },
      ),
    );
  }
}
