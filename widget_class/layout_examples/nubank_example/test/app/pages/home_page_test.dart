import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nubank_example/app/data/mock.dart';
import 'package:nubank_example/app/pages/home_page.dart';
import 'package:nubank_example/app/theme/app_theme.dart';

void main() {
  testWidgets(
    'home page ...',
    (tester) async {
      await mockNetworkImagesFor(() async {
        return await tester.pumpWidget(
          MaterialApp(theme: AppTheme.theme, home: const HomePage()),
        );
      });

      final visibilityButtonFinder = find.widgetWithIcon(
        IconButton,
        Icons.visibility_outlined,
      );
      expect(visibilityButtonFinder, findsOneWidget);

      final accountValueFinder = find.text(AppMock.accountValue);
      expect(accountValueFinder, findsOneWidget);

      await tester.tap(visibilityButtonFinder);
      await tester.pump();

      expect(accountValueFinder, findsNothing);

      // find.widgetWithText(FittedBox, '●●●●')

      // final accountValueObscuredFinder = find.byWidgetPredicate((widget) {
      //   // widget is FittedBox &&
      //   //     widget.child is Text &&
      //   //     widget.child.data == '●●●●';

      //   final fittedBox = widget;
      //   if (fittedBox is FittedBox) {
      //     final text = fittedBox.child;

      //     if (text is Text) {
      //       return text.data == '●●●●';
      //     }
      //   }

      //   return false;
      // });
      // expect(accountValueObscuredFinder, findsOneWidget);
      final accountValueObscuredFinder =
          find.byKey(const Key('account-obscured-value'));
      expect(accountValueObscuredFinder, findsOneWidget);

      final visibilityOffButtonFinder = find.widgetWithIcon(
        IconButton,
        Icons.visibility_off_outlined,
      );
      await tester.tap(visibilityOffButtonFinder);
      await tester.pump();

      expect(accountValueFinder, findsOneWidget);
      expect(accountValueObscuredFinder, findsNothing);
    },
  );
}
