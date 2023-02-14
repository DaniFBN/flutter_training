import 'package:flutter/material.dart';

class PromotionCardWidget extends StatelessWidget {
  final String imageUrl;

  const PromotionCardWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.35,
      // width: size.width * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
