// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/failures.dart';
import 'helpers/params.dart';
import 'helpers/responses.dart';
import 'local_storage_service.dart';

class SharedPreferencesLocalStorageService implements LocalStorageService {
  final SharedPreferences _preferences;

  SharedPreferencesLocalStorageService(this._preferences);

  @override
  Future<CreateLocalStorageResponse> save(CreateLocalStorageParam param) async {
    final json = encode(param.data);

    final result = await _preferences.setString(param.table, json);
    if (!result) {
      throw CreateLocalStorageFailure('Erro ao inserir');
    }

    return CreateLocalStorageResponse(param.data);
  }

  @override
  Future<Map<String, dynamic>> get(
    String key,
  ) async {
    final currentData = _preferences.getString(key);

    final data = decode(currentData ?? '{}');
    return data;
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

    final currentData = (_preferences.getStringList(param.table) ?? [])
      ..add(json);

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
