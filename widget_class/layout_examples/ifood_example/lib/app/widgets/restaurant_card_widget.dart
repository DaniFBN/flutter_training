import 'package:flutter/material.dart';
import 'package:ifood_example/app/mock/app_mock.dart';

import '../pages/restaurant_page.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RestaurantPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 32,
              foregroundImage: NetworkImage(AppMock.areaImageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Whatever asdgsdg sfgdfh fgdf asasa asas asg',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber.shade700,
                        size: 16,
                      ),
                      Text(
                        '4,9',
                        style: TextStyle(
                          color: Colors.amber.shade700,
                        ),
                      ),
                      const CircleDividerWidget(),
                      const Text('Mercado'),
                      const CircleDividerWidget(),
                      const Text('5,5 km'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Text('71-81 min'),
                      CircleDividerWidget(),
                      Text(r'R$ 11,99'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const CouponWidget(),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.favorite_border_rounded,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFcff2dc),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.add,
              color: Color(0xFF106840),
            ),
            SizedBox(width: 4),
            Text(
              r'Cupom de R$ 20 disponível',
              style: TextStyle(
                color: Color(0xFF106840),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleDividerWidget extends StatelessWidget {
  const CircleDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Text('\u2022'),
    );
  }
}
