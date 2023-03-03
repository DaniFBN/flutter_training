import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'helpers/params.dart';
import 'i_local_storage_service.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  const SharedPreferencesLocalStorageService();

  @override
  Future<bool> delete(DeleteLocalStorageParam param) async {
    final shared = await _getInstance();
    print('called');
    return await shared.remove(param.key);
  }

  @override
  Future<String> spread(SpreadLocalStorageParam param) async {
    final getParam = GetLocalStorageParam(key: param.key);
    final currentData = await get(getParam);

    final String id = const Uuid().v4();

    currentData.add({'localStorageID': id, ...param.data});

    await _write(param.key, currentData);

    return id;
  }

  @override
  Future<bool> replace(ReplaceLocalStorageParam param) async {
    return await _write(param.key, param.data);
  }

  @override
  Future<List<Map<String, dynamic>>> get(GetLocalStorageParam param) async {
    final shared = await _getInstance();
    final json = shared.getString(param.key);

    late final Map data;
    if (json == null) {
      data = {'values': []};
    } else {
      data = jsonDecode(json);
    }

    return List<Map<String, dynamic>>.from(data['values']);
  }

  Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> _write(String key, List<Map<String, dynamic>> data) async {
    final handledData = {'values': data};
    final json = jsonEncode(handledData);

    final shared = await _getInstance();
    return await shared.setString(key, json);
  }
}
