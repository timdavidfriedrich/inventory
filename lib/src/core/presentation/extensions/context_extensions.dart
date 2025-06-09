import 'package:flutter/material.dart';
import 'package:inventory/config/localization/app_localizations.dart';

extension ContextExtensions on BuildContext {
  bool get isIos => Theme.of(this).platform == TargetPlatform.iOS;

  AppLocalizations get s => AppLocalizations.of(this);
  ColorScheme get c => Theme.of(this).colorScheme;
  TextTheme get t => Theme.of(this).textTheme;
}
