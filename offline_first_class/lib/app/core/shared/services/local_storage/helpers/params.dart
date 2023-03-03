class SpreadLocalStorageParam {
  final String key;
  final Map<String, dynamic> data;

  const SpreadLocalStorageParam({
    required this.key,
    required this.data,
  });
}

class InsertLocalStorageParam {
  final String key;
  final Map<String, dynamic> data;

  const InsertLocalStorageParam({
    required this.key,
    required this.data,
  });
}
class ReplaceLocalStorageParam {
  final String key;
  final List<Map<String, dynamic>> data;

  const ReplaceLocalStorageParam({
    required this.key,
    required this.data,
  });
}

class GetLocalStorageParam {
  final String key;

  const GetLocalStorageParam({required this.key});
}

class DeleteLocalStorageParam {
  final String key;

  const DeleteLocalStorageParam({required this.key});
}
