import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class GetItemByIdUseCase {
  final ItemRepository _repository;

  const GetItemByIdUseCase({
    required ItemRepository repository,
  }) : _repository = repository;

  Future<AppResult<Item?>> call(int id) async {
    return await _repository.getItemById(id);
  }
}
