import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';

@injectable
class GetCurrentSessionItemUseCase {
  final DeclutterSessionRepository _sessionRepository;
  final ItemRepository _itemRepository;

  const GetCurrentSessionItemUseCase({
    required DeclutterSessionRepository sessionRepository,
    required ItemRepository itemRepository,
  })  : _sessionRepository = sessionRepository,
        _itemRepository = itemRepository;

  Future<AppResult<Item?>> call(int id) async {
    try {
      final sessionResult = await _sessionRepository.getSessionById(id);

      if (sessionResult is Error) {
        return AppResult.error((sessionResult as Error).error);
      }

      final session = (sessionResult as Success).value;
      if (session == null) {
        return AppResult.error(Exception("Session not found"));
      }

      // Session already completed
      if (session.progressIndex >= session.itemIds.length) {
        return const AppResult.success(null);
      }

      final currentItemId = session.itemIds[session.progressIndex];
      return await _itemRepository.getItemById(currentItemId);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }
}
