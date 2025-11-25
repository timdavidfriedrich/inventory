import 'package:inventory/src/core/data/models/ldb_item.dart';

abstract class LocalDatabaseDataSource {
  Stream<List<LdbItem>> watchItems();
  Future<List<LdbItem>> getDueItems(int? maxCount);
  Future<List<LdbItem>> getItemsByLocationId(int id);
  Future<List<LdbItem>> getItemsByTag(String tag);
  Future<List<LdbItem>> getItemsByCondition(int conditionIndex);
  Future<List<LdbItem>> getItemsByIds(List<int> ids);
  Future<LdbItem?> getItemById(int id);
  Future<int> upsertItem(LdbItem item);
  Future<void> deleteItem(LdbItem item);
}
