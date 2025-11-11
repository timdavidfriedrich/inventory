sealed class HubEvent {
  const HubEvent();
}

class HubActiveSessionsRequested extends HubEvent {
  const HubActiveSessionsRequested();
}

class HubNewQuickSessionRequested extends HubEvent {
  const HubNewQuickSessionRequested();
}

class HubNewLocationSessionRequested extends HubEvent {
  final int locationId;
  const HubNewLocationSessionRequested({required this.locationId});
}

class HubNewTagSessionRequested extends HubEvent {
  final String tag;
  const HubNewTagSessionRequested({required this.tag});
}

class HubDeleteSession extends HubEvent {
  final int? sessionId;
  const HubDeleteSession(this.sessionId);
}
