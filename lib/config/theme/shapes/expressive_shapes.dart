import 'package:flutter/material.dart';
import 'package:inventory/config/theme/shapes/expressive_shape_border.dart';

class ExpressiveShapes {
  const ExpressiveShapes._();

  static final OutlinedBorder ghostish = ExpressiveShapeBorder(
    pathBuilder: _buildGhostPath,
    viewBox: const Rect.fromLTWH(0, 0, 300, 300),
  );

  static Path _buildGhostPath() {
    final path = Path();
    path.moveTo(0, 142.857);
    path.cubicTo(0, 63.9593, 67.1573, 0, 150, 0);
    path.cubicTo(232.843, 0, 300, 63.9593, 300, 142.857);
    path.lineTo(300, 242.857);
    path.cubicTo(300, 274.416, 273.137, 300, 240, 300);
    path.cubicTo(230.178, 300, 220.907, 297.752, 212.724, 293.768);
    path.cubicTo(208.554, 291.737, 204.394, 289.512, 200.216, 287.277);
    path.cubicTo(185.513, 279.411, 170.592, 271.429, 154.27, 271.429);
    path.lineTo(145.73, 271.429);
    path.cubicTo(129.408, 271.429, 114.487, 279.411, 99.7841, 287.277);
    path.cubicTo(95.6062, 289.512, 91.4459, 291.737, 87.276, 293.768);
    path.cubicTo(79.0926, 297.752, 69.8219, 300, 60, 300);
    path.cubicTo(26.8629, 300, 0, 274.416, 0, 242.857);
    path.lineTo(0, 142.857);
    path.close();
    return path;
  }

  static final ShapeBorder fourLeafClover = ExpressiveShapeBorder(
    pathBuilder: _buildFourLeafCloverPath,
    viewBox: const Rect.fromLTWH(0, 0, 296, 296),
  );

  static Path _buildFourLeafCloverPath() {
    final path = Path();
    path.moveTo(21.0014, 148);
    path.cubicTo(7.89536, 132.339, 0, 112.126, 0, 90.0596);
    path.cubicTo(0, 40.321, 40.1131, 0, 89.5951, 0);
    path.cubicTo(111.99, 0, 132.466, 8.2594, 148.173, 21.9131);
    path.cubicTo(163.843, 8.2594, 184.271, 0, 206.614, 0);
    path.cubicTo(255.981, 0, 296, 40.321, 296, 90.0596);
    path.cubicTo(296, 112.126, 288.123, 132.339, 275.048, 148);
    path.cubicTo(288.123, 163.661, 296, 183.874, 296, 205.94);
    path.cubicTo(296, 255.679, 255.981, 296, 206.614, 296);
    path.cubicTo(184.271, 296, 163.843, 287.741, 148.173, 274.087);
    path.cubicTo(132.466, 287.741, 111.99, 296, 89.5951, 296);
    path.cubicTo(40.1131, 296, 0, 255.679, 0, 205.94);
    path.cubicTo(0, 183.874, 7.89536, 163.661, 21.0014, 148);
    path.close();
    return path;
  }
}
