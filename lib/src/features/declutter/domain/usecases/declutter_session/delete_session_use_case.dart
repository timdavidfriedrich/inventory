import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';

@injectable
class DeleteSessionUseCase {
  final DeclutterSessionRepository _sessionRepository;

  const DeleteSessionUseCase(this._sessionRepository);

  Future<AppResult<void>> call(int id) async {
    return await _sessionRepository.deleteSession(id);
  }
}
