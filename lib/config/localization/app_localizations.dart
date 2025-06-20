import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Home Inventory'**
  String get appTitle;

  /// No description provided for @common_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred.\nPlease try again later.'**
  String get common_error;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get common_archive;

  /// No description provided for @common_archive_confirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to archive this item?'**
  String get common_archive_confirm;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get common_add;

  /// No description provided for @screen_overview.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get screen_overview;

  /// No description provided for @screen_declutter.
  ///
  /// In en, this message translates to:
  /// **'Declutter'**
  String get screen_declutter;

  /// No description provided for @screen_tasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get screen_tasks;

  /// No description provided for @screen_archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get screen_archive;

  /// No description provided for @screen_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get screen_settings;

  /// No description provided for @screen_scan.
  ///
  /// In en, this message translates to:
  /// **'Capture a new item'**
  String get screen_scan;

  /// No description provided for @screen_details.
  ///
  /// In en, this message translates to:
  /// **'Item details'**
  String get screen_details;

  /// No description provided for @details_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get details_name;

  /// No description provided for @details_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get details_name_hint;

  /// No description provided for @details_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get details_notes;

  /// No description provided for @details_notes_hint.
  ///
  /// In en, this message translates to:
  /// **'Add some important information…'**
  String get details_notes_hint;

  /// No description provided for @details_tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get details_tags;

  /// No description provided for @details_add_tag.
  ///
  /// In en, this message translates to:
  /// **'Add tag'**
  String get details_add_tag;

  /// No description provided for @details_location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get details_location;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
