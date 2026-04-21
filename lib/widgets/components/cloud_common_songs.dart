import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/pages/cloud_add_to_playlists_page.dart';

class CloudMusicSongsHorizontalListView extends HookConsumerWidget {
  const CloudMusicSongsHorizontalListView({
    super.key,
    required this.songs,
    required this.songsFlag,
    required this.colorScheme,
    required this.size,
    required this.l10n,
    this.artistId,
    this.defaultRows = 3,
    this.maxRows = 6,
  });

  final List<CloudMusicSongData>? songs;
  final int songsFlag;
  final ColorScheme colorScheme;
  final Size size;
  final AppLocalizations l10n;
  final int? artistId;
  final int defaultRows;
  final int maxRows;

  int _calculateColumns(Size size) {
    if (size.lgAndUp) {
      return 4;
    } else if (size.isMd) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (songsFlag == 1) {
      final columns = _calculateColumns(size);
      return _buildShimmerGrid(colorScheme, size, columns, defaultRows);
    }

    if (songsFlag == -1 || songs == null || songs!.isEmpty) {
      return const SizedBox.shrink();
    }

    final expanded = useState(false);
    final columns = _calculateColumns(size);
    final songsToShow = expanded.value
        ? songs!.take(maxRows * columns).toList()
        : songs!.take(defaultRows * columns).toList();
    final totalRows = (songsToShow.length / columns).ceil();
    final canExpand = songs!.length > defaultRows * columns;
    final canCollapse = expanded.value && totalRows > defaultRows;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSongGrid(
          context,
          ref,
          songsToShow.length,
          songs!,
          colorScheme,
          size,
          columns,
          totalRows,
          l10n,
          artistId,
        ),
        if (canExpand || canCollapse)
          Padding(
            padding: EdgeInsets.only(
              top: 8 * size.multiplier,
              bottom: 8 * size.multiplier,
            ),
            child: InkWell(
              onTap: () => expanded.value = !expanded.value,
              child: Text(
                expanded.value ? l10n.collapse : l10n.expand,
                style: TextStyle(
                  fontSize: 14 * size.multiplier,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSongGrid(
    BuildContext context,
    WidgetRef ref,
    int visibleSize,
    List<CloudMusicSongData> songs,
    ColorScheme colorScheme,
    Size size,
    int columns,
    int rows,
    AppLocalizations l10n,
    int? artistId,
  ) {
    final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);
    final user = ref.watch(cloudUserInfoProvider);
    final userVipType = user.value?.vipType ?? 0;
    return Column(
      children: List.generate(rows, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex < rows - 1 ? 8 * size.multiplier : 0,
          ),
          child: Row(
            children: List.generate(columns, (colIndex) {
              final index = rowIndex + colIndex * rows;
              if (index >= visibleSize) {
                return const Expanded(child: SizedBox());
              }
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: colIndex < columns - 1 ? 12 * size.multiplier : 0,
                  ),
                  child: _CloudMusicSongItem(
                    index: index,
                    song: songs[index],
                    songs: songs,
                    colorScheme: colorScheme,
                    size: size,
                    l10n: l10n,
                    isLoggedIn: isLoggedIn,
                    userVipType: userVipType,
                    artistId: artistId,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _buildShimmerGrid(
    ColorScheme colorScheme,
    Size size,
    int columns,
    int defaultRows,
  ) {
    final itemCount = columns * defaultRows;

    return Column(
      children: List.generate(defaultRows, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex < defaultRows - 1 ? 8 * size.multiplier : 0,
          ),
          child: Row(
            children: List.generate(columns, (colIndex) {
              final index = rowIndex + colIndex * defaultRows;
              if (index >= itemCount) {
                return const Expanded(child: SizedBox());
              }
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: colIndex < columns - 1 ? 12 * size.multiplier : 0,
                  ),
                  child: _CloudMusicSongShimmerItem(
                    colorScheme: colorScheme,
                    size: size,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

class _CloudMusicSongItem extends ConsumerWidget {
  const _CloudMusicSongItem({
    required this.index,
    required this.song,
    required this.songs,
    required this.colorScheme,
    required this.size,
    required this.l10n,
    required this.isLoggedIn,
    required this.userVipType,
    this.artistId,
  });

  final int index;
  final CloudMusicSongData song;
  final List<CloudMusicSongData> songs;
  final ColorScheme colorScheme;
  final Size size;
  final AppLocalizations l10n;
  final bool isLoggedIn;
  final int? userVipType;
  final int? artistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multiplier = size.multiplier;
    final isPlayable = isCloudTrackPlayable(
      song,
      l10n,
      isLoggedIn: isLoggedIn,
      userVipType: userVipType,
    );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8 * multiplier),
      child: ContextMenuRegion(
        enableDefaultGestures: true,
        contextMenu: ContextMenu(
          entriesBuilder: () {
            return <ContextMenuEntry>[
              MenuHeader(text: song.name),
              MenuDivider(),
              if (isPlayable.playable) ...[
                MenuItem(
                  label: Text(l10n.download),
                  icon: Icon(Icons.download_rounded),
                  onSelected: (value) async {
                    ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                    await ref
                        .read(downloadManagerProvider.notifier)
                        .addToQueue(song.asTrack());
                    ref
                        .read(requestFlagProvider.notifier)
                        .setRequestFlag(false);
                  },
                ),
                MenuItem.submenu(
                  label: Text(l10n.add_to),
                  icon: const Icon(Icons.add_box_rounded),
                  items: [
                    MenuItem(
                      label: Text(l10n.next_song),
                      onSelected: (value) async {
                        ref
                            .read(requestFlagProvider.notifier)
                            .setRequestFlag(true);
                        await ref
                            .read(audioPlayerStateProvider.notifier)
                            .addTrackAtFirst(
                              song.asTrack(),
                              allowDuplicates: true,
                            );
                        ref
                            .read(requestFlagProvider.notifier)
                            .setRequestFlag(false);
                      },
                    ),
                    MenuItem(
                      label: Text(l10n.play_queue),
                      onSelected: (value) async {
                        ref
                            .read(requestFlagProvider.notifier)
                            .setRequestFlag(true);
                        await ref
                            .read(audioPlayerStateProvider.notifier)
                            .addTrack(song.asTrack());
                        ref
                            .read(requestFlagProvider.notifier)
                            .setRequestFlag(false);
                      },
                    ),
                    if (isLoggedIn) ...[
                      MenuItem(
                        label: Text(l10n.song_playlist),
                        onSelected: (value) {
                          if (size.mdAndUp) {
                            showSlidePanel(
                              context: ref.context,
                              builder: (context) {
                                return CloudAddToPlaylistsPage(song.id);
                              },
                            );
                          } else {
                            showModalBottomSheetWidget(
                              ref.context,
                              colorScheme,
                              (context) {
                                return CloudAddToPlaylistsPage(song.id);
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ],
                ),
              ],
              MenuItem.submenu(
                label: Text(l10n.search),
                icon: const Icon(Icons.search_rounded),
                items: [
                  MenuItem(
                    label: Text(l10n.search_song),
                    onSelected: (value) async {
                      ref.context.pushWrapper(
                        "/search/${Uri.encodeComponent(song.name)}",
                      );
                    },
                  ),
                  if (song.ar != null && song.ar!.isNotEmpty) ...[
                    if (song.ar!.length == 1)
                      MenuItem(
                        label: Text(l10n.search_artist),
                        onSelected: (value) async {
                          ref.context.pushWrapper(
                            "/search/${Uri.encodeComponent(song.ar![0].name)}",
                          );
                        },
                      ),
                    if (song.ar!.length > 1)
                      MenuItem<void>.submenu(
                        label: Text(l10n.search_artist),
                        items: song.ar!
                            .map(
                              (e) => MenuItem<void>(
                                label: Text(e.name),
                                onSelected: (value) async {
                                  ref.context.pushWrapper(
                                    "/search/${Uri.encodeComponent(e.name)}",
                                  );
                                },
                              ),
                            )
                            .toList(),
                      ),
                  ],
                  if (song.al != null)
                    MenuItem(
                      label: Text(l10n.search_album),
                      onSelected: (value) async {
                        ref.context.pushWrapper(
                          "/search/${Uri.encodeComponent(song.al!.name)}",
                        );
                      },
                    ),
                ],
              ),
              MenuDivider(),
              if (song.ar != null && song.ar!.length > 1) ...[
                MenuItem.submenu(
                  label: Text(l10n.artist_profile),
                  icon: const Icon(Icons.person_rounded),
                  items: [
                    ...song.ar!.map(
                      (artist) => MenuItem(
                        icon: const Icon(Icons.person_rounded),
                        label: Text(artist.name),
                        onSelected: (value) async {
                          if (artist.id != artistId) {
                            context.pushWrapper(
                              "/cloud-artist-detail",
                              extra: artist,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
              if (song.al != null)
                MenuItem(
                  label: Text(song.al!.name),
                  icon: const Icon(Icons.album_rounded),
                  onSelected: (value) async {
                    context.pushWrapper("/cloud-album-detail", extra: song.al!);
                  },
                ),
            ];
          },
          padding: const EdgeInsets.all(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8 * multiplier),
          hoverColor: colorScheme.surface.withValues(alpha: 0.3),
          onTap: isPlayable.playable
              ? () async {
                  var targetTracks = <ToneHarborTrackObject>[];
                  var initIndex = index;
                  final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
                  final user = await ref.read(cloudUserInfoProvider.future);
                  final userVipType = user?.vipType ?? 0;

                  for (var i = 0; i < songs.length; i++) {
                    var currentTrack = songs[i];
                    final isPlayable = isCloudTrackPlayable(
                      currentTrack,
                      l10n,
                      isLoggedIn: isLoggedIn,
                      userVipType: userVipType,
                    );
                    if (isPlayable.playable) {
                      if (initIndex == i) {
                        initIndex = targetTracks.length;
                      }
                      targetTracks.add(currentTrack.asTrack());
                    }
                  }
                  if (targetTracks.isEmpty) return;
                  await ref
                      .read(audioPlayerStateProvider.notifier)
                      .load(
                        targetTracks,
                        initialIndex: initIndex < targetTracks.length
                            ? initIndex
                            : 0,
                        autoPlay: true,
                      );
                }
              : null,
          child: Stack(
            children: [
              Container(
                height: 56 * multiplier,
                padding: EdgeInsets.symmetric(horizontal: 8 * multiplier),
                child: Row(
                  children: [
                    CloudMusicCoverImage(
                      imageUrl: song.coverUrl(),
                      colorScheme: colorScheme,
                      config: CloudMusicCoverImageConfig(
                        size: 50 * multiplier,
                        borderRadius: 12 * multiplier,
                      ),
                    ),
                    SizedBox(width: 8 * multiplier),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            song.name,
                            style: TextStyle(
                              fontSize: 16 * multiplier,
                              fontWeight: FontWeight.bold,
                              color: isPlayable.playable
                                  ? colorScheme.onSurface
                                  : Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2 * multiplier),
                          Text(
                            song.artistName,
                            style: TextStyle(
                              fontSize: 13 * multiplier,
                              color: isPlayable.playable
                                  ? colorScheme.onSurfaceVariant
                                  : Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isPlayable.playable)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2 * multiplier,
                      vertical: 2 * multiplier,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      isPlayable.reason ?? l10n.paid_album,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 6 * multiplier,
                        fontWeight: FontWeight.bold,
                      ),
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

class _CloudMusicSongShimmerItem extends StatelessWidget {
  const _CloudMusicSongShimmerItem({
    required this.colorScheme,
    required this.size,
  });

  final ColorScheme colorScheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final multiplier = size.multiplier;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      highlightColor: colorScheme.surface.withValues(alpha: 1.0),
      child: Container(
        height: 56 * multiplier,
        padding: EdgeInsets.symmetric(horizontal: 8 * multiplier),
        child: Row(
          children: [
            Container(
              width: 50 * multiplier,
              height: 50 * multiplier,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12 * multiplier),
              ),
            ),
            SizedBox(width: 8 * multiplier),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 16 * multiplier,
                    width: 120 * multiplier,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 2 * multiplier),
                  Container(
                    height: 14 * multiplier,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
