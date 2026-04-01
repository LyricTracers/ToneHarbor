import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/download.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';
import 'package:tray_manager/tray_manager.dart';

class SettingPage extends HookConsumerWidget with BuildItem {
  const SettingPage({super.key});

  Widget _other(BuildContext context, WidgetRef ref, l10n, colorScheme) {
    return Column(
      children: [
        buildDropdownTile(
          title: l10n.language,
          items: Language.values,
          value: Language.fromLocale(ref.watch(localeProvider)),
          colorScheme: colorScheme,
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(localeProvider.notifier)
                  .setLocale(Locale(value.languageCode));
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
            l10n.storage_management,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () => context.push('/storage'),
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        ListTile(
          title: Text(
            l10n.ai_translate_settings,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () => context.push('/ai-translate'),
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        ListTile(
          title: Text(
            l10n.about,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _audioPlay(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return Column(
      children: [
        buildSwitchTile(
          l10n.replay_gain,
          l10n.replay_gain_desc,
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
          title: l10n.playback_quality,
          items: AudioQuality.values,
          value: ref.watch(audioQualityProvider),
          colorScheme: colorScheme,
          labelBuilder: (q) => q.localizedLabel(l10n),
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
            l10n.audio_device,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () => context.push('/audio-device'),
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        ListTile(
          title: Text(
            l10n.lyrics_provider,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Consumer(
            builder: (context, ref, child) {
              final selectedProviders = ref.watch(
                lyricsProviderSelectionProvider,
              );
              return selectedProviders.when(
                data: (providers) {
                  if (providers.isEmpty) {
                    return Text(
                      l10n.lyrics_provider_desc,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    );
                  }
                  final names = providers.map((p) => p.displayName).join(', ');
                  return Text(
                    names,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
                loading: () => Text(
                  l10n.lyrics_provider_desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                error: (_, __) => Text(
                  l10n.lyrics_provider_desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              );
            },
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () =>
              _showLyricsProviderDialog(context, ref, l10n, colorScheme),
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }

  void _showLyricsProviderDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.lyrics_provider,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Consumer(
          builder: (context, ref, child) {
            final selectedProviders = ref.watch(
              lyricsProviderSelectionProvider,
            );
            return selectedProviders.when(
              data: (providers) => SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            ref
                                .read(lyricsProviderSelectionProvider.notifier)
                                .selectAll();
                          },
                          child: Text(l10n.select_all),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(lyricsProviderSelectionProvider.notifier)
                                .clearAll();
                          },
                          child: Text(l10n.clear_all),
                        ),
                      ],
                    ),
                    const Divider(height: 1),
                    ...LyricsProviderType.values.map((provider) {
                      final isSelected = providers.contains(provider);
                      return CheckboxListTile(
                        title: Text(provider.displayName),
                        value: isSelected,
                        onChanged: (value) {
                          ref
                              .read(lyricsProviderSelectionProvider.notifier)
                              .toggleProvider(provider);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      );
                    }),
                  ],
                ),
              ),
              loading: () => const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => Text('Error loading providers'),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.confirm),
          ),
        ],
      ),
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
          l10n.status_bar_display,
          l10n.icon,
          ref.watch(statusBarLyricProvider),
          (value) async {
            ref.read(statusBarLyricProvider.notifier).set(value);
          },
          colorScheme,
          subtitle2: l10n.lyrics,
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildSliderTile(
          title: l10n.font_size,
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
          l10n.auto_switch_background,
          l10n.manual_switch_background,
          title2: l10n.follow_song_cover,
          subtitle2: l10n.long_press_set_background,
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
          title: l10n.color_scheme,
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
          title: l10n.brightness_contrast,
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
    final needAppBar = MediaQuery.of(context).lgAndUp;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (needAppBar)
          buildAppBar(context, ref, l10n, colorScheme, l10n.settings, size),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.account,
            _account(ref, l10n, colorScheme),
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.playback_settings,
            _audioPlay(context, ref, l10n, colorScheme),
          ),
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.theme_settings,
            _theme(ref, l10n, colorScheme),
          ),

          if (Platform.isMacOS) ...[
            SizedBox(height: 20),
            ...buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.status_bar_settings,
              _statusBar(ref, l10n, colorScheme),
            ),
          ],
          SizedBox(height: 20),
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.other_settings,
            _other(context, ref, l10n, colorScheme),
          ),
        ]),
      ],
    );
  }
}
