import 'package:dashboard_web2/app/theme/app_constants.dart';
import 'package:dashboard_web2/app/widgets/drawer/drawer_item_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(50, (index) {
      return _DrawerItem(icon: Icons.add, title: 'Title ${index + 1}');
    });

    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          if (isOpen) ...[
            const SizedBox(
              height: AppConstants.appBarHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: FlutterLogo(size: 56),
              ),
            ),
          ] else ...[
            const SizedBox(
              height: AppConstants.appBarHeight,
              child: FlutterLogo(),
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(height: 0),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, index) {
                  final item = items.elementAt(index);

                  return DrawerItemWidget(
                    isOpen: isOpen,
                    icon: item.icon,
                    title: item.title,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  final IconData icon;
  final String title;

  _DrawerItem({
    required this.icon,
    required this.title,
  });
}
