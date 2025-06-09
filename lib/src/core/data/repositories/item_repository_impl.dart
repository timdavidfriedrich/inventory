import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/data/datasources/local_database_data_source.dart';
import 'package:inventory/src/core/data/mappers/item_mappers.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

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
      // TODO: Replace print with custom log class
      print('Error in watchItems stream: $error');
      return AppResult.error(Exception(error));
    });
  }

  @override
  Future<AppResult<void>> saveItem(Item item) async {
    try {
      final ldbItem = item.toLdbItem();
      await _localDataSource.upsertItem(ldbItem);
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> deleteItem(int itemId) async {
    try {
      await _localDataSource.deleteItem(itemId);
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }
}
