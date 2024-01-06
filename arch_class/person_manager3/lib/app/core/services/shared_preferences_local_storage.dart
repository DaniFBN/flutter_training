import 'dart:convert';
import 'dart:math';

import 'package:person_manager3/app/core/services/i_local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage implements ILocalStorage {
  const SharedPreferencesLocalStorage(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<Map<String, dynamic>> add(
    String key,
    Map<String, dynamic> data,
  ) async {
    final handledData = {'id': Random().nextInt(999999), ...data};
    final newData = jsonEncode(handledData);

    final currentData = _preferences.getStringList(key) ?? [];
    currentData.add(newData);

    await _preferences.setStringList(key, currentData);

    return handledData;
  }

  @override
  Future<List<Map<String, dynamic>>> get(String key) async {
    final currentData = _preferences.getStringList(key) ?? [];

    final data = currentData.map((e) {
      return Map<String, dynamic>.from(jsonDecode(e));
    });

    return data.toList();
  }
}

