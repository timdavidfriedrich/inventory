import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/data/datasources/local_database_data_source.dart';
import 'package:inventory/src/core/data/mappers/item_mappers.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/entities/task.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';
import 'package:log/log.dart';

@LazySingleton(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final LocalDatabaseDataSource _localDataSource;

  const ItemRepositoryImpl({
    required LocalDatabaseDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Stream<AppResult<List<Item>>> watchItems() {
    return _localDataSource.watchItems().map((ldbItems) {
      final items = ldbItems.map((ldbItem) => ldbItem.toItem()).toList();
      return AppResult.success(items);
    }).handleError((error, stackTrace) {
      Log.error("Error in watchItems stream", exception: error);
      return AppResult.error(Exception(error));
    });
  }

  @override
  Future<AppResult<List<Item>>> getDueItems(int? maxCount) async {
    try {
      final ldbItems = await _localDataSource.getDueItems(maxCount);
      final items = ldbItems.map((ldbItem) => ldbItem.toItem()).toList();
      return AppResult.success(items);
    } on Exception catch (e) {
      return AppResult.error(e);
    }
  }

  @override
  Future<AppResult<List<Item>>> getItemsByLocationId(int id) async {
    try {
      final ldbItems = await _localDataSource.getItemsByLocationId(id);
      final items = ldbItems.map((ldbItem) => ldbItem.toItem()).toList();
      return AppResult.success(items);
    } on Exception catch (e) {
      return AppResult.error(e);
    }
  }

  @override
  Future<AppResult<List<Item>>> getItemsByTag(String tag) async {
    try {
      final ldbItems = await _localDataSource.getItemsByTag(tag);
      final items = ldbItems.map((ldbItem) => ldbItem.toItem()).toList();
      return AppResult.success(items);
    } on Exception catch (e) {
      return AppResult.error(e);
    }
  }

  @override
  Future<AppResult<Item?>> getItemById(int id) async {
    try {
      final ldbItem = await _localDataSource.getItemById(id);
      if (ldbItem == null) {
        return AppResult.error(Exception("Item not found with id: $id"));
      }
      final item = ldbItem.toItem();
      return AppResult.success(item);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> saveItem(Item item) async {
    try {
      final ldbItem = item.toLdbItem();
      if (ldbItem == null) {
        return AppResult.error(Exception("Invalid LdbItem: $ldbItem"));
      }
      await _localDataSource.upsertItem(ldbItem);
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> deleteItem(Item item) async {
    try {
      final ldbItem = item.toLdbItem();
      if (ldbItem == null) {
        return AppResult.error(Exception("Invalid LdbItem: $ldbItem"));
      }
      try {
        await _localDataSource.deleteItem(ldbItem);
      } catch (e) {
        return AppResult.error(Exception("Failed to delete item: $e"));
      }
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> archiveItem(Item item) async {
    try {
      final updatedItem = item.copyWith(isArchived: true);
      final ldbItem = updatedItem.toLdbItem();
      if (ldbItem == null) {
        return AppResult.error(Exception("Invalid LdbItem: $ldbItem"));
      }
      await _localDataSource.upsertItem(ldbItem);
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> unarchiveItem(Item item) async {
    try {
      final updatedItem = item.copyWith(isArchived: false);
      final ldbItem = updatedItem.toLdbItem();
      if (ldbItem == null) {
        return AppResult.error(Exception("Invalid LdbItem: $ldbItem"));
      }
      await _localDataSource.upsertItem(ldbItem);
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> markToKeep(Item item) async {
    // TODO: Implement markToKeep
    return const AppResult.success(null);
  }

  @override
  Future<AppResult<void>> markToMove(Item item) async {
    final updatedItem = item.copyWith(currentTask: Task.move);
    final ldbItem = updatedItem.toLdbItem();
    if (ldbItem == null) {
      return AppResult.error(Exception("markToMove: Invalid LdbItem: $ldbItem"));
    }
    await _localDataSource.upsertItem(ldbItem);
    return const AppResult.success(null);
  }

  @override
  Future<AppResult<void>> markToToss(Item item) async {
    final updatedItem = item.copyWith(currentTask: Task.toss);
    final ldbItem = updatedItem.toLdbItem();
    if (ldbItem == null) {
      return AppResult.error(Exception("markToToss: Invalid LdbItem: $ldbItem"));
    }
    await _localDataSource.upsertItem(ldbItem);
    return const AppResult.success(null);
  }

  @override
  Future<AppResult<void>> skipDeclutter(Item item) async {
    // TODO: Implement skipDeclutter
    return const AppResult.success(null);
  }
}
