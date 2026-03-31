import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/favorite_playlist_state.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/consts.dart';
import 'package:toneharbor/widgets/widgets.dart';

class LibraryPage extends HookConsumerWidget with BuildItem {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final favoritePlaylist = ref.watch(favoritePlaylistStateProvider);
    final textStyle = TextStyle(
      fontSize: 15,
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
              listTextStyle: const TextStyle(fontSize: 14),
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
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: const Icon(Icons.search, size: 16),
              ),
              onFocusChanged: (v) {},
              onSubmitSearch: (value) {
                var r = value.trim();
                if (r.isEmpty) return;
                context.push("/mobile/search/${Uri.encodeComponent(r)}");
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
            _musicHouse(ref, l10n, colorScheme, divider),
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
              ),
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
  ) {
    final textButtonStyle = TextButton.styleFrom(
      fixedSize: const Size(40, 60),
      padding: EdgeInsets.zero,
      iconColor: colorScheme.onSurface,
      iconSize: 24,
    );
    final textStyle = TextStyle(fontSize: 14, color: colorScheme.onSurface);

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
                        fontSize: 18,
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
                        fontSize: 14,
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
                  ref.context.push(
                    '/mobile/songs/${Uri.encodeComponent(l10n.all_music)}',
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
                  ref.context.push(
                    'mobile/albums/None',
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
                  ref.context.push('mobile/artists');
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
                  ref.context.push('mobile/playlist');
                },
              ),
              _buildIconButton(
                ref: ref,
                icon: Icons.folder_rounded,
                text: l10n.folder,
                textStyle: textStyle,
                textButtonStyle: textButtonStyle,
                onTap: () {
                  ref.context.push(
                    'mobile/folders/None',
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
                  ref.context.push('/mobile/download');
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
                  ref.context.push(
                    '/mobile/local_songs/${Uri.encodeComponent(l10n.local_songs)}',
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
                  ref.context.push(
                    '/mobile/most_play/${Uri.encodeComponent(l10n.most_play)}',
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
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: favoritePlaylists.length,
      separatorBuilder: (context, index) => divider,
      itemBuilder: (context, index) {
        final item = favoritePlaylists[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPressStart: (detail) async {
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
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                      SizedBox(width: 10),
                      Text(
                        l10n.no_favorite_playlist,
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
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
            final path = "/mobile/songs/${Uri.encodeComponent(item.title)}";
            ref.context.push(
              path,
              extra: (
                playlistDetailProvider(id: item.playlistId),
                -1,
                SongsPageSortAction.none,
              ),
            );
          },
          child: ListTile(
            leading: Icon(Icons.file_present_rounded, size: 18),
            title: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
            trailing: trailingIcon,
          ),
        );
      },
    );
  }
}
