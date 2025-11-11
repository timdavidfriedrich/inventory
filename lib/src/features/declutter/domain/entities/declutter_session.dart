import 'package:freezed_annotation/freezed_annotation.dart';

part 'declutter_session.freezed.dart';

@freezed
abstract class DeclutterSession with _$DeclutterSession {
  const factory DeclutterSession({
    int? id,
    required String contextName,
    required List<int> itemIds,
    @Default(0) int progressIndex,
    @Default(DeclutterSessionStatus.active) DeclutterSessionStatus status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DeclutterSession;
}

enum DeclutterSessionStatus {
  active,
  paused,
  completed,
}
