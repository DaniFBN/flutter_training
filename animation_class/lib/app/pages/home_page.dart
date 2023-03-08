import 'package:default_design/default_design.dart';
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
    return const DefaultScaffold(
      title: 'Animation Class',
      body: DefaultMenu(options: [
        DefaultNavigationButton(
          page: AnimatedContainerPage(),
          title: 'AnimatedContainer',
        ),
        DefaultNavigationButton(
          page: AnimatedAlignPage(),
          title: 'AnimatedAlign',
        ),
        DefaultNavigationButton(
          page: AnimatedOpacityPage(),
          title: 'AnimatedOpacity',
        ),
        DefaultNavigationButton(
          page: AnimatedPositionedPage(),
          title: 'AnimatedStack',
        ),
        DefaultNavigationButton(
          page: AnimatedAlignExplicitPage(),
          title: 'AnimatedExplicitAlign',
        ),
      ]),
    );
  }
}
