import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';

abstract interface class ItemRepository {
  Stream<AppResult<List<Item>>> watchItems();
  Future<AppResult<List<Item>>> getDueItems(int? maxCount);
  Future<AppResult<List<Item>>> getItemsByLocationId(int id);
  Future<AppResult<List<Item>>> getItemsByTag(String tag);
  Future<AppResult<Item?>> getItemById(int id);
  Future<AppResult<void>> saveItem(Item item);
  Future<AppResult<void>> deleteItem(Item item);
  Future<AppResult<void>> archiveItem(Item item);
  Future<AppResult<void>> unarchiveItem(Item item);
  Future<AppResult<void>> markToKeep(Item item);
  Future<AppResult<void>> markToMove(Item item);
  Future<AppResult<void>> markToToss(Item item);
  Future<AppResult<void>> skipDeclutter(Item item);
}
