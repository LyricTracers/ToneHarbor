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
}
