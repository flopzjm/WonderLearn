import 'dart:convert';
import 'package:drift/drift.dart';
import 'database.dart';

class SyncQueue {
  final WonderLearnDatabase _db;

  SyncQueue(this._db);

  Future<void> addEvent(String childId, String eventType, Map<String, dynamic> payload) async {
    await _db.insertOfflineEvent(
      OfflineEventTableCompanion(
        childId: Value(childId),
        eventType: Value(eventType),
        payload: Value(jsonEncode(payload)),
        timestamp: Value(DateTime.now()),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getPendingEvents(String childId) async {
    final events = await _db.getPendingOfflineEvents(childId);
    return events.map((e) => {
      'id': e.id,
      'eventType': e.eventType,
      'payload': jsonDecode(e.payload),
      'timestamp': e.timestamp.toIso8601String(),
    }).toList();
  }

  Future<void> markSynced(int eventId) async {
    await _db.markEventSynced(eventId);
  }

  Future<int> getPendingCount(String childId) async {
    final events = await _db.getPendingOfflineEvents(childId);
    return events.length;
  }

  Future<void> clearOldEvents({int daysOld = 30}) async {
    await _db.clearOldOfflineEvents(daysOld: daysOld);
  }
}
