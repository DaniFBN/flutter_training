import 'dart:convert';

import 'package:person_manager2/app/core/services/local_storage/helpers/params.dart';
import 'package:person_manager2/app/core/services/local_storage/i_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  @override
  Future<List<Map<String, dynamic>>> read(String table) async {
    final storage = await _getPreferences();

    final data = storage.getStringList(table) ?? [];

    return data.map((e) => Map<String, dynamic>.from(jsonDecode(e))).toList();
  }

  @override
  Future<Map<String, dynamic>?> retrieve(String table, String id) async {
    final storage = await _getPreferences();

    final data = storage.getStringList(table) ?? [];

    final filteredData = data.where((e) {
      final data = Map<String, dynamic>.from(jsonDecode(e));
      return data['id'] == id;
    });

    if (filteredData.isEmpty) return null;
    return Map<String, dynamic>.from(jsonDecode(filteredData.first));
  }

  @override
  Future<Map<String, dynamic>> write(WriteLocalStorageParam param) async {
    final storage = await _getPreferences();

    final currentData = storage.getStringList(param.table) ?? [];

    final id = _genID();
    final object = {...param.data, 'id': id};
    final dataJson = jsonEncode(object);

    currentData.add(dataJson);

    await storage.setStringList(param.table, currentData);

    return object;
  }

  String _genID() {
    return const Uuid().v4();
  }

  Future<SharedPreferences> _getPreferences() async {
    return SharedPreferences.getInstance();
  }
}
