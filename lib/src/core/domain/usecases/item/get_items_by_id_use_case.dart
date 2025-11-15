import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class GetItemsByIdsUseCase {
  final ItemRepository _repository;

  const GetItemsByIdsUseCase({
    required ItemRepository repository,
  }) : _repository = repository;

  Future<AppResult<List<Item>>> call(List<int> ids) async {
    return await _repository.getItemsByIds(ids);
  }
}
