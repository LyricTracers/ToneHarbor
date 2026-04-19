import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/connection_checker_service.dart';
import 'package:toneharbor/services/server/server_health_check.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/layouts/local_songs_layout.dart';
import 'package:toneharbor/widgets/mobile/layouts/mobile_full_layout.dart';
import 'package:toneharbor/widgets/mobile/layouts/mobile_home_layout.dart';
import 'package:toneharbor/widgets/pages/cloud_album_detail.dart';
import 'package:toneharbor/widgets/pages/cloud_api_setting_page.dart';
import 'package:toneharbor/widgets/pages/cloud_artist_page.dart';
import 'package:toneharbor/widgets/pages/cloud_detail_playlist_page.dart';
import 'package:toneharbor/widgets/pages/cloud_music_login_page.dart';
import 'package:toneharbor/widgets/pages/cloud_playlist_catlist_page.dart';
import 'package:toneharbor/widgets/pages/gesture_only_cupertino_page.dart';
import 'package:toneharbor/widgets/widgets.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'init/initialized.dart';
import 'utils/base_utils.dart';
import 'l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

final publicPaths = [
  '/login',
  '/playing_detail',
  '/switch_lyrics',
  '/local_music',
  '/test',
];
void main() async {
  await initialized();
  runApp(
    ProviderScope(
      overrides: [httpClientProvider.overrideWithValue(httpClientWrapper)],
      child: const MyApp(),
    ),
  );
}

int _getMobileTabIndex(String path) {
  if (path.startsWith('/mobile_home/library')) return 1;
  if (path.startsWith('/mobile_home/settings')) return 2;
  return 0;
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(serverControllerProvider);
    ref.listen(audioPlayerStreamListenersProvider, (_, __) {});

    final previousServerPort = useRef<int?>(null);

    ref.listen<AsyncValue<HttpServer>>(serverControllerProvider, (
      previous,
      next,
    ) {
      next.when(
        data: (server) {
          final oldPort = previousServerPort.value;
          final newPort = server.port;

          if (oldPort != null && oldPort != newPort) {
            logger.i(
              '[Server] Port changed from $oldPort to $newPort, refreshing playlist...',
            );
            ref.read(audioPlayerStateProvider.notifier).refreshPlaylistUrls();
          }
          previousServerPort.value = newPort;

          logger.i('Server started successfully on port ${server.port}');
          if (Platform.isIOS || Platform.isAndroid) {
            ref.read(serverHealthCheckProvider).startPeriodicHealthCheck();
          }
        },
        loading: () {
          logger.i('Server is starting...');
        },
        error: (error, stackTrace) {
          logger.e('Server failed to start: $error', stackTrace: stackTrace);
        },
      );
    });

    final colorScheme = getColorSchemeWhenReady(ref);
    final localeAsync = ref.watch(localeProvider);
    // final synotokenAsync = ref.watch(authTokenProvider);
    final cookiesInfoAsync = ref.watch(audioStationCookiesInfoProvider);

    useEffect(() {
      if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
        _DesktopListener(ref).initListeners();
      }
      return () {
        if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
          windowManager.removeListener(_DesktopListener(ref));
          trayManager.removeListener(_DesktopListener(ref));
        }
        ref.read(audioPlayerStreamListenersProvider).dispose();
      };
    }, []);

    useEffect(() {
      StreamSubscription? audioPlayerSubscription;
      bool pausedByStream = false;

      final connectServiceListen = ConnectionCheckerService
          .instance
          .onConnectivityChanged
          .listen((connected) async {
            await audioPlayerSubscription?.cancel();
            if (audioPlayer.currentIndex >= 0) {
              if (connected && audioPlayer.isPaused && pausedByStream) {
                await audioPlayer.resume();
                pausedByStream = false;
              } else if (!connected && audioPlayer.isPlaying) {
                if ((audioPlayer.bufferedPosition -
                        const Duration(seconds: 1)) <=
                    audioPlayer.position) {
                  await audioPlayer.pause();
                  pausedByStream = true;
                } else {
                  audioPlayerSubscription = audioPlayer.positionStream.listen((
                    position,
                  ) async {
                    if (ConnectionCheckerService.instance.isConnectedSync ==
                        true) {
                      return;
                    }

                    final bufferedPosition =
                        audioPlayer.bufferedPosition -
                        const Duration(seconds: 1);
                    final duration =
                        audioPlayer.duration - const Duration(seconds: 1);

                    if (bufferedPosition <= position || position >= duration) {
                      audioPlayer.pause();
                      pausedByStream = true;
                    }
                  });
                }
              }
            }
            final i10n = ref.read(l10nProvider);
            if (!context.mounted) return;
            if (ScaffoldMessenger.maybeOf(context) == null) return;
            showSnackBar(
              connected ? i10n.connection_restored : i10n.you_are_offline,
              context,
              colorScheme.secondary,
            );
          });
      return () {
        audioPlayerSubscription?.cancel();
        connectServiceListen.cancel();
      };
    }, []);

    Page<void> buildPage<T>({
      required LocalKey key,
      required Widget child,
      bool fullscreenDialog = false,
    }) {
      final size = MediaQuery.of(context).size;
      if ((Platform.isIOS || Platform.isAndroid) & size.mdAndDown) {
        return GestureOnlyCupertinoPage<void>(
          key: key,
          child: child,
          fullscreenDialog: fullscreenDialog,
          onPopInvoked: (didPop, result) {
            if (didPop) {
              ref.invalidate(songSelectionProvider);
            }
          },
        );
      }
      return NoTransitionPage<void>(key: key, child: child);
    }

    final rootNavigatorKey = GlobalKey<NavigatorState>();
    final shellKey = GlobalKey<NavigatorState>();
    final router = useMemoized(() {
      return GoRouter(
        navigatorKey: rootNavigatorKey,
        redirect: (context, state) {
          final currentPath = state.uri.path;

          if (publicPaths.any((path) => currentPath.startsWith(path))) {
            return null;
          }

          if (cookiesInfoAsync == null || !cookiesInfoAsync.isValid) {
            return '/login';
          }

          // if (synotokenAsync.isLoading) return null;
          // if (synotokenAsync.hasError) return '/login';
          // if (synotokenAsync.value == null) return '/login';

          return null;
        },
        routes: [
          // ================================
          // 桌面端 Shell（全部页面在 HomeLayout）
          // ================================
          ShellRoute(
            navigatorKey: shellKey,
            builder: (context, state, child) {
              final size = MediaQuery.of(context).size;
              if (size.lgAndUp) {
                return HomeLayout(currentPath: state.uri.path, child: child);
              }
              return MobileHomeLayout(tab: _getMobileTabIndex(state.uri.path));
            },
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: const RecommendPage()),
              ),
              GoRoute(
                path: '/mobile_home',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: const RecommendPage()),
              ),
              GoRoute(
                path: '/mobile_home/recommend',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: const RecommendPage()),
              ),
              GoRoute(
                path: '/mobile_home/library',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: const RecommendPage()),
              ),
              GoRoute(
                path: '/mobile_home/settings',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: SettingPage()),
              ),
              GoRoute(
                path: '/songs/:title',
                pageBuilder: (context, state) {
                  final (provider, total, sortAction) =
                      state.extra
                          as (
                            $AsyncNotifierProvider<
                              ExtraProvider<ToneHarborTrackObjectList>,
                              ToneHarborTrackObjectList
                            >,
                            int,
                            SongsPageSortAction,
                          );
                  return buildPage(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Songs',
                      baseProvider: provider,
                      limitTotal: total,
                      sortAction: sortAction,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/folders/:id',
                pageBuilder: (context, state) {
                  final (provider, lastFoldItems) =
                      state.extra
                          as (
                            $AsyncNotifierProvider<
                              ExtraProvider<FolderResponse>,
                              FolderResponse
                            >,
                            List<ToneHarborTrackObject>,
                          );
                  var id = state.pathParameters['id'];
                  if (id == null || id == 'None') id = '';
                  return buildPage(
                    key: state.pageKey,
                    child: FoldersPage(
                      currentId: id,
                      baseProvider: provider,
                      lastFoldItems: lastFoldItems,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/albums/:title',
                pageBuilder: (context, state) {
                  var title = state.pathParameters['title'];
                  if (title == null || title == 'None') title = '';
                  final provider =
                      state.extra
                          as $AsyncNotifierProvider<
                            ExtraProvider<AlbumResponse>,
                            AlbumResponse
                          >;
                  return buildPage(
                    key: state.pageKey,
                    child: AlbumPage(title: title, baseProvider: provider),
                  );
                },
              ),
              GoRoute(
                path: '/artists',
                pageBuilder: (context, state) => buildPage(
                  key: state.pageKey,
                  child: ArtistPage(baseProvider: artistsProvider()),
                ),
              ),
              GoRoute(
                path: '/playlist',
                pageBuilder: (context, state) => buildPage(
                  key: state.pageKey,
                  child: PlaylistsPage(
                    baseProvider: playlistResponseProvider(),
                  ),
                ),
              ),
              GoRoute(
                path: '/download',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: DownloadPage()),
              ),
              GoRoute(
                path: '/search/:query',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: SearchResultPage(
                      query: state.pathParameters['query'] ?? '',
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/local_songs/:title',
                pageBuilder: (context, state) {
                  Future.microtask(() {
                    if (!context.mounted) return;
                    ProviderScope.containerOf(
                      context,
                    ).invalidate(localSongsProvider);
                  });
                  return buildPage(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Local Songs',
                      baseProvider: localSongsProvider,
                      limitTotal: -1,
                      sortAction: SongsPageSortAction.all,
                      isLocal: true,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/random_songs/:title',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Random Songs',
                      baseProvider: randomSongsProvider(
                        limit: 100,
                        cacheDuration: const Duration(hours: 24),
                      ),
                      limitTotal: 100,
                      sortAction: SongsPageSortAction.none,
                      refreshRandom: true,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/most_play/:title',
                pageBuilder: (context, state) {
                  Future.microtask(() {
                    if (!context.mounted) return;
                    ProviderScope.containerOf(
                      context,
                    ).invalidate(mostPlayerProvider());
                  });
                  return buildPage(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Most Play',
                      baseProvider: mostPlayerProvider(),
                      limitTotal: -1,
                      sortAction: SongsPageSortAction.none,
                      isLocal: false,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/playlist_song/:title',
                pageBuilder: (context, state) {
                  final playlistId = state.extra as String;
                  return buildPage(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Playlist Songs',
                      baseProvider: playlistDetailProvider(id: playlistId),
                      playlistId: playlistId,
                      limitTotal: -1,
                      sortAction: SongsPageSortAction.none,
                      isLocal: false,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/cloud-detail/:id',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: CloudDetailPlaylistPage(
                      playlist: state.extra as CloudMusicPlaylistData,
                    ),
                  );
                },
              ),
              GoRoute(
                path: '/setting',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: SettingPage()),
              ),
              GoRoute(
                path: '/storage',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: StorageManagePage(),
                  );
                },
              ),
              GoRoute(
                path: '/cloud-login',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: CloudMusicLoginPage(),
                  );
                },
              ),
              GoRoute(
                path: '/cloud-api',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: CloudApiSettingPage(),
                  );
                },
              ),
              GoRoute(
                path: '/ai-translate',
                pageBuilder: (context, state) => buildPage(
                  key: state.pageKey,
                  child: AITranslateSettingPage(),
                ),
              ),
              GoRoute(
                path: '/log',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: LogPage()),
              ),
              GoRoute(
                path: '/account',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: AccountPage()),
              ),
              GoRoute(
                path: '/audio-device',
                pageBuilder: (context, state) =>
                    buildPage(key: state.pageKey, child: AudioDevicePage()),
              ),
              GoRoute(
                path: '/cloud-playlist-catlist',
                pageBuilder: (context, state) => buildPage(
                  key: state.pageKey,
                  child: CloudPlaylistCategoryListPage(
                    category: state.extra as CloudPlaylistCategory,
                  ),
                ),
              ),
              GoRoute(
                path: '/cloud-artist-detail',
                pageBuilder: (context, state) => buildPage(
                  key: state.pageKey,
                  child: CloudArtistPage(
                    artistData: state.extra as CloudMusicArtistData,
                  ),
                ),
              ),
              GoRoute(
                path: '/cloud-album-detail',
                pageBuilder: (context, state) => buildPage(
                  key: state.pageKey,
                  child: CloudAlbumDetailPage(
                    albumData: state.extra as CloudMusicAlbumData,
                  ),
                ),
              ),
              GoRoute(
                path: '/cloud-favorite-songs/:title',
                pageBuilder: (context, state) {
                  return buildPage(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Playlist Songs',
                      baseProvider: cloudLikelistStateProvider,
                      limitTotal: -1,
                      sortAction: SongsPageSortAction.none,
                      isLocal: false,
                      isCloud: true,
                    ),
                  );
                },
              ),
            ],
          ),
          // ================================
          // 移动端全页面（不在任何 Shell，都包 MobileFullLayout）
          // ================================
          GoRoute(
            path: '/mobile/songs/:title',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              final (provider, total, sortAction) =
                  state.extra
                      as (
                        $AsyncNotifierProvider<
                          ExtraProvider<ToneHarborTrackObjectList>,
                          ToneHarborTrackObjectList
                        >,
                        int,
                        SongsPageSortAction,
                      );
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SongsPage(
                    title: state.pathParameters['title'] ?? 'Songs',
                    baseProvider: provider,
                    limitTotal: total,
                    sortAction: sortAction,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/folders/:id',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              final (provider, lastFoldItems) =
                  state.extra
                      as (
                        $AsyncNotifierProvider<
                          ExtraProvider<FolderResponse>,
                          FolderResponse
                        >,
                        List<ToneHarborTrackObject>,
                      );
              var id = state.pathParameters['id'];
              if (id == null || id == 'None') id = '';
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: FoldersPage(
                    currentId: id,
                    baseProvider: provider,
                    lastFoldItems: lastFoldItems,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/albums/:title',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              var title = state.pathParameters['title'];
              if (title == null || title == 'None') title = '';
              final provider =
                  state.extra
                      as $AsyncNotifierProvider<
                        ExtraProvider<AlbumResponse>,
                        AlbumResponse
                      >;
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: AlbumPage(title: title, baseProvider: provider),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/artists',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(
                child: ArtistPage(baseProvider: artistsProvider()),
              ),
            ),
          ),
          GoRoute(
            path: '/mobile/playlist',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(
                child: PlaylistsPage(baseProvider: playlistResponseProvider()),
              ),
            ),
          ),
          GoRoute(
            path: '/mobile/download',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(child: DownloadPage()),
            ),
          ),
          GoRoute(
            path: '/mobile/search/:query',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SearchResultPage(
                    query: state.pathParameters['query'] ?? '',
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/local_songs/:title',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              Future.microtask(() {
                if (!context.mounted) return;
                ProviderScope.containerOf(
                  context,
                ).invalidate(localSongsProvider);
              });
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SongsPage(
                    title: state.pathParameters['title'] ?? 'Local Songs',
                    baseProvider: localSongsProvider,
                    limitTotal: -1,
                    sortAction: SongsPageSortAction.all,
                    isLocal: true,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/random_songs/:title',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SongsPage(
                    title: state.pathParameters['title'] ?? 'Random Songs',
                    baseProvider: randomSongsProvider(
                      limit: 100,
                      cacheDuration: const Duration(hours: 24),
                    ),
                    limitTotal: 100,
                    sortAction: SongsPageSortAction.none,
                    refreshRandom: true,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/most_play/:title',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              Future.microtask(() {
                if (!context.mounted) return;
                ProviderScope.containerOf(
                  context,
                ).invalidate(mostPlayerProvider());
              });
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SongsPage(
                    title: state.pathParameters['title'] ?? 'Most Play',
                    baseProvider: mostPlayerProvider(),
                    limitTotal: -1,
                    sortAction: SongsPageSortAction.none,
                    isLocal: false,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/playlist_song/:title',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              final playlistId = state.extra as String;
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SongsPage(
                    title: state.pathParameters['title'] ?? 'Playlist Songs',
                    baseProvider: playlistDetailProvider(id: playlistId),
                    playlistId: playlistId,
                    limitTotal: -1,
                    sortAction: SongsPageSortAction.none,
                    isLocal: false,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/setting',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(child: SettingPage()),
            ),
          ),
          GoRoute(
            path: '/mobile/cloud-api',
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(child: CloudApiSettingPage()),
              );
            },
          ),
          GoRoute(
            path: '/mobile/storage',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(child: StorageManagePage()),
              );
            },
          ),
          GoRoute(
            path: '/mobile/ai-translate',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(child: AITranslateSettingPage()),
            ),
          ),
          GoRoute(
            path: '/mobile/log',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(child: LogPage()),
            ),
          ),
          GoRoute(
            path: '/mobile/account',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(child: AccountPage()),
            ),
          ),
          GoRoute(
            path: '/mobile/cloud-detail/:id',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  appbar: false,
                  child: CloudDetailPlaylistPage(
                    playlist: state.extra as CloudMusicPlaylistData,
                  ),
                ),
              );
            },
          ),
          GoRoute(
            path: '/mobile/cloud-login',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(child: CloudMusicLoginPage()),
              );
            },
          ),
          GoRoute(
            path: '/mobile/audio-device',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(child: AudioDevicePage()),
            ),
          ),
          GoRoute(
            path: '/mobile/cloud-playlist-catlist',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(
                child: CloudPlaylistCategoryListPage(
                  category: state.extra as CloudPlaylistCategory,
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/mobile/cloud-artist-detail',
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(
                appbar: false,
                child: CloudArtistPage(
                  artistData: state.extra as CloudMusicArtistData,
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/mobile/cloud-album-detail',
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: MobileFullLayout(
                appbar: false,
                child: CloudAlbumDetailPage(
                  albumData: state.extra as CloudMusicAlbumData,
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/mobile/cloud-favorite-songs/:title',
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: MobileFullLayout(
                  child: SongsPage(
                    title: state.pathParameters['title'] ?? 'Playlist Songs',
                    baseProvider: cloudLikelistStateProvider,
                    limitTotal: -1,
                    sortAction: SongsPageSortAction.none,
                    isLocal: false,
                    isCloud: true,
                  ),
                ),
              );
            },
          ),

          // ================================
          // 公共页面
          // ================================
          GoRoute(
            path: "/switch_lyrics",
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) => buildPage(
              key: state.pageKey,
              child: SwitchLyricsLayout(
                songTrackObject: state.extra as ToneHarborTrackObject,
              ),
            ),
          ),
          GoRoute(
            path: "/playing_detail",
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              return buildPage(
                key: state.pageKey,
                child: const PlayingDetailLayout(),
              );
            },
          ),
          GoRoute(
            path: '/login',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) =>
                buildPage(key: state.pageKey, child: const LoginLayout()),
          ),
          GoRoute(
            path: '/local_music',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) =>
                buildPage(key: state.pageKey, child: const LocalSongsLayout()),
          ),
          GoRoute(
            path: '/test',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) =>
                buildPage(key: state.pageKey, child: const TestLayout()),
          ),
        ],
      );
    }, [cookiesInfoAsync]);

    return MaterialApp.router(
      title: 'ToneHarbor',
      theme: ThemeData(colorScheme: colorScheme, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      locale: localeAsync,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('zh')],
      routerConfig: router,
    );
  }
}

class _DesktopListener implements WindowListener, MusicPlayerListener {
  final WidgetRef ref;

  _DesktopListener(this.ref);

  void initListeners() {
    windowManager.addListener(this);
    trayManager.addListener(this);
  }

  @override
  void onWindowClose() {
    windowManager.minimize();
  }

  @override
  void onWindowFocus() {}

  @override
  void onWindowBlur() {}

  @override
  void onWindowMaximize() {}

  @override
  void onWindowUnmaximize() {}

  @override
  void onWindowMinimize() {}

  @override
  void onWindowRestore() {}

  @override
  void onWindowResize() {}

  @override
  void onWindowResized() {}

  @override
  void onWindowMove() {}

  @override
  void onWindowMoved() {}

  @override
  void onWindowEnterFullScreen() {}

  @override
  void onWindowLeaveFullScreen() {}

  @override
  void onWindowDocked() {}

  @override
  void onWindowUndocked() {}

  @override
  void onWindowEvent(String eventName) {}

  @override
  void onTrayIconMouseDown() {
    if (Platform.isMacOS) {
      trayManager.popUpMusicPlayerPopover();
    }
  }

  @override
  void onTrayIconMouseUp() {}

  @override
  void onTrayIconRightMouseDown() {}

  @override
  void onTrayIconRightMouseUp() {
    logger.d('Tray icon right mouse up event');
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    logger.d('Tray menu item click: ${menuItem.key}');
  }

  @override
  void onMusicPlayerPlayPause() {
    logger.d('Music player play/pause event');
    if (audioPlayer.isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.resume();
    }
  }

  @override
  void onMusicPlayerPrevious() {
    logger.d('Music player previous event');
    audioPlayer.skipToPrevious();
  }

  @override
  void onMusicPlayerNext() {
    logger.d('Music player next event');
    audioPlayer.skipToNext();
  }

  @override
  void onMusicPlayerRestart() {
    logger.d('Music player restart event');
    audioPlayer.seek(Duration.zero);
  }

  @override
  void onMusicPlayerFullscreen() {
    windowManager.show();
    windowManager.focus();
  }

  @override
  void onMusicPlayerQuit() {
    windowManager.destroy();
  }
}
