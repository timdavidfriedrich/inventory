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

  static final ShapeBorder bun = ExpressiveShapeBorder(
    pathBuilder: _buildBunPath,
    viewBox: const Rect.fromLTWH(0, 0, 302.25, 312),
  );

  static Path _buildBunPath() {
    final path = Path();
    path.moveTo(0, 79.3221);
    path.cubicTo(0, 35.5137, 35.5137, 0, 79.3221, 0);
    path.lineTo(222.928, 0);
    path.cubicTo(266.736, 0, 302.25, 35.5137, 302.25, 79.3221);
    path.cubicTo(302.25, 115.45, 278.097, 145.937, 245.057, 155.516);
    path.cubicTo(244.842, 155.579, 244.692, 155.776, 244.692, 156);
    path.cubicTo(244.692, 156.224, 244.842, 156.421, 245.057, 156.484);
    path.cubicTo(278.097, 166.063, 302.25, 196.55, 302.25, 232.678);
    path.cubicTo(302.25, 276.486, 266.736, 312, 222.928, 312);
    path.lineTo(79.3221, 312);
    path.cubicTo(35.5137, 312, 0, 276.486, 0, 232.678);
    path.cubicTo(0, 196.785, 23.8388, 166.461, 56.547, 156.674);
    path.cubicTo(56.845, 156.585, 57.0514, 156.311, 57.0514, 156);
    path.cubicTo(57.0514, 155.689, 56.845, 155.415, 56.547, 155.326);
    path.cubicTo(23.8388, 145.539, 0, 115.214, 0, 79.3221);
    path.close();
    return path;
  }

  static final ShapeBorder eightLeafClover = ExpressiveShapeBorder(
    pathBuilder: _buildEightLeafCloverPath,
    viewBox: const Rect.fromLTWH(0, 0, 320, 320),
  );

  static Path _buildEightLeafCloverPath() {
    final path = Path();
    path.moveTo(308.584, 159.998);
    path.cubicTo(334.427, 208.164, 314.902, 251.771, 265.066, 265.061);
    path.cubicTo(251.771, 314.902, 208.164, 334.422, 159.998, 308.584);
    path.cubicTo(111.831, 334.427, 68.2245, 314.902, 54.9337, 265.066);
    path.cubicTo(5.09812, 251.771, -14.427, 208.164, 11.4157, 159.998);
    path.cubicTo(-14.427, 111.831, 5.09812, 68.2245, 54.9337, 54.9337);
    path.cubicTo(68.2245, 5.09812, 111.831, -14.427, 159.998, 11.4157);
    path.cubicTo(208.164, -14.427, 251.771, 5.09812, 265.061, 54.9337);
    path.cubicTo(314.902, 68.2245, 334.422, 111.831, 308.584, 159.998);
    path.close();
    return path;
  }

  static final ShapeBorder fourSidedCookie = ExpressiveShapeBorder(
    pathBuilder: _buildFourSidedCookiePath,
    viewBox: const Rect.fromLTWH(0, 0, 292, 292),
  );

  static Path _buildFourSidedCookiePath() {
    final path = Path();
    path.moveTo(186.389, 6.47298);
    path.cubicTo(249.109, -20.7672, 312.767, 42.8908, 285.527, 105.611);
    path.lineTo(281.023, 115.981);
    path.cubicTo(272.707, 135.13, 272.707, 156.87, 281.023, 176.019);
    path.lineTo(285.527, 186.389);
    path.cubicTo(312.767, 249.109, 249.109, 312.767, 186.389, 285.527);
    path.lineTo(176.019, 281.023);
    path.cubicTo(156.87, 272.707, 135.13, 272.707, 115.981, 281.023);
    path.lineTo(105.611, 285.527);
    path.cubicTo(42.8908, 312.767, -20.7672, 249.109, 6.47299, 186.389);
    path.lineTo(10.9768, 176.019);
    path.cubicTo(19.2934, 156.87, 19.2934, 135.13, 10.9768, 115.981);
    path.lineTo(6.47298, 105.611);
    path.cubicTo(-20.7672, 42.8908, 42.8908, -20.7672, 105.611, 6.47299);
    path.lineTo(115.981, 10.9768);
    path.cubicTo(135.13, 19.2934, 156.87, 19.2934, 176.019, 10.9768);
    path.lineTo(186.389, 6.47298);
    path.close();
    return path;
  }

  static final ShapeBorder gem = ExpressiveShapeBorder(
    pathBuilder: _buildGemPath,
    viewBox: const Rect.fromLTWH(0, 0, 292, 303),
  );

  static Path _buildGemPath() {
    final path = Path();
    path.moveTo(89.4155, 25.7498);
    path.cubicTo(106.981, 12.991, 115.763, 6.61156, 125.124, 3.44021);
    path.cubicTo(138.663, -1.14674, 153.337, -1.14674, 166.876, 3.44021);
    path.cubicTo(176.237, 6.61156, 185.019, 12.991, 202.585, 25.7498);
    path.lineTo(242.083, 54.4402);
    path.cubicTo(252.514, 62.017, 257.729, 65.8054, 261.981, 70.3534);
    path.cubicTo(268.125, 76.9261, 272.839, 84.702, 275.823, 93.1893);
    path.cubicTo(277.888, 99.062, 278.834, 105.438, 280.725, 118.189);
    path.lineTo(288.038, 167.501);
    path.cubicTo(291.355, 189.87, 293.014, 201.055, 291.34, 211.136);
    path.cubicTo(288.918, 225.718, 281.6, 239.04, 270.59, 248.907);
    path.cubicTo(262.979, 255.728, 252.649, 260.329, 231.987, 269.532);
    path.lineTo(185.176, 290.382);
    path.cubicTo(172.707, 295.935, 166.473, 298.712, 160.064, 300.131);
    path.cubicTo(150.8, 302.182, 141.2, 302.182, 131.936, 300.131);
    path.cubicTo(125.527, 298.712, 119.293, 295.935, 106.824, 290.382);
    path.lineTo(60.0131, 269.532);
    path.cubicTo(39.3515, 260.329, 29.0207, 255.728, 21.4097, 248.907);
    path.cubicTo(10.4005, 239.04, 3.08192, 225.718, 0.660161, 211.136);
    path.cubicTo(-1.01406, 201.055, 0.644655, 189.87, 3.96208, 167.501);
    path.lineTo(11.2752, 118.189);
    path.cubicTo(13.1662, 105.437, 14.1117, 99.0619, 16.1768, 93.1892);
    path.cubicTo(19.1612, 84.702, 23.8747, 76.9261, 30.0191, 70.3534);
    path.cubicTo(34.2706, 65.8054, 39.4862, 62.017, 49.9172, 54.4402);
    path.lineTo(89.4155, 25.7498);
    path.close();
    return path;
  }

  static final ShapeBorder pentagon = ExpressiveShapeBorder(
    pathBuilder: _buildPentagonPath,
    viewBox: const Rect.fromLTWH(0, 0, 315, 306),
  );

  static Path _buildPentagonPath() {
    final path = Path();
    path.moveTo(122.064, 11.459);
    path.cubicTo(143.093, -3.81967, 171.569, -3.81965, 192.598, 11.459);
    path.lineTo(289.926, 82.1714);
    path.cubicTo(310.955, 97.45, 319.754, 124.532, 311.722, 149.253);
    path.lineTo(274.546, 263.668);
    path.cubicTo(266.514, 288.39, 243.476, 305.127, 217.483, 305.127);
    path.lineTo(97.1798, 305.127);
    path.cubicTo(71.1862, 305.127, 48.1489, 288.39, 40.1164, 263.668);
    path.lineTo(2.9407, 149.253);
    path.cubicTo(-5.09176, 124.532, 3.70774, 97.45, 24.737, 82.1714);
    path.lineTo(122.064, 11.459);
    path.close();
    return path;
  }

  static final ShapeBorder pill = ExpressiveShapeBorder(
    pathBuilder: _buildPillPath,
    viewBox: const Rect.fromLTWH(0, 0, 316, 316),
  );

  static Path _buildPillPath() {
    final path = Path();
    path.moveTo(84.1157, 39.7851);
    path.cubicTo(137.162, -13.2617, 223.168, -13.2617, 276.215, 39.7851);
    path.cubicTo(329.262, 92.8318, 329.262, 178.838, 276.215, 231.884);
    path.lineTo(231.884, 276.215);
    path.cubicTo(178.838, 329.262, 92.8318, 329.262, 39.7851, 276.215);
    path.cubicTo(-13.2617, 223.168, -13.2617, 137.162, 39.7851, 84.1157);
    path.lineTo(84.1157, 39.7851);
    path.close();
    return path;
  }

  static final ShapeBorder sixSidedCookie = ExpressiveShapeBorder(
    pathBuilder: _buildSixSidedCookiePath,
    viewBox: const Rect.fromLTWH(0, 0, 296, 316),
  );

  static Path _buildSixSidedCookiePath() {
    final path = Path();
    path.moveTo(92.1855, 22.5654);
    path.cubicTo(123.276, -7.52178, 172.724, -7.52178, 203.814, 22.5654);
    path.cubicTo(213.328, 31.7718, 224.984, 38.4811, 237.738, 42.0919);
    path.cubicTo(279.419, 53.8924, 304.142, 96.5858, 293.552, 138.473);
    path.cubicTo(290.312, 151.291, 290.312, 164.709, 293.552, 177.527);
    path.cubicTo(304.142, 219.414, 279.419, 262.108, 237.738, 273.908);
    path.cubicTo(224.984, 277.519, 213.328, 284.228, 203.814, 293.435);
    path.cubicTo(172.724, 323.522, 123.276, 323.522, 92.1855, 293.435);
    path.cubicTo(82.672, 284.228, 71.016, 277.519, 58.262, 273.908);
    path.cubicTo(16.5815, 262.108, -8.14224, 219.414, 2.44755, 177.527);
    path.cubicTo(5.68794, 164.709, 5.68794, 151.291, 2.44755, 138.473);
    path.cubicTo(-8.14224, 96.5858, 16.5815, 53.8924, 58.262, 42.0919);
    path.cubicTo(71.016, 38.4811, 82.672, 31.7718, 92.1855, 22.5654);
    path.close();
    return path;
  }

  static final ShapeBorder slanted = ExpressiveShapeBorder(
    pathBuilder: _buildSlantedPath,
    viewBox: const Rect.fromLTWH(0, 0, 320, 300),
  );

  static Path _buildSlantedPath() {
    final path = Path();
    path.moveTo(15.7147, 80.543);
    path.cubicTo(18.289, 55.9642, 19.5761, 43.6748, 24.3025, 33.9777);
    path.cubicTo(31.142, 19.9453, 43.0768, 9.11012, 57.6278, 3.72286);
    path.cubicTo(67.6833, 0, 79.9328, 0, 104.432, 0);
    path.lineTo(228.137, 0);
    path.cubicTo(257.764, 0, 272.578, 0, 283.887, 4.85392);
    path.cubicTo(300.261, 11.8819, 312.72, 25.8495, 317.927, 43.0153);
    path.cubicTo(321.523, 54.8709, 319.967, 69.733, 316.854, 99.457);
    path.lineTo(304.285, 219.457);
    path.cubicTo(301.711, 244.036, 300.424, 256.325, 295.697, 266.022);
    path.cubicTo(288.858, 280.055, 276.923, 290.89, 262.372, 296.277);
    path.cubicTo(252.317, 300, 240.067, 300, 215.568, 300);
    path.lineTo(91.8634, 300);
    path.cubicTo(62.2359, 300, 47.4221, 300, 36.1134, 295.146);
    path.cubicTo(19.7395, 288.118, 7.2802, 274.151, 2.07293, 256.985);
    path.cubicTo(-1.5235, 245.129, 0.0330968, 230.267, 3.14629, 200.543);
    path.lineTo(15.7147, 80.543);
    path.close();
    return path;
  }
}
