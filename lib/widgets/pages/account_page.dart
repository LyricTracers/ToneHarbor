import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/syno_api_info.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class AccountPage extends HookConsumerWidget with BuildItem {
  const AccountPage({super.key});

  String _formatUptime(int uptimeSeconds, AppLocalizations l10n) {
    final days = uptimeSeconds ~/ 86400;
    final hours = (uptimeSeconds % 86400) ~/ 3600;
    final minutes = (uptimeSeconds % 3600) ~/ 60;
    final seconds = uptimeSeconds % 60;

    if (days > 0) {
      return '$days ${l10n.day} $hours ${l10n.hour} $minutes ${l10n.minute} $seconds ${l10n.second}';
    } else if (hours > 0) {
      return '$hours ${l10n.hour} $minutes ${l10n.minute} $seconds ${l10n.second}';
    } else if (minutes > 0) {
      return '$minutes ${l10n.minute} $seconds ${l10n.second}';
    } else {
      return '$seconds ${l10n.second}';
    }
  }

  Widget _buildListTile({
    required String title,
    required String value,
    required ColorScheme colorScheme,
    required double multiplier,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 16 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      trailing:
          trailing ??
          Text(
            value,
            style: TextStyle(
              fontSize: 14 * multiplier,
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
    double multiplier,
  ) {
    return ListTile(
      onTap: () async {
        audioPlayer.pause();
        ref.read(requestFlagProvider.notifier).setRequestFlag(true);
        try {
          await logout(ref);
        } finally {
          ref.read(requestFlagProvider.notifier).setRequestFlag(false);
          await ref
              .read(audioStationCookiesInfoProvider.notifier)
              .clearCookie();
        }
      },
      title: Text(
        l10n.logout,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16 * multiplier,
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
    double multiplier,
  ) {
    var account = ref.read(accountInfoProvider);
    var url = ref.read(baseUrlProvider);
    var serverUrl = ref.read(serverUrlProvider);
    final isQuickConnect =
        !serverUrl.contains('.') &&
        !serverUrl.contains(':') &&
        serverUrl.length >= 3;

    return Column(
      children: [
        _buildListTile(
          title: l10n.serverUrl,
          value: url,
          colorScheme: colorScheme,
          multiplier: multiplier,
          onTap: () => copyToClipboard(url, ref.context, colorScheme.secondary),
        ),
        if (isQuickConnect) ...[
          _buildDivider(colorScheme),
          _buildListTile(
            title: l10n.quickConnectId,
            value: serverUrl,
            colorScheme: colorScheme,
            multiplier: multiplier,
            onTap: () =>
                copyToClipboard(serverUrl, ref.context, colorScheme.secondary),
          ),
        ],
        _buildDivider(colorScheme),
        _buildListTile(
          title: l10n.proxy_url,
          value: ToneHarborMedia.baseUrl,
          colorScheme: colorScheme,
          multiplier: multiplier,
          onTap: () {
            copyToClipboard(
              ToneHarborMedia.baseUrl,
              ref.context,
              colorScheme.secondary,
            );
          },
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: l10n.username,
          value: account?.account ?? '',
          colorScheme: colorScheme,
          multiplier: multiplier,
          onTap: () => copyToClipboard(
            account?.account ?? '',
            ref.context,
            colorScheme.secondary,
          ),
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: l10n.password,
          value: '',
          colorScheme: colorScheme,
          multiplier: multiplier,
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
                  fontSize: 14 * multiplier,
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
    double multiplier,
  ) {
    if (dsmInfo == null) {
      return ListTile(
        title: Text(
          l10n.error_getDeviceInfo_failed,
          style: TextStyle(color: colorScheme.error, fontSize: 16),
        ),
      );
    }
    return Column(
      children: [
        _buildListTile(
          title: l10n.model,
          value: dsmInfo.model,
          colorScheme: colorScheme,
          multiplier: multiplier,
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: l10n.serialNumber,
          value: dsmInfo.serial,
          colorScheme: colorScheme,
          multiplier: multiplier,
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: l10n.dsmVersion,
          value: dsmInfo.versionString,
          colorScheme: colorScheme,
          multiplier: multiplier,
        ),
        _buildDivider(colorScheme),
        _buildListTile(
          title: l10n.deviceTemperature,
          value: "${dsmInfo.temperature}°C",
          colorScheme: colorScheme,
          multiplier: multiplier,
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
          title: l10n.uptime,
          value: _formatUptime(currentUptime, l10n),
          colorScheme: colorScheme,
          multiplier: multiplier,
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
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    return Column(
      children: [
        buildAppBar(context, ref, l10n, colorScheme, l10n.account, size),
        buildContent(context, ref, l10n, colorScheme, [
          ...dsmInfo.when(
            data: (value) {
              final uptime = useState(value.data?.uptime ?? 0);
              useEffect(() {
                final timer = Timer.periodic(const Duration(seconds: 1), (_) {
                  uptime.value++;
                });
                return () => timer.cancel();
              }, []);
              return buildItem(
                ref,
                l10n,
                colorScheme,
                l10n.deviceInfo,
                _deviceInfo(
                  ref,
                  l10n,
                  colorScheme,
                  value.data,
                  uptime.value,
                  multiplier,
                ),
                multiplier,
              );
            },
            loading: () => buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.deviceInfo,
              CommonShimmerLoader.deviceInfoItem(colorScheme: colorScheme),
              multiplier,
            ),
            error: (error, stackTrace) => buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.deviceInfo,
              SizedBox.shrink(),
              multiplier,
            ),
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.userInfo,
            _userInfo(ref, l10n, colorScheme, obscurePassword, multiplier),
            multiplier,
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.operation,
            _logout(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
        ]),
      ],
    );
  }
}
