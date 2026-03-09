import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
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
                  Expanded(flex: 3, child: Text("1")),
                  Expanded(flex: 4, child: LyricsContentPage()),
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
}
