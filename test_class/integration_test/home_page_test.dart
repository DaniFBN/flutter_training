import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_class/models/user_model.dart';
import 'package:test_class/pages/home_page.dart';
import 'package:test_class/stores/user_store.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Widget createMainTestWidget(UserStore userStore) {
    return MaterialApp(
      home: HomePage(userStoreScope: userStore),
    );
  }

  testWidgets(
    '''
      Workflow 1 - Show "user-logged-key" when is logged
    ''',
    (tester) async {
      final userStoreScope = UserStore();

      await tester.pumpWidget(createMainTestWidget(userStoreScope));

      final failureKey = find.byKey(const Key('user-not-logged-key'));
      expect(failureKey, findsOneWidget);

      final successKey = find.byKey(const Key('user-logged-key'));
      expect(successKey, findsNothing);

      userStoreScope.updateUser(const UserModel('Emison'));
      await tester.pumpAndSettle();

      expect(failureKey, findsNothing);
      expect(successKey, findsOneWidget);
    },
  );

  testWidgets(
    '''
      Workflow 1 - Show "user-not-logged-key" when is not logged
    ''',
    (tester) async {
      final userStore = UserStore();
      await tester.pumpWidget(createMainTestWidget(userStore));

      final successKey = find.byKey(const Key('user-logged-key'));
      expect(successKey, findsNothing);

      final failureKey = find.byKey(const Key('user-not-logged-key'));
      expect(failureKey, findsOneWidget);
    },
  );
}
