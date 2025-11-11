import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/core/domain/entities/item.dart';
import 'package:inventory/src/core/domain/repositories/item_repository.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session_config.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';

const _maxQuickSessionItems = 10;

@injectable
class CreateSessionUseCase {
  final ItemRepository _itemRepository;
  final DeclutterSessionRepository _sessionRepository;

  const CreateSessionUseCase({
    required ItemRepository itemRepository,
    required DeclutterSessionRepository sessionRepository,
  })  : _itemRepository = itemRepository,
        _sessionRepository = sessionRepository;

  Future<AppResult<int>> call({
    required DeclutterSessionConfig config,
  }) async {
    try {
      final itemsResult = await switch (config) {
        QuickDeclutterSessionConfig() =>
          _itemRepository.getDueItems(config.maxItems ?? _maxQuickSessionItems),
        DeclutterByLocationSessionConfig(:var locationId) =>
          _itemRepository.getItemsByLocationId(locationId),
        DeclutterByTagSessionConfig(:var tag) => _itemRepository.getItemsByTag(tag),
      };

      if (itemsResult is Error) {
        return AppResult.error((itemsResult as Error).error);
      }

      if ((itemsResult as Success).value is! List<Item>) {
        return AppResult.error(
          Exception("Create session: Unexpected result type${itemsResult.runtimeType}"),
        );
      }

      final items = (itemsResult as Success).value as List<Item>;

      final itemIds = items
          .where((item) => !item.isArchived && item.id != null)
          .map((item) => item.id!)
          .toList();

      if (itemIds.isEmpty) {
        return AppResult.empty();
      }

      final now = DateTime.now();
      final session = DeclutterSession(
        contextName: config.contextName,
        itemIds: itemIds.cast<int>(), // this cast is crucial for objectbox
        createdAt: now,
        updatedAt: now,
      );

      return await _sessionRepository.upsertSession(session);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }
}
