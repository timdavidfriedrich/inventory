sealed class SwipeEvent {
  const SwipeEvent();
}

class SwipeDeleteSession extends SwipeEvent {
  const SwipeDeleteSession();
}

class SwipeCurrentItemRequested extends SwipeEvent {
  const SwipeCurrentItemRequested();
}

class SwipeItemActioned extends SwipeEvent {
  final int? itemId;
  final SwipeAction action;
  const SwipeItemActioned(this.itemId, this.action);
}

enum SwipeAction {
  keep,
  toss,
  move,
}
