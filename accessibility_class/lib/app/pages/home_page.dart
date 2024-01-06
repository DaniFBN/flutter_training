import 'package:accessibility_class/app/pages/detect_accessibility_page.dart';
import 'package:accessibility_class/app/pages/ignore_semantics_page.dart';
import 'package:accessibility_class/app/pages/invalid/invalid_text_contrast_page.dart';
import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

import 'invalid/invalid_button_android_page.dart';
import 'invalid/invalid_button_ios_page.dart';
import 'invalid/invalid_labeled_page.dart';
import 'merge_semantics_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      title: 'Accessibility Class',
      body: DefaultMenu(
        options: [
          DefaultNavigationButton(
            page: InvalidButtonAndroidPage.complete(),
            title: 'InvalidButtonAndroidPage',
          ),
          DefaultNavigationButton(
            page: InvalidButtonIosPage.complete(),
            title: 'InvalidButtonIosPage',
          ),
          DefaultNavigationButton(
            page: InvalidLabeledPage.complete(),
            title: 'InvalidLabeledPage',
          ),
          DefaultNavigationButton(
            page: InvalidTextContrastPage.complete(),
            title: 'InvalidTextContrastPage',
          ),
          DefaultNavigationButton(
            page: DetectAccessibilityPage(),
            title: 'DetectAccessibilityPage',
          ),
          DefaultNavigationButton(
            page: IgnoreSemanticsPage(),
            title: 'IgnoreSemanticsPage',
          ),
          DefaultNavigationButton(
            page: MergeSemanticsPage(),
            title: 'MergeSemanticsPage',
          ),
        ],
      ),
    );
  }
}


