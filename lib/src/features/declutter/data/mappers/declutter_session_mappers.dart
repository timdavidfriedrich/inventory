import 'package:inventory/src/features/declutter/data/models/ldb_declutter_session.dart';
import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';

extension LdbDeclutterSessionMapper on LdbDeclutterSession {
  DeclutterSession toDeclutterSession() {
    return DeclutterSession(
      id: id,
      contextName: contextName,
      itemIds: List<int>.from(itemIds),
      progressIndex: progressIndex,
      status: DeclutterSessionStatus.values[status],
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension DeclutterSessionMapper on DeclutterSession {
  LdbDeclutterSession toLdbDeclutterSession() {
    final ldbDeclutterSesssion = LdbDeclutterSession(
      contextName: contextName,
      itemIds: List<int>.from(itemIds),
      progressIndex: progressIndex,
      status: status.index,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    // Only set id, if not 0
    final sessionId = id;
    if (sessionId != null && sessionId > 0) {
      ldbDeclutterSesssion.id = sessionId;
    }

    return ldbDeclutterSesssion;
  }
}
