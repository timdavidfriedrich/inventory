import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class MarkToMoveUseCase {
  final ItemRepository _itemRepository;

  MarkToMoveUseCase(this._itemRepository);

  Future<AppResult<void>> call(Item item) async {
    try {
      await _itemRepository.markToMove(item);
      return Success(null);
    } on Exception catch (e) {
      return Error(e);
    }
  }
}
