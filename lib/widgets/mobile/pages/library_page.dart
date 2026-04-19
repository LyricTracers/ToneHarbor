import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/favorite_playlist_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/consts.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

class LibraryPage extends HookConsumerWidget with BuildItem {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final favoritePlaylist = ref.watch(favoritePlaylistStateProvider);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier3;
    final textStyle = TextStyle(
      fontSize: 15 * multiplier,
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    );
    final trailingIcon = Icon(Icons.arrow_forward_ios_rounded, size: 18);
    final divider = Divider(
      height: 1,
      color: colorScheme.outline.withValues(alpha: 0.2),
      indent: 15,
      endIndent: 15,
    );
    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(maxHeight: 55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: SearchHistoryTextField(
              showHistoryIcon: false,
              listTextStyle: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.1),
                  ),
                ),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                hintText: l10n.searchHint,
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: const Icon(Icons.search, size: 16),
              ),
              onFocusChanged: (v) {},
              onSubmitSearch: (value) {
                var r = value.trim();
                if (r.isEmpty) return;
                context.pushWrapper("/search/${Uri.encodeComponent(r)}");
              },
            ),
          ),
        ),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            '',
            _musicHouse(ref, l10n, colorScheme, divider, multiplier),
            multiplier,
          ),
          if (favoritePlaylist.playlists.isNotEmpty) ...[
            SizedBox(height: 8),
            ...buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.favorite_playlist,
              _favoritePlaylists(
                ref,
                l10n,
                colorScheme,
                favoritePlaylist.playlists,
                textStyle,
                trailingIcon,
                divider,
                multiplier,
              ),
              multiplier,
            ),
          ],
        ]),
      ],
    );
  }

  Widget _buildIconButton({
    required WidgetRef ref,
    required IconData icon,
    required String text,
    required TextStyle textStyle,
    required VoidCallback onTap,
    required ButtonStyle textButtonStyle,
  }) {
    return Expanded(
      child: TextButton(
        style: textButtonStyle,
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }

  Widget _musicHouse(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    Divider divider,
    double multiplier,
  ) {
    final textButtonStyle = TextButton.styleFrom(
      fixedSize: const Size(40, 60),
      padding: EdgeInsets.zero,
      iconColor: colorScheme.onSurface,
      iconSize: 24,
    );
    final textStyle = TextStyle(
      fontSize: 14 * multiplier,
      color: colorScheme.onSurface,
    );

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Row(
              children: [
                const SizedBox(width: 30),
                Image.asset(appIcon, width: 70, height: 70),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.appTitle,
                      style: TextStyle(
                        fontSize: 18 * multiplier,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.appSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14 * multiplier,
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        divider,
        SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              _buildIconButton(
                ref: ref,
                icon: Icons.library_music_rounded,
                text: l10n.all_music,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper(
                    '/songs/${Uri.encodeComponent(l10n.all_music)}',
                    extra: (
                      songsProvider(limit: 100),
                      -1,
                      SongsPageSortAction.all,
                    ),
                  );
                },
              ),
              _buildIconButton(
                ref: ref,
                icon: Icons.album_rounded,
                text: l10n.albums,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper(
                    '/albums/None',
                    extra: albumsProvider(),
                  );
                },
              ),
              _buildIconButton(
                ref: ref,
                icon: Icons.people_rounded,
                text: l10n.artist,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper('/artists');
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              _buildIconButton(
                ref: ref,
                icon: Icons.play_lesson_rounded,
                text: l10n.playlists,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper('/playlist');
                },
              ),
              _buildIconButton(
                ref: ref,
                icon: Icons.folder_rounded,
                text: l10n.folder,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper(
                    '/folders/None',
                    extra: (
                      foldersProvider(limit: 100),
                      <ToneHarborTrackObject>[],
                    ),
                  );
                },
              ),
              _buildIconButton(
                ref: ref,
                icon: Icons.download_for_offline,
                text: l10n.download_center,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper('/download');
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              _buildIconButton(
                ref: ref,
                icon: Icons.library_music_outlined,
                text: l10n.local_songs,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper(
                    '/local_songs/${Uri.encodeComponent(l10n.local_songs)}',
                  );
                },
              ),
              _buildIconButton(
                ref: ref,
                icon: Icons.local_play_rounded,
                text: l10n.most_play,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.pushWrapper(
                    '/most_play/${Uri.encodeComponent(l10n.most_play)}',
                  );
                },
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _favoritePlaylists(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    List<FavoritePlaylistItem> favoritePlaylists,
    TextStyle textStyle,
    Icon trailingIcon,
    Divider divider,
    double multiplier,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int index = 0; index < favoritePlaylists.length; index++)
          Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onLongPressStart: (detail) async {
                  final item = favoritePlaylists[index];
                  await showCustomMenu<FavoritePlaylistItem>(
                    context: ref.context,
                    globalPosition: detail.globalPosition,
                    items: [
                      PopupMenuItem(
                        height: 30,
                        enabled: false,
                        child: Text(
                          item.title,
                          maxLines: 1,
                          style: TextStyle(fontSize: 13 * multiplier),
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
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              l10n.no_favorite_playlist,
                              style: TextStyle(
                                fontSize: 13 * multiplier,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          ref
                              .read(favoritePlaylistStateProvider.notifier)
                              .removeFavoritePlaylist(item.playlistId);
                        },
                      ),
                    ],
                  );
                },
                onTap: () {
                  final item = favoritePlaylists[index];
                  if (item.cloudData != null) {
                    ref.context.pushWrapper(
                      "/cloud-detail/${item.cloudData?.id}",
                      extra: item.cloudData?.toPlaylistData(),
                    );
                  } else {
                    final path = "/songs/${Uri.encodeComponent(item.title)}";
                    ref.context.pushWrapper(
                      path,
                      extra: (
                        playlistDetailProvider(id: item.playlistId),
                        -1,
                        SongsPageSortAction.none,
                      ),
                    );
                  }
                },
                child: ListTile(
                  leading: Icon(Icons.file_present_rounded, size: 18),
                  title: Text(
                    favoritePlaylists[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  ),
                  trailing: trailingIcon,
                ),
              ),
              if (index < favoritePlaylists.length - 1) divider,
            ],
          ),
      ],
    );
  }
}
