import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';
import 'package:toneharbor/widgets/widgets.dart';

class SwitchLyricsLayout extends BaseBgLayout {
  final ToneHarborTrackObject songTrackObject;
  const SwitchLyricsLayout({
    super.key,
    required this.songTrackObject,
    super.appbar = false,
  });

  static const double _itemHeight = 56.0;

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    var audioPlayState = ref.watch(audioPlayerStateProvider);
    var l10n = ref.watch(l10nProvider);
    var activeTrack = audioPlayState.activeTrack;
    var songId = useState(songTrackObject.id);
    var title = useState(songTrackObject.title);
    var selectedIndex = useState(-1);
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
      color: colorScheme.tertiary.withValues(alpha: 0.1),
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

    var callBack = useCallback(() {
      if (title.value.isEmpty) {
        showSnackBar(l10n.input_title_empty, context, colorScheme.secondary);
        return;
      }
      selectedIndex.value = -1;
      searchTerm.value.update(title: title.value, artist: artist.value);
      ref.invalidate(combinedSearchProvider);
    }, []);

    var size = MediaQuery.of(context).size;
    if (size.lgAndUp) {
      {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).padding.top + kToolbarHeight,
                  color: colorScheme.tertiary.withValues(alpha: 0.1),
                ),
              ),

              SafeArea(
                top: true,
                bottom: false,
                child: Row(
                  children: [
                    SizedBox(
                      width: min(size.width * 0.3, 300),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.easeInOutSine,
                        decoration: gradientDecoration,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 8),
                          child: _getListLyrics(
                            titleController,
                            artistController,
                            l10n,
                            activeTrack,
                            currentTrack,
                            title,
                            artist,
                            colorScheme,
                            searchProvider,
                            callBack,
                            selectedIndex,
                            size,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          _appBar(
                            ref,
                            l10n,
                            selectedIndex,
                            songId,
                            searchProvider,
                            colorScheme,
                          ),

                          Expanded(
                            child: _lyricsContent(
                              size.xlAndUp ? 3 : 0,
                              selectedIndex,
                              songId,
                              searchProvider,
                              defaultLyrics,
                            ),
                          ),
                          BottomPlayer(showArrowType: ShowArrowType.none),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    }
    final tabController = useTabController(initialLength: 2);
    return SafeArea(
      top: true,
      bottom: false,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 0,
            child: IconButton(
              onPressed: () {
                context.popWrap();
              },
              icon: Icon(Icons.arrow_back_ios_sharp, size: 18),
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  getActionMenuItem(
                    () {
                      selectedIndex.value = -1;
                    },
                    l10n.reset_default,
                    Icons.restore_rounded,
                  ),
                  getActionMenuItem(
                    () async {
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
                        if (ref.context.mounted) {
                          showSnackBar(
                            l10n.save_success,
                            ref.context,
                            colorScheme.primary,
                          );
                        }
                      }
                    },
                    l10n.save,
                    Icons.save_rounded,
                  ),
                ];
              },
              icon: Icon(Icons.more_vert_rounded, size: 18),
              tooltip: l10n.more,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            children: [
              Center(
                child: Material(
                  color: colorScheme.tertiary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.antiAlias,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 200 * size.multiplier2,
                      maxHeight: 40 * size.multiplier2,
                    ),
                    child: TabBar(
                      controller: tabController,
                      labelColor: colorScheme.primary,
                      labelStyle: TextStyle(
                        fontSize: 16 * size.multiplier2,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14 * size.multiplier2,
                        fontWeight: FontWeight.normal,
                      ),
                      unselectedLabelColor: colorScheme.onSurface,
                      indicatorColor: colorScheme.primary,
                      tabs: [
                        Tab(text: l10n.lyrics_provider),
                        Tab(text: l10n.lyrics),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _getListLyrics(
                      titleController,
                      artistController,
                      l10n,
                      activeTrack,
                      currentTrack,
                      title,
                      artist,
                      colorScheme,
                      searchProvider,
                      callBack,
                      selectedIndex,
                      size,
                      tabController: tabController,
                    ),
                    _lyricsContent(
                      size.isXs ? -1 : 0,
                      selectedIndex,
                      songId,
                      searchProvider,
                      defaultLyrics,
                    ),
                  ],
                ),
              ),
              BottomPlayer(showArrowType: ShowArrowType.none),
            ],
          ),
        ],
      ),
    );
  }

  Widget _lyricsContent(
    double extraFontSize,
    ValueNotifier<int> selectedIndex,
    ValueNotifier<String> songId,
    AsyncValue<List<Lyrics>> searchProvider,
    AsyncValue<Lyrics?> defaultLyrics,
  ) {
    return LyricsContentPage(
      currentLyrics:
          (selectedIndex.value != -1 &&
              !searchProvider.hasError &&
              !searchProvider.isLoading)
          ? searchProvider.value![selectedIndex.value]
          : defaultLyrics.value,
      extraFontSize: extraFontSize,
    );
  }

  Widget _appBar(
    WidgetRef ref,
    AppLocalizations l10n,
    ValueNotifier<int> selectedIndex,
    ValueNotifier<String> songId,
    AsyncValue<List<Lyrics>> searchProvider,
    ColorScheme colorScheme,
  ) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: Text(
        l10n.switch_lyrics,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: () {
          ref.context.popWrap();
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
            if (searchProvider.hasValue && selectedIndex.value != -1) {
              var currentLyrics = searchProvider.value![selectedIndex.value];
              await lyricCache.set(
                songId.value,
                currentLyrics.toJson(),
                permanent: true,
              );
              ref.invalidate(getLyricsProvider);
              ref.invalidate(currentLyricsProvider);
              if (ref.context.mounted) {
                showSnackBar(
                  l10n.save_success,
                  ref.context,
                  colorScheme.primary,
                );
              }
            }
          },
          icon: Icon(Icons.save_rounded, size: 18),
        ),
      ],
    );
  }

  Widget _getListLyrics(
    TextEditingController titleController,
    TextEditingController artistController,
    AppLocalizations l10n,
    ToneHarborTrackObject? activeTrack,
    ValueNotifier<ToneHarborTrackObject> currentTrack,
    ValueNotifier<String> title,
    ValueNotifier<String> artist,
    ColorScheme colorScheme,
    AsyncValue<List<Lyrics>> searchProvider,
    Function() callBack,
    ValueNotifier<int> selectedIndex,
    Size size, {
    TabController? tabController,
  }) {
    return Column(
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
                  labelText: l10n.title,
                  hintText: l10n.input_song_title,
                  prefixIcon: Icon(Icons.music_note, size: 18),
                  suffixIcon:
                      activeTrack != currentTrack.value && activeTrack != null
                      ? (IconButton(
                          onPressed: () {
                            currentTrack.value = activeTrack;
                          },
                          icon: Icon(Icons.sync, size: 18),
                          tooltip: l10n.sync,
                        ))
                      : (currentTrack.value.title != title.value)
                      ? IconButton(
                          onPressed: () {
                            titleController.text = currentTrack.value.title;
                          },
                          icon: Icon(Icons.restore, size: 18),
                          tooltip: l10n.restore_default,
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
                  labelText: l10n.artist,
                  hintText: l10n.input_song_artist,
                  prefixIcon: Icon(Icons.person, size: 18),
                  suffixIcon:
                      activeTrack != currentTrack.value && activeTrack != null
                      ? (IconButton(
                          onPressed: () {
                            currentTrack.value = activeTrack;
                          },
                          icon: Icon(Icons.sync, size: 18),
                          tooltip: l10n.sync,
                        ))
                      : (currentTrack.value.artist != artist.value &&
                            currentTrack.value.artist != "Unknown Artist")
                      ? IconButton(
                          onPressed: () {
                            artistController.text = currentTrack.value.artist;
                          },
                          icon: Icon(Icons.restore, size: 18),
                          tooltip: l10n.restore_default,
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
          style: ElevatedButton.styleFrom(fixedSize: const Size(120, 35)),
          onPressed: callBack,
          icon: Icon(Icons.search, size: 16),
          label: Text(l10n.search, style: TextStyle(fontSize: 14)),
        ),

        SizedBox(height: 15),
        if (searchProvider.isLoading)
          Expanded(
            child: CommonShimmerLoader.lyricsList(
              colorScheme: colorScheme,
              size: size,
              itemCount: 20,
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
                    label: Text(l10n.retry, style: TextStyle(fontSize: 16)),
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
                return _LyricsListItem(
                  index: index,
                  lyric: searchProvider.value![index],
                  isSelected: selectedIndex.value == index,
                  onTap: () {
                    selectedIndex.value = index;
                    tabController?.index = 1;
                  },
                  colorScheme: colorScheme,
                  l10n: l10n,
                );
              },
            ),
          ),
      ],
    );
  }
}

class _LyricsListItem extends StatelessWidget {
  final int index;
  final Lyrics lyric;
  final bool isSelected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final AppLocalizations l10n;

  const _LyricsListItem({
    required this.index,
    required this.lyric,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final title = lyric.idTags[IDTagKey('title')] ?? l10n.unknown_title;
    final artist = lyric.idTags[IDTagKey('artist')] ?? l10n.unknown_artist;
    final source = lyric.idTags[IDTagKey('source')] ?? l10n.unknown_source;

    return Container(
      height: SwitchLyricsLayout._itemHeight,
      color: isSelected
          ? colorScheme.primaryContainer.withValues(alpha: .3)
          : Colors.transparent,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          horizontalTitleGap: 0,
          titleAlignment: ListTileTitleAlignment.center,
          leading: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 12, color: colorScheme.primary),
          ),
          minTileHeight: SwitchLyricsLayout._itemHeight,
          title: isSelected
              ? SmartMarquee(
                  alignment: Alignment.centerLeft,
                  text: title,
                  style: const TextStyle(fontSize: 13),
                  pauseAfterRound: const Duration(seconds: 1),
                )
              : Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
          subtitle: _buildSubtitle(artist),
          trailing: Text(
            source,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: isSelected
                  ? colorScheme.primary.withValues(alpha: .8)
                  : colorScheme.onSurface.withValues(alpha: .4),
              fontSize: 9,
            ),
          ),
          selected: isSelected,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _buildSubtitle(String artist) {
    final color = isSelected
        ? colorScheme.primary.withValues(alpha: .8)
        : colorScheme.onSurface.withValues(alpha: .8);

    return isSelected
        ? SmartMarquee(
            alignment: AlignmentGeometry.centerLeft,
            text: artist,
            style: TextStyle(fontSize: 11, color: color),
            pauseAfterRound: const Duration(seconds: 1),
          )
        : Text(
            artist,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11, color: color),
          );
  }
}
