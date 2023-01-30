import 'package:flutter_test/flutter_test.dart';
import 'package:test_class/models/user_model.dart';

void main() {


  // O que vai acontecer
  // Quando vai acontecer


  test(
    'Deve retornar um usuário ignorando case sensitive',
    () {
      // Arrange
      final users = [
        const UserModel('Emison'),
        const UserModel('Lucka'),
        const UserModel('Cilas'),
      ];

      // Act
      final result = UserModel.getUsersByName(
        name: 'Emison',
        users: users,
      );

      // Assert
      expect(result, isA<List<UserModel>>());
      expect(result.length, equals(1));
    },
  );
}
