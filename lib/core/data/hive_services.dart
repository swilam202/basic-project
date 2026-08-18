import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const _boxName = 'app_cache';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  Future<void> save(
    String key,
    dynamic data, {
    Map<String, dynamic>? body,
  }) async {
    final box = Hive.box(_boxName);
    await box.put(key, {
      'data': data,
      'body': body,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  Map<String, dynamic>? get(
    String key, {
    Map<String, dynamic>? body,
  }) {
    final box = Hive.box(_boxName);
    final entry = box.get(key) as Map<String, dynamic>?;
    if (entry != null && entry['body'] == body) {
      return entry['data'];
    }
    return null;
  }

  bool isStale(String key, {Duration maxAge = const Duration(hours: 1)}) {
    final entry = get(key);
    if (entry == null) return true;
    final savedAt = DateTime.parse(entry['timestamp']);
    return DateTime.now().difference(savedAt) > maxAge;
  }

  Future<void> clear(String key) => Hive.box(_boxName).delete(key);
}
