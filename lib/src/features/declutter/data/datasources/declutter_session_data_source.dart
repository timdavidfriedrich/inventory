import 'package:inventory/src/features/declutter/data/models/ldb_declutter_session.dart';

abstract class DeclutterSessionDataSource {
  Stream<List<LdbDeclutterSession>> watchActiveSessions();
  Future<LdbDeclutterSession?> getSessionById(int id);
  Future<int> upsertSession(LdbDeclutterSession session);
  Future<void> deleteSession(int id);
}
