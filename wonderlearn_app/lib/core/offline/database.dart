import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// Tables
class LessonProgressTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get childId => text()();
  TextColumn get lessonId => text()();
  TextColumn get status => text()();
  IntColumn get score => integer()();
  IntColumn get attempts => integer()();
  IntColumn get correctAnswers => integer()();
  IntColumn get totalQuestions => integer()();
  IntColumn get timeSpentSeconds => integer()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get deviceSyncStatus => text()();
}

class OfflineEventsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get childId => text()();
  TextColumn get eventType => text()();
  TextColumn get payload => text()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get syncedAt => dateTime().nullable()();
}

class CachedAssetsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get assetPath => text()();
  TextColumn get localPath => text()();
  IntColumn get sizeBytes => integer()();
  DateTimeColumn get downloadedAt => dateTime()();
}

class SettingsTable extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
}

@DriftDatabase(tables: [
  LessonProgressTable,
  OfflineEventsTable,
  CachedAssetsTable,
  SettingsTable,
])
class WonderLearnDatabase extends _$WonderLearnDatabase {
  WonderLearnDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Lesson Progress
  Future<List<LessonProgressTableData>> getLessonProgress(String childId) {
    return (select(lessonProgressTable)
          ..where((t) => t.childId.equals(childId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  Future<int> insertLessonProgress(LessonProgressTableCompanion entry) {
    return into(lessonProgressTable).insert(entry, mode: InsertMode.replace);
  }

  Future<bool> updateLessonProgress(LessonProgressTableData entry) {
    return update(lessonProgressTable).replace(entry);
  }

  // Offline Events
  Future<List<OfflineEventTableData>> getPendingOfflineEvents(String childId) {
    return (select(offlineEventsTable)
          ..where((t) => t.childId.equals(childId) & t.syncedAt.isNull())
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();
  }

  Future<int> insertOfflineEvent(OfflineEventTableCompanion entry) {
    return into(offlineEventsTable).insert(entry);
  }

  Future<void> markEventSynced(int eventId) {
    return (update(offlineEventsTable)..where((t) => t.id.equals(eventId)))
        .write(OfflineEventTableCompanion(syncedAt: Value(DateTime.now())));
  }

  // Cached Assets
  Future<CachedAssetTableData?> getCachedAsset(String assetPath) {
    return (select(cachedAssetsTable)
          ..where((t) => t.assetPath.equals(assetPath))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertCachedAsset(CachedAssetTableCompanion entry) {
    return into(cachedAssetsTable).insert(entry, mode: InsertMode.replace);
  }

  // Settings
  Future<String?> getSetting(String key) async {
    final result = await (select(settingsTable)
          ..where((t) => t.key.equals(key))
          ..limit(1))
        .getSingleOrNull();
    return result?.value;
  }

  Future<void> setSetting(String key, String value) {
    return into(settingsTable).insert(
      SettingsTableCompanion(key: Value(key), value: Value(value)),
      mode: InsertMode.replace,
    );
  }

  // Cleanup
  Future<void> clearOldOfflineEvents({int daysOld = 30}) {
    final cutoff = DateTime.now().subtract(Duration(days: daysOld));
    return (delete(offlineEventsTable)
          ..where((t) => t.timestamp.isSmallerThanValue(cutoff)))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wonderlearn.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
