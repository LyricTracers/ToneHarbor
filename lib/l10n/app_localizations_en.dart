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
  String get error_songListEmpty => 'Song list cannot be empty';

  @override
  String get error_authFailed => 'Authentication failed';

  @override
  String get error_downloadFailedWithCode => 'Download failed, status code: %s';

  @override
  String get error_downloadCoverFailedWithCode =>
      'Failed to download cover, status code: %s';

  @override
  String get error_batchDownloadFailedWithCode =>
      'Batch download failed, status code: %s';

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
  String get testConnection => 'Test Connection';

  @override
  String get testConnectionSuccess => 'Connection test successful';

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

  @override
  String get search => 'Search';

  @override
  String get searchHint => 'Search songs, artists, albums...';

  @override
  String get searchHistoryLabel => 'Search History';

  @override
  String get clearHistory => 'Clear';

  @override
  String get noSearchHistory => 'No search history';

  @override
  String get searchingFor => 'Searching:';

  @override
  String get recommend => 'Recommend';

  @override
  String get daily_recommend => 'Daily Recommend';

  @override
  String get recent_albums => 'Recent Albums';

  @override
  String get recommend_albums => 'Recommend Albums';

  @override
  String get my_favorite => 'My Favorite';

  @override
  String get favorite => 'Favorite';

  @override
  String get more => 'Load More';

  @override
  String get setThemeBackground => 'Set Theme Background';

  @override
  String get setThemeBackgroundConfirm => 'Set this cover as theme background?';

  @override
  String get playlist_text => 'Playlist(%s)';

  @override
  String get no_lyric => 'No lyrics available';

  @override
  String get add_to_playlists => 'Add to';

  @override
  String get create_playlist => 'Create playlist';

  @override
  String get no_playlists => 'No playlist';

  @override
  String get playlists => 'Playlists';

  @override
  String get playlist_name => 'Playlist Name';

  @override
  String get input_playlist_name => 'Input Playlist Name';

  @override
  String get addsong_to_playlist_success =>
      'Successfully added Songs to [%s playlist]';

  @override
  String get switch_lyrics => 'Switch Lyrics';

  @override
  String get input_title_empty => 'The current input title is empty';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get playing => 'Playing';

  @override
  String get delete => 'Delete';

  @override
  String get title => 'Title';

  @override
  String get artist => 'Artist';

  @override
  String get sort => 'sort';

  @override
  String get albums => 'Albums';

  @override
  String get sort_name => 'Order Of Title';

  @override
  String get sort_time => 'Order Of Time';

  @override
  String get music_house => 'Music Library';

  @override
  String get all_music => 'Music';

  @override
  String get music => 'Music';

  @override
  String get folder => 'Folder';

  @override
  String get sort_artist_name => 'Order Of Artist';

  @override
  String get total_songs => '(Total %s)';

  @override
  String get total_artists => '(Total %s)';

  @override
  String get total_albums => '(Total %s)';

  @override
  String get input_song_title => 'Enter song title';

  @override
  String get input_song_artist => 'Enter song artist';

  @override
  String get sync => 'Sync';

  @override
  String get restore_default => 'Restore Default';

  @override
  String get retry => 'Retry';

  @override
  String get favorite_playlist => 'Collect Playlists';

  @override
  String get no_favorite_playlist => 'Cancel Collection';

  @override
  String get delete_playlist => 'Delete Playlists';

  @override
  String get ask_delete_playlist => 'Delete [%s] Playlist?';

  @override
  String get song_playlist => 'Song PlayList';

  @override
  String get unknown_title => 'Unknown Title';

  @override
  String get unknown_artist => 'Unknown Artist';

  @override
  String get unknown_source => 'Unknown Source';

  @override
  String get add_to => 'Add To';

  @override
  String get next_song => 'Next Song';

  @override
  String get play_queue => 'Play Queue';

  @override
  String get download => 'Download';

  @override
  String get no_selected_songs => 'No songs selected';

  @override
  String get favorite_limit_exceeded =>
      'Favorite limit exceeded (max 100 songs)';

  @override
  String get cancel_favorite_limit_exceeded =>
      'Cancel favorite limit exceeded (max 100 songs)';

  @override
  String get queue_limit_exceeded => 'Queue limit exceeded (max 1000 songs)';

  @override
  String get selected_count => 'Selected %s songs';

  @override
  String get selected_download_count => 'Selected Count Of %s';

  @override
  String get select_all => 'Select All';

  @override
  String get tip_pre_song => 'Already at the first song. Enable loop playback.';

  @override
  String get tip_next_song => 'Already at the last song. Enable loop playback.';

  @override
  String get save_success => 'Saved successfully';

  @override
  String get download_center => 'Download Center';

  @override
  String get local_songs => 'Local Songs';

  @override
  String get select_quality => 'Select Quality';

  @override
  String get play => 'Play';

  @override
  String get normal_download => 'Normal Download';

  @override
  String get preload => 'Preload';

  @override
  String get no_download_tasks => 'No download tasks';

  @override
  String get no_download_history => 'No download history';

  @override
  String get status_queued => 'Queued';

  @override
  String get status_downloading => 'Downloading';

  @override
  String get status_paused => 'Paused';

  @override
  String get status_completed => 'Completed';

  @override
  String get status_failed => 'Failed';

  @override
  String get status_canceled => 'Canceled';

  @override
  String get cancel_download => 'Cancel Download';

  @override
  String get pause_download => 'Pause Download';

  @override
  String get resume_download => 'Resume Download';

  @override
  String get delete_download_history => 'Delete Download History';

  @override
  String get delete_current_history => 'Delete Current History';

  @override
  String get redownload => 'Redownload';

  @override
  String get other => 'Other';

  @override
  String get copy => 'Copy';

  @override
  String get most_play => 'Most Played';

  @override
  String get play_current_song => 'Play Current Song';

  @override
  String get local_file_not_found => 'Local file not found for %s';

  @override
  String get account => 'Account';

  @override
  String get deviceInfo => 'Device Info';

  @override
  String get model => 'Model';

  @override
  String get serialNumber => 'Serial Number';

  @override
  String get dsmVersion => 'DSM Version';

  @override
  String get deviceTemperature => 'Device Temperature';

  @override
  String get uptime => 'Uptime';

  @override
  String get userInfo => 'User Info';

  @override
  String get operation => 'Operation';

  @override
  String get logout => 'Logout';

  @override
  String get error_getDeviceInfo_failed => 'Failed to get device info!';

  @override
  String get you_are_offline => 'You are currently offline';

  @override
  String get connection_restored => 'Your internet connection was restored';

  @override
  String get normalize_audio => 'Normalize audio';

  @override
  String get proxy_url => 'Playback Proxy Address';

  @override
  String get quality_low => 'Low Quality (128kbps)';

  @override
  String get quality_medium => 'Medium Quality (192kbps)';

  @override
  String get quality_high => 'High Quality (320kbps)';

  @override
  String get quality_original => 'Original Quality';

  @override
  String get storage_cache => 'Cache';

  @override
  String get storage_other => 'Other';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get storage_management => 'Storage Management';

  @override
  String get about => 'About';

  @override
  String get replay_gain => 'Replay Gain';

  @override
  String get replay_gain_desc =>
      'Add ReplayGain tags via third-party software (e.g., rsgain)';

  @override
  String get playback_quality => 'Playback Quality';

  @override
  String get status_bar_display => 'Status Bar Display';

  @override
  String get icon => 'Icon';

  @override
  String get lyrics => 'Lyrics';

  @override
  String get font_size => 'Font Size';

  @override
  String get auto_switch_background => 'Auto Switch Background';

  @override
  String get manual_switch_background => 'Manual Switch Background';

  @override
  String get follow_song_cover => 'Follow Song Cover';

  @override
  String get long_press_set_background => 'Long press cover to set background';

  @override
  String get color_scheme => 'Color Scheme';

  @override
  String get brightness_contrast => 'Brightness Contrast';

  @override
  String get playback_settings => 'Playback Settings';

  @override
  String get theme_settings => 'Theme Settings';

  @override
  String get status_bar_settings => 'Status Bar Settings';

  @override
  String get other_settings => 'Other Settings';

  @override
  String get total => 'Total';

  @override
  String get confirm_clear => 'Confirm Clear';

  @override
  String get confirm_clear_message => 'Are you sure you want to clear [%s]?';

  @override
  String get size => 'Size';

  @override
  String get day => 'day';

  @override
  String get hour => 'hour';

  @override
  String get minute => 'minute';

  @override
  String get second => 'second';

  @override
  String get zhipu_translate_settings => 'Zhipu Translate Settings';

  @override
  String get ai_translate_settings => 'AI Translate Settings';

  @override
  String get platform => 'Platform';

  @override
  String get platform_settings => 'Platform Settings';

  @override
  String get siliconflow => 'SiliconFlow';

  @override
  String get llama => 'Llama';

  @override
  String get custom_platform => 'Custom';

  @override
  String get built_in_model => 'Built-in Model';

  @override
  String get need_api_key_hint => 'API Key required for this platform';

  @override
  String get api_key_required => 'API Key Required';

  @override
  String get api_settings => 'API Settings';

  @override
  String get model_settings => 'Model Settings';

  @override
  String get advanced_settings => 'Advanced Settings';

  @override
  String get api_key => 'API Key';

  @override
  String get not_configured => 'Not Configured';

  @override
  String get enter_api_key => 'Enter API Key';

  @override
  String get save => 'Save';

  @override
  String get api_endpoint => 'API Endpoint';

  @override
  String get temperature => 'Temperature';

  @override
  String get reset_default => 'Reset to Default';

  @override
  String get default_target_language => 'Default Target Language';

  @override
  String get custom_model => 'Custom Model';

  @override
  String get custom_model_hint =>
      'Enter model name, e.g., gpt-4, deepseek-chat, etc.';

  @override
  String get show_original_lyrics => 'Show Original';

  @override
  String get show_translated_lyrics => 'Show Translation';

  @override
  String get save_translated_lyrics => 'Save Translated Lyrics';

  @override
  String get translate_lyrics => 'Translate Lyrics';

  @override
  String get target_language => 'Target Language';

  @override
  String get audio_device => 'Audio Device';

  @override
  String get no_audio_devices_found => 'No audio devices found';

  @override
  String get available_devices => 'Available Devices';

  @override
  String get audio_device_hint =>
      'Select an audio output device. AirPlay and Bluetooth devices will appear here when connected.';

  @override
  String get airplay_devices => 'AirPlay Devices';

  @override
  String get airplay_tap_to_connect => 'Tap to connect to AirPlay devices';

  @override
  String get airplay_not_supported =>
      'AirPlay is only available on iOS and macOS';

  @override
  String get lyrics_provider => 'Lyrics Provider';

  @override
  String get lyrics_provider_desc => 'Select the sources for lyrics search';

  @override
  String get remove_from_playlist => 'Remove From Playlist';

  @override
  String get download_history => 'Download History';

  @override
  String get refresh => 'Refresh';

  @override
  String get login => 'Login';

  @override
  String get clear_all => 'Clear All';
}
