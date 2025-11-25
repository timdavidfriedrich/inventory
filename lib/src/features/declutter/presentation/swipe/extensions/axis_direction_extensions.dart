import 'package:flutter/material.dart';

extension AxisDirectionExtensions on AxisDirection {
  bool get isVertical => this == AxisDirection.up || this == AxisDirection.down;

  bool get isHorizontal => !isVertical;

  AxisDirection get opposite => switch (this) {
        AxisDirection.up => AxisDirection.down,
        AxisDirection.down => AxisDirection.up,
        AxisDirection.left => AxisDirection.right,
        AxisDirection.right => AxisDirection.left,
      };
}
