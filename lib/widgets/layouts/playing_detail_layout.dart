import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:toneharbor/providers/providers.dart";
import "package:toneharbor/services/audio_player/audio_player.dart";
import "package:toneharbor/utils/base_funs.dart";
import "package:toneharbor/widgets/layouts/base_bg_layout.dart";
import "package:toneharbor/widgets/pages/lyrics_content_page.dart";
import "package:toneharbor/widgets/pages/playlist_page.dart";
import "package:toneharbor/widgets/widgets.dart";

enum PlayingSubContent { none, playList, songInfo, updateLyrics }

class PlayingDetailLayout extends BaseBgLayout {
  const PlayingDetailLayout({super.key});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var playingSubContent = useState(PlayingSubContent.none);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 100),
    );
    useEffect(() {
      if (playingSubContent.value != PlayingSubContent.none) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [playingSubContent.value]);
    final slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
        );
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 1, child: Center(child: _buildSongIcon(ref))),
                  Expanded(flex: 1, child: LyricsContentPage()),
                ],
              ),
            ),
            BottomPlayer(() {
              playingSubContent.value = PlayingSubContent.playList;
            }, showArrowUp: false),
          ],
        ),
        if (playingSubContent.value != PlayingSubContent.none)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                playingSubContent.value = PlayingSubContent.none;
              },
              onLongPress: () {
                playingSubContent.value = PlayingSubContent.none;
              },
            ),
          ),
        if (playingSubContent.value == PlayingSubContent.playList)
          SlideTransition(
            position: slideAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [PlaylistPage()],
            ),
          ),
      ],
    );
  }

  Widget _buildSongIcon(WidgetRef ref) {
    final audioPlayerState = ref.watch(audioPlayerStateProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final activeTrack = audioPlayerState.activeTrack;
    var size = MediaQuery.of(ref.context).size;
    if (activeTrack == null) {
      return buildErrorView(ref.context, ref, colorScheme, size.height, () {});
    }
    var radius = size.height > size.width / 2 ? size.width / 2 : size.height;
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
}
