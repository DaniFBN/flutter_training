import 'package:dashboard_web2/app/widgets/app_bar/user_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'menu_app_bar_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Container(
                  // margin: const EdgeInsets.only(right: 50, left: 50),
                  child: SizedBox(
                    width: constraints.maxWidth * 0.25,
                    child: const MenuAppBarWidget(),
                  ),
                ),
                const Spacer(flex: 3),
                const Icon(Icons.notifications_active_outlined),
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
    );
  }
}
