import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';

@injectable
class UpdateSessionUseCase {
  final DeclutterSessionRepository _sessionRepository;

  UpdateSessionUseCase(this._sessionRepository);

  Future<AppResult<void>> call(DeclutterSession session) {
    return _sessionRepository.upsertSession(session);
  }
}
