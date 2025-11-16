import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/swipe_activity.dart';

class SwipeAnimationCoordinator {
  final Queue<Swipe> _activityHistory = Queue();
  SwipeActivity? _currentActivity;
  Future<bool>? _previousActivityFuture;

  bool get canUnswipe => _activityHistory.isNotEmpty;

  SwipeActivity? get currentActivity => _currentActivity;

  Future<bool> runActivity(SwipeActivity activity) async {
    final currentActivity = _currentActivity;
    if (currentActivity != null) {
      currentActivity.animation.stop();
      await _previousActivityFuture;
    }

    _currentActivity = activity;

    if (activity is Swipe) {
      _activityHistory.add(activity);
    } else if (activity is Unswipe && _activityHistory.isNotEmpty) {
      _activityHistory.removeLast();
    }

    _previousActivityFuture =
        activity.animation.forward().orCancel.then((_) => false).onError((error, stackTrace) {
      if (error is TickerCanceled) return true;
      throw error!;
    }).then((wasCancelled) {
      activity.animation.dispose();
      _currentActivity = null;
      return wasCancelled;
    });

    return await _previousActivityFuture!;
  }

  Swipe? getLastSwipe() {
    return _activityHistory.isEmpty ? null : _activityHistory.last;
  }

  void dispose() {
    _currentActivity?.animation.dispose();
    _activityHistory.clear();
  }
}
