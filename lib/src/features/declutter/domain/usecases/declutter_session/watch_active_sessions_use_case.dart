import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';

@injectable
class WatchActiveSessionsUseCase {
  final DeclutterSessionRepository _sessionRepository;

  const WatchActiveSessionsUseCase(this._sessionRepository);

  Stream<AppResult<List<DeclutterSession>>> call() {
    return _sessionRepository.watchActiveSessions();
  }
}
