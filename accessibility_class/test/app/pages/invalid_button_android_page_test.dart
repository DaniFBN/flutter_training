import 'package:accessibility_class/app/pages/invalid/invalid_button_android_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "GestureDetector - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showGesture: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "InkWell - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showInkWell: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "IconButton - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showIconButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "TextButton - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showTextButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );
  testWidgets(
    "ElevatedButton - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showElevatedButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "OutlinedButton - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showOutlinedButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "FloatingActionButton - Should be an error because the page has a Tappable Item with less than 48x48, it's 47x47",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidButtonAndroidPage(showFab: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(androidTapTargetGuideline),
      );
      handle.dispose();
    },
  );
}
