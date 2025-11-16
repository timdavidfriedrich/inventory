import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/extensions/offset_extensions.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/swipe_activity.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/swipe_animation_coordinator.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/swipe_position.dart';

const _maxAngle = 15.0;
const _threshold = 100.0;
const _duration = Duration(milliseconds: 200);

/// This implementation is inspired by and adapted from the appinio_swiper package
/// (https://github.com/appinioGmbH/flutter_packages/tree/main/packages/appinio_swiper) 
/// by Appinio GmbH, licensed under MIT. The core swipe mechanics, animation system, 
/// and controller pattern have been modified and simplified for this specific use case.
class DeclutterSwipeStack extends StatefulWidget {
  final IndexedWidgetBuilder cardBuilder;
  final int cardCount;
  final DeclutterSwipeController? controller;
  final void Function(SwipeActivity activity)? onSwipedLeft;
  final void Function(SwipeActivity activity)? onSwipedUp;
  final void Function(SwipeActivity activity)? onSwipedRight;
  final void Function(SwipePosition position)? onCardPositionChanged;
  final void Function(SwipeActivity activity)? onUnSwipe;
  final void Function(SwipeActivity activity)? onSwipeCancelled;

  const DeclutterSwipeStack({
    super.key,
    required this.cardBuilder,
    required this.cardCount,
    this.controller,
    this.onSwipedLeft,
    this.onSwipedUp,
    this.onSwipedRight,
    this.onCardPositionChanged,
    this.onUnSwipe,
    this.onSwipeCancelled,
  });

  @override
  State createState() => _DeclutterSwipeStackState();
}

class _DeclutterSwipeStackState extends State<DeclutterSwipeStack> with TickerProviderStateMixin {
  late final SwipeAnimationCoordinator _animationCoordinator;
  late final SwipePosition _position;

  @override
  void initState() {
    super.initState();
    _animationCoordinator = SwipeAnimationCoordinator();
    // * cardSize will be updated in didChangeDependencies
    _position = SwipePosition(
      cardSize: Size.zero,
      cardCount: widget.cardCount,
      threshold: _threshold,
      maxAngleRadians: _maxAngle,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller?._attach(this);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _position.cardSize = MediaQuery.sizeOf(context);
  }

  @override
  void dispose() {
    widget.controller?._detach();
    _animationCoordinator.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DeclutterSwipeStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cardCount != widget.cardCount) {
      _position.updateFromWidgetState(widget);
    }
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._detach();
      widget.controller?._attach(this);
    }
  }

  AnimationController _createAnimation() {
    return AnimationController(vsync: this, duration: _duration);
  }

  Future<void> _onSwipe(AxisDirection direction) async {
    final swipe = Swipe(
      _createAnimation(),
      begin: _position.offset,
      end: _directionToTarget(direction),
    );
    await _executeActivity(swipe);
  }

  Future<void> _onUnswipe() async {
    if (!_animationCoordinator.canUnswipe) return;

    final lastSwipe = _animationCoordinator.getLastSwipe()!;
    final unswipe = Unswipe(
      _createAnimation(),
      begin: _directionToTarget(lastSwipe.direction),
    );
    await _executeActivity(unswipe);
    widget.onUnSwipe?.call(unswipe);
  }

  Future<void> _onSwipeCancelled() async {
    final cancelSwipe = CancelSwipe(
      _createAnimation(),
      begin: _position.offset,
    );
    await _executeActivity(cancelSwipe);
    widget.onSwipeCancelled?.call(cancelSwipe);
  }

  Future<void> _executeActivity(SwipeActivity activity) async {
    final previousIndex = _position.index;

    final targetIndex = switch (activity) {
      Swipe() => _position.baseIndex + 1,
      Unswipe() => _position.baseIndex - 1,
      CancelSwipe() => _position.baseIndex,
    };

    activity.animation.addListener(() {
      _position.offset = activity.currentOffset;
      widget.onCardPositionChanged?.call(_position);
      setState(() {});
    });

    final wasCancelled = await _animationCoordinator.runActivity(activity);

    _position.rotationPosition = null;
    _position.baseIndex = targetIndex;
    if (!wasCancelled) {
      _position.offset = Offset.zero;
    }

    if (previousIndex != targetIndex) {
      _notifySwipeCompletion(activity);
    }
    widget.onCardPositionChanged?.call(_position);
    setState(() {});
  }

  void _notifySwipeCompletion(SwipeActivity activity) {
    switch (activity.direction) {
      case AxisDirection.left:
        widget.onSwipedLeft?.call(activity);
      case AxisDirection.up:
        widget.onSwipedUp?.call(activity);
      case AxisDirection.right:
        widget.onSwipedRight?.call(activity);
      case AxisDirection.down:
        break;
    }
  }

  Offset _directionToTarget(AxisDirection direction) {
    final size = MediaQuery.sizeOf(context);
    return switch (direction) {
      AxisDirection.up => Offset(0, -size.height),
      AxisDirection.down => Offset(0, size.height),
      AxisDirection.left => Offset(-size.width, 0),
      AxisDirection.right => Offset(size.width, 0),
    };
  }

  Future<void> _onPanEnd() async {
    if (_position.offsetRelativeToThreshold.dx.abs() < 1 &&
        _position.offsetRelativeToThreshold.dy.abs() < 1) {
      return _onSwipeCancelled();
    }
    await _onSwipe(_position.offset.toAxisDirection());
  }

  @override
  Widget build(BuildContext context) {
    final int foregroundIndex =
        _animationCoordinator.canUnswipe && _animationCoordinator.currentActivity is Unswipe
            ? (_position.index + widget.cardCount - 1) % widget.cardCount
            : _position.index;
    final int backgroundIndex = foregroundIndex + 1;

    final double progress = max(
      _position.offsetRelativeToSize.dx.abs(),
      _position.offsetRelativeToSize.dy.abs(),
    ).clamp(0, 1);

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        // * Background card
        if (backgroundIndex < widget.cardCount)
          Transform.scale(
            scale: 0.95 + (0.05 * progress),
            child: Opacity(
              opacity: 0.5 + (0.5 * progress),
              child: widget.cardBuilder(context, backgroundIndex),
            ),
          ),
        // * Foreground card
        if (foregroundIndex < widget.cardCount)
          Transform.translate(
            offset: _position.offset,
            child: GestureDetector(
              child: Transform.rotate(
                angle: _position.angleRadians,
                alignment: _position.rotationAlignment ?? Alignment.bottomCenter,
                child: widget.cardBuilder(context, foregroundIndex),
              ),
              onPanStart: (tapInfo) {
                _position.rotationPosition = tapInfo.localPosition;
              },
              onPanUpdate: (tapInfo) {
                setState(() {
                  final newOffset = _position.offset + tapInfo.delta;
                  final double dx = newOffset.dx;
                  final double dy = min(newOffset.dy, 0.0);
                  _position.offset = Offset(dx, dy);
                  widget.onCardPositionChanged?.call(_position);
                });
              },
              onPanEnd: (tapInfo) => _onPanEnd(),
            ),
          ),
      ],
    );
  }
}

class DeclutterSwipeController extends ChangeNotifier {
  _DeclutterSwipeStackState? _attachedSwiper;

  SwipePosition? get position => _attachedSwiper?._position;

  int? get cardIndex => position?.index;

  bool get canUnswipe => _attachedSwiper?._animationCoordinator.canUnswipe ?? false;

  Future<void> swipeLeft() async {
    _assertIsAttached();
    await _attachedSwiper!._onSwipe(AxisDirection.left);
    notifyListeners();
  }

  Future<void> swipeRight() async {
    _assertIsAttached();
    await _attachedSwiper!._onSwipe(AxisDirection.right);
    notifyListeners();
  }

  Future<void> swipeUp() async {
    _assertIsAttached();
    await _attachedSwiper!._onSwipe(AxisDirection.up);
    notifyListeners();
  }

  Future<void> unswipe() async {
    _assertIsAttached();
    await _attachedSwiper!._onUnswipe();
    notifyListeners();
  }

  void _attach(_DeclutterSwipeStackState swiper) {
    assert(
      _attachedSwiper == null,
      "Controller can only be attached to one swiper widget at a time.",
    );
    _attachedSwiper = swiper;
    swiper._position.addListener(notifyListeners);
  }

  void _detach() {
    _attachedSwiper?._position.removeListener(notifyListeners);
    _attachedSwiper = null;
  }

  void _assertIsAttached() {
    assert(_attachedSwiper != null, "Controller must be attached.");
  }
}
