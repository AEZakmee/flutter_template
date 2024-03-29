import 'package:hive/hive.dart';

abstract class CacheClient<T> {
  CacheClient({
    required Box<T> box,
  }) : _box = box;

  final Box<T> _box;

  Iterable<T> get entries => _box.values;
  Iterable<String> get keys => _box.keys.map((key) => key.toString());

  bool isEmpty() => _box.values.isEmpty;

  T? get(String id) => _box.get(id);

  Future<void> put({
    required String id,
    required T data,
  }) =>
      _box.put(id, data);

  Future<void> putAll(Map<dynamic, T> entries) => _box.putAll(entries);

  Future<void> delete(String id) async {
    if (_box.containsKey(id)) {
      await _box.delete(id);
    }
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Stream<Iterable<T>> observeAll() async* {
    yield _box.values;
    yield* _box.watch().map((_) {
      return _box.values;
    });
  }

  Stream<T?> observe(String id) async* {
    yield _box.get(id);
    yield* _box.watch(key: id).map((_) {
      return _box.get(id);
    });
  }
}
