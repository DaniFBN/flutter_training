// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../data/mock.dart';
import '../widgets/action_button_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/tip_card_widget.dart';
import '../widgets/title_section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showInformation = true;

  void toggleShowInformation() {
    setState(() {
      showInformation = !showInformation;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          HomeHeaderWidget(
            userName: AppMock.userName,
            userImage: AppMock.userImage,
            toggleShowInformation: toggleShowInformation,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSectionWidget(
                  title: 'Conta',
                  showArrow: true,
                  onTap: () {
                    print('Account Section is tapped');
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  showInformation ? AppMock.accountValue : '●●●●',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: AppMock.profileButtons.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  final item = AppMock.profileButtons.elementAt(index);

                  return ActionButtonWidget(
                    onTap: () => print('ActionButtonWidget is tapped $index'),
                    icon: item.icon,
                    title: item.title,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ButtonWidget(
              icon: Icons.credit_card,
              text: 'Meus cartões',
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: AppMock.tips.length,
                separatorBuilder: (_, __) => const SizedBox(width: 28),
                itemBuilder: (_, index) {
                  final item = AppMock.tips.elementAt(index);

                  return TipCardWidget(tip: item);
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
        ],
      ),
    );
  }
}
