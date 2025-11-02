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
  String get common_add => 'Add';

  @override
  String get common_archive => 'Archive';

  @override
  String get common_archive_confirm =>
      'Are you sure you want to archive this item?';

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_error => 'An error occurred.\nPlease try again later.';

  @override
  String get common_save => 'Save';

  @override
  String get details_add_tag => 'Add tag';

  @override
  String get details_location => 'Location';

  @override
  String get details_name => 'Name';

  @override
  String get details_name_hint => 'Item';

  @override
  String get details_notes => 'Notes';

  @override
  String get details_notes_hint => 'Add some important information…';

  @override
  String get details_tags => 'Tags';

  @override
  String get error_common => 'An error occurred.';

  @override
  String get error_camera_picture => 'Unable to take a picture.';

  @override
  String get screen_archive => 'Archive';

  @override
  String get screen_declutter => 'Declutter';

  @override
  String get screen_details => 'Item details';

  @override
  String get screen_overview => 'Inventory';

  @override
  String get screen_scan => 'Capture a new item';

  @override
  String get screen_settings => 'Settings';

  @override
  String get screen_tasks => 'Tasks';

  @override
  String get scan_failed_message =>
      'Failed to analyze image. AI suggestions are unavailable.';
}
