abstract interface class IPersonDatasource {
  Future<Map<String, dynamic>> create(Map<String, dynamic> data);
}
