import 'package:flutter/material.dart';

import 'promotion_card_widget.dart';

class PromotionSliderWidget extends StatefulWidget {
  final List<String> promotionImages;

  const PromotionSliderWidget({
    Key? key,
    required this.promotionImages,
  }) : super(key: key);

  @override
  State<PromotionSliderWidget> createState() => _PromotionSliderWidgetState();
}

class _PromotionSliderWidgetState extends State<PromotionSliderWidget> {
  int showingCount = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.35,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: widget.promotionImages.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  showingCount = value;
                });
              },
              itemBuilder: (_, index) {
                final item = widget.promotionImages.elementAt(index);

                return PromotionCardWidget(
                  imageUrl: item,
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 15,
            child: Center(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.promotionImages.length,
                separatorBuilder: (context, index) => const SizedBox(width: 4),
                itemBuilder: (context, index) {
                  return Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: showingCount == index
                          ? Colors.grey.shade800
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
