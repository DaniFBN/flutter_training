import 'package:flutter/material.dart';
import 'package:ifood_example/app/mock/app_mock.dart';
import 'package:ifood_example/app/widgets/home_app_bar_widget.dart';

import '../widgets/area_card_widget.dart';
import '../widgets/promotion_slider_widget.dart';
import '../widgets/restaurant_card_widget.dart';
import '../widgets/tab_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const HomeAppBarWidget(
        address: AppMock.userAddress,
        notificationLength: AppMock.notificationLength,
        tabBar: TabBarWidget(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.85,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return const AreaCardWidget(
                imageUrl: AppMock.areaImageUrl,
                title: AppMock.areaTitle,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: PromotionSliderWidget(
              promotionImages: AppMock.promotionImages,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
                itemBuilder: (context, index) {
                  return const RestaurantCardWidget();
                },
              ),
            ),
          ),
        ],
      ),

      // body: Column(
      //   children: [
      //     Container(
      //       height: size.width * 0.65,
      //       padding: const EdgeInsets.all(8),
      //       child: GridView.builder(
      //         physics: const NeverScrollableScrollPhysics(),
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 4,
      //           childAspectRatio: 0.8,
      //         ),
      //         itemCount: 8,
      //         itemBuilder: (context, index) {
      //           return const AreaCardWidget(
      //             imageUrl: AppMock.areaImageUrl,
      //             title: AppMock.areaTitle,
      //           );
      //         },
      //       ),
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.only(left: 16),
      //       child: PromotionSliderWidget(
      //         promotionImages: AppMock.promotionImages,
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
