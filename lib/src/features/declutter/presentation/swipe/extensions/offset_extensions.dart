import 'package:flutter/material.dart';

extension OffsetExtensions on Offset {
  Alignment toAlignment(Size size) {
    return Alignment(
      2 * (dx / size.width) - 1,
      2 * (dy / size.height) - 1,
    );
  }

  AxisDirection toAxisDirection() {
    if (dx.abs() >= dy.abs()) {
      if (dx.isNegative) {
        return AxisDirection.left;
      }
      return AxisDirection.right;
    }
    if (dy.isNegative) {
      return AxisDirection.up;
    }
    return AxisDirection.down;
  }
}
