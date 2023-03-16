// ignore_for_file: public_member_api_docs, sort_constructors_first
class UpdateLocalStorageParam {
  final String table;
  final String id;
  final Map<String, dynamic> data;

  const UpdateLocalStorageParam({
    required this.table,
    required this.id,
    required this.data,
  });
}

class CreateLocalStorageParam {
  final String table;
  final Map<String, dynamic> data;

  const CreateLocalStorageParam({
    required this.table,
    required this.data,
  });
}

class GetFilteredLocalStorageParam {
  final String table;
  final FilterItemLocalStorage filter;

  const GetFilteredLocalStorageParam({
    required this.table,
    required this.filter,
  });
}

class FilterItemLocalStorage {
  final String key;
  final dynamic value;

  const FilterItemLocalStorage({
    required this.key,
    required this.value,
  });
}
