import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:lyricskit/lyricskit.dart";
import "package:toneharbor/init/initialized.dart";
import "package:toneharbor/models/audio_player/sub_content_state.dart";
import "package:toneharbor/models/audio_player/tone_harbor_track.dart";
import "package:toneharbor/providers/providers.dart";
import "package:toneharbor/providers/translate/translate_provider.dart";
import "package:toneharbor/services/audio_player/audio_player.dart";
import "package:toneharbor/services/translate/translate_service.dart";
import "package:toneharbor/utils/base_funs.dart";
import "package:toneharbor/widgets/layouts/base_bg_layout.dart";
import "package:toneharbor/widgets/pages/add_to_playlists_page.dart";
import "package:toneharbor/widgets/pages/lyrics_content_page.dart";
import "package:toneharbor/widgets/pages/playlist_page.dart";
import "package:toneharbor/widgets/widgets.dart";

class PlayingDetailLayout extends BaseBgLayout {
  const PlayingDetailLayout({super.key});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final audioPlayerState = ref.watch(audioPlayerStateProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final activeTrack = audioPlayerState.activeTrack;
    var size = MediaQuery.of(ref.context).size;
    double radius = size.height > size.width / 2 ? size.width / 2 : size.height;
    if (activeTrack == null) {
      return Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                ref.invalidate(subContentProvider);
                ref.context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_sharp),
            ),
          ),
          buildErrorView(ref.context, ref, colorScheme, () {}),
        ],
      );
    }
    final subContentState = ref.watch(subContentProvider);

    final showTranslated = useState(false);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 100),
    );
    useEffect(() {
      if (subContentState.type != SubContentType.none) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [subContentState]);
    final slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
        );
    final isLocal = activeTrack is ToneHarborTrackObjectLocal;

    useEffect(() {
      ref.invalidate(translateTextProvider);
      return null;
    }, [activeTrack.id]);

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSongIcon(ref, activeTrack, radius),
                          const SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: radius * 0.25,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: isLocal
                                      ? null
                                      : () {
                                          ref
                                              .read(subContentProvider.notifier)
                                              .set(
                                                SubContentData(
                                                  type: SubContentType
                                                      .addToPlayLists,
                                                  extra: activeTrack.id,
                                                ),
                                              );
                                        },
                                  icon: Icon(
                                    Icons.playlist_add_rounded,
                                    size: 24,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.push(
                                      "/switch_lyrics",
                                      extra: activeTrack,
                                    );
                                  },
                                  icon: Icon(Icons.lyrics_rounded, size: 24),
                                ),
                                _buildTranslateButton(
                                  ref,
                                  colorScheme,
                                  showTranslated,
                                  activeTrack,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Builder(
                      builder: (context) {
                        final originalLyrics = ref
                            .watch(currentLyricsProvider)
                            .value;
                        final translatedText = ref
                            .watch(translateTextProvider)
                            .value;

                        if (!showTranslated.value ||
                            originalLyrics == null ||
                            translatedText == null) {
                          return LyricsContentPage(
                            currentLyrics: originalLyrics,
                          );
                        }

                        final translatedLyrics = Lyrics.fromString(
                          translatedText,
                        );
                        if (translatedLyrics == null) {
                          return LyricsContentPage(
                            currentLyrics: originalLyrics,
                          );
                        }

                        final mergedLyrics = Lyrics.fromJson(
                          originalLyrics.toJson(),
                        );

                        mergedLyrics.merge(translatedLyrics);

                        return LyricsContentPage(currentLyrics: mergedLyrics);
                      },
                    ),
                  ),
                ],
              ),
            ),
            BottomPlayer(showArrowType: ShowArrowType.down),
          ],
        ),

        if (subContentState.type != SubContentType.none) ...[
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref
                    .read(subContentProvider.notifier)
                    .set(SubContentData(type: SubContentType.none));
              },
              onLongPress: () {
                ref
                    .read(subContentProvider.notifier)
                    .set(SubContentData(type: SubContentType.none));
              },
            ),
          ),
          SlideTransition(
            position: slideAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                switch (subContentState.type) {
                  SubContentType.playList => PlaylistPage(),
                  SubContentType.songInfo => SizedBox(),
                  SubContentType.addToPlayLists => AddToPlaylistsPage(
                    subContentState.extra ?? activeTrack.id,
                  ),
                  SubContentType.updateLyrics => SizedBox(),
                  SubContentType.none => const SizedBox(),
                },
              ],
            ),
          ),
        ],
      ],
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
  ) {
    final targetLanguage = ref.watch(zhipuTargetLanguageSettingProvider);
    final translateState = ref.watch(translateTextProvider);
    final isLoading = translateState.isLoading;
    final hasTranslation = translateState.value != null;

    return IconButton(
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
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.onSurface,
              ),
            )
          : Stack(
              children: [
                Icon(Icons.translate_rounded, size: 24),
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

    showModalBottomSheet(
      context: ref.context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  await _saveTranslatedLyrics(ref, activeTrack);
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
                _translateLyrics(ref, showTranslated);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language_rounded, size: 18),
              title: Text(
                '${l10n.target_language}: ${ref.read(zhipuTargetLanguageSettingProvider).displayName}',
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

    final targetLanguage = ref.read(zhipuTargetLanguageSettingProvider);
    await ref
        .read(translateTextProvider.notifier)
        .translate(lyricsText, target: targetLanguage);

    if (ref.read(translateTextProvider).value != null) {
      showTranslated.value = true;
    }
  }

  Future<void> _saveTranslatedLyrics(
    WidgetRef ref,
    ToneHarborTrackObject activeTrack,
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
  }

  void _showLanguageSelector(WidgetRef ref, ColorScheme colorScheme) {
    final currentLanguage = ref.read(zhipuTargetLanguageSettingProvider);

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
                  .read(zhipuTargetLanguageSettingProvider.notifier)
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
}
