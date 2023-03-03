import '../../domain/entities/sync_entity.dart';

class SyncMapper {
  const SyncMapper._();

  static Map<String, dynamic> toMap(SyncEntity sync) {
    return <String, dynamic>{
      'itemID': sync.itemID,
      'data': sync.data,
      'table': sync.table,
      'operation': sync.operation.name,
      'createdAt': sync.createdAt.millisecondsSinceEpoch,
      'executedAt': sync.executedAt?.millisecondsSinceEpoch,
    };
  }

  static SyncEntity fromMap(Map<String, dynamic> map) {
    final data = Map<String, dynamic>.from(map['data'] as Map);
    final createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);
    final operation = SyncOperation.values.firstWhere(
      (e) => e.name == map['operation'],
    );
    final executedAt = map['executedAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(map['executedAt'])
        : null;

    return SyncEntity(
      itemID: map['itemID'],
      table: map['table'],
      data: data,
      operation: operation,
      createdAt: createdAt,
      executedAt: executedAt,
    );
  }
}
