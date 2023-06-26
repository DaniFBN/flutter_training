import 'package:dashboard_web2/app/theme/app_constants.dart';
import 'package:dashboard_web2/app/widgets/cards/principle_card_widget.dart';
import 'package:flutter/material.dart';

import '../stores/drawer_store.dart';
import '../widgets/app_bar/app_bar_widget.dart';
import '../widgets/drawer/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: drawerStore,
            builder: (_, drawerState, __) {
              return ClipRect(
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 100),
                  alignment: Alignment.center,
                  widthFactor: drawerState.isOpen ? 1 : 0.3,
                  child: SizedBox(
                    width: AppConstants.drawerOpenWidth,
                    height: MediaQuery.sizeOf(context).height,
                    child: DrawerWidget(
                      isOpen: drawerState.isOpen,
                    ),
                  ),
                ),
              );
            },
          ),
          const Expanded(
            child: Column(
              children: [
                AppBarWidget(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: PrincipleCardWidget(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Card(
                                  child: Column(children: []),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Card(
                                  child: Column(children: []),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
