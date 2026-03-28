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
  String get sort_time => '时间排序';

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
  String get add_to => '添加到';

  @override
  String get next_song => '下一首';

  @override
  String get play_queue => '播放队列';

  @override
  String get download => '下载';

  @override
  String get no_selected_songs => '没有选择的歌曲';

  @override
  String get favorite_limit_exceeded => '收藏数量超过限制（最多100首）';

  @override
  String get cancel_favorite_limit_exceeded => '取消收藏数量超过限制（最多100首）';

  @override
  String get queue_limit_exceeded => '播放队列数量超过限制（最多1000首）';

  @override
  String get selected_count => '已选择 %s 首歌曲';

  @override
  String get selected_download_count => '已选择 %s 个';

  @override
  String get select_all => '全选';

  @override
  String get tip_pre_song => '已经是第一首了，请开启循环播放';

  @override
  String get tip_next_song => '已经是最后一首了，请开启循环播放';

  @override
  String get save_success => '保存成功';

  @override
  String get download_center => '下载中心';

  @override
  String get local_songs => '本地歌曲';

  @override
  String get select_quality => '选择音质';

  @override
  String get play => '播放';

  @override
  String get normal_download => '普通下载';

  @override
  String get preload => '预加载';

  @override
  String get no_download_tasks => '暂无下载任务';

  @override
  String get no_download_history => '暂无下载历史';

  @override
  String get status_queued => '排队中';

  @override
  String get status_downloading => '下载中';

  @override
  String get status_paused => '已暂停';

  @override
  String get status_completed => '已完成';

  @override
  String get status_failed => '下载失败';

  @override
  String get status_canceled => '已取消';

  @override
  String get cancel_download => '取消下载';

  @override
  String get pause_download => '暂停下载';

  @override
  String get resume_download => '继续下载';

  @override
  String get delete_download_history => '删除下载历史';

  @override
  String get delete_current_history => '删除当前下载历史';

  @override
  String get redownload => '重新下载';

  @override
  String get other => '其他';

  @override
  String get copy => '拷贝';

  @override
  String get most_play => '最常播放';

  @override
  String get play_current_song => '播放当前歌曲';

  @override
  String get local_file_not_found => '本地未找到%s歌曲';

  @override
  String get account => '账号';

  @override
  String get deviceInfo => '设备信息';

  @override
  String get model => '型号';

  @override
  String get serialNumber => '序列号';

  @override
  String get dsmVersion => 'DSM版本号';

  @override
  String get deviceTemperature => '设备温度';

  @override
  String get uptime => '运行时长';

  @override
  String get userInfo => '用户信息';

  @override
  String get operation => '操作';

  @override
  String get logout => '退出登录';

  @override
  String get error_getDeviceInfo_failed => '获取设备信息失败！';

  @override
  String get you_are_offline => '您当前处于离线状态';

  @override
  String get connection_restored => '您的互联网连接已恢复';

  @override
  String get normalize_audio => '标准化音频';

  @override
  String get proxy_url => '播放代理地址';

  @override
  String get quality_low => '低音质 (128kbps)';

  @override
  String get quality_medium => '中音质 (192kbps)';

  @override
  String get quality_high => '高音质 (320kbps)';

  @override
  String get quality_original => '原始音质 (不转码)';

  @override
  String get storage_cache => '缓存';

  @override
  String get storage_other => '其他';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get storage_management => '存储空间管理';

  @override
  String get about => '关于';

  @override
  String get replay_gain => '回放增益';

  @override
  String get replay_gain_desc => '通过第三方软件(如rsgain)添加ReplayGain标签';

  @override
  String get playback_quality => '播放音质';

  @override
  String get status_bar_display => '状态栏显示';

  @override
  String get icon => '图标';

  @override
  String get lyrics => '歌词';

  @override
  String get font_size => '字体大小';

  @override
  String get auto_switch_background => '自动切换背景';

  @override
  String get manual_switch_background => '手动切换背景';

  @override
  String get follow_song_cover => '跟随歌曲封面';

  @override
  String get long_press_set_background => '长按封面设置背景';

  @override
  String get color_scheme => '配色方案';

  @override
  String get brightness_contrast => '亮度对比度';

  @override
  String get playback_settings => '播放设置';

  @override
  String get theme_settings => '主题设置';

  @override
  String get status_bar_settings => '状态栏设置';

  @override
  String get other_settings => '其他设置';

  @override
  String get total => '总计';

  @override
  String get confirm_clear => '确认清理';

  @override
  String get confirm_clear_message => '确定要清理【%s】吗？';

  @override
  String get size => '大小';

  @override
  String get day => '天';

  @override
  String get hour => '小时';

  @override
  String get minute => '分钟';

  @override
  String get second => '秒';

  @override
  String get zhipu_translate_settings => '智谱翻译设置';

  @override
  String get api_settings => 'API 设置';

  @override
  String get model_settings => '模型设置';

  @override
  String get advanced_settings => '高级设置';

  @override
  String get api_key => 'API Key';

  @override
  String get not_configured => '未配置';

  @override
  String get enter_api_key => '请输入 API Key';

  @override
  String get save => '保存';

  @override
  String get api_endpoint => 'API 端点';

  @override
  String get temperature => '温度';

  @override
  String get reset_default => '恢复默认';

  @override
  String get default_target_language => '默认翻译语言';

  @override
  String get show_original_lyrics => '显示原文';

  @override
  String get show_translated_lyrics => '显示译文';

  @override
  String get save_translated_lyrics => '保存翻译歌词';

  @override
  String get translate_lyrics => '翻译歌词';

  @override
  String get target_language => '目标语言';
}
