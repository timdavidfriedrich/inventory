import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class GetItemsByLocationIdUseCase {
  final ItemRepository _itemRepository;

  const GetItemsByLocationIdUseCase({
    required ItemRepository itemRepository,
  }) : _itemRepository = itemRepository;

  Future<AppResult<List<Item>>> call(int id) {
    return _itemRepository.getItemsByLocationId(id);
  }
}
