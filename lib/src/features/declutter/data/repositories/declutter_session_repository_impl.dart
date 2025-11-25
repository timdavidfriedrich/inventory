import 'package:injectable/injectable.dart';
import 'package:inventory/src/core/domain/entities/app_result.dart';
import 'package:inventory/src/features/declutter/data/datasources/declutter_session_data_source.dart';
import 'package:inventory/src/features/declutter/data/mappers/declutter_session_mappers.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/repositories/declutter_session_repository.dart';
import 'package:log/log.dart';

@LazySingleton(as: DeclutterSessionRepository)
class DeclutterSessionRepositoryImpl implements DeclutterSessionRepository {
  final DeclutterSessionDataSource _dataSource;

  const DeclutterSessionRepositoryImpl({
    required DeclutterSessionDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Stream<AppResult<List<DeclutterSession>>> watchActiveSessions() {
    return _dataSource.watchActiveSessions().map((ldbSessions) {
      final sessions = ldbSessions.map((ldbSession) => ldbSession.toDeclutterSession()).toList();
      return AppResult.success(sessions);
    }).handleError((error, stackTrace) {
      Log.error("Error in watchActiveSessions stream", exception: error);
      return AppResult.error(Exception(error));
    });
  }

  @override
  Future<AppResult<DeclutterSession?>> getSessionById(int id) async {
    try {
      final ldbSession = await _dataSource.getSessionById(id);
      if (ldbSession == null) {
        return AppResult.success(null);
      }
      return AppResult.success(ldbSession.toDeclutterSession());
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<int>> upsertSession(DeclutterSession session) async {
    try {
      final ldbSession = session.toLdbDeclutterSession();
      final sessionId = await _dataSource.upsertSession(ldbSession);
      return AppResult.success(sessionId);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }

  @override
  Future<AppResult<void>> deleteSession(int id) async {
    try {
      await _dataSource.deleteSession(id);
      return const AppResult.success(null);
    } catch (e) {
      return AppResult.error(Exception(e));
    }
  }
}
