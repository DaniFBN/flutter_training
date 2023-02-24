import 'package:arch_class2/app/core/shared/services/local_storage/i_local_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveLocalStorageService implements ILocalStorageService {
  @override
  Future<void> initialize() async {
    if (!kIsWeb) {
      final dir = await getTemporaryDirectory();
      Hive.init(dir.path);
    }
  }

  @override
  Future<bool> delete({required String key}) async {
    final box = await _getBox(key);
    await box.clear();

    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> read({required String key}) async {
    final box = await _getBox(key);

    final data = box.toMap().entries.map((e) {
      return Map<String, dynamic>.from(e.value);
    });
    
    return List<Map<String, dynamic>>.from(data);
  }

  @override
  Future<bool> write({
    required String key,
    required Map<String, dynamic> data,
  }) async {
    final box = await _getBox(key);
    await box.add(data);

    return true;
  }

  @override
  void dispose() async {
    Hive.close();
  }

  Future<Box> _getBox(String boxKey) async {
    if (Hive.isBoxOpen(boxKey)) {
      return Hive.box(boxKey);
    }
    return await Hive.openBox(boxKey);
  }
}

// Modularização
// Interceptor com API


