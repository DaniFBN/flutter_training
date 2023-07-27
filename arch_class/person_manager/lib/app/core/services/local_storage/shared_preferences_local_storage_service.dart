import 'dart:convert';

import 'package:person_manager/app/core/services/local_storage/helpers/params.dart';
import 'package:person_manager/app/core/services/local_storage/helpers/responses.dart';
import 'package:person_manager/app/core/services/local_storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  @override
  Future<List<Map<String, dynamic>>> read(String table) async {
    final storage = await _getPreferences();
    final data = storage.getStringList(table) ?? [];

    final handledData = data.map((e) => Map<String, dynamic>.of(jsonDecode(e)));
    return handledData.toList();
  }

  @override
  Future<WriteLocalStorageResponse> write(WriteLocalStorageParam param) async {
    final storage = await _getPreferences();
    final currentData = storage.getStringList(param.table) ?? [];

    final id = currentData.length + 1;
    final dataToSave = {...param.data, 'id': id};
    final jsonToSave = jsonEncode(dataToSave);
    currentData.add(jsonToSave);

    await storage.setStringList(param.table, currentData);

    final response = WriteLocalStorageResponse(id);
    return response;
  }

  Future<SharedPreferences> _getPreferences() async {
    return SharedPreferences.getInstance();
  }
}
