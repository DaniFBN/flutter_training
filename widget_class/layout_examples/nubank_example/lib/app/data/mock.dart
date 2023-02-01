import 'package:flutter/material.dart';

class AppMock {
  const AppMock._();

  static const userName = 'João Kennedy';
  // static const userImage = null;
  static const userImage = 'https://avatars.githubusercontent.com/u/54218517?v=4';
  static const accountValue = 'R\$ 3.356,98';
  static const invoiceValue = 'R\$ 250,00';
  static const creditLimit = 'R\$ 50.455,55';
  static const loanLimitFormatted = 'R\$ 120.000';
  static const loanLimit = 'R\$ 120.000,00';
  static const newsImage =
      'https://blog.twitch.tv/assets/uploads/03-glitch.jpg';
  static const profileButtons = [
    ProfileButton(title: 'Área Pix', icon: Icons.pix),
    ProfileButton(title: 'Pagar', icon: Icons.qr_code),
    ProfileButton(
      title: 'Pegar emprestado',
      icon: Icons.handshake_rounded,
      specialText: loanLimitFormatted,
    ),
    ProfileButton(title: 'Transferir', icon: Icons.handshake_rounded),
    ProfileButton(
      title: 'Recarga de celular',
      icon: Icons.phone_android_rounded,
    ),
    ProfileButton(title: 'Depositar', icon: Icons.handshake_rounded),
    ProfileButton(title: 'Transferir Internac.', icon: Icons.language),
    ProfileButton(title: 'Doação', icon: Icons.favorite),
    ProfileButton(title: 'Cobrar', icon: Icons.attach_money_rounded),
    ProfileButton(title: 'Investir', icon: Icons.signal_cellular_alt),
    ProfileButton(title: 'Caixinhas', icon: Icons.savings),
  ];
  static const tips = [
    TipItem(
      tips: [
        TipText(text: 'Produtos e limites do seu jeito, ', isSpecial: true),
        TipText(text: 'traga seus dados.'),
      ],
    ),
    TipItem(
      tips: [
        TipText(text: 'Você tem até '),
        TipText(text: 'R\$ 12.500,00', isSpecial: true),
        TipText(text: ' disponíveis para empréstimo'),
      ],
    ),
    TipItem(
      tips: [
        TipText(text: 'Modo Rua: ', isSpecial: true),
        TipText(text: 'aumente a segurança do seu app.'),
      ],
    ),
    TipItem(
      tips: [
        TipText(text: 'Conta PJ: organizar o dinheiro do negócio. '),
        TipText(text: 'Abrir conta PJ!', isSpecial: true),
      ],
    ),
  ];

  static const news = [
    NewsCard(
      image: AppMock.newsImage,
      title: 'Parcele compras no app',
      content: 'Descontos em compras à vista no crédito, controle total sobre '
          'suas finanças',
    ),
    NewsCard(
      image: AppMock.newsImage,
      title: 'Nubank Celular Seguro',
      content: '100% cobertura, 0% estresse. Simule agora mesmo',
    ),
    NewsCard(
      image: AppMock.newsImage,
      title: 'Seguro de vida',
      content: 'Cuide de quem você ama de um jeito simples e que cabe no bolso',
    ),
  ];
}

class ProfileButton {
  final IconData icon;
  final String title;
  final String? specialText;

  const ProfileButton({
    required this.icon,
    required this.title,
    this.specialText,
  });
}

class TipItem {
  final List<TipText> tips;

  const TipItem({required this.tips});
}

class TipText {
  final String text;
  final bool isSpecial;

  const TipText({
    required this.text,
    this.isSpecial = false,
  });
}

class NewsCard {
  final String image;
  final String title;
  final String content;

  const NewsCard({
    required this.image,
    required this.title,
    required this.content,
  });
}
