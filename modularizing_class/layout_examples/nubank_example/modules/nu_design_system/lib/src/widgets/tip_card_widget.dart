import 'package:flutter/material.dart';

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

class TipCardWidget extends StatelessWidget {
  final TipItem tip;

  const TipCardWidget({
    Key? key,
    required this.tip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width * 0.7,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Center(
            child: Text.rich(
              TextSpan(
                children: tip.tips.map<InlineSpan>((tip) {
                  return TextSpan(
                    text: tip.text,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: tip.isSpecial ? theme.primaryColor : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
