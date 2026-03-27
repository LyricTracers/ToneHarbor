import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';
import 'package:tray_manager/tray_manager.dart';

class SettingPage extends HookConsumerWidget with BuildItem {
  const SettingPage({super.key});

  Widget _audioPlay(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        buildSwitchTile(
          "回放增益",
          "通过第三方软件(如rsgain)添加ReplayGain标签",
          ref.watch(normalizeAudioProvider),
          (value) async {
            ref.read(normalizeAudioProvider.notifier).set(value);
            await audioPlayer.setAudioNormalization(value);
          },
          colorScheme,
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildDropdownTile(
          title: '播放音质',
          items: AudioQuality.values,
          value: ref.watch(audioQualityProvider),
          colorScheme: colorScheme,
          onChanged: (value) {
            if (value != null) {
              ref.read(audioQualityProvider.notifier).setAudioQuality(value);
              setDemuxerBufferSize(value);
            }
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        ListTile(
          title: Text(
            '代理地址',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            ToneHarborMedia.baseUrl,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          onTap: () {
            copyToClipboard(
              ToneHarborMedia.baseUrl,
              ref.context,
              colorScheme.secondary,
            );
          },
        ),
      ],
    );
  }

  Widget _statusBar(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        buildSwitchTile(
          '状态栏显示',
          '图标',
          ref.watch(statusBarLyricProvider),
          (value) async {
            ref.read(statusBarLyricProvider.notifier).set(value);
          },
          colorScheme,
          subtitle2: '歌词',
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildSliderTile(
          title: '字体大小',
          value: ref.watch(trayFontSizeProvider),
          onChanged: (value) async {
            ref.read(trayFontSizeProvider.notifier).setFontSize(value);
            await trayManager.setFontSize(value);
          },
          minValue: 12.0,
          maxValue: 15.0,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _theme(WidgetRef ref, AppLocalizations l10n, ColorScheme colorScheme) {
    return Column(
      children: [
        buildSwitchTile(
          '自动切换背景',
          '手动切换背景',
          title2: '跟随歌曲封面',
          subtitle2: '长按封面设置背景',
          ref.watch(syncSongIconProvider),
          (value) =>
              ref.read(syncSongIconProvider.notifier).setSyncSongIcon(value),
          colorScheme,
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildDropdownTile(
          title: '配色方案',
          items: DynamicSchemeVariant.values,
          value: ref.watch(dynamicSchemeProvider),
          colorScheme: colorScheme,
          onChanged: (value) {
            if (value != null) {
              ref.read(dynamicSchemeProvider.notifier).setSchemeVariant(value);
            }
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildSliderTile(
          title: '亮度对比度',
          value: ref.watch(contrastLevelProvider),
          onChanged: (value) =>
              ref.read(contrastLevelProvider.notifier).setContrastLevel(value),
          minValue: -1.0,
          maxValue: 1.0,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _account(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return ListTile(
      title: Text(
        ref.read(accountInfoProvider)?.account ?? '',
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        ref.read(baseUrlProvider),
        style: TextStyle(
          fontSize: 12,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
      leading: Icon(Icons.person, size: 24),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
      onTap: () {
        ref.context.push("/account");
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    return Column(
      children: [
        buildAppBar(context, ref, l10n, colorScheme, "设置"),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            "账号",
            _account(ref, l10n, colorScheme),
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            '播放设置',
            _audioPlay(ref, l10n, colorScheme),
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            '主题设置',
            _theme(ref, l10n, colorScheme),
          ),
          if (Platform.isMacOS) ...[
            SizedBox(height: 20),
            ...buildItem(
              ref,
              l10n,
              colorScheme,
              '状态栏设置',
              _statusBar(ref, l10n, colorScheme),
            ),
          ],
        ]),
      ],
    );
  }
}
