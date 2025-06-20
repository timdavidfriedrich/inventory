import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';

@injectable
class GetAllItemsUseCase {
  final ItemRepository _repository;

  const GetAllItemsUseCase({
    required ItemRepository repository,
  }) : _repository = repository;

  Stream<AppResult<List<Item>>> call() {
    return _repository.watchItems();
  }
}
