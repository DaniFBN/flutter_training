import 'package:dashboard_web/app/widgets/app_bar/menu_app_bar_section_widget.dart';
import 'package:dashboard_web/app/widgets/app_bar/user_app_bar_section_widget.dart';
import 'package:flutter/material.dart';

import 'enterprise_banner_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.zero,
      borderOnForeground: false,
      elevation: 5,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide.none,
      ),
      child: Column(
        children: [
          EnterpriseBannerWidget(
            name: 'Dashboard',
            logo: SizedBox(
              height: 60,
              width: 125,
              child: FlutterLogo(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 20),
            child: Row(
              children: [
                MenuAppBarSectionWidget(),
                Spacer(),
                UserAppBarSectionWidget(
                  userImage:
                      'https://avatars.githubusercontent.com/u/63812934?s=200&v=4',
                  userName: 'Daniel Fernandes',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// HomePage
//   Scaffold
//     body: Column[]
//       EnterpriseBannerWidget
//         Icon
//         Text
//       AppBarWidget
//         Menu
//           Home, Relatorios, Portal
//         UserSection
//           Image
//           Column
//             Text - UserName
//             Text - Minhas informações
//           Icon(logout)
