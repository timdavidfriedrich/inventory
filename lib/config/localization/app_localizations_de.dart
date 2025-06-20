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
  String get common_error =>
      'Ein Fehler ist aufgetreten.\nBitte versuche es später erneut.';

  @override
  String get common_cancel => 'Abbrechen';

  @override
  String get common_delete => 'Löschen';

  @override
  String get common_delete_confirm =>
      'Bist du sicher, dass du dieses Objekt löschen möchtest?';

  @override
  String get common_save => 'Speichern';

  @override
  String get common_add => 'Hinzufügen';

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

  @override
  String get details_name => 'Name';

  @override
  String get details_name_hint => 'Objekt';

  @override
  String get details_notes => 'Notizen';

  @override
  String get details_notes_hint => 'Ergänze wichtige Informationen…';

  @override
  String get details_tags => 'Kategorien';

  @override
  String get details_add_tag => 'Kategorie hinzufügen';

  @override
  String get details_location => 'Standort';
}
