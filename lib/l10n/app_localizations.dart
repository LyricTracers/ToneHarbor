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

  /// No description provided for @error_getSongs_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the list of songs'**
  String get error_getSongs_failed;

  /// No description provided for @error_getAlbumSongs_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the list of album songs'**
  String get error_getAlbumSongs_failed;

  /// No description provided for @error_getLyrics_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get lyrics'**
  String get error_getLyrics_failed;

  /// No description provided for @error_searchLyrics_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to search lyrics'**
  String get error_searchLyrics_failed;

  /// No description provided for @error_getSongInfo_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get song information'**
  String get error_getSongInfo_failed;

  /// No description provided for @error_setRating_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to set rating'**
  String get error_setRating_failed;

  /// No description provided for @error_getNumberOfPlugIns_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get the number of plugins'**
  String get error_getNumberOfPlugIns_failed;

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

  /// No description provided for @error_getPlaylists_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get playlists'**
  String get error_getPlaylists_failed;

  /// No description provided for @error_getPlaylistDetail_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get playlist detail'**
  String get error_getPlaylistDetail_failed;

  /// No description provided for @error_getPlaylistInfo_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get playlist info'**
  String get error_getPlaylistInfo_failed;

  /// No description provided for @error_createPlaylist_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create playlist'**
  String get error_createPlaylist_failed;

  /// No description provided for @error_renamePlaylist_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to rename playlist'**
  String get error_renamePlaylist_failed;

  /// No description provided for @error_deletePlaylist_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete playlist'**
  String get error_deletePlaylist_failed;

  /// No description provided for @error_addSongToPlaylist_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add song to playlist'**
  String get error_addSongToPlaylist_failed;

  /// No description provided for @error_removeMissingSongs_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove missing songs'**
  String get error_removeMissingSongs_failed;

  /// No description provided for @error_getStreamUrl_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get stream URL'**
  String get error_getStreamUrl_failed;

  /// No description provided for @error_getCoverUrl_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get cover URL'**
  String get error_getCoverUrl_failed;

  /// No description provided for @error_downloadSong_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to download song'**
  String get error_downloadSong_failed;

  /// No description provided for @error_downloadCover_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to download cover'**
  String get error_downloadCover_failed;

  /// No description provided for @error_batchDownload_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to batch download'**
  String get error_batchDownload_failed;

  /// No description provided for @error_extractZip_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to extract ZIP file'**
  String get error_extractZip_failed;

  /// No description provided for @error_invalidCookie.
  ///
  /// In en, this message translates to:
  /// **'Valid cookie not found'**
  String get error_invalidCookie;

  /// No description provided for @error_songListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Song list cannot be empty'**
  String get error_songListEmpty;

  /// No description provided for @error_authFailed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get error_authFailed;

  /// No description provided for @error_downloadFailedWithCode.
  ///
  /// In en, this message translates to:
  /// **'Download failed, status code: %s'**
  String get error_downloadFailedWithCode;

  /// No description provided for @error_downloadCoverFailedWithCode.
  ///
  /// In en, this message translates to:
  /// **'Failed to download cover, status code: %s'**
  String get error_downloadCoverFailedWithCode;

  /// No description provided for @error_batchDownloadFailedWithCode.
  ///
  /// In en, this message translates to:
  /// **'Batch download failed, status code: %s'**
  String get error_batchDownloadFailedWithCode;

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

  /// No description provided for @testConnection.
  ///
  /// In en, this message translates to:
  /// **'Test Connection'**
  String get testConnection;

  /// No description provided for @testConnectionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Connection test successful'**
  String get testConnectionSuccess;

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

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search songs, artists, albums...'**
  String get searchHint;

  /// No description provided for @searchHistoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get searchHistoryLabel;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearHistory;

  /// No description provided for @noSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'No search history'**
  String get noSearchHistory;

  /// No description provided for @searchingFor.
  ///
  /// In en, this message translates to:
  /// **'Searching:'**
  String get searchingFor;

  /// No description provided for @recommend.
  ///
  /// In en, this message translates to:
  /// **'Recommend'**
  String get recommend;

  /// No description provided for @daily_recommend.
  ///
  /// In en, this message translates to:
  /// **'Daily Recommend'**
  String get daily_recommend;

  /// No description provided for @recent_albums.
  ///
  /// In en, this message translates to:
  /// **'Recent Albums'**
  String get recent_albums;

  /// No description provided for @recommend_albums.
  ///
  /// In en, this message translates to:
  /// **'Recommend Albums'**
  String get recommend_albums;

  /// No description provided for @my_favorite.
  ///
  /// In en, this message translates to:
  /// **'My Favorite'**
  String get my_favorite;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'Load More'**
  String get more;

  /// No description provided for @setThemeBackground.
  ///
  /// In en, this message translates to:
  /// **'Set Theme Background'**
  String get setThemeBackground;

  /// No description provided for @setThemeBackgroundConfirm.
  ///
  /// In en, this message translates to:
  /// **'Set this cover as theme background?'**
  String get setThemeBackgroundConfirm;

  /// No description provided for @playlist_text.
  ///
  /// In en, this message translates to:
  /// **'Playlist(%s)'**
  String get playlist_text;

  /// No description provided for @no_lyric.
  ///
  /// In en, this message translates to:
  /// **'No lyrics available'**
  String get no_lyric;

  /// No description provided for @add_to_playlists.
  ///
  /// In en, this message translates to:
  /// **'Add to'**
  String get add_to_playlists;

  /// No description provided for @create_playlist.
  ///
  /// In en, this message translates to:
  /// **'Create playlist'**
  String get create_playlist;

  /// No description provided for @no_playlists.
  ///
  /// In en, this message translates to:
  /// **'No playlist'**
  String get no_playlists;

  /// No description provided for @playlists.
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlists;

  /// No description provided for @playlist_name.
  ///
  /// In en, this message translates to:
  /// **'Playlist Name'**
  String get playlist_name;

  /// No description provided for @input_playlist_name.
  ///
  /// In en, this message translates to:
  /// **'Input Playlist Name'**
  String get input_playlist_name;

  /// No description provided for @addsong_to_playlist_success.
  ///
  /// In en, this message translates to:
  /// **'Successfully added Songs to [%s playlist]'**
  String get addsong_to_playlist_success;

  /// No description provided for @switch_lyrics.
  ///
  /// In en, this message translates to:
  /// **'Switch Lyrics'**
  String get switch_lyrics;

  /// No description provided for @input_title_empty.
  ///
  /// In en, this message translates to:
  /// **'The current input title is empty'**
  String get input_title_empty;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @playing.
  ///
  /// In en, this message translates to:
  /// **'Playing'**
  String get playing;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @artist.
  ///
  /// In en, this message translates to:
  /// **'Artist'**
  String get artist;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'sort'**
  String get sort;

  /// No description provided for @albums.
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get albums;

  /// No description provided for @sort_name.
  ///
  /// In en, this message translates to:
  /// **'Order Of Title'**
  String get sort_name;

  /// No description provided for @sort_time.
  ///
  /// In en, this message translates to:
  /// **'Order Of Time'**
  String get sort_time;

  /// No description provided for @music_house.
  ///
  /// In en, this message translates to:
  /// **'Music Library'**
  String get music_house;

  /// No description provided for @all_music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get all_music;

  /// No description provided for @folder.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get folder;

  /// No description provided for @sort_artist_name.
  ///
  /// In en, this message translates to:
  /// **'Order Of Artist'**
  String get sort_artist_name;

  /// No description provided for @total_songs.
  ///
  /// In en, this message translates to:
  /// **'(Total %s)'**
  String get total_songs;

  /// No description provided for @total_artists.
  ///
  /// In en, this message translates to:
  /// **'(Total %s)'**
  String get total_artists;

  /// No description provided for @total_albums.
  ///
  /// In en, this message translates to:
  /// **'(Total %s)'**
  String get total_albums;

  /// No description provided for @input_song_title.
  ///
  /// In en, this message translates to:
  /// **'Enter song title'**
  String get input_song_title;

  /// No description provided for @input_song_artist.
  ///
  /// In en, this message translates to:
  /// **'Enter song artist'**
  String get input_song_artist;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @restore_default.
  ///
  /// In en, this message translates to:
  /// **'Restore Default'**
  String get restore_default;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @favorite_playlist.
  ///
  /// In en, this message translates to:
  /// **'Collect Playlists'**
  String get favorite_playlist;

  /// No description provided for @no_favorite_playlist.
  ///
  /// In en, this message translates to:
  /// **'Cancel Collection'**
  String get no_favorite_playlist;

  /// No description provided for @delete_playlist.
  ///
  /// In en, this message translates to:
  /// **'Delete Playlists'**
  String get delete_playlist;

  /// No description provided for @ask_delete_playlist.
  ///
  /// In en, this message translates to:
  /// **'Delete [%s] Playlist?'**
  String get ask_delete_playlist;

  /// No description provided for @song_playlist.
  ///
  /// In en, this message translates to:
  /// **'Song PlayList'**
  String get song_playlist;

  /// No description provided for @unknown_title.
  ///
  /// In en, this message translates to:
  /// **'Unknown Title'**
  String get unknown_title;

  /// No description provided for @unknown_artist.
  ///
  /// In en, this message translates to:
  /// **'Unknown Artist'**
  String get unknown_artist;

  /// No description provided for @unknown_source.
  ///
  /// In en, this message translates to:
  /// **'Unknown Source'**
  String get unknown_source;

  /// No description provided for @add_to.
  ///
  /// In en, this message translates to:
  /// **'Add To'**
  String get add_to;

  /// No description provided for @next_song.
  ///
  /// In en, this message translates to:
  /// **'Next Song'**
  String get next_song;

  /// No description provided for @play_queue.
  ///
  /// In en, this message translates to:
  /// **'Play Queue'**
  String get play_queue;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @no_selected_songs.
  ///
  /// In en, this message translates to:
  /// **'No songs selected'**
  String get no_selected_songs;

  /// No description provided for @favorite_limit_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Favorite limit exceeded (max 100 songs)'**
  String get favorite_limit_exceeded;

  /// No description provided for @cancel_favorite_limit_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Cancel favorite limit exceeded (max 100 songs)'**
  String get cancel_favorite_limit_exceeded;

  /// No description provided for @queue_limit_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Queue limit exceeded (max 1000 songs)'**
  String get queue_limit_exceeded;

  /// No description provided for @selected_count.
  ///
  /// In en, this message translates to:
  /// **'Selected %s songs'**
  String get selected_count;

  /// No description provided for @selected_download_count.
  ///
  /// In en, this message translates to:
  /// **'Selected Count Of %s'**
  String get selected_download_count;

  /// No description provided for @select_all.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get select_all;

  /// No description provided for @tip_pre_song.
  ///
  /// In en, this message translates to:
  /// **'Already at the first song. Enable loop playback.'**
  String get tip_pre_song;

  /// No description provided for @tip_next_song.
  ///
  /// In en, this message translates to:
  /// **'Already at the last song. Enable loop playback.'**
  String get tip_next_song;

  /// No description provided for @save_success.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully'**
  String get save_success;

  /// No description provided for @download_center.
  ///
  /// In en, this message translates to:
  /// **'Download Center'**
  String get download_center;

  /// No description provided for @local_songs.
  ///
  /// In en, this message translates to:
  /// **'Local Songs'**
  String get local_songs;

  /// No description provided for @select_quality.
  ///
  /// In en, this message translates to:
  /// **'Select Quality'**
  String get select_quality;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @normal_download.
  ///
  /// In en, this message translates to:
  /// **'Normal Download'**
  String get normal_download;

  /// No description provided for @preload.
  ///
  /// In en, this message translates to:
  /// **'Preload'**
  String get preload;

  /// No description provided for @no_download_tasks.
  ///
  /// In en, this message translates to:
  /// **'No download tasks'**
  String get no_download_tasks;

  /// No description provided for @no_download_history.
  ///
  /// In en, this message translates to:
  /// **'No download history'**
  String get no_download_history;

  /// No description provided for @status_queued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get status_queued;

  /// No description provided for @status_downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get status_downloading;

  /// No description provided for @status_paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get status_paused;

  /// No description provided for @status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get status_completed;

  /// No description provided for @status_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get status_failed;

  /// No description provided for @status_canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get status_canceled;

  /// No description provided for @cancel_download.
  ///
  /// In en, this message translates to:
  /// **'Cancel Download'**
  String get cancel_download;

  /// No description provided for @pause_download.
  ///
  /// In en, this message translates to:
  /// **'Pause Download'**
  String get pause_download;

  /// No description provided for @resume_download.
  ///
  /// In en, this message translates to:
  /// **'Resume Download'**
  String get resume_download;

  /// No description provided for @delete_download_history.
  ///
  /// In en, this message translates to:
  /// **'Delete Download History'**
  String get delete_download_history;

  /// No description provided for @delete_current_history.
  ///
  /// In en, this message translates to:
  /// **'Delete Current History'**
  String get delete_current_history;

  /// No description provided for @redownload.
  ///
  /// In en, this message translates to:
  /// **'Redownload'**
  String get redownload;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @most_play.
  ///
  /// In en, this message translates to:
  /// **'Most Played'**
  String get most_play;

  /// No description provided for @play_current_song.
  ///
  /// In en, this message translates to:
  /// **'Play Current Song'**
  String get play_current_song;

  /// No description provided for @local_file_not_found.
  ///
  /// In en, this message translates to:
  /// **'Local file not found for %s'**
  String get local_file_not_found;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @deviceInfo.
  ///
  /// In en, this message translates to:
  /// **'Device Info'**
  String get deviceInfo;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @serialNumber.
  ///
  /// In en, this message translates to:
  /// **'Serial Number'**
  String get serialNumber;

  /// No description provided for @dsmVersion.
  ///
  /// In en, this message translates to:
  /// **'DSM Version'**
  String get dsmVersion;

  /// No description provided for @deviceTemperature.
  ///
  /// In en, this message translates to:
  /// **'Device Temperature'**
  String get deviceTemperature;

  /// No description provided for @uptime.
  ///
  /// In en, this message translates to:
  /// **'Uptime'**
  String get uptime;

  /// No description provided for @userInfo.
  ///
  /// In en, this message translates to:
  /// **'User Info'**
  String get userInfo;

  /// No description provided for @operation.
  ///
  /// In en, this message translates to:
  /// **'Operation'**
  String get operation;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @error_getDeviceInfo_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get device info!'**
  String get error_getDeviceInfo_failed;

  /// No description provided for @you_are_offline.
  ///
  /// In en, this message translates to:
  /// **'You are currently offline'**
  String get you_are_offline;

  /// No description provided for @connection_restored.
  ///
  /// In en, this message translates to:
  /// **'Your internet connection was restored'**
  String get connection_restored;

  /// No description provided for @normalize_audio.
  ///
  /// In en, this message translates to:
  /// **'Normalize audio'**
  String get normalize_audio;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// No description provided for @second.
  ///
  /// In en, this message translates to:
  /// **'second'**
  String get second;
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
