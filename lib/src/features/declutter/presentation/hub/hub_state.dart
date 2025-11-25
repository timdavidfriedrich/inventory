import 'package:inventory/src/features/declutter/domain/entities/declutter_session.dart';

sealed class HubState {
  const HubState();
}

class HubInitial extends HubState {
  const HubInitial();
}

class HubLoading extends HubState {
  const HubLoading();
}

class HubLoadSuccess extends HubState {
  final List<DeclutterSession> activeSessions;
  const HubLoadSuccess(this.activeSessions);
}

class HubNavigationSuccess extends HubState {
  final int sessionId;
  const HubNavigationSuccess(this.sessionId);
}

class HubError extends HubState {
  final String message;
  const HubError(this.message);
}
