import 'package:inventory/src/core/data/models/ldb_item.dart';

abstract class LocalDatabaseDataSource {
  Stream<List<LdbItem>> watchItems();
  Future<int> upsertItem(LdbItem item);
  Future<void> deleteItem(int itemId);
}
