import 'package:inventory/src/core/data/datasources/local_database.dart';
import 'package:inventory/objectbox.g.dart';
import 'package:injectable/injectable.dart' as inject;

import 'package:inventory/src/core/data/datasources/local_database_data_source.dart';
import 'package:inventory/src/core/data/models/ldb_item.dart';

@inject.LazySingleton(as: LocalDatabaseDataSource)
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
  Future<List<LdbItem>> getDueItems(int? maxCount) async {
    final query = _itemBox
        .query(LdbItem_.isArchived.equals(false) | LdbItem_.currentTask.isNull())
        .order(LdbItem_.lastDeclutter, flags: Order.descending | Order.nullsLast)
        .build()
      ..limit = maxCount ?? 999;
    return query.find();
  }

  @override
  Future<List<LdbItem>> getItemsByLocationId(int id) async {
    final query = _itemBox
        .query(LdbItem_.location.equals(id) |
            LdbItem_.isArchived.equals(false) |
            LdbItem_.currentTask.isNull())
        .build();
    return query.find();
  }

  @override
  Future<List<LdbItem>> getItemsByTag(String tag) async {
    final query = _itemBox
        .query(LdbItem_.tags.containsElement(tag) |
            LdbItem_.isArchived.equals(false) |
            LdbItem_.currentTask.isNull())
        .build();
    return query.find();
  }

  @override
  Future<List<LdbItem>> getItemsByCondition(int conditionIndex) async {
    final query = _itemBox.query(LdbItem_.condition.equals(conditionIndex)).build();
    return query.find();
  }

  @override
  Future<List<LdbItem>> getItemsByIds(List<int> ids) async {
    if (ids.isEmpty) {
      return [];
    }
    return _itemBox.getMany(ids).whereType<LdbItem>().toList();
  }

  @override
  Future<LdbItem?> getItemById(int id) async {
    if (id == 0) {
      return null;
    }
    return _itemBox.get(id);
  }

  @override
  Future<int> upsertItem(LdbItem item) async {
    return _itemBox.put(item);
  }

  @override
  Future<void> deleteItem(LdbItem item) async {
    if (item.id == 0) {
      throw Exception("Cannot delete item with id 0");
    }
    _itemBox.remove(item.id);
  }
}
