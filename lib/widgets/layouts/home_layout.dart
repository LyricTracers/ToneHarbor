import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/layouts/base_bg_layout.dart';
import 'package:toneharbor/widgets/pages/playlist_page.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';
import 'package:toneharbor/widgets/widgets.dart';
part 'home_layout_logic.dart';

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

    final isPlaylistPage = useState(false);
    final allMusicPath = '/songs/${Uri.encodeComponent(l10n.all_music)}';
    final allFoldersPath = '/folders/';
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
      if (isPlaylistPage.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [isPlaylistPage.value]);
    final slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
        );
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 200,
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
                          labelStyle: const TextStyle(fontSize: 16),
                          hintText: l10n.searchHint,
                          hintStyle: const TextStyle(fontSize: 14),
                          prefixIcon: const Icon(Icons.search, size: 16),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        onSubmitSearch: (value) {
                          onSubmitSearch(ref, value);
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
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    _getItem(
                      currentPath == allMusicPath,
                      colorScheme,
                      Icons.music_note_rounded,
                      l10n.all_music,
                      () {
                        context.push(
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
                      currentPath.startsWith(allFoldersPath),
                      colorScheme,
                      Icons.folder_rounded,
                      l10n.folder,
                      () {
                        context.push(
                          "${allFoldersPath}None",
                          extra: (foldersProvider(limit: 100), <FolderItem>[]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: child),
                  BottomPlayer(() {
                    isPlaylistPage.value = true;
                  }),
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

  Widget _getItem(
    bool targetPage,
    ColorScheme colorScheme,
    IconData icon,
    String text,
    VoidCallback onTapCallback,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          if (!targetPage) {
            onTapCallback.call();
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: targetPage ? FontWeight.w600 : FontWeight.normal,
                  color: targetPage
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
