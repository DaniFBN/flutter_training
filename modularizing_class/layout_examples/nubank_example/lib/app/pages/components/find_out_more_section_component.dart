import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';

import '../../data/mock.dart';

class FindOutMoreSectionComponent extends StatelessWidget {
  const FindOutMoreSectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
