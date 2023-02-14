abstract class ILocalStorageService {
  Future<void> initialize();
  Future<List<Map<String, dynamic>>> read({required String key});
  Future<bool> write({required String key, required Map<String, dynamic> data});
  Future<bool> delete({required String key});
  void dispose();
}
