import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/favorite_playlist_state.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  final String currentPath;
  const HomeLayout({
    super.key,
    super.showLoading = false,
    super.offsetLeft = 200,
    required this.child,
    required this.currentPath,
  });

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final allMusicPath = '/songs/${Uri.encodeComponent(l10n.all_music)}';
    final allFoldersPath = '/folders/';
    final gradientDecoration = BoxDecoration(
      color: colorScheme.tertiary.withValues(alpha: 0.1),
    );

    final favoritePlaylist = ref.watch(favoritePlaylistStateProvider);
    var selectionTypeState = ref.watch(
      songSelectionProvider.select((state) {
        return SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: false,
        );
      }),
    );

    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 200,
              height: double.infinity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeInOutSine,
                decoration: gradientDecoration,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 8),
                        child: SearchHistoryTextField(
                          showHistoryIcon: false,
                          listTextStyle: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            labelText: l10n.search,
                            labelStyle: const TextStyle(fontSize: 14),
                            hintText: l10n.searchHint,
                            hintStyle: const TextStyle(fontSize: 14),
                            prefixIcon: const Icon(Icons.search, size: 16),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          onFocusChanged: (v) {
                            if (v) {
                              ref.invalidate(songSelectionProvider);
                            }
                          },
                          onSubmitSearch: (value) {
                            var r = value.trim();
                            if (r.isEmpty) return;
                            context.pushWrapper(
                              "/search/${Uri.encodeComponent(r)}",
                            );
                          },
                        ),
                      ),
                      _getItem(
                        currentPath == '/',
                        colorScheme,
                        Icons.recommend,
                        l10n.recommend,
                        () {
                          context.go('/');
                        },
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.music_house,
                              style: TextStyle(
                                fontSize: 15,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.house_rounded,
                              size: 16,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath == allMusicPath,
                        colorScheme,
                        Icons.library_music_rounded,
                        l10n.all_music,
                        () {
                          context.pushWrapper(
                            allMusicPath,
                            extra: (
                              songsProvider(limit: 100),
                              -1,
                              SongsPageSortAction.all,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath == '/albums/None',
                        colorScheme,
                        Icons.album_rounded,
                        l10n.albums,
                        () {
                          context.pushWrapper(
                            '/albums/None',
                            extra: albumsProvider(),
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath == '/artists',
                        colorScheme,
                        Icons.people_rounded,
                        l10n.artist,
                        () {
                          context.pushWrapper('/artists');
                        },
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath == '/playlist',
                        colorScheme,
                        Icons.play_lesson_rounded,
                        l10n.playlists,
                        () {
                          context.pushWrapper('/playlist');
                        },
                      ),

                      SizedBox(height: 8),
                      _getItem(
                        currentPath.startsWith(allFoldersPath),
                        colorScheme,
                        Icons.folder_rounded,
                        l10n.folder,
                        () {
                          context.pushWrapper(
                            "${allFoldersPath}None",
                            extra: (
                              foldersProvider(limit: 100),
                              <ToneHarborTrackObject>[],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.other,
                              style: TextStyle(
                                fontSize: 15,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.more_horiz_rounded,
                              size: 16,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath == '/download',
                        colorScheme,
                        Icons.download_for_offline,
                        l10n.download_center,
                        () {
                          context.pushWrapper('/download');
                        },
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath.startsWith('/local_songs/'),
                        colorScheme,
                        Icons.library_music_outlined,
                        l10n.local_songs,
                        () {
                          context.pushWrapper(
                            '/local_songs/${Uri.encodeComponent(l10n.local_songs)}',
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      _getItem(
                        currentPath.startsWith('/most_play/'),
                        colorScheme,
                        Icons.local_play_rounded,
                        l10n.most_play,
                        () {
                          context.pushWrapper(
                            '/most_play/${Uri.encodeComponent(l10n.most_play)}',
                          );
                        },
                      ),
                      if (favoritePlaylist.playlists.isNotEmpty) ...[
                        SizedBox(height: 5),
                        Divider(thickness: 1, indent: 12, endIndent: 12),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                            bottom: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: favoritePlaylist.playlists.map((item) {
                              final path =
                                  "/songs/${Uri.encodeComponent(item.title)}";
                              final isSelected = path == currentPath;
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onSecondaryTapDown: (detail) async {
                                  if (isSelected) {
                                    return;
                                  }
                                  await showCustomMenu<FavoritePlaylistItem>(
                                    context: context,
                                    globalPosition: detail.globalPosition,
                                    items: [
                                      PopupMenuItem(
                                        height: 30,
                                        enabled: false,
                                        child: Text(
                                          item.title,
                                          maxLines: 1,
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      PopupMenuDivider(),
                                      PopupMenuItem(
                                        height: 25,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.favorite_border_rounded,
                                              size: 18,
                                              color: colorScheme.onSurface
                                                  .withValues(alpha: 0.7),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              l10n.no_favorite_playlist,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: colorScheme.onSurface
                                                    .withValues(alpha: 0.7),
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          ref
                                              .read(
                                                favoritePlaylistStateProvider
                                                    .notifier,
                                              )
                                              .removeFavoritePlaylist(
                                                item.playlistId,
                                              );
                                        },
                                      ),
                                    ],
                                  );
                                },
                                child: _getItem(
                                  isSelected,
                                  colorScheme,
                                  Icons.file_present,
                                  item.title,
                                  () {
                                    context.pushWrapper(
                                      path,
                                      extra: (
                                        playlistDetailProvider(
                                          id: item.playlistId,
                                        ),
                                        -1,
                                        SongsPageSortAction.none,
                                      ),
                                    );
                                  },
                                  paddingContent:
                                      const EdgeInsetsGeometry.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  offsetWidth: 2,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: child),
                  if (!selectionTypeState.selectionType) BottomPlayer(),
                ],
              ),
            ),
          ],
        ),
        requestFlag
            ? const Center(child: AudioEqualizerLoader())
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _getItem(
    bool targetPage,
    ColorScheme colorScheme,
    IconData icon,
    String text,
    VoidCallback onTapCallback, {
    EdgeInsetsGeometry paddingContent = const EdgeInsets.symmetric(
      horizontal: 4,
      vertical: 8,
    ),
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 12),
    double offsetWidth = 8,
  }) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: () {
          if (!targetPage) {
            onTapCallback.call();
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: paddingContent,
          decoration: BoxDecoration(
            color: targetPage
                ? colorScheme.primary.withValues(alpha: 0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: targetPage
                    ? colorScheme.primary
                    : colorScheme.onSurface.withValues(alpha: 0.8),
              ),
              SizedBox(width: offsetWidth),
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: targetPage
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: targetPage
                        ? colorScheme.primary
                        : colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
