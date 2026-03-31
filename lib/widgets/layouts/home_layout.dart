import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class HomeLayout extends BaseBgLayout {
  final Widget child;
  final String currentPath;
  const HomeLayout({
    super.key,
    super.showLoading = false,
    required this.child,
    required this.currentPath,
  });

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final allMusicPath = '/songs/${Uri.encodeComponent(l10n.all_music)}';
    final allFoldersPath = '/folders/';

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
            ResponsiveSidebar(
              colorScheme: colorScheme,
              l10n: l10n,
              currentPath: currentPath,
              allMusicPath: allMusicPath,
              allFoldersPath: allFoldersPath,
              favoritePlaylist: favoritePlaylist,
              width: 200,
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
}

class ResponsiveSidebar extends StatelessWidget {
  final ColorScheme colorScheme;
  final dynamic l10n;
  final String currentPath;
  final String allMusicPath;
  final String allFoldersPath;
  final dynamic favoritePlaylist;
  final double width;

  const ResponsiveSidebar({
    super.key,
    required this.colorScheme,
    required this.l10n,
    required this.currentPath,
    required this.allMusicPath,
    required this.allFoldersPath,
    required this.favoritePlaylist,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
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

    return SizedBox(
      width: width,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeInOutSine,
        decoration: gradientDecoration,
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
                onFocusChanged: (v) {},
                onSubmitSearch: (value) {
                  var r = value.trim();
                  if (r.isEmpty) return;
                  context.push("/search/${Uri.encodeComponent(r)}");
                },
              ),
            ),
            _buildNavItem(
              currentPath == '/',
              Icons.recommend,
              l10n.recommend,
              () => context.go('/'),
            ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.music_house,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  Icon(
                    Icons.house_rounded,
                    size: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            _buildNavItem(
              currentPath == allMusicPath,
              Icons.library_music_rounded,
              l10n.all_music,
              () => context.push(
                allMusicPath,
                extra: (songsProvider(limit: 100), -1, SongsPageSortAction.all),
              ),
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              currentPath == '/albums/None',
              Icons.album_rounded,
              l10n.albums,
              () => context.push('/albums/None', extra: albumsProvider()),
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              currentPath == '/artists',
              Icons.people_rounded,
              l10n.artist,
              () => context.push('/artists'),
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              currentPath == '/playlist',
              Icons.play_lesson_rounded,
              l10n.playlists,
              () => context.push('/playlist'),
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              currentPath.startsWith(allFoldersPath),
              Icons.folder_rounded,
              l10n.folder,
              () => context.push(
                "${allFoldersPath}None",
                extra: (foldersProvider(limit: 100), <ToneHarborTrackObject>[]),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.other,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  Icon(
                    Icons.more_horiz_rounded,
                    size: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            _buildNavItem(
              currentPath == '/download',
              Icons.download_for_offline,
              l10n.download_center,
              () => context.push('/download'),
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              currentPath.startsWith('/local_songs/'),
              Icons.library_music_outlined,
              l10n.local_songs,
              () => context.push(
                '/local_songs/${Uri.encodeComponent(l10n.local_songs)}',
              ),
            ),
            const SizedBox(height: 8),
            _buildNavItem(
              currentPath.startsWith('/most_play/'),
              Icons.local_play_rounded,
              l10n.most_play,
              () => context.push(
                '/most_play/${Uri.encodeComponent(l10n.most_play)}',
              ),
            ),
            if (favoritePlaylist.playlists.isNotEmpty) ...[
              const SizedBox(height: 5),
              const Divider(thickness: 1, indent: 12, endIndent: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: favoritePlaylist.playlists.map<Widget>((item) {
                        final path =
                            "/songs/${Uri.encodeComponent(item.title)}";
                        final isSelected = path == currentPath;
                        return _buildNavItem(
                          isSelected,
                          Icons.file_present,
                          item.title,
                          () => context.push(
                            path,
                            extra: (
                              playlistDetailProvider(id: item.playlistId),
                              -1,
                              SongsPageSortAction.none,
                            ),
                          ),
                          paddingContent: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          offsetWidth: 2,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    bool targetPage,
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
        onTap: targetPage ? null : onTapCallback,
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
              if (offsetWidth > 0) SizedBox(width: offsetWidth),
              if (offsetWidth > 0)
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
