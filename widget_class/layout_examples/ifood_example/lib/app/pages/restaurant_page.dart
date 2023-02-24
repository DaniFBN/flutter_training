import 'package:flutter/material.dart';
import 'package:ifood_example/app/themes/light/app_colors.dart';

import '../mock/app_mock.dart';
import '../widgets/restaurant_card_widget.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);

    super.dispose();
  }

  void scrollListener() {
    _scrollController.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            centerTitle: false,
            automaticallyImplyLeading: false,
            expandedHeight: 125,
            collapsedHeight: 350,
            title: const _Title(),
            actions: const [_Actions()],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://cdn.shopify.com/s/files/1/0070/7032/files/food-photgraphy-tips.png?format=jpg&quality=90&v=1657891849',
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                width: size.width,
                height: 250,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 28,
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      const RestaurantName(),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          DropdownWidget(
                            icon: Icons.keyboard_arrow_down_rounded,
                            child: Text(
                              'Entrega',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: DropdownWidget(
                              icon: Icons.keyboard_arrow_right_rounded,
                              child: Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Hoje, ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '20-30 min ',
                                        style: TextStyle(
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      TextSpan(text: '\u2022 '),
                                      TextSpan(
                                        text: r'R$ 7,99',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: const [
                          Expanded(child: Stars()),
                          Text(
                            '116 avaliações',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Pedido mínimo ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: r'R$ 20,00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.search, size: 30, color: AppColors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) {
                  return Container(
                    color: Colors.blue.shade100,
                    child: const RestaurantCardWidget(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          '4,8',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(Icons.star_rounded, color: Colors.amber),
        Icon(Icons.star_rounded, color: Colors.amber),
        Icon(Icons.star_rounded, color: Colors.amber),
        Icon(Icons.star_rounded, color: Colors.amber),
        Icon(Icons.star_half_rounded, color: Colors.amber),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.primaryRed,
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.share_outlined,
            color: AppColors.primaryRed,
          ),
        ),
        SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.favorite_border_rounded,
            color: AppColors.primaryRed,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

class RestaurantName extends StatelessWidget {
  const RestaurantName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Tradicional Bolos e Tortas - Tatuapé',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              r'Doces & Bolos - 2,5 km - $$$$$',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 32,
          foregroundImage: NetworkImage(
            AppMock.areaImageUrl,
          ),
        ),
      ],
    );
  }
}

class DropdownWidget extends StatelessWidget {
  final Widget child;
  final IconData icon;

  const DropdownWidget({
    Key? key,
    required this.child,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backgroundCard,
      ),
      child: Row(
        children: [
          child,
          Icon(
            icon,
            color: AppColors.primaryRed,
          )
        ],
      ),
    );
  }
}
