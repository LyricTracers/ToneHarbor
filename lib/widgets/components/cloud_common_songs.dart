import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/services/cloud_music/playlists.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_music_cover_image.dart';
import 'package:toneharbor/widgets/components/common_track_list_item.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';
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
                if (ref.read(aria2EnabledProvider)) ...[
                  MenuItem(
                    label: Text("Aria2 Download"),
                    icon: Icon(Icons.cloud_download_rounded),
                    onSelected: (value) async {
                      ref
                          .read(requestFlagProvider.notifier)
                          .setRequestFlag(true);
                      final result = await ref
                          .read(aria2ClientProvider.notifier)
                          .addDownloadTask(song.asTrack());
                      ref
                          .read(requestFlagProvider.notifier)
                          .setRequestFlag(false);

                      if (!ref.context.mounted) {
                        return;
                      }
                      showSnackBar(
                        result.$2,
                        ref.context,
                        colorScheme.secondary,
                      );
                    },
                  ),
                ],
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

class _TrackListItem extends HookConsumerWidget {
  final CloudMusicSongData track;
  final int index;
  final ColorScheme colorScheme;
  final Size size;
  final Function(int) onTap;
  final CloudMusicUserData? creator;
  final int? pid;

  const _TrackListItem({
    this.pid,
    this.creator,
    required this.track,
    required this.index,
    required this.colorScheme,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multiplier = size.multiplier2;
    final itemHeight = 66.0 * multiplier;
    var localSelected = useState(false);
    var useInfo = ref.watch(cloudUserInfoProvider);
    final songSelectionState = ref.watch(
      songSelectionProvider.select(
        (state) => SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: state.boxState,
        ),
      ),
    );
    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(track.id.toString());
      return null;
    }, [songSelectionState.selectionType]);

    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(track.id.toString());
      return null;
    }, [songSelectionState.boxState]);

    void updateState() {
      localSelected.value = !ref
          .read(songSelectionProvider.notifier)
          .isSelected(track.id.toString());
      var flag = localSelected.value;
      Future.microtask(() {
        if (flag) {
          ref.read(songSelectionProvider.notifier).select(track.id.toString());
        } else {
          ref
              .read(songSelectionProvider.notifier)
              .deSelect(track.id.toString());
        }
      });
    }

    return CommonTrackListItem(
      track: track,
      index: index,
      colorScheme: colorScheme,
      size: size,
      onTap: (idx) {
        if (songSelectionState.selectionType) {
          updateState();
        } else {
          onTap(idx);
        }
      },
      contextMenuEntries: <ContextMenuEntry>[
        if (track.al != null && track.al!.name.isNotEmpty) ...[
          MenuItem(
            label: Text(track.al!.name),
            icon: const Icon(Icons.album_rounded, size: 18),
            onSelected: (value) {
              context.pushWrapper("/cloud-album-detail", extra: track.al);
            },
          ),
        ],
        if (creator != null &&
            creator!.userId == useInfo.value?.userId &&
            pid != null) ...[
          MenuItem(
            label: Text(ref.read(l10nProvider).delete_from_playlist),
            icon: const Icon(Icons.delete_rounded, size: 18),
            onSelected: (value) async {
              ref.read(requestFlagProvider.notifier).setRequestFlag(true);
              try {
                var result = await updateTrackSongs(ref, pid!, track.id, false);
                if (result) {
                  await audioStationRequestCache.delete(
                    'cloud_playlistDetail:${pid!}',
                  );
                  ref.invalidate(cloudMusicPlaylistDetailProvider(pid!));
                  ref.invalidate(songSelectionProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  showSnackBarError(e, context, colorScheme.secondary);
                }
              } finally {
                ref.read(requestFlagProvider.notifier).setRequestFlag(false);
              }
            },
          ),
        ],
      ],
      enableSelection: songSelectionState.selectionType,
      showAlbumName: true,
      leading: CloudMusicCoverImage(
        imageUrl: track.coverUrl(),
        colorScheme: colorScheme,
        config: CloudMusicCoverImageConfig(
          size: itemHeight * 0.8,
          borderRadius: 8,
        ),
      ),
      trailing: songSelectionState.selectionType
          ? Checkbox(
              shape: const CircleBorder(),
              value: localSelected.value,
              onChanged: (_) {
                updateState();
              },
            )
          : null,
    );
  }
}

Widget buildTrackList(
  WidgetRef ref,
  List<CloudMusicSongData>? tempTracks,
  ColorScheme colorScheme,
  Size size,
  AppLocalizations l10n,
  bool isLoadingMore,
  int? pid,
  CloudMusicUserData? creator,
) {
  final tracks = tempTracks ?? [];

  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      if (index == tracks.length) {
        return SizedBox(
          height: 60,
          child: Center(
            child: isLoadingMore
                ? const CircularProgressIndicator(strokeWidth: 2)
                : Text(
                    l10n.reach_end,
                    style: TextStyle(
                      fontSize: 12 * size.multiplier,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
          ),
        );
      }
      final track = tracks[index];
      return RepaintBoundary(
        child: _TrackListItem(
          pid: pid,
          creator: creator,
          track: track,
          index: index + 1,
          colorScheme: colorScheme,
          size: size,
          onTap: (ci) async {
            var targetTracks = <ToneHarborTrackObject>[];
            var initIndex = ci - 1;
            final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
            final user = await ref.read(cloudUserInfoProvider.future);
            final userVipType = user?.vipType ?? 0;

            for (var i = 0; i < tracks.length; i++) {
              var currentTrack = tracks[i];
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
                  initialIndex: initIndex < targetTracks.length ? initIndex : 0,
                  autoPlay: true,
                );
            if (context.mounted) {
              if (size.isXs) {
                showModalBottomSheetWidget(
                  ref.context,
                  colorScheme,
                  isScrollControlled: true,
                  (context) => const PlayingDetailLayout(),
                );
              } else {
                context.pushWrapper("/playing_detail");
              }
            }
          },
        ),
      );
    }, childCount: tracks.length + 1),
  );
}

bool _checkIdsEmpty(Set<String> ids, WidgetRef ref) {
  if (ids.isEmpty) {
    if (ref.context.mounted) {
      showSnackBar(
        ref.read(l10nProvider).no_selected_songs,
        ref.context,
        getColorSchemeWhenReady(ref).secondary,
      );
    }
    return true;
  }
  return false;
}

Set<ToneHarborTrackObject> _getSelectedTracks(
  List<CloudMusicSongData> tracks,
  Set<String> ids,
) {
  return ids
      .map(
        (id) => tracks
            .firstWhere((element) => element.id.toString() == id)
            .asTrack(),
      )
      .toSet();
}

bool _checkIdsLimit(Set<String> ids, int limit, WidgetRef ref, String message) {
  if (ids.length > limit) {
    if (ref.context.mounted) {
      showSnackBar(
        message,
        ref.context,
        getColorSchemeWhenReady(ref).secondary,
      );
    }
    return true;
  }
  return false;
}

Widget selectionBottom(
  WidgetRef ref,
  Size size,
  ColorScheme colorScheme,
  AppLocalizations l10n,
  List<CloudMusicSongData>? tracks,
) {
  if (tracks == null || tracks.isEmpty) {
    return SizedBox.shrink();
  }
  return SafeArea(
    top: false,
    bottom: false,
    child: Container(
      height: kToolbarHeight * size.multiplier3,
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 * size.multiplier2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    final ids = ref.read(songSelectionProvider).ids;
                    if (_checkIdsEmpty(ids, ref)) return;
                    ref.invalidate(songSelectionProvider);
                    ref
                        .read(downloadManagerProvider.notifier)
                        .addAllToQueue(_getSelectedTracks(tracks, ids));
                  },
                  icon: Icon(Icons.download_rounded, size: 18),
                  tooltip: l10n.download,
                ),
                IconButton(
                  onPressed: () async {
                    final ids = ref.read(songSelectionProvider).ids;
                    if (_checkIdsEmpty(ids, ref)) return;
                    if (_checkIdsLimit(
                      ids,
                      1000,
                      ref,
                      l10n.queue_limit_exceeded,
                    )) {
                      return;
                    }

                    final selectedTracks = _getSelectedTracks(tracks, ids);
                    await ref
                        .read(audioPlayerStateProvider.notifier)
                        .addTracksAtFirst(
                          selectedTracks,
                          allowDuplicates: true,
                        );
                    if (!audioPlayer.isPlaying) {
                      var index =
                          audioPlayer.currentIndex < 0 ||
                              audioPlayer.currentIndex >=
                                  audioPlayer.sources.length
                          ? 0
                          : audioPlayer.currentIndex;
                      await audioPlayer.jumpTo(index);
                    }
                    ref.invalidate(songSelectionProvider);
                  },
                  icon: Icon(Icons.queue_play_next_rounded, size: 18),
                  tooltip: l10n.next_song,
                ),
                IconButton(
                  onPressed: () async {
                    final ids = ref.read(songSelectionProvider).ids;
                    if (_checkIdsEmpty(ids, ref)) return;
                    if (_checkIdsLimit(
                      ids,
                      1000,
                      ref,
                      l10n.queue_limit_exceeded,
                    )) {
                      return;
                    }

                    final selectedTracks = _getSelectedTracks(tracks, ids);
                    await ref
                        .read(audioPlayerStateProvider.notifier)
                        .addTracks(selectedTracks);
                    if (!audioPlayer.isPlaying) {
                      var index =
                          audioPlayer.currentIndex < 0 ||
                              audioPlayer.currentIndex >=
                                  audioPlayer.sources.length
                          ? 0
                          : audioPlayer.currentIndex;
                      await audioPlayer.jumpTo(index);
                    }
                    ref.invalidate(songSelectionProvider);
                  },
                  icon: Icon(Icons.queue_music_rounded, size: 18),
                  tooltip: l10n.play_queue,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  l10n.select_all,
                  style: TextStyle(
                    fontSize: 14 * size.multiplier2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final selection = ref.watch(songSelectionProvider);
                    final isLoggedIn = ref.read(cloudMusicAuthStateProvider);
                    final user = ref.read(cloudUserInfoProvider);

                    final selectableSongs = tracks.where((song) {
                      final isPlayable = isCloudTrackPlayable(
                        song,
                        l10n,
                        isLoggedIn: isLoggedIn,
                        userVipType: user.value?.vipType ?? 0,
                      );
                      return isPlayable.playable;
                    }).toList();
                    return Checkbox(
                      shape: const CircleBorder(),
                      value: selection.ids.length == selectableSongs.length,
                      onChanged: (b) {
                        if (b == true) {
                          ref
                              .read(songSelectionProvider.notifier)
                              .selectAll(
                                selectableSongs.map((song) {
                                  return song.id.toString();
                                }).toSet(),
                              );
                        } else {
                          ref
                              .read(songSelectionProvider.notifier)
                              .deSelectAll();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
