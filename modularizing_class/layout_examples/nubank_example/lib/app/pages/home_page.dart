// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';
import 'package:nubank_example/app/pages/components/credit_card_section_component.dart';
import 'package:nubank_example/app/pages/components/loan_section_component.dart';
import 'package:nubank_example/app/pages/components/shopping_section_component.dart';

import '../data/mock.dart';
import 'components/find_out_more_section_component.dart';
import 'components/insurance_section_component.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeaderWidget(
              userName: AppMock.userName,
              userImage: AppMock.userImage,
              showInformation: showInformation,
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
                      specialText: item.specialText,
                      showInformation: showInformation,
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
            const SizedBox(height: 16),
            const Divider(),
            const CreditCardSectionComponent(),
            const SizedBox(height: 16),
            const Divider(),
            const LoanSectionComponent(),
            const SizedBox(height: 16),
            const Divider(),
            const InsuranceSectionComponent(),
            const SizedBox(height: 16),
            const Divider(),
            const ShoppingSectionComponent(),
            const SizedBox(height: 16),
            const Divider(),
            const FindOutMoreSectionComponent(),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
