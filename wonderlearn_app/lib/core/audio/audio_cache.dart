import 'dart:collection';

class AudioCache {
  final Map<String, String> _cache = {};
  final Queue<String> _accessOrder = Queue<String>();
  final int _maxSize;
  
  AudioCache({int maxSize = 100}) : _maxSize = maxSize;
  
  String? get(String key) {
    if (_cache.containsKey(key)) {
      _accessOrder.remove(key);
      _accessOrder.addLast(key);
      return _cache[key];
    }
    return null;
  }
  
  void put(String key, String value) {
    if (_cache.containsKey(key)) {
      _accessOrder.remove(key);
    } else if (_cache.length >= _maxSize) {
      final oldest = _accessOrder.removeFirst();
      _cache.remove(oldest);
    }
    
    _cache[key] = value;
    _accessOrder.addLast(key);
  }
  
  bool contains(String key) => _cache.containsKey(key);
  
  void remove(String key) {
    _cache.remove(key);
    _accessOrder.remove(key);
  }
  
  void clear() {
    _cache.clear();
    _accessOrder.clear();
  }
  
  int get size => _cache.length;
}
