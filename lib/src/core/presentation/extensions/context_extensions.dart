import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get isIos => Theme.of(this).platform == TargetPlatform.iOS;
}
