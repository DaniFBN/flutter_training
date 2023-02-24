import 'package:flutter/material.dart';
import 'package:ifood_example/app/mock/app_mock.dart';

import '../widgets/area_card_widget.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/promotion_slider_widget.dart';
import '../widgets/restaurant_card_widget.dart';
import '../widgets/tab_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeAppBarWidget(
            address: AppMock.userAddress,
            notificationLength: AppMock.notificationLength,
            tabBar: TabBarWidget(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 8,
              (_, __) {
                return const AreaCardWidget(
                  imageUrl: AppMock.areaImageUrl,
                  title: AppMock.areaTitle,
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: PromotionSliderWidget(
                promotionImages: AppMock.promotionImages,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (_, __) {
                  return const RestaurantCardWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
