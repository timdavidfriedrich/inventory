import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';

@injectable
class GetSessionByIdUseCase {
  final DeclutterSessionRepository _sessionRepository;

  GetSessionByIdUseCase(this._sessionRepository);

  Future<AppResult<DeclutterSession?>> call(int id) {
    return _sessionRepository.getSessionById(id);
  }
}
