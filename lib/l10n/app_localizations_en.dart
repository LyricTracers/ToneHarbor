// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ToneHarbor';

  @override
  String get appSubtitle => 'Your music, all in harbor.';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get error_serverUrl =>
      'Please enter a valid server address (e.g., 192.168.1.100:5000)';

  @override
  String get error_username => 'Please enter your username';

  @override
  String get error_password => 'Please enter your password';

  @override
  String get error_invalidUrl => 'Invalid server address format';

  @override
  String get error_login_failed => 'Login failed';

  @override
  String get error_token_refresh_failed => 'Failed to refresh token';

  @override
  String get error_account_info_invalid => 'User information is invalid';

  @override
  String get error_syno_login_400 => 'No such account or incorrect password';

  @override
  String get error_syno_login_401 => 'Account disabled';

  @override
  String get error_syno_login_402 => 'Permission denied';

  @override
  String get error_syno_login_403 => '2-factor authentication code required';

  @override
  String get error_syno_login_404 =>
      'Failed to authenticate 2-factor authentication code';

  @override
  String get error_syno_login_406 =>
      'Enforce to authenticate with 2-factor authentication code';

  @override
  String get error_syno_login_407 => 'Blocked IP source';

  @override
  String get error_syno_login_408 => 'Expired password cannot change';

  @override
  String get error_syno_login_409 => 'Password expired';

  @override
  String get error_syno_login_410 => 'Password must be changed';

  @override
  String get useHttps => 'Use HTTPS';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Login';

  @override
  String get loading => '「Please wait a moment」';

  @override
  String get has_copy => 'Copied:';
}
