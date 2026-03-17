import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/playlist_list.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';

class _PlaylistItemWidget extends HookConsumerWidget {
  final List<PlaylistInfo> playlists;
  final ColorScheme colorScheme;
  final int index;

  const _PlaylistItemWidget({
    required this.index,
    required this.playlists,
    required this.colorScheme,
  });
  static const double itemHeight = 44.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHovered = useState(false);
    var playlistItem = playlists[index];
    var personalState = playlistItem.library == "personal";
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        height: itemHeight,
        color: isHovered.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            context.push(
              "/songs/${Uri.encodeComponent(playlistItem.name)}",
              extra: (
                playlistDetailProvider(id: playlistItem.id),
                -1,
                SongsPageSortAction.none,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 14, color: colorScheme.primary),
                ),
                const SizedBox(width: 15),
                ...[
                  Icon(
                    personalState
                        ? Icons.folder_open_rounded
                        : Icons.folder_shared_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      playlistItem.name,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlaylistsPage<T extends ExtraProvider<PlaylistListResponse>>
    extends HookConsumerWidget {
  final $AsyncNotifierProvider<T, PlaylistListResponse> baseProvider;
  const PlaylistsPage({super.key, required this.baseProvider});

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
    int total,
  ) {
    final l10n = ref.watch(l10nProvider);
    return AppBar(
      title: Row(
        children: [
          Text(
            l10n.playlists,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          if (total > 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                " ${l10n.total_albums.replaceFirst("%s", total.toString())}",
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      actions: [
        Container(
          constraints: BoxConstraints(maxWidth: 200, maxHeight: 35),
          child: SearchAnchor.bar(
            suggestionsBuilder: (context, ref) => [],
            barHintStyle: WidgetStateProperty.all(TextStyle(fontSize: 14)),
            barHintText: l10n.searchHint,
            barLeading: Icon(Icons.search, size: 18),
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_rounded, size: 18),
        ),
      ],
      centerTitle: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = <ContextMenuEntry>[
      MenuItem(
        value: 'play',
        label: const Text('播放'),
        icon: const Icon(Icons.play_arrow),
        onSelected: (value) {
          logger.i("播放");
        },
      ),
      MenuItem(
        value: 'edit',
        label: const Text('编辑'),
        icon: const Icon(Icons.edit),
        onSelected: (value) {
          logger.i("编辑");
        },
      ),
      MenuItem(
        value: 'delete',
        label: const Text('删除'),
        icon: const Icon(Icons.delete),
        onSelected: (value) {
          logger.i("删除");
        },
      ),
      const MenuDivider(),
      MenuItem.submenu(
        label: const Text('更多'),
        icon: const Icon(Icons.more_horiz),
        items: [
          MenuItem(
            value: 'share',
            label: const Text('分享'),
            icon: const Icon(Icons.share),
            onSelected: (value) {
              logger.i("分享");
            },
          ),
          MenuItem(
            value: 'export',
            label: const Text('导出'),
            icon: const Icon(Icons.file_download),
            onSelected: (value) {
              logger.i("导出");
            },
          ),
        ],
      ),
    ];
    final menu = ContextMenu(
      entries: entries,
      padding: const EdgeInsets.all(8.0),
    );
    var colorScheme = getColorSchemeWhenReady(ref);
    final scrollController = useScrollController();
    var playlistsResponse = ref.watch(baseProvider);
    final playlists = playlistsResponse.value?.data?.playlists ?? [];
    final total = playlistsResponse.value?.data?.total ?? 0;
    final hasMore = playlists.length < total;
    final isLoadingMore = useState(false);
    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;

        final state = ref.read(playlistResponseProvider());
        final currentPlaylists = state.value?.data?.playlists ?? [];
        final currentTotal = state.value?.data?.total ?? 0;
        final currentHasMore = currentPlaylists.length < currentTotal;

        if (currentScroll >= maxScroll * 0.8 &&
            currentHasMore &&
            !isLoadingMore.value) {
          loadMore(
            ref: ref,
            isLoadingMore: isLoadingMore,
            baseProvider: baseProvider,
          );
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);
    return Column(
      children: [
        _buildAppBar(context, ref, colorScheme, total),
        Expanded(
          child: playlistsResponse.when(
            data: (data) {
              if (playlists.isEmpty) {
                return const Center(child: Text('No playlists'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount: playlists.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == playlists.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  }
                  return ContextMenuRegion(
                    contextMenu: menu,
                    child: _PlaylistItemWidget(
                      index: index,
                      playlists: playlists,
                      colorScheme: colorScheme,
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
      ],
    );
  }
}
