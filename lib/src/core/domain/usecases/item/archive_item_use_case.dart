import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class ArchiveItemUseCase {
  final ItemRepository _repository;

  const ArchiveItemUseCase({
    required ItemRepository repository,
  }) : _repository = repository;

  Future<AppResult<void>> call(Item item) async {
    return await _repository.archiveItem(item);
  }
}
