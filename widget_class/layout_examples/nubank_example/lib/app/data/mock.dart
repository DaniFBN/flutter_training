// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppMock {
  const AppMock._();

  static const userName = 'Daniel';
  static const userImage =
      'https://avatars.githubusercontent.com/u/54218517?v=4';
  static const accountValue = 'R\$ 1,356,98';
  static const profileButtons = [
    ProfileButton(title: 'Área Pix', icon: Icons.pix),
    ProfileButton(title: 'Pagar', icon: Icons.qr_code),
    ProfileButton(title: 'Pegar emprestado', icon: Icons.handshake_rounded),
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
}

class ProfileButton {
  final IconData icon;
  final String title;

  const ProfileButton({
    required this.icon,
    required this.title,
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
