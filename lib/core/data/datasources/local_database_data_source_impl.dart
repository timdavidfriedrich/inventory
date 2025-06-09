import 'package:inventory/core/data/datasources/local_database.dart';
import 'package:inventory/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:injectable/injectable.dart';

import 'package:inventory/core/data/datasources/local_database_data_source.dart';
import 'package:inventory/core/data/models/ldb_item.dart';

@LazySingleton(as: LocalDatabaseDataSource)
class LocalDatabaseDataSourceImpl implements LocalDatabaseDataSource {
  final LocalDatabase _localDatabase;
  late final Box<LdbItem> _itemBox;

  LocalDatabaseDataSourceImpl({
    required LocalDatabase localDatabase,
  }) : _localDatabase = localDatabase {
    _itemBox = _localDatabase.store.box<LdbItem>();
  }

  @override
  Stream<List<LdbItem>> watchItems() {
    return _itemBox.query().watch(triggerImmediately: true).map((query) => query.find());
  }

  @override
  Future<int> upsertItem(LdbItem item) async {
    return _itemBox.put(item);
  }

  @override
  Future<void> deleteItem(int itemId) async {
    _itemBox.remove(itemId);
  }
}
