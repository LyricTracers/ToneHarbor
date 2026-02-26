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
  String get error_account_info_invalid => 'User information is invalid';
}
