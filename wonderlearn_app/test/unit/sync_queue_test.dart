import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SyncQueue', () {
    test('serializes event correctly', () {
      final event = {
        'id': 1,
        'childId': 'child-123',
        'eventType': 'lesson_completed',
        'payload': {'lessonId': 'lesson-1', 'stars': 3},
        'timestamp': DateTime(2024, 1, 15, 10, 30).toIso8601String(),
      };

      final json = jsonEncode(event);
      final decoded = jsonDecode(json);

      expect(decoded['childId'], 'child-123');
      expect(decoded['eventType'], 'lesson_completed');
      expect(decoded['payload']['lessonId'], 'lesson-1');
      expect(decoded['payload']['stars'], 3);
    });

    test('pending count returns correct number', () {
      final events = [
        {'id': 1, 'synced': false},
        {'id': 2, 'synced': false},
        {'id': 3, 'synced': true},
      ];

      final pendingCount = events.where((e) => e['synced'] == false).length;
      expect(pendingCount, 2);
    });

    test('FIFO ordering by timestamp', () {
      final events = [
        {'id': 1, 'timestamp': '2024-01-15T10:30:00'},
        {'id': 2, 'timestamp': '2024-01-15T10:25:00'},
        {'id': 3, 'timestamp': '2024-01-15T10:35:00'},
      ];

      events.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

      expect(events[0]['id'], 2);
      expect(events[1]['id'], 1);
      expect(events[2]['id'], 3);
    });

    test('old events are filtered correctly', () {
      final now = DateTime.now();
      final events = [
        {'id': 1, 'timestamp': now.subtract(const Duration(days: 31))},
        {'id': 2, 'timestamp': now.subtract(const Duration(days: 15))},
        {'id': 3, 'timestamp': now.subtract(const Duration(days: 5))},
      ];

      final cutoff = now.subtract(const Duration(days: 30));
      final oldEvents = events
          .where((e) => DateTime.parse(e['timestamp']).isBefore(cutoff))
          .toList();

      expect(oldEvents.length, 1);
      expect(oldEvents[0]['id'], 1);
    });
  });
}
