import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nubank_example/app/data/mock.dart';
import 'package:nubank_example/app/theme/app_theme.dart';
import 'package:nubank_example/app/widgets/home_header_widget.dart';

void main() {
  testWidgets(
    'HomeHeaderWidget => should find a IconData.add_a_photo_outlined when userImage is null',
    (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme,
        home: Material(
          child: HomeHeaderWidget(
            showInformation: true,
            userName: 'Daniel',
            toggleShowInformation: () {},
            userImage: null,
          ),
        ),
      ));

      final addImageFinder = find.byIcon(Icons.add_a_photo_outlined);
      expect(addImageFinder, findsOneWidget);
    },
  );

  testWidgets(
    'HomeHeaderWidget => should find a Image when userImage is provided',
    (tester) async {
      await mockNetworkImagesFor(() async {
        return await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.theme,
            home: Material(
              child: HomeHeaderWidget(
                showInformation: true,
                userName: 'Daniel',
                toggleShowInformation: () {},
                userImage: AppMock.userImage,
              ),
            ),
          ),
        );
      });

      final profileImageFinder1 = find.byType(Image);
      final profileImageFinder2 = find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image == const NetworkImage(AppMock.userImage),
      );
      expect(profileImageFinder1, findsOneWidget);
      expect(profileImageFinder2, findsOneWidget);
    },
  );

  testWidgets(
    "HomeHeaderWidget => should find an Text 'Olá, Daniel' when userName is 'Daniel'",
    (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme,
        home: Material(
          child: HomeHeaderWidget(
            showInformation: true,
            userName: 'Daniel',
            toggleShowInformation: () {},
            userImage: null,
          ),
        ),
      ));

      final helloMessageFinder = find.text('Olá, Daniel');
      expect(helloMessageFinder, findsOneWidget);
    },
  );

  testWidgets(
    "HomeHeaderWidget => should find Icons.visibility_off_outlined when showInformation is false",
    (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme,
        home: Material(
          child: HomeHeaderWidget(
            showInformation: false,
            userName: 'Daniel',
            toggleShowInformation: () {},
            userImage: null,
          ),
        ),
      ));

      final visibilityOffIconFinder =
          find.byIcon(Icons.visibility_off_outlined);
      expect(visibilityOffIconFinder, findsOneWidget);
    },
  );

  testWidgets(
    "HomeHeaderWidget => should find Icons.visibility_outlined when showInformation is true",
    (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme,
        home: Material(
          child: HomeHeaderWidget(
            showInformation: true,
            userName: 'Daniel',
            toggleShowInformation: () {},
            userImage: null,
          ),
        ),
      ));

      final visibilityIconFinder = find.byIcon(Icons.visibility_outlined);
      expect(visibilityIconFinder, findsOneWidget);
    },
  );
}
