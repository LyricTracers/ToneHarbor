import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ToneHarbor'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your music, all in harbor.'**
  String get appSubtitle;

  /// No description provided for @serverUrl.
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get serverUrl;

  /// No description provided for @error_serverUrl.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid server address (e.g., 192.168.1.100:5000)'**
  String get error_serverUrl;

  /// No description provided for @error_username.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get error_username;

  /// No description provided for @error_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get error_password;

  /// No description provided for @error_invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid server address format'**
  String get error_invalidUrl;

  /// No description provided for @error_login_failed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get error_login_failed;

  /// No description provided for @error_search_failed.
  ///
  /// In en, this message translates to:
  /// **'search %s failed'**
  String get error_search_failed;

  /// No description provided for @error_token_refresh_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to refresh token'**
  String get error_token_refresh_failed;

  /// No description provided for @error_account_info_invalid.
  ///
  /// In en, this message translates to:
  /// **'User information is invalid'**
  String get error_account_info_invalid;

  /// No description provided for @error_syno_login_400.
  ///
  /// In en, this message translates to:
  /// **'No such account or incorrect password'**
  String get error_syno_login_400;

  /// No description provided for @error_syno_login_401.
  ///
  /// In en, this message translates to:
  /// **'Account disabled'**
  String get error_syno_login_401;

  /// No description provided for @error_syno_login_402.
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get error_syno_login_402;

  /// No description provided for @error_syno_login_403.
  ///
  /// In en, this message translates to:
  /// **'2-factor authentication code required'**
  String get error_syno_login_403;

  /// No description provided for @error_syno_login_404.
  ///
  /// In en, this message translates to:
  /// **'Failed to authenticate 2-factor authentication code'**
  String get error_syno_login_404;

  /// No description provided for @error_syno_login_406.
  ///
  /// In en, this message translates to:
  /// **'Enforce to authenticate with 2-factor authentication code'**
  String get error_syno_login_406;

  /// No description provided for @error_syno_login_407.
  ///
  /// In en, this message translates to:
  /// **'Blocked IP source'**
  String get error_syno_login_407;

  /// No description provided for @error_syno_login_408.
  ///
  /// In en, this message translates to:
  /// **'Expired password cannot change'**
  String get error_syno_login_408;

  /// No description provided for @error_syno_login_409.
  ///
  /// In en, this message translates to:
  /// **'Password expired'**
  String get error_syno_login_409;

  /// No description provided for @error_syno_login_410.
  ///
  /// In en, this message translates to:
  /// **'Password must be changed'**
  String get error_syno_login_410;

  /// No description provided for @error_getArtists_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the list of artists'**
  String get error_getArtists_failed;

  /// No description provided for @error_getAlbums_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the list of albums'**
  String get error_getAlbums_failed;

  /// No description provided for @error_getFolders_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the list of folders'**
  String get error_getFolders_failed;

  /// No description provided for @error_getServerInfo_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get server information'**
  String get error_getServerInfo_failed;

  /// No description provided for @error_getDSMInfo_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get DSM information'**
  String get error_getDSMInfo_failed;

  /// No description provided for @error_syno_request_100.
  ///
  /// In en, this message translates to:
  /// **'Unknown error.'**
  String get error_syno_request_100;

  /// No description provided for @error_syno_request_101.
  ///
  /// In en, this message translates to:
  /// **'No parameter of API, method or version.'**
  String get error_syno_request_101;

  /// No description provided for @error_syno_request_102.
  ///
  /// In en, this message translates to:
  /// **'The requested API does not exist.'**
  String get error_syno_request_102;

  /// No description provided for @error_syno_request_103.
  ///
  /// In en, this message translates to:
  /// **'The requested method does not exist.'**
  String get error_syno_request_103;

  /// No description provided for @error_syno_request_104.
  ///
  /// In en, this message translates to:
  /// **'The requested version does not support the functionality.'**
  String get error_syno_request_104;

  /// No description provided for @error_syno_request_105.
  ///
  /// In en, this message translates to:
  /// **'The logged in session does not have permission.'**
  String get error_syno_request_105;

  /// No description provided for @error_syno_request_106.
  ///
  /// In en, this message translates to:
  /// **'Session timeout.'**
  String get error_syno_request_106;

  /// No description provided for @error_syno_request_107.
  ///
  /// In en, this message translates to:
  /// **'Session interrupted by duplicated login.'**
  String get error_syno_request_107;

  /// No description provided for @error_syno_request_114.
  ///
  /// In en, this message translates to:
  /// **'Lost parameters for this API'**
  String get error_syno_request_114;

  /// No description provided for @error_syno_request_150.
  ///
  /// In en, this message translates to:
  /// **'Request source IP does not match the login IP.'**
  String get error_syno_request_150;

  /// No description provided for @error_network_error.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get error_network_error;

  /// No description provided for @error_response_parse_failed.
  ///
  /// In en, this message translates to:
  /// **'Response Parsing failed'**
  String get error_response_parse_failed;

  /// No description provided for @useHttps.
  ///
  /// In en, this message translates to:
  /// **'Use HTTPS'**
  String get useHttps;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get signIn;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'「Please wait a moment」'**
  String get loading;

  /// No description provided for @has_copy.
  ///
  /// In en, this message translates to:
  /// **'Copied:'**
  String get has_copy;
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
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
