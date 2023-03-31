import '../../../../core/shared/interfaces/i_entity.dart';

class TodoEntity extends Entity<String> {
  const TodoEntity({
    required super.id,
    required this.userID,
    required this.name,
    required this.description,
    required this.createdAt,
    this.executedAt,
  });

  final String userID;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime? executedAt;
}
