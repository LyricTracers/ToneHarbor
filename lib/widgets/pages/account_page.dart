import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/syno_api_info.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class AccountPage extends HookConsumerWidget with BuildItem {
  const AccountPage({super.key});

  String _formatUptime(int uptimeSeconds) {
    final days = uptimeSeconds ~/ 86400;
    final hours = (uptimeSeconds % 86400) ~/ 3600;
    final minutes = (uptimeSeconds % 3600) ~/ 60;
    final seconds = uptimeSeconds % 60;

    if (days > 0) {
      return '$days 天 $hours 小时 $minutes 分钟 $seconds 秒';
    } else if (hours > 0) {
      return '$hours 小时 $minutes 分钟 $seconds 秒';
    } else if (minutes > 0) {
      return '$minutes 分钟 $seconds 秒';
    } else {
      return '$seconds 秒';
    }
  }

  Widget _buildListTile({
    required String title,
    required String value,
    required ColorScheme colorScheme,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      trailing:
          trailing ??
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
    );
  }

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(
      height: 1,
      color: colorScheme.outline.withValues(alpha: 0.2),
      indent: 15,
      endIndent: 15,
    );
  }

  Widget _logout(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return ListTile(
      onTap: () async {
        audioPlayer.pause();
        await ref.read(audioStationCookiesInfoProvider.notifier).clearCookie();
        ref.invalidate(authTokenProvider);
      },
      title: Text(
        "退出登录",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.tertiary,
        ),
      ),
    );
  }

  Widget _userInfo(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    ValueNotifier<bool> obscurePassword,
  ) {
    var account = ref.read(accountInfoProvider);
    var url = ref.read(baseUrlProvider);

    return Column(
      children: [
        _buildListTile(
          title: "设备地址",
          value: url,
          colorScheme: colorScheme,
          onTap: () => copyToClipboard(url, ref.context, colorScheme.secondary),
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: "用户名",
          value: account?.account ?? '',
          colorScheme: colorScheme,
          onTap: () => copyToClipboard(
            account?.account ?? '',
            ref.context,
            colorScheme.secondary,
          ),
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: "密码",
          value: '',
          colorScheme: colorScheme,
          onTap: () => copyToClipboard(
            account?.passwd ?? '',
            ref.context,
            colorScheme.secondary,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  obscurePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 18,
                ),
                onPressed: () {
                  obscurePassword.value = !obscurePassword.value;
                },
              ),
              Text(
                obscurePassword.value ? '********' : (account?.passwd ?? ''),
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _deviceInfo(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    DSMInfoData? dsmInfo,
    int currentUptime,
  ) {
    if (dsmInfo == null) {
      return ListTile(
        title: Text(
          "获取设备信息失败！",
          style: TextStyle(color: colorScheme.error, fontSize: 16),
        ),
      );
    }
    return Column(
      children: [
        _buildListTile(
          title: "型号",
          value: dsmInfo.model,
          colorScheme: colorScheme,
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: "序列号",
          value: dsmInfo.serial,
          colorScheme: colorScheme,
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: "DSM版本号",
          value: dsmInfo.versionString,
          colorScheme: colorScheme,
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: "设备温度",
          value: "${dsmInfo.temperature}°C",
          colorScheme: colorScheme,
          trailing: Text(
            "${dsmInfo.temperature}°C",
            style: TextStyle(
              fontSize: 14,
              color: dsmInfo.temperatureWarn ? Colors.red : Colors.green,
            ),
          ),
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: "运行时长",
          value: _formatUptime(currentUptime),
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    var dsmInfo = ref.watch(dsmInfoProvider());
    var obscurePassword = useState(true);

    return Column(
      children: [
        buildAppBar(context, ref, l10n, colorScheme, "账号"),
        dsmInfo.when(
          data: (value) {
            final uptime = useState(value.data?.uptime ?? 0);
            useEffect(() {
              final timer = Timer.periodic(const Duration(seconds: 1), (_) {
                uptime.value++;
              });
              return () => timer.cancel();
            }, []);
            return buildContent(context, ref, l10n, colorScheme, [
              ...buildItem(
                ref,
                l10n,
                colorScheme,
                "设备信息",
                _deviceInfo(ref, l10n, colorScheme, value.data, uptime.value),
              ),
              SizedBox(height: 20),
              ...buildItem(
                ref,
                l10n,
                colorScheme,
                "用户信息",
                _userInfo(ref, l10n, colorScheme, obscurePassword),
              ),
              SizedBox(height: 20),
              ...buildItem(
                ref,
                l10n,
                colorScheme,
                "操作",
                _logout(ref, l10n, colorScheme),
              ),
            ]);
          },
          loading: () =>
              const Expanded(child: Center(child: AudioEqualizerLoader())),
          error: (error, stackTrace) {
            return buildErrorView(context, ref, colorScheme, () {});
          },
        ),
      ],
    );
  }
}
