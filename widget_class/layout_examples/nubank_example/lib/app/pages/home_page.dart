// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../data/mock.dart';
import '../widgets/action_button_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/news_card_widget.dart';
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
                  FittedBox(
                    key: const Key('fitted-account-value'),
                    fit: BoxFit.scaleDown,
                    child: Text(
                      showInformation ? AppMock.accountValue : '●●●●',
                      key: showInformation
                          ? const Key('account-value')
                          : const Key('account-obscured-value'),
                      maxLines: 1,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
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
            const SizedBox(height: 24),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TitleSectionWidget(
                    title: 'Cartão de crédito',
                    onTap: () {
                      print('Credit Card Section is tapped');
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fatura atual',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.hintColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppMock.invoiceValue,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Limite disponível de ${AppMock.creditLimit}',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  const ButtonWidget(
                    icon: Icons.credit_card,
                    text: 'Parcelar compras',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TitleSectionWidget(
                    title: 'Empréstimo',
                    onTap: () {
                      print('Loan Section is tapped');
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Valor disponível de até',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.hintColor,
                    ),
                  ),
                  Text(
                    AppMock.loanLimit,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TitleSectionWidget(
                    title: 'Seguros',
                    showArrow: false,
                    onTap: () {
                      print('Insurance Section is tapped');
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Proteçao para você cuidar do que importa',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.hintColor,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const ButtonWidget(
                    icon: Icons.favorite_border,
                    text: 'Seguro de vida',
                    action: 'Conhecer',
                  ),
                  const SizedBox(height: 20),
                  const ButtonWidget(
                    icon: Icons.phone_android_rounded,
                    text: 'Seguro de celular',
                    action: 'Conhecer',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TitleSectionWidget(
                    title: 'Shopping',
                    onTap: () {
                      print('Shopping Section is tapped');
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Vantagens exclusivas das nossas marcas preferidas',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  TitleSectionWidget(
                    title: 'Descubra mais',
                    showArrow: false,
                    onTap: () {
                      print('Find out more Section is tapped');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppMock.news.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, index) {
                    final item = AppMock.news.elementAt(index);

                    return NewsCardWidget(
                      cardImage: item.image,
                      title: item.title,
                      content: item.content,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
