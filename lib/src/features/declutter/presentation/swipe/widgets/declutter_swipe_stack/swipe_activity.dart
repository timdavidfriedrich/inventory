import 'package:flutter/material.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/extensions/axis_direction_extensions.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/extensions/offset_extensions.dart';

sealed class SwipeActivity extends Tween<Offset> {
  SwipeActivity(
    this.animation, {
    required super.begin,
    required super.end,
  });

  final AnimationController animation;

  Offset get currentOffset => evaluate(animation);

  AxisDirection get direction {
    return (end! - begin!).toAxisDirection();
  }
}

class Swipe extends SwipeActivity {
  Swipe(
    super.animation, {
    required super.begin,
    required super.end,
  });
}

class Unswipe extends SwipeActivity {
  Unswipe(
    super.animation, {
    required super.begin,
  }) : super(end: Offset.zero);

  @override
  AxisDirection get direction => super.direction.opposite;
}

class CancelSwipe extends SwipeActivity {
  CancelSwipe(
    super.animation, {
    required super.begin,
  }) : super(end: Offset.zero);

  @override
  AxisDirection get direction => super.direction.opposite;
}
