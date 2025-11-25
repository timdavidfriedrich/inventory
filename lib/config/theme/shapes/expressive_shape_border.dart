import 'package:flutter/material.dart';

typedef OriginalPathBuilder = Path Function();

class ExpressiveShapeBorder extends OutlinedBorder {
  final OriginalPathBuilder pathBuilder;

  final Rect viewBox;

  late final Path _originalPath;

  ExpressiveShapeBorder({
    required this.pathBuilder,
    required this.viewBox,
    super.side,
  }) {
    _originalPath = pathBuilder();
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final matrix = _createTransformMatrix(viewBox, rect);
    return _originalPath.transform(matrix.storage);
  }

  Matrix4 _createTransformMatrix(Rect src, Rect dst) {
    final scaleX = dst.width / src.width;
    final scaleY = dst.height / src.height;

    final translateX = dst.left - (src.left * scaleX);
    final translateY = dst.top - (src.top * scaleY);

    return Matrix4.identity()
      ..translate(translateX, translateY)
      ..scale(scaleX, scaleY);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // For clipping
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpressiveShapeBorder &&
          runtimeType == other.runtimeType &&
          pathBuilder == other.pathBuilder &&
          viewBox == other.viewBox;

  @override
  int get hashCode => pathBuilder.hashCode ^ viewBox.hashCode;

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return ExpressiveShapeBorder(
      pathBuilder: pathBuilder,
      viewBox: viewBox,
      side: side ?? this.side,
    );
  }
}
