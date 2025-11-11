import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';

abstract interface class DeclutterSessionRepository {
  Stream<AppResult<List<DeclutterSession>>> watchActiveSessions();
  Future<AppResult<DeclutterSession?>> getSessionById(int id);
  Future<AppResult<int>> upsertSession(DeclutterSession session);
  Future<AppResult<void>> deleteSession(int id);
}
