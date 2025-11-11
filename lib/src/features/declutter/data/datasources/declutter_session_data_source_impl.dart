import 'package:injectable/injectable.dart';
import 'package:inventory/objectbox.g.dart';
import 'package:inventory/src/core/data/datasources/local_database.dart';
import 'package:inventory/src/features/declutter/data/datasources/declutter_session_data_source.dart';
import 'package:inventory/src/features/declutter/data/models/ldb_declutter_session.dart';

@LazySingleton(as: DeclutterSessionDataSource)
class DeclutterSessionDataSourceImpl implements DeclutterSessionDataSource {
  final LocalDatabase _localDatabase;
  late final Box<LdbDeclutterSession> _sessionBox;

  DeclutterSessionDataSourceImpl({
    required LocalDatabase localDatabase,
  }) : _localDatabase = localDatabase {
    _sessionBox = _localDatabase.store.box<LdbDeclutterSession>();
  }

  @override
  Stream<List<LdbDeclutterSession>> watchActiveSessions() {
    return _sessionBox
        .query(LdbDeclutterSession_.status.notEquals(2))
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  @override
  Future<LdbDeclutterSession?> getSessionById(int id) async {
    final query = _sessionBox.query(LdbDeclutterSession_.id.equals(id)).build();
    final sessions = query.find();
    query.close();
    return sessions.isEmpty ? null : sessions.first;
  }

  @override
  Future<int> upsertSession(LdbDeclutterSession session) async {
    return _sessionBox.put(session);
  }

  @override
  Future<void> deleteSession(int id) async {
    final session = await getSessionById(id);
    if (session != null) {
      _sessionBox.remove(session.id);
    }
  }
}
