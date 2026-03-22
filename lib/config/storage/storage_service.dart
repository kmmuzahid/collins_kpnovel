import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storageServiceProvider = Provider.autoDispose<StorageService>(
  (ref) => StorageService(),
);

class StorageService {
  StorageService() {
    _secureStorage = const FlutterSecureStorage();
  }
  static StorageService get instance => StorageService();

  late final FlutterSecureStorage _secureStorage;

  Future<void> set(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
