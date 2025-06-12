// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Home Inventory';

  @override
  String get error_general => 'An error occurred.\nPlease try again later.';

  @override
  String get cancel => 'Cancel';

  @override
  String get screen_overview => 'Inventory';

  @override
  String get screen_declutter => 'Declutter';

  @override
  String get screen_tasks => 'Tasks';

  @override
  String get screen_archive => 'Archive';

  @override
  String get screen_settings => 'Settings';

  @override
  String get screen_scan => 'Capture a new item';

  @override
  String get screen_details => 'Item details';
}
