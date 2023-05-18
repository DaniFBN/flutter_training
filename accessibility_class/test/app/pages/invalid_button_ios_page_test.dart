import 'package:accessibility_class/app/pages/invalid/invalid_button_ios_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "GestureDetector - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showGesture: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "InkWell - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showInkWell: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "IconButton - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showIconButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "TextButton - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showTextButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );
  testWidgets(
    "ElevatedButton - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showElevatedButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "OutlinedButton - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showOutlinedButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "FloatingActionButton - Should be an error because the page has a Tappable Item with less than 44x44, it's 43x43",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonIosPage(showFab: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(iOSTapTargetGuideline),
      );
      handle.dispose();
    },
  );
}

const AccessibilityGuideline customTapTargetGuideline =
    MinimumTapTargetGuideline(
  size: Size(60, 60),
  link: 'https://support.google.com/accessibility/android/answer/7101858?hl=en',
);
