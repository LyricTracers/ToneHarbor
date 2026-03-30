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
import 'package:toneharbor/providers/audio_player/most_player_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/server/server_provider.dart';
import 'package:toneharbor/providers/audio_player/audio_player_streams.dart';
import 'package:toneharbor/services/audio_player/connection_checker_service.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';
import 'package:toneharbor/widgets/layouts/switch_lyrics_layout.dart';
import 'package:toneharbor/widgets/pages/account_page.dart';
import 'package:toneharbor/widgets/pages/album_page.dart';
import 'package:toneharbor/widgets/pages/artist_page.dart';
import 'package:toneharbor/widgets/pages/audio_device_page.dart';
import 'package:toneharbor/widgets/pages/download_page.dart';
import 'package:toneharbor/widgets/pages/folders_page.dart';
import 'package:toneharbor/widgets/pages/playlists_page.dart';
import 'package:toneharbor/widgets/pages/search_resulut_page.dart';
import 'package:toneharbor/widgets/pages/setting_page.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';
import 'package:toneharbor/widgets/pages/storage_manage_page.dart';
import 'package:toneharbor/widgets/pages/ai_translate_setting_page.dart';
import 'package:toneharbor/widgets/widgets.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'init/initialized.dart';
import 'utils/base_utils.dart';
import 'l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await initialized();
  runApp(
    ProviderScope(
      overrides: [httpClientProvider.overrideWithValue(httpClientWrapper)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(serverProvider);
    ref.listen(audioPlayerStreamListenersProvider, (_, __) {});

    ref.listen<AsyncValue<HttpServer>>(serverProvider, (previous, next) {
      next.when(
        data: (server) {
          logger.i('Server started successfully on port ${server.port}');
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
    final synotokenAsync = ref.watch(authTokenProvider);

    useEffect(() {
      if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
        _DesktopListener(ref).initListeners();
      }
      return () {
        if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
          windowManager.removeListener(_DesktopListener(ref));
          trayManager.removeListener(_DesktopListener(ref));
        }
        audioPlayer.dispose();
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
              connected ? i10n.you_are_offline : i10n.connection_restored,
              context,
              colorScheme.secondary,
            );
          });
      return () {
        audioPlayerSubscription?.cancel();
        connectServiceListen.cancel();
      };
    }, []);

    final router = useMemoized(() {
      return GoRouter(
        routes: [
          ShellRoute(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                  key: state.pageKey,
                  child: const RecommendPage(),
                ),
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
                  return NoTransitionPage<void>(
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
                  if (id == null || id == 'None') {
                    id = '';
                  }
                  return NoTransitionPage<void>(
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
                  if (title == null || title == 'None') {
                    title = '';
                  }
                  final provider =
                      state.extra
                          as $AsyncNotifierProvider<
                            ExtraProvider<AlbumResponse>,
                            AlbumResponse
                          >;
                  return NoTransitionPage<void>(
                    key: state.pageKey,
                    child: AlbumPage(title: title, baseProvider: provider),
                  );
                },
              ),
              GoRoute(
                path: '/artists',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                  key: state.pageKey,
                  child: ArtistPage(baseProvider: artistsProvider()),
                ),
              ),
              GoRoute(
                path: '/playlist',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                  key: state.pageKey,
                  child: PlaylistsPage(
                    baseProvider: playlistResponseProvider(),
                  ),
                ),
              ),
              GoRoute(
                path: '/download',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: DownloadPage()),
              ),
              GoRoute(
                path: '/search/:query',
                pageBuilder: (context, state) {
                  return NoTransitionPage<void>(
                    key: state.pageKey,
                    child: SearchResulutPage(
                      query: state.pathParameters['query'] ?? '',
                    ),
                  );
                },
              ),

              GoRoute(
                path: '/local_songs/:title',
                pageBuilder: (context, state) {
                  Future.microtask(() {
                    ref.invalidate(localSongsProvider);
                  });
                  return NoTransitionPage<void>(
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
                  return NoTransitionPage<void>(
                    key: state.pageKey,
                    child: SongsPage(
                      title: state.pathParameters['title'] ?? 'Random Songs',
                      baseProvider: randomSongsProvider(
                        limit: 100,
                        cacheDuration: Duration(hours: 24),
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
                    ref.invalidate(mostPlayerProvider());
                  });
                  return NoTransitionPage<void>(
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
                  var playlistId = state.extra as String;
                  return NoTransitionPage<void>(
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
                path: '/setting',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: SettingPage()),
              ),
              GoRoute(
                path: '/storage',
                pageBuilder: (context, state) {
                  Future.microtask(() {
                    ref.invalidate(storageInfoProvider);
                  });
                  return NoTransitionPage(child: StorageManagePage());
                },
              ),
              GoRoute(
                path: '/ai-translate',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: AITranslateSettingPage()),
              ),
              GoRoute(
                path: '/account',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: AccountPage()),
              ),
              GoRoute(
                path: '/audio-device',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: AudioDevicePage()),
              ),
            ],
            builder: (context, state, child) {
              final currentPath = state.uri.path;
              return HomeLayout(currentPath: currentPath, child: child);
            },
          ),
          GoRoute(
            path: "/switch_lyrics",
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: SwitchLyricsLayout(
                songTrackObject: state.extra as ToneHarborTrackObject,
              ),
            ),
          ),
          GoRoute(
            path: "/playing_detail",
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const PlayingDetailLayout(),
            ),
          ),
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const LoginLayout(),
            ),
          ),
          GoRoute(
            path: '/test',
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const TestLayout()),
          ),
        ],
        redirect: (context, state) {
          logger.d('redirect: ${state.fullPath}');
          final currentPath = state.uri.path;

          final publicPaths = ['/login', '/playing_detail', '/test'];
          if (publicPaths.any((path) => currentPath.startsWith(path))) {
            return null;
          }

          if (synotokenAsync.isLoading) {
            return null;
          }

          if (synotokenAsync.hasError) {
            logger.w('认证检查失败: ${synotokenAsync.error}');
            return '/login';
          }

          if (synotokenAsync.value == null) {
            logger.d('未认证，跳转到登录页');
            return '/login';
          }

          logger.d('已认证');
          return null;
        },
      );
    }, [synotokenAsync]);

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
