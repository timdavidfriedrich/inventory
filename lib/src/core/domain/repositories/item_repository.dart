import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';

abstract interface class ItemRepository {
  Stream<AppResult<List<Item>>> watchItems();
  Future<AppResult<void>> saveItem(Item item);
  Future<AppResult<void>> deleteItem(int itemId);
}
