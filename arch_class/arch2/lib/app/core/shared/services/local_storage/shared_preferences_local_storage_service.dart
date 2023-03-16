import 'dart:convert';
import 'dart:math';

import 'package:arch2/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:arch2/app/core/shared/services/local_storage/helpers/responses.dart';
import 'package:arch2/app/core/shared/services/local_storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/failures.dart';

class SharedPreferencesLocalStorageService implements LocalStorageService {
  late final SharedPreferences _preferences;

  @override
  Future<void> load() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<CreateLocalStorageResponse> create(
    CreateLocalStorageParam param,
  ) async {
    final handledData = {
      ...param.data,
      'id': Random().nextInt(999999999).toString(),
    };
    final json = encode(handledData);

    final currentData = _preferences.getStringList(param.table) ?? [];
    currentData.add(json);

    final result = await _preferences.setStringList(param.table, currentData);
    if (!result) {
      throw CreateLocalStorageFailure('Erro ao inserir');
    }

    return CreateLocalStorageResponse(handledData);
  }

  @override
  Future<List<Map<String, dynamic>>> getFiltered(
    GetFilteredLocalStorageParam param,
  ) async {
    final currentData = _preferences.getStringList(param.table) ?? [];

    final filteredJson = currentData.where(
      (element) {
        final map = decode(element);
        if (map[param.filter.key] == param.filter.value) {
          return true;
        }
        return false;
      },
    );

    final filteredMap = filteredJson.map(decode).toList();
    return filteredMap;
  }

  @override
  Future<Map<String, dynamic>> update(UpdateLocalStorageParam param) async {
    final currentData = _preferences.getStringList(param.table) ?? [];

    final filteredJson = currentData.firstWhere(
      (element) {
        final map = decode(element);
        if (map['id'] == param.id) {
          return true;
        }
        return false;
      },
    );

    final filteredMap = decode(filteredJson);
    return filteredMap;
  }

  String encode(Map<String, dynamic> map) => jsonEncode(map);
  Map<String, dynamic> decode(String json) => jsonDecode(json);
}
