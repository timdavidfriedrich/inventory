import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class SaveItemUseCase {
  final ItemRepository _repository;

  const SaveItemUseCase({
    required ItemRepository repository,
  }) : _repository = repository;

  Future<AppResult<void>> call(Item item) async {
    return await _repository.saveItem(item);
  }
}
