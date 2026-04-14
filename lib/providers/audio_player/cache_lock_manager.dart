class CacheLockManager {
  static final CacheLockManager _instance = CacheLockManager._internal();
  static CacheLockManager get instance => _instance;
  CacheLockManager._internal();

  final _locks = <String, bool>{};

  bool isLocked(String cacheKey) {
    return _locks[cacheKey] == true;
  }

  void lock(String cacheKey) {
    _locks[cacheKey] = true;
  }

  void unlock(String cacheKey) {
    _locks.remove(cacheKey);
  }

  bool tryLock(String cacheKey) {
    if (isLocked(cacheKey)) {
      return false;
    }
    lock(cacheKey);
    return true;
  }

  bool isAnyLocked(Iterable<String> cacheKeys) {
    return cacheKeys.any((key) => isLocked(key));
  }

  void clearAll() {
    _locks.clear();
  }

  List<String> get lockedKeys => _locks.keys.toList();
}
