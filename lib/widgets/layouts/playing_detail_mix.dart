import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:lyricskit/lyricskit.dart";
import "package:flutter_to_airplay/flutter_to_airplay.dart";
import "package:toneharbor/init/initialized.dart";
import "package:toneharbor/l10n/app_localizations.dart";
import "package:toneharbor/models/audio_player/tone_harbor_track.dart";
import "package:toneharbor/providers/providers.dart";
import "package:toneharbor/services/audio_player/audio_player.dart";
import "package:toneharbor/services/translate/translate_service.dart";
import "package:toneharbor/utils/base_funs.dart";
import "package:toneharbor/utils/responsive.dart";
import "package:toneharbor/widgets/widgets.dart";

mixin PlayingDetailMix {
  Widget buildLyrics(WidgetRef ref, ValueNotifier<bool> showTranslated) {
    return Builder(
      builder: (context) {
        final originalLyrics = ref.watch(currentLyricsProvider).value;
        final translatedText = ref.watch(translateTextProvider).value;

        if (!showTranslated.value ||
            originalLyrics == null ||
            translatedText == null) {
          return LyricsContentPage(currentLyrics: originalLyrics);
        }

        final translatedLyrics = Lyrics.fromString(translatedText);
        if (translatedLyrics == null) {
          return LyricsContentPage(currentLyrics: originalLyrics);
        }

        final mergedLyrics = Lyrics.fromJson(originalLyrics.toJson());

        mergedLyrics.merge(translatedLyrics);

        return LyricsContentPage(currentLyrics: mergedLyrics);
      },
    );
  }

  Widget buildMusic(
    WidgetRef ref,
    ToneHarborTrackObject activeTrack,
    ColorScheme colorScheme,
    ValueNotifier<bool> showTranslated,
    Size size,
    double radius,
  ) {
    final l10n = ref.watch(l10nProvider);

    final isLocal = activeTrack.isLocal;
    final size24 = 24 * size.multiplier2;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSongIcon(ref, activeTrack, radius),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: radius * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  tooltip: l10n.song_playlist,
                  onPressed: isLocal
                      ? null
                      : () {
                          if (size.mdAndUp) {
                            showSlidePanel(
                              context: ref.context,
                              builder: (context) =>
                                  AddToPlaylistsPage(activeTrack.id),
                            );
                          } else {
                            showModalBottomSheetWidget(
                              ref.context,
                              colorScheme,
                              (context) => AddToPlaylistsPage(activeTrack.id),
                            );
                          }
                        },
                  icon: Icon(Icons.playlist_add_rounded, size: size24),
                ),
                if (defaultTargetPlatform == TargetPlatform.iOS)
                  SizedBox(
                    width: size24 + 16,
                    height: size24 + 16,
                    child: AirPlayRoutePickerView(
                      width: size24 + 16,
                      height: size24 + 16,
                      tintColor: colorScheme.onSurface,
                      activeTintColor: colorScheme.primary,
                      backgroundColor: Colors.transparent,
                      prioritizesVideoDevices: false,
                    ),
                  )
                else
                  IconButton(
                    onPressed: () => _showAudioDeviceMenu(ref, colorScheme),
                    icon: Icon(Icons.speaker, size: size24),
                    tooltip: l10n.audio_device,
                  ),
                IconButton(
                  onPressed: () {
                    ref.context.pushWrapper(
                      "/switch_lyrics",
                      extra: activeTrack,
                    );
                  },
                  icon: Icon(Icons.lyrics_rounded, size: size24),
                  tooltip: l10n.lyrics,
                ),
                _buildTranslateButton(
                  ref,
                  colorScheme,
                  showTranslated,
                  activeTrack,
                  l10n,
                  size24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongIcon(
    WidgetRef ref,
    ToneHarborTrackObject activeTrack,
    double radius,
  ) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final containerSize = radius * 0.75;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.surface,
              width: containerSize * 0.35,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.surfaceContainer,
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: SongCoverImage(
            songId: activeTrack.id,
            albumName: activeTrack.album,
            artistName: activeTrack.artist,
            colorScheme: colorScheme,
            config: SongCoverImageConfig(
              size: containerSize * 0.65,
              isCircular: true,
              rotating: audioPlayer.isPlaying,
              rotationDuration: Duration(seconds: 30),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTranslateButton(
    WidgetRef ref,
    ColorScheme colorScheme,
    ValueNotifier<bool> showTranslated,
    ToneHarborTrackObject activeTrack,
    AppLocalizations l10n,
    double size24,
  ) {
    final targetLanguage = ref.watch(aITargetLanguageSettingProvider);
    final translateState = ref.watch(translateTextProvider);
    final isLoading = translateState.isLoading;
    final hasTranslation = translateState.value != null;

    return IconButton(
      tooltip: l10n.translate_lyrics,
      onPressed: isLoading
          ? null
          : () => _showTranslateMenu(
              ref,
              colorScheme,
              showTranslated,
              activeTrack,
            ),
      icon: isLoading
          ? SizedBox(
              width: size24,
              height: size24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.onSurface,
              ),
            )
          : Stack(
              children: [
                Icon(Icons.translate_rounded, size: size24),
                if (hasTranslation)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: showTranslated.value
                            ? colorScheme.primary
                            : colorScheme.surface,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        targetLanguage ==
                                TranslateTargetLanguage.simplifiedChinese
                            ? '中'
                            : 'EN',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: showTranslated.value
                              ? colorScheme.onPrimary
                              : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  void _showTranslateMenu(
    WidgetRef ref,
    ColorScheme colorScheme,
    ValueNotifier<bool> showTranslated,
    ToneHarborTrackObject activeTrack,
  ) {
    final hasTranslation = ref.read(translateTextProvider).value != null;
    final l10n = ref.read(l10nProvider);

    showModalBottomSheetWidget(
      ref.context,
      colorScheme,
      (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.translate_lyrics,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            const Divider(height: 1),
            if (hasTranslation) ...[
              ListTile(
                leading: Icon(
                  showTranslated.value
                      ? Icons.lyrics_rounded
                      : Icons.translate_rounded,
                  size: 18,
                ),
                title: Text(
                  showTranslated.value
                      ? l10n.show_original_lyrics
                      : l10n.show_translated_lyrics,
                  style: const TextStyle(fontSize: 14),
                ),
                onTap: () {
                  showTranslated.value = !showTranslated.value;
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.save_rounded, size: 18),
                title: Text(
                  l10n.save_translated_lyrics,
                  style: const TextStyle(fontSize: 14),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  await _saveTranslatedLyrics(ref, activeTrack, showTranslated);
                },
              ),
            ],
            ListTile(
              leading: const Icon(Icons.translate_rounded, size: 18),
              title: Text(
                l10n.translate_lyrics,
                style: const TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pop(context);
                _translateLyrics(ref, showTranslated, colorScheme);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language_rounded, size: 18),
              title: Text(
                '${l10n.target_language}: ${ref.read(aITargetLanguageSettingProvider).displayName}',
                style: const TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pop(context);
                _showLanguageSelector(ref, colorScheme);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _translateLyrics(
    WidgetRef ref,
    ValueNotifier<bool> showTranslated,
    ColorScheme colorScheme,
  ) async {
    final currentLyrics = ref.read(currentLyricsProvider).value;
    if (currentLyrics == null || currentLyrics.isEmpty) {
      return;
    }

    final lyricsText = currentLyrics.lines
        .map((line) => line.toLrcString())
        .where((str) => str.isNotEmpty)
        .join('\n');

    if (lyricsText.isEmpty) {
      return;
    }

    final targetLanguage = ref.read(aITargetLanguageSettingProvider);
    await ref
        .read(translateTextProvider.notifier)
        .translate(lyricsText, target: targetLanguage);

    if (ref.read(translateTextProvider).value != null) {
      showTranslated.value = true;
    }
    if (ref.read(translateTextProvider).hasError) {
      logger.i("translate error: ${ref.read(translateTextProvider).error}");
      if (ref.context.mounted) {
        showSnackBar(
          ref.read(translateTextProvider).error.toString(),
          ref.context,
          colorScheme.secondary,
        );
      }
      return;
    }
  }

  Future<void> _saveTranslatedLyrics(
    WidgetRef ref,
    ToneHarborTrackObject activeTrack,
    ValueNotifier<bool> showTranslated,
  ) async {
    final currentLyrics = ref.read(currentLyricsProvider).value;
    final translatedText = ref.read(translateTextProvider).value;

    if (currentLyrics == null || translatedText == null) {
      return;
    }

    final translatedLyrics = Lyrics.fromString(translatedText);
    if (translatedLyrics == null) {
      return;
    }

    final mergedLyrics = Lyrics.fromJson(currentLyrics.toJson());

    mergedLyrics.merge(translatedLyrics);
    await lyricCache.set(
      activeTrack.id,
      mergedLyrics.toJson(),
      permanent: true,
    );

    ref.invalidate(currentLyricsProvider);
    ref.invalidate(translateTextProvider);
    showTranslated.value = false;
  }

  void _showLanguageSelector(WidgetRef ref, ColorScheme colorScheme) {
    final currentLanguage = ref.read(aITargetLanguageSettingProvider);

    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text(
          ref.read(l10nProvider).default_target_language,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: RadioGroup<TranslateTargetLanguage>(
          groupValue: currentLanguage,
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(aITargetLanguageSettingProvider.notifier)
                  .setTargetLanguage(value);
              Navigator.pop(context);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: TranslateTargetLanguage.values.map((language) {
              return RadioListTile<TranslateTargetLanguage>(
                title: Text(language.displayName),
                value: language,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showAudioDeviceMenu(WidgetRef ref, ColorScheme colorScheme) {
    final l10n = ref.read(l10nProvider);
    final devices = audioPlayer.audioDevices;
    final selectedDevice = audioPlayer.currentAudioDevice;
    final isAirPlaySupported = defaultTargetPlatform == TargetPlatform.iOS;

    showModalBottomSheetWidget(
      ref.context,
      colorScheme,
      (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.audio_device,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            const Divider(height: 1),
            if (isAirPlaySupported)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.airplay,
                      color: colorScheme.primary,
                      size: 22,
                    ),
                  ),
                  title: Text(
                    l10n.airplay_devices,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    l10n.airplay_tap_to_connect,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: AirPlayRoutePickerView(
                        width: 32,
                        height: 32,
                        tintColor: colorScheme.primary,
                        activeTintColor: colorScheme.primary,
                        backgroundColor: Colors.transparent,
                        prioritizesVideoDevices: false,
                      ),
                    ),
                  ),
                ),
              ),
            if (!isAirPlaySupported)
              if (devices.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    l10n.no_audio_devices_found,
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                )
              else
                ...devices.map((device) {
                  final isSelected = selectedDevice.name == device.name;
                  return ListTile(
                    leading: Icon(
                      _getDeviceIcon(device.name),
                      size: 20,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                    ),
                    title: Text(
                      device.description.isNotEmpty
                          ? device.description
                          : device.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    subtitle: device.description.isNotEmpty
                        ? Text(
                            device.name,
                            style: TextStyle(
                              fontSize: 12,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          )
                        : null,
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: colorScheme.primary)
                        : null,
                    onTap: () async {
                      Navigator.pop(context);
                      await audioPlayer.setAudioDevice(device);
                    },
                  );
                }),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  IconData _getDeviceIcon(String deviceName) {
    final name = deviceName.toLowerCase();
    if (name.contains('airplay') ||
        name.contains('apple tv') ||
        name.contains('homepod')) {
      return Icons.airplay;
    } else if (name.contains('bluetooth') || name.contains('bt')) {
      return Icons.bluetooth_audio;
    } else if (name.contains('headphone') ||
        name.contains('headset') ||
        name.contains('earphone')) {
      return Icons.headphones;
    } else if (name.contains('hdmi') || name.contains('displayport')) {
      return Icons.tv;
    } else if (name.contains('usb')) {
      return Icons.usb;
    } else if (name.contains('speaker') || name.contains('built-in')) {
      return Icons.speaker;
    }
    return Icons.speaker;
  }
}
