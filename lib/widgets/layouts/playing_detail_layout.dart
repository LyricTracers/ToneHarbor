import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
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
                                _buildTranslateButton(ref, colorScheme),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: LyricsContentPage(
                      currentLyrics: ref.watch(currentLyricsProvider).value,
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

  Widget _buildTranslateButton(WidgetRef ref, ColorScheme colorScheme) {
    final targetLanguage = ref.watch(zhipuTargetLanguageSettingProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            _translateLyrics(ref);
          },
          icon: Icon(Icons.translate_rounded, size: 24),
        ),
        GestureDetector(
          onTap: () => _showLanguageSelector(ref, colorScheme),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 10,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                SizedBox(width: 2),
                Text(
                  targetLanguage == TranslateTargetLanguage.simplifiedChinese
                      ? '中'
                      : 'EN',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _translateLyrics(WidgetRef ref) async {
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

    final translatedText = ref.read(translateTextProvider).value;
    if (translatedText != null) {
      print('Translated lyrics:\n$translatedText');
    }
  }

  void _showLanguageSelector(WidgetRef ref, ColorScheme colorScheme) {
    final currentLanguage = ref.read(zhipuTargetLanguageSettingProvider);

    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text(
          '选择翻译语言',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: TranslateTargetLanguage.values.map((language) {
            return RadioListTile<TranslateTargetLanguage>(
              title: Text(language.displayName),
              value: language,
              groupValue: currentLanguage,
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(zhipuTargetLanguageSettingProvider.notifier)
                      .setTargetLanguage(value);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
