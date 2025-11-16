import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/extensions/offset_extensions.dart';
import 'package:inventory/src/features/declutter/presentation/swipe/widgets/declutter_swipe_stack/declutter_swipe_stack.dart';

class SwipePosition with ChangeNotifier {
  SwipePosition({
    required this.cardSize,
    required int cardCount,
    required double threshold,
    required double maxAngleRadians,
  })  : _cardCount = cardCount,
        _threshold = threshold,
        _maxAngle = maxAngleRadians;

  set offset(Offset newOffset) {
    _offset = newOffset;
    notifyListeners();
  }

  Offset get offset => _offset;

  double get angle {
    return (_maxAngle * (_offset.dx / cardSize.width)).clamp(-_maxAngle, _maxAngle);
  }

  double get angleRadians => angle * (pi / 180);

  double get progress => max(
        offsetRelativeToSize.dx.abs(),
        offsetRelativeToSize.dy.abs(),
      );

  int get index => baseIndex % _cardCount;

  Offset? rotationPosition;

  Alignment? get rotationAlignment => rotationPosition?.toAlignment(cardSize);

  Offset _offset = Offset.zero;
  Size cardSize;
  int _cardCount;
  double _threshold;
  double _maxAngle;
  int baseIndex = 0;

  Offset get offsetRelativeToSize => Offset(
        _offset.dx / cardSize.width,
        _offset.dy / cardSize.height,
      );

  Offset get offsetRelativeToThreshold => Offset(
        _offset.dx / _threshold,
        _offset.dy / _threshold,
      );

  void updateFromWidgetState(DeclutterSwipeStack widget) {
    _cardCount = widget.cardCount;
    notifyListeners();
  }
}
