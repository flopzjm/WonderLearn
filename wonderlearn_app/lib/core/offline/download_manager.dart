import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'database.dart';

class DownloadManager {
  final WonderLearnDatabase _db;

  DownloadManager(this._db);

  Future<String> get _cacheDir async {
    final dir = await getApplicationCacheDirectory();
    final assetsDir = Directory(p.join(dir.path, 'assets'));
    if (!await assetsDir.exists()) {
      await assetsDir.create(recursive: true);
    }
    return assetsDir.path;
  }

  Future<bool> isAssetCached(String assetPath) async {
    final cached = await _db.getCachedAsset(assetPath);
    if (cached == null) return false;
    
    final file = File(cached.localPath);
    return await file.exists();
  }

  Future<String?> getCachedAssetPath(String assetPath) async {
    final cached = await _db.getCachedAsset(assetPath);
    if (cached == null) return null;
    
    final file = File(cached.localPath);
    if (await file.exists()) {
      return cached.localPath;
    }
    return null;
  }

  Future<void> cacheAsset(String assetPath, List<int> bytes) async {
    final cacheDir = await _cacheDir;
    final localPath = p.join(cacheDir, assetPath.replaceAll('/', '_'));
    
    final file = File(localPath);
    await file.writeAsBytes(bytes);

    await _db.insertCachedAsset(
      CachedAssetTableCompanion(
        assetPath: Value(assetPath),
        localPath: Value(localPath),
        sizeBytes: Value(bytes.length),
        downloadedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> removeCachedAsset(String assetPath) async {
    final cached = await _db.getCachedAsset(assetPath);
    if (cached != null) {
      final file = File(cached.localPath);
      if (await file.exists()) {
        await file.delete();
      }
      await (await _db.delete(_db.cachedAssetsTable)
        ..where((t) => t.assetPath.equals(assetPath)))
        .go();
    }
  }

  Future<int> getCacheSize() async {
    final assets = await _db.select(_db.cachedAssetsTable).get();
    return assets.fold(0, (sum, a) => sum + a.sizeBytes);
  }

  Future<void> clearCache() async {
    final assets = await _db.select(_db.cachedAssetsTable).get();
    for (final asset in assets) {
      final file = File(asset.localPath);
      if (await file.exists()) {
        await file.delete();
      }
    }
    await _db.delete(_db.cachedAssetsTable).go();
  }

  Future<void> downloadNextLessons(String childId, {int count = 5}) async {
    // TODO: Implement lesson downloading logic
    // This would:
    // 1. Get next lessons from learning path
    // 2. Download assets for each lesson
    // 3. Cache them locally
  }
}
