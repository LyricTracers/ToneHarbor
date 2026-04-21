import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/cloud_add_to_playlists_page.dart';

class CommonTrackListItem extends HookConsumerWidget {
  final CloudMusicSongData track;
  final int index;
  final ColorScheme colorScheme;
  final Size size;
  final Function(int) onTap;
  final CloudMusicAlbumData? album;
  final Widget? leading;
  final Widget? trailing;
  final bool showAlbumName;
  final bool enableSelection;
  final List<ContextMenuEntry>? contextMenuEntries;

  const CommonTrackListItem({
    super.key,
    required this.track,
    required this.index,
    required this.colorScheme,
    required this.size,
    required this.onTap,
    this.album,
    this.leading,
    this.trailing,
    this.showAlbumName = false,
    this.enableSelection = false,
    this.contextMenuEntries,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = track.ar?.map((a) => a.name).join(', ') ?? '';
    final duration = track.dt != null ? formatDuration(track.dt!) : null;
    final multiplier = size.multiplier2;
    final itemHeight = 66.0 * multiplier;
    var isHovered = useState(false);
    var isPressed = useState(false);
    final l10n = ref.watch(l10nProvider);
    final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);
    final userVipType = ref.watch(
      cloudUserInfoProvider.select((value) => value.value?.vipType ?? 0),
    );
    final isPlayable = isCloudTrackPlayable(
      track,
      l10n,
      isLoggedIn: isLoggedIn,
      userVipType: userVipType,
    );

    final isFavorite = isLoggedIn
        ? (ref
                  .watch(cloudLikelistStateProvider)
                  .value
                  ?.songs
                  .any((t) => t.id == track.id) ??
              false)
        : false;

    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: ContextMenuRegion(
        enableDefaultGestures: !enableSelection,
        contextMenu: ContextMenu(
          entriesBuilder: () {
            return <ContextMenuEntry>[
              MenuHeader(text: track.name),
              MenuDivider(),
              if (isPlayable.playable) ...[
                if (isLoggedIn) ...[
                  MenuItem(
                    label: isFavorite
                        ? Text(l10n.no_favorite_playlist)
                        : Text(l10n.favorite),
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite_border_rounded
                          : Icons.favorite_rounded,
                    ),
                    onSelected: (value) async {
                      try {
                        ref
                            .read(requestFlagProvider.notifier)
                            .setRequestFlag(true);
                        await ref
                            .read(cloudLikelistStateProvider.notifier)
                            .updateLike(track.asTrack(album: album));
                      } catch (e) {
                        if (ref.context.mounted) {
                          showSnackBarError(
                            e,
                            ref.context,
                            colorScheme.secondary,
                          );
                        }
                      } finally {
                        ref
                            .read(requestFlagProvider.notifier)
                            .setRequestFlag(false);
                      }
                    },
                  ),
                ],
                MenuItem(
                  label: Text(l10n.download),
                  icon: const Icon(Icons.download_rounded),
                  onSelected: (value) async {
                    ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                    await ref
                        .read(downloadManagerProvider.notifier)
                        .addToQueue(track.asTrack(album: album));
                    ref
                        .read(requestFlagProvider.notifier)
                        .setRequestFlag(false);
                  },
                ),
                MenuItem(
                  label: Text("Aria2 Download"),
                  icon: Icon(Icons.cloud_download_rounded),
                  onSelected: (value) async {
                    ref.read(requestFlagProvider.notifier).setRequestFlag(true);
                    final result = await ref
                        .read(aria2ClientProvider.notifier)
                        .addDownloadTask(track.asTrack());
                    ref
                        .read(requestFlagProvider.notifier)
                        .setRequestFlag(false);

                    if (!ref.context.mounted) {
                      return;
                    }
                    showSnackBar(result.$2, ref.context, colorScheme.secondary);
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
                              track.asTrack(album: album),
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
                            .addTrack(track.asTrack(album: album));
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
                                return CloudAddToPlaylistsPage(track.id);
                              },
                            );
                          } else {
                            showModalBottomSheetWidget(
                              ref.context,
                              colorScheme,
                              (context) {
                                return CloudAddToPlaylistsPage(track.id);
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
                        "/search/${Uri.encodeComponent(track.name)}",
                      );
                    },
                  ),
                  if (track.ar != null && track.ar!.isNotEmpty) ...[
                    if (track.ar!.length == 1)
                      MenuItem(
                        label: Text(l10n.search_artist),
                        onSelected: (value) async {
                          ref.context.pushWrapper(
                            "/search/${Uri.encodeComponent(track.ar![0].name)}",
                          );
                        },
                      ),
                    if (track.ar!.length > 1)
                      MenuItem<void>.submenu(
                        label: Text(l10n.search_artist),
                        items: track.ar!
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

                  if (track.al != null)
                    MenuItem(
                      label: Text(l10n.search_album),
                      onSelected: (value) async {
                        ref.context.pushWrapper(
                          "/search/${Uri.encodeComponent(track.al!.name)}",
                        );
                      },
                    ),
                ],
              ),

              MenuDivider(),
              if (track.ar != null && track.ar!.isNotEmpty) ...[
                if (track.ar!.length == 1) ...[
                  MenuItem(
                    label: Text(track.ar![0].name),
                    icon: const Icon(Icons.person_rounded),
                    onSelected: (value) async {
                      context.pushWrapper(
                        "/cloud-artist-detail",
                        extra: track.ar![0],
                      );
                    },
                  ),
                ],
                if (track.ar!.length > 1) ...[
                  MenuItem.submenu(
                    label: Text(l10n.artist_profile),
                    icon: const Icon(Icons.person_rounded),
                    items: [
                      ...track.ar!.map(
                        (artist) => MenuItem(
                          icon: const Icon(Icons.person_rounded),
                          label: Text(artist.name),
                          onSelected: (value) async {
                            context.pushWrapper(
                              "/cloud-artist-detail",
                              extra: artist,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ],
              ...contextMenuEntries ?? [],
            ];
          },
          padding: const EdgeInsets.all(8.0),
        ),
        child: Stack(
          children: [
            if (!isPlayable.playable)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6 * multiplier,
                    vertical: 2 * multiplier,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8 * multiplier),
                    ),
                  ),
                  child: Text(
                    isPlayable.reason ?? l10n.paid_album,
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 8 * multiplier,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Container(
              height: itemHeight,
              color: isHovered.value || isPressed.value
                  ? colorScheme.outline.withValues(alpha: .1)
                  : Colors.transparent,
              child: InkWell(
                onDoubleTap: () {
                  isPressed.value = false;
                  if (isPlayable.playable) {
                    onTap(index);
                  }
                },
                onTapDown: (details) => isPressed.value = true,
                onTapUp: (details) => isPressed.value = false,
                onTapCancel: () => isPressed.value = false,
                onTap: () {
                  isPressed.value = false;
                  if (isPlayable.playable) {
                    onTap(index);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15 * multiplier,
                    right: 20 * multiplier,
                    top: 4 * multiplier,
                    bottom: 4 * multiplier,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$index',
                        style: TextStyle(
                          fontSize: 14 * multiplier,
                          color: isPlayable.playable
                              ? colorScheme.primary
                              : Colors.grey,
                        ),
                      ),
                      SizedBox(width: 20 * multiplier),
                      if (leading != null) ...[
                        leading!,
                        SizedBox(width: 15 * multiplier),
                      ],
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    track.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16 * multiplier,
                                      fontWeight: FontWeight.bold,
                                      color: isPlayable.playable
                                          ? colorScheme.onSurface
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                if (isFavorite)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 4 * multiplier,
                                    ),
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      size: 14 * multiplier,
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 4 * multiplier),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    artists,
                                    style: TextStyle(
                                      fontSize: 12 * multiplier,
                                      color: isPlayable.playable
                                          ? colorScheme.onSurfaceVariant
                                          : Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                if (showAlbumName &&
                                    track.al != null &&
                                    track.al!.name.isNotEmpty &&
                                    size.mdAndDown) ...[
                                  SizedBox(width: 10 * multiplier),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      '- ${track.al!.name}',
                                      style: TextStyle(
                                        fontSize: 12 * multiplier,
                                        color: isPlayable.playable
                                            ? colorScheme.onSurfaceVariant
                                            : Colors.grey,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (showAlbumName &&
                          track.al != null &&
                          track.al!.name.isNotEmpty &&
                          size.lgAndUp) ...[
                        SizedBox(width: 15 * multiplier),
                        Expanded(
                          child: Text(
                            track.al!.name,
                            style: TextStyle(
                              fontSize: 14 * multiplier,
                              color: isPlayable.playable
                                  ? colorScheme.onSurfaceVariant
                                  : Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                      if (duration != null) ...[
                        SizedBox(width: 15 * multiplier),
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 12 * multiplier,
                            color: isPlayable.playable
                                ? colorScheme.onSurface.withValues(alpha: 0.5)
                                : Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 10 * multiplier),
                      ],
                      if (trailing != null) trailing!,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
