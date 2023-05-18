import 'package:accessibility_class/app/pages/invalid/invalid_text_contrast_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "White - Should be an error when text color it's white with light background color",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidTextContrastPage(showWhite: true),
        ),
      );

      await expectLater(tester, doesNotMeetGuideline(textContrastGuideline));
      handle.dispose();
    },
  );

  testWidgets(
    "Red - Should be an error when text color it's red with light background color",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidTextContrastPage(showRed: true),
        ),
      );

      await expectLater(tester, doesNotMeetGuideline(textContrastGuideline));
      handle.dispose();
    },
  );

  testWidgets(
    "Yellow - Should be an error when text color it's yellow with light background color",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidTextContrastPage(showYellow: true),
        ),
      );

      await expectLater(tester, doesNotMeetGuideline(textContrastGuideline));
      handle.dispose();
    },
  );

  testWidgets(
    "Black - Should meet the guideline when text color it's black with light background color",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidTextContrastPage(showBlack: true),
        ),
      );

      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
    },
  );
}
