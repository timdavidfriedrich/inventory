import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class GetItemsByTagUseCase {
  final ItemRepository _itemRepository;

  const GetItemsByTagUseCase({
    required ItemRepository itemRepository,
  }) : _itemRepository = itemRepository;

  Future<AppResult<List<Item>>> call(String tag) {
    return _itemRepository.getItemsByTag(tag);
  }
}
