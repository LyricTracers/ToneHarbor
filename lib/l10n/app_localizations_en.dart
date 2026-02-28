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
  String get error_search_failed => 'search %s failed';

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
  String get error_getArtists_failed => 'Failed to get the list of artists';

  @override
  String get error_getAlbums_failed => 'Failed to get the list of albums';

  @override
  String get error_getFolders_failed => 'Failed to get the list of folders';

  @override
  String get error_getSongs_failed => 'Failed to get the list of songs';

  @override
  String get error_getAlbumSongs_failed =>
      'Failed to get the list of album songs';

  @override
  String get error_getLyrics_failed => 'Failed to get lyrics';

  @override
  String get error_searchLyrics_failed => 'Failed to search lyrics';

  @override
  String get error_getSongInfo_failed => 'Failed to get song information';

  @override
  String get error_setRating_failed => 'Failed to set rating';

  @override
  String get error_getNumberOfPlugIns_failed =>
      'Failed to get the number of plugins';

  @override
  String get error_getServerInfo_failed => 'Failed to get server information';

  @override
  String get error_getDSMInfo_failed => 'Failed to get DSM information';

  @override
  String get error_getPlaylists_failed => 'Failed to get playlists';

  @override
  String get error_getPlaylistDetail_failed => 'Failed to get playlist detail';

  @override
  String get error_getPlaylistInfo_failed => 'Failed to get playlist info';

  @override
  String get error_createPlaylist_failed => 'Failed to create playlist';

  @override
  String get error_renamePlaylist_failed => 'Failed to rename playlist';

  @override
  String get error_deletePlaylist_failed => 'Failed to delete playlist';

  @override
  String get error_addSongToPlaylist_failed => 'Failed to add song to playlist';

  @override
  String get error_removeMissingSongs_failed =>
      'Failed to remove missing songs';

  @override
  String get error_getStreamUrl_failed => 'Failed to get stream URL';

  @override
  String get error_getCoverUrl_failed => 'Failed to get cover URL';

  @override
  String get error_downloadSong_failed => 'Failed to download song';

  @override
  String get error_downloadCover_failed => 'Failed to download cover';

  @override
  String get error_batchDownload_failed => 'Failed to batch download';

  @override
  String get error_extractZip_failed => 'Failed to extract ZIP file';

  @override
  String get error_invalidCookie => 'Valid cookie not found';

  @override
  String get error_syno_request_100 => 'Unknown error.';

  @override
  String get error_syno_request_101 =>
      'No parameter of API, method or version.';

  @override
  String get error_syno_request_102 => 'The requested API does not exist.';

  @override
  String get error_syno_request_103 => 'The requested method does not exist.';

  @override
  String get error_syno_request_104 =>
      'The requested version does not support the functionality.';

  @override
  String get error_syno_request_105 =>
      'The logged in session does not have permission.';

  @override
  String get error_syno_request_106 => 'Session timeout.';

  @override
  String get error_syno_request_107 =>
      'Session interrupted by duplicated login.';

  @override
  String get error_syno_request_114 => 'Lost parameters for this API';

  @override
  String get error_syno_request_150 =>
      'Request source IP does not match the login IP.';

  @override
  String get error_network_error => 'Network Error';

  @override
  String get error_response_parse_failed => 'Response Parsing failed';

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
