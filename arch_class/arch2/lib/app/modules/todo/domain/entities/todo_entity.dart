import 'package:arch2/app/core/shared/interfaces/i_entity.dart';

class TodoEntity extends Entity<String> {
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime? executedAt;

  const TodoEntity({
    required super.id,
    required this.name,
    required this.description,
    required this.createdAt,
    this.executedAt,
  });
}
