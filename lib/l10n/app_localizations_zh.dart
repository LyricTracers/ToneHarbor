// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '拾音坞';

  @override
  String get appSubtitle => '一坞藏万乐，双耳遇知音';

  @override
  String get serverUrl => '服务器地址';

  @override
  String get error_serverUrl => '请输入有效的服务器地址（例如：192.168.1.100:5000）';

  @override
  String get error_username => '请输入用户名';

  @override
  String get error_password => '请输入密码';

  @override
  String get error_invalidUrl => '服务器地址格式无效';

  @override
  String get error_login_failed => '登录失败';

  @override
  String get error_search_failed => '搜索%s失败';

  @override
  String get error_token_refresh_failed => '刷新 token 失败';

  @override
  String get error_account_info_invalid => '用户信息无效';

  @override
  String get error_syno_login_400 => '无此账户或密码错误';

  @override
  String get error_syno_login_401 => '账户已禁用';

  @override
  String get error_syno_login_402 => '权限被拒绝';

  @override
  String get error_syno_login_403 => '需要双因素认证码';

  @override
  String get error_syno_login_404 => '双因素认证码验证失败';

  @override
  String get error_syno_login_406 => '强制使用双因素验证码进行认证';

  @override
  String get error_syno_login_407 => 'IP源已被封锁';

  @override
  String get error_syno_login_408 => '过期密码无法更改';

  @override
  String get error_syno_login_409 => '密码已过期';

  @override
  String get error_syno_login_410 => '必须更改密码';

  @override
  String get error_getArtists_failed => '获取艺术家列表失败';

  @override
  String get error_getAlbums_failed => '获取专辑列表失败';

  @override
  String get error_getFolders_failed => '获取文件夹列表失败';

  @override
  String get error_getSongs_failed => '获取歌曲列表失败';

  @override
  String get error_getAlbumSongs_failed => '获取专辑歌曲失败';

  @override
  String get error_getLyrics_failed => '获取歌词失败';

  @override
  String get error_searchLyrics_failed => '搜索歌词失败';

  @override
  String get error_getSongInfo_failed => '获取歌曲信息失败';

  @override
  String get error_setRating_failed => '设置评分失败';

  @override
  String get error_getNumberOfPlugIns_failed => '获取插件数量失败';

  @override
  String get error_getServerInfo_failed => '获取服务器信息失败';

  @override
  String get error_getDSMInfo_failed => '获取 DSM 信息失败';

  @override
  String get error_getPlaylists_failed => '获取播放列表失败';

  @override
  String get error_getPlaylistDetail_failed => '获取播放列表详情失败';

  @override
  String get error_getPlaylistInfo_failed => '获取播放列表信息失败';

  @override
  String get error_createPlaylist_failed => '创建播放列表失败';

  @override
  String get error_renamePlaylist_failed => '重命名播放列表失败';

  @override
  String get error_deletePlaylist_failed => '删除播放列表失败';

  @override
  String get error_addSongToPlaylist_failed => '添加歌曲到播放列表失败';

  @override
  String get error_removeMissingSongs_failed => '清除遗失歌曲失败';

  @override
  String get error_getStreamUrl_failed => '获取播放流URL失败';

  @override
  String get error_getCoverUrl_failed => '获取封面URL失败';

  @override
  String get error_downloadSong_failed => '下载歌曲失败';

  @override
  String get error_downloadCover_failed => '下载封面失败';

  @override
  String get error_batchDownload_failed => '批量下载失败';

  @override
  String get error_extractZip_failed => '解压ZIP文件失败';

  @override
  String get error_invalidCookie => '未找到有效Cookie';

  @override
  String get error_songListEmpty => '歌曲列表不能为空';

  @override
  String get error_authFailed => '认证失败';

  @override
  String get error_downloadFailedWithCode => '下载失败，状态码: %s';

  @override
  String get error_downloadCoverFailedWithCode => '下载封面失败，状态码: %s';

  @override
  String get error_batchDownloadFailedWithCode => '批量下载失败，状态码: %s';

  @override
  String get error_syno_request_100 => '未知错误';

  @override
  String get error_syno_request_101 => '没有API、方法或版本的参数';

  @override
  String get error_syno_request_102 => '请求的API不存在';

  @override
  String get error_syno_request_103 => '请求的方法不存在';

  @override
  String get error_syno_request_104 => '请求的版本不支持该功能';

  @override
  String get error_syno_request_105 => '登录的会话没有权限';

  @override
  String get error_syno_request_106 => '会话超时';

  @override
  String get error_syno_request_107 => '会话因重复登录而中断';

  @override
  String get error_syno_request_114 => '此API的参数丢失';

  @override
  String get error_syno_request_150 => '请求源IP与登录IP不匹配';

  @override
  String get error_network_error => '网络错误';

  @override
  String get error_response_parse_failed => '解析失败';

  @override
  String get testConnection => '测试连通性';

  @override
  String get testConnectionSuccess => '连通性测试成功';

  @override
  String get useHttps => '使用HTTPS';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get signIn => '登录';

  @override
  String get loading => '「加载中｜请稍后」';

  @override
  String get has_copy => '已复制:';

  @override
  String get search => '搜索';

  @override
  String get searchHint => '搜索歌曲、艺术家、专辑...';

  @override
  String get searchHistoryLabel => '搜索历史';

  @override
  String get clearHistory => '清空';

  @override
  String get noSearchHistory => '暂无搜索历史';

  @override
  String get searchingFor => '搜索:';

  @override
  String get recommend => '推荐';

  @override
  String get daily_recommend => '每日推荐';

  @override
  String get recent_albums => '最近专辑';

  @override
  String get recommend_albums => '推荐专辑';

  @override
  String get my_favorite => '我的收藏';

  @override
  String get favorite => '收藏';

  @override
  String get more => '查看更多';

  @override
  String get setThemeBackground => '设置主题背景';

  @override
  String get setThemeBackgroundConfirm => '是否将此封面设置为主题背景？';

  @override
  String get playlist_text => '播放列表(%s)';

  @override
  String get no_lyric => '暂无歌词';

  @override
  String get add_to_playlists => '添加到';

  @override
  String get create_playlist => '创建歌单';

  @override
  String get no_playlists => '没有歌单';

  @override
  String get playlists => '歌单';

  @override
  String get playlist_name => '歌单名';

  @override
  String get input_playlist_name => '输入歌单名';

  @override
  String get addsong_to_playlist_success => '添加歌曲到[%s歌单]成功';

  @override
  String get switch_lyrics => '切换歌词';

  @override
  String get input_title_empty => '当前输入标题为空';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确定';

  @override
  String get playing => '播放中';

  @override
  String get delete => '删除';

  @override
  String get title => '标题';

  @override
  String get artist => '歌手';

  @override
  String get sort => '排序';

  @override
  String get albums => '专辑';

  @override
  String get sort_name => '歌曲名排序';

  @override
  String get music_house => '音乐库';

  @override
  String get all_music => '歌曲';

  @override
  String get folder => '文件夹';

  @override
  String get sort_artist_name => '演唱者排序';

  @override
  String get total_songs => '(共%s首)';

  @override
  String get total_artists => '(共%s位)';

  @override
  String get total_albums => '(共%s个)';

  @override
  String get input_song_title => '输入歌曲标题';

  @override
  String get input_song_artist => '输入歌曲歌手';

  @override
  String get sync => '同步';

  @override
  String get restore_default => '恢复默认';

  @override
  String get retry => '重试';

  @override
  String get favorite_playlist => '收藏歌单';

  @override
  String get no_favorite_playlist => '取消收藏';

  @override
  String get delete_playlist => '删除歌单';

  @override
  String get ask_delete_playlist => '确定删除[%s]歌单吗？';

  @override
  String get song_playlist => '歌单';

  @override
  String get unknown_title => '未知标题';

  @override
  String get unknown_artist => '未知艺术家';

  @override
  String get unknown_source => '未知来源';

  @override
  String get save_success => '保存成功';
}
