import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/audio_player/lyrics_cache_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/layouts/base_bg_layout.dart';
import 'package:toneharbor/widgets/pages/lyrics_content_page.dart';
import 'package:toneharbor/widgets/pages/playlist_page.dart';
import 'package:toneharbor/widgets/widgets.dart';

class SwitchLyricsLayout extends BaseBgLayout {
  final ToneHarborTrackObject songTrackObject;
  const SwitchLyricsLayout({super.key, required this.songTrackObject});
  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var audioPlayState = ref.watch(audioPlayerStateProvider);
    var l10n = ref.watch(l10nProvider);
    var activeTrack = audioPlayState.activeTrack;
    var songId = useState(songTrackObject.id);
    var title = useState(songTrackObject.title);
    var selectedIndex = useState(-1);
    final isPlaylistPage = useState(false);
    var artist = useState(
      songTrackObject.artist == "Unknown Artist" ? "" : songTrackObject.artist,
    );
    var currentTrack = useState(songTrackObject);
    var defaultLyrics = ref.watch(getLyricsProvider(songId: songId.value));
    final titleController = useTextEditingController();
    final artistController = useTextEditingController();
    final searchTerm = useState(
      SearchTerm(title: title.value, artist: artist.value),
    );
    final searchProvider = ref.watch(
      combinedSearchProvider(searchTerm.value, sorted: true),
    );

    useEffect(() {
      songId.value = currentTrack.value.id;
      title.value = currentTrack.value.title;
      artist.value = currentTrack.value.artist == "Unknown Artist"
          ? ""
          : currentTrack.value.artist;
      selectedIndex.value = -1;
      titleController.text = title.value;
      artistController.text = artist.value;
      searchTerm.value = SearchTerm(title: title.value, artist: artist.value);
      ref.invalidate(getLyricsProvider);
      ref.invalidate(combinedSearchProvider);
      return null;
    }, [currentTrack.value]);

    final colorScheme = getColorSchemeWhenReady(ref);
    final gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.8, -0.8),
        end: Alignment(0.8, 0.8),
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        colors: [
          colorScheme.surface,
          colorScheme.surfaceContainerHighest,
          colorScheme.surface,
          colorScheme.surfaceContainerHighest,
          colorScheme.surface,
        ],
      ),
    );
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 100),
    );

    useEffect(() {
      void onTextChanged() {
        title.value = titleController.text;
      }

      titleController.addListener(onTextChanged);
      return () {
        titleController.removeListener(onTextChanged);
      };
    }, [titleController]);

    useEffect(() {
      void onTextChanged() {
        artist.value = artistController.text;
      }

      artistController.addListener(onTextChanged);
      return () {
        artistController.removeListener(onTextChanged);
      };
    }, [artistController]);

    useEffect(() {
      if (isPlaylistPage.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [isPlaylistPage.value]);

    var callBack = useCallback(() {
      if (title.value.isEmpty) {
        showSnackBar(l10n.input_title_empty, context, colorScheme.secondary);
        return;
      }
      selectedIndex.value = -1;
      searchTerm.value.update(title: title.value, artist: artist.value);
      ref.invalidate(combinedSearchProvider);
    }, []);

    final slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
        );
    var width = MediaQuery.of(context).size.width;
    const itemHeight = 56.0;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: width * 0.25,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeInOutSine,
                decoration: gradientDecoration,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 15,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(fontSize: 14),
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: "标题",
                              hintText: '输入歌曲标题',
                              prefixIcon: Icon(Icons.music_note, size: 18),
                              suffixIcon:
                                  activeTrack != currentTrack.value &&
                                      activeTrack != null
                                  ? (IconButton(
                                      onPressed: () {
                                        currentTrack.value = activeTrack;
                                      },
                                      icon: Icon(Icons.sync, size: 18),
                                      tooltip: "同步",
                                    ))
                                  : (currentTrack.value.title != title.value)
                                  ? IconButton(
                                      onPressed: () {
                                        titleController.text =
                                            currentTrack.value.title;
                                      },
                                      icon: Icon(Icons.restore, size: 18),
                                      tooltip: "恢复默认标题",
                                    )
                                  : null,
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            style: TextStyle(fontSize: 14),
                            controller: artistController,
                            decoration: InputDecoration(
                              labelText: "歌手",
                              hintText: '输入歌曲歌手',
                              prefixIcon: Icon(Icons.person, size: 18),
                              suffixIcon:
                                  activeTrack != currentTrack.value &&
                                      activeTrack != null
                                  ? (IconButton(
                                      onPressed: () {
                                        currentTrack.value = activeTrack;
                                      },
                                      icon: Icon(Icons.sync, size: 18),
                                      tooltip: "同步",
                                    ))
                                  : (currentTrack.value.artist !=
                                            artist.value &&
                                        currentTrack.value.artist !=
                                            "Unknown Artist")
                                  ? IconButton(
                                      onPressed: () {
                                        artistController.text =
                                            currentTrack.value.artist;
                                      },
                                      icon: Icon(Icons.restore, size: 18),
                                      tooltip: "恢复默认歌手",
                                    )
                                  : null,
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) => callBack(),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 35),
                      ),
                      onPressed: callBack,
                      icon: Icon(Icons.search, size: 16),
                      label: const Text('搜索', style: TextStyle(fontSize: 14)),
                    ),

                    SizedBox(height: 15),
                    if (searchProvider.isLoading)
                      Expanded(
                        child: Center(
                          child: Transform.scale(
                            scale: 0.7,
                            child: const AudioEqualizerLoader(),
                          ),
                        ),
                      ),
                    if (searchProvider.hasError)
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                searchProvider.error.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 15),
                              ElevatedButton.icon(
                                onPressed: () => callBack(),
                                label: const Text(
                                  '重试',
                                  style: TextStyle(fontSize: 16),
                                ),
                                icon: Icon(Icons.refresh_rounded, size: 18),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (searchProvider.hasValue &&
                        !searchProvider.isLoading &&
                        !searchProvider.hasError)
                      Expanded(
                        child: ListView.builder(
                          itemCount: searchProvider.value!.length,
                          itemBuilder: (context, index) {
                            var lyricsList = searchProvider.value!;
                            final lyric = lyricsList[index];
                            final title =
                                lyric.idTags[IDTagKey('title')] ?? '未知标题';
                            final artist =
                                lyric.idTags[IDTagKey('artist')] ?? '未知艺术家';
                            final source =
                                lyric.idTags[IDTagKey('source')] ?? '未知来源';
                            var isSelected = selectedIndex.value == index;

                            return Container(
                              height: itemHeight,
                              color: isSelected
                                  ? colorScheme.primaryContainer.withValues(
                                      alpha: .3,
                                    )
                                  : Colors.transparent,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  horizontalTitleGap: 0,
                                  titleAlignment: ListTileTitleAlignment.center,
                                  leading: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                  minTileHeight: itemHeight,
                                  title: isSelected
                                      ? SmartMarquee(
                                          alignment: Alignment.centerLeft,
                                          text: title,
                                          style: TextStyle(fontSize: 13),
                                          pauseAfterRound: Duration(seconds: 1),
                                        )
                                      : Text(
                                          title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                  subtitle: isSelected
                                      ? SmartMarquee(
                                          alignment:
                                              AlignmentGeometry.centerLeft,
                                          text: artist,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: isSelected
                                                ? colorScheme.primary
                                                      .withValues(alpha: .8)
                                                : colorScheme.onSurface
                                                      .withValues(alpha: .8),
                                          ),
                                          pauseAfterRound: Duration(seconds: 1),
                                        )
                                      : Text(
                                          artist,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: isSelected
                                                ? colorScheme.primary
                                                      .withValues(alpha: .8)
                                                : colorScheme.onSurface
                                                      .withValues(alpha: .8),
                                          ),
                                        ),
                                  trailing: Text(
                                    source,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: isSelected
                                          ? colorScheme.primary.withValues(
                                              alpha: .8,
                                            )
                                          : colorScheme.onSurface.withValues(
                                              alpha: .4,
                                            ),
                                      fontSize: 9,
                                    ),
                                  ),
                                  selected: isSelected,
                                  onTap: () {
                                    selectedIndex.value = index;
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  AppBar(
                    toolbarOpacity: 0.5,
                    centerTitle: false,
                    title: Text(
                      l10n.switch_lyrics,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          selectedIndex.value = -1;
                        },
                        icon: Icon(Icons.restore_rounded, size: 18),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (searchProvider.hasValue &&
                              selectedIndex.value != -1) {
                            var currentLyrics =
                                searchProvider.value![selectedIndex.value];
                            await lyricCache.set(
                              songId.value,
                              currentLyrics.toJson(),
                              permanent: true,
                            );
                            ref.invalidate(getLyricsProvider);
                            ref.invalidate(currentLyricsProvider);
                            if (context.mounted) {
                              showSnackBar(
                                "保存成功",
                                context,
                                colorScheme.primary,
                              );
                            }
                          }
                        },
                        icon: Icon(Icons.save_rounded, size: 18),
                      ),
                    ],
                  ),

                  Expanded(
                    child: LyricsContentPage(
                      currentLyrics:
                          (selectedIndex.value != -1 &&
                              !searchProvider.hasError &&
                              !searchProvider.isLoading)
                          ? searchProvider.value![selectedIndex.value]
                          : defaultLyrics.value,
                    ),
                  ),
                  BottomPlayer(() {
                    isPlaylistPage.value = true;
                  }, showArrowType: ShowArrowType.none),
                ],
              ),
            ),
          ],
        ),
        if (isPlaylistPage.value)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                isPlaylistPage.value = false;
              },
              onLongPress: () {
                isPlaylistPage.value = false;
              },
            ),
          ),
        if (isPlaylistPage.value)
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
