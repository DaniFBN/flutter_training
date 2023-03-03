class SyncEntity {
  final String itemID;
  final String table;
  final Map<String, dynamic> data;

  final SyncOperation operation;
  final DateTime createdAt;
  final DateTime? executedAt;

  const SyncEntity({
    required this.itemID,
    required this.table,
    required this.data,
    required this.operation,
    required this.createdAt,
    this.executedAt,
  });

  @override
  String toString() {
    return 'SyncEntity(itemID: $itemID, table: $table, data: $data, operation: $operation, createdAt: $createdAt, executedAt: $executedAt)';
  }
}

enum SyncOperation { create, update, delete }
