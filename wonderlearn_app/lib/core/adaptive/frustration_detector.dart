import 'dart:async';

class FrustrationDetector {
  final List<DateTime> _errorTimestamps = [];
  final int _errorThreshold = 5;
  final Duration _timeWindow = const Duration(seconds: 120);

  void recordError() {
    _errorTimestamps.add(DateTime.now());
    _cleanOldTimestamps();
  }

  void clearErrors() {
    _errorTimestamps.clear();
  }

  void _cleanOldTimestamps() {
    final cutoff = DateTime.now().subtract(_timeWindow);
    _errorTimestamps.removeWhere((t) => t.isBefore(cutoff));
  }

  bool get isFrustrated => _errorTimestamps.length >= _errorThreshold;

  int get recentErrors => _errorTimestamps.length;

  String? get suggestion {
    if (isFrustrated) {
      return 'mindfulness';
    }
    return null;
  }
}
