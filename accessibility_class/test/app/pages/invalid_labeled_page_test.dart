import 'package:accessibility_class/app/pages/invalid/invalid_labeled_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "GestureDetector - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showGesture: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "InkWell - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showInkWell: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "IconButton - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showIconButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "TextButton - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showTextButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );
  testWidgets(
    "ElevatedButton - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showElevatedButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "OutlinedButton - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showOutlinedButton: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );

  testWidgets(
    "FloatingActionButton - Should be an error because the page has a Tappable Item without Semantic label",
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: InvalidLabeledPage(showFab: true),
        ),
      );

      await expectLater(
        tester,
        doesNotMeetGuideline(labeledTapTargetGuideline),
      );
      handle.dispose();
    },
  );
}
