// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Home Inventory';

  @override
  String get error_general =>
      'Ein Fehler ist aufgetreten.\nBitte versuche es später erneut.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get screen_overview => 'Inventar';

  @override
  String get screen_declutter => 'Ausmisten';

  @override
  String get screen_tasks => 'Aufgaben';

  @override
  String get screen_archive => 'Archiv';

  @override
  String get screen_settings => 'Einstellungen';

  @override
  String get screen_scan => 'Scanne ein Objekt';

  @override
  String get screen_details => 'Objekt-Details';
}
