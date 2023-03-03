import 'package:flutter/material.dart';

import 'explicit_animations/animated_align_page.dart';
import 'implicit_animations/animated_align_page.dart';
import 'implicit_animations/animated_container_page.dart';
import 'implicit_animations/animated_opacity_page.dart';
import 'implicit_animations/animated_stack_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Class')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _NavigationButton(
              page: AnimatedContainerPage(),
              title: 'AnimatedContainer',
            ),
            const _NavigationButton(
              page: AnimatedAlignPage(),
              title: 'AnimatedAlign',
            ),
            const _NavigationButton(
              page: AnimatedOpacityPage(),
              title: 'AnimatedOpacity',
            ),
            const _NavigationButton(
              page: AnimatedPositionedPage(),
              title: 'AnimatedStack',
            ),
            GestureDetector(
              onTap: () {
                print('tapped');
              },
              child: Container(
                height: 100,
                width: 210,
                color: Colors.transparent,
                child: Row(
                  children: const [
                    Text('BUG CONTAINER TRANSPARENT'),
                  ],
                ),
              ),
            ),
            const _NavigationButton(
              page: AnimatedAlignExplicitPage(),
              title: 'AnimatedExplicitAlign',
            ),
          ],
        ),
      ),
    );
  }
}
