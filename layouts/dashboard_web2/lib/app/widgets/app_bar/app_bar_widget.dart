import 'package:dashboard_web2/app/theme/app_constants.dart';
import 'package:dashboard_web2/app/widgets/app_bar/user_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../stores/drawer_store.dart';
import 'menu_app_bar_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return Stack(
      children: [
        Container(
          height: AppConstants.appBarHeight,
          color: appBarTheme.backgroundColor,
          child: Container(
            margin: const EdgeInsets.all(13),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.25,
                      child: const MenuAppBarWidget(),
                    ),
                    const Spacer(flex: 3),
                    Icon(
                      Icons.notifications_active_outlined,
                      color: appBarTheme.iconTheme!.color,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: constraints.maxWidth * 0.3,
                      child: UserAppBarWidget(
                        userImage:
                            'https://avatars.githubusercontent.com/u/54218517?v=4',
                        userName:
                            'Daniel Fernandes asasa asasasasas asasasaasa sasasas',
                        onLogoutTap: () {},
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Positioned(
          left: -5,
          child: ValueListenableBuilder(
            valueListenable: drawerStore,
            builder: (_, state, __) {
              return GestureDetector(
                onTap: drawerStore.toggle,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Icon(
                    state.isOpen
                        ? Icons.keyboard_double_arrow_left_rounded
                        : Icons.keyboard_double_arrow_right_rounded,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
