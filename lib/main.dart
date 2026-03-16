import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/tone_harbor_track.dart';
import 'package:toneharbor/models/audio_station/album.dart';
import 'package:toneharbor/models/audio_station/folder.dart';
import 'package:toneharbor/models/audio_station/song.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/server/server_provider.dart';
import 'package:toneharbor/providers/audio_player/audio_player_streams.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';
import 'package:toneharbor/widgets/layouts/switch_lyrics_layout.dart';
import 'package:toneharbor/widgets/pages/album_page.dart';
import 'package:toneharbor/widgets/pages/artist_page.dart';
import 'package:toneharbor/widgets/pages/folders_page.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';
import 'package:toneharbor/widgets/widgets.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'init/initialized.dart';
import 'utils/base_utils.dart';
import 'l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

class SlideTransitionPage extends CustomTransitionPage<void> {
  SlideTransitionPage({
    super.key,
    required super.child,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return _buildSlideTransition(
             context,
             animation,
             secondaryAnimation,
             child,
           );
         },
       );

  static Widget _buildSlideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(0, 1.0, curve: Curves.fastEaseInToSlowEaseOut),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(opacity: fadeAnimation, child: child);
      },
      child: child,
    );
  }
}

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
    final serverAsync = ref.watch(serverProvider);
    ref.listen(audioPlayerStreamListenersProvider, (_, __) {});

    final colorScheme = getColorSchemeWhenReady(ref);
    final localeAsync = ref.watch(localeProvider);
    final synotokenAsync = ref.watch(authTokenProvider);

    useEffect(() {
      return () {
        if (!kDebugMode) return;
        ref.read(audioPlayerStreamListenersProvider).dispose();
        audioPlayer.dispose();
      };
    }, []);

    if (serverAsync.isLoading) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    if (serverAsync.hasError) {
      logger.e('Server failed to start: ${serverAsync.error}');
    }

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
                              ExtraProvider<SongListResponse>,
                              SongListResponse
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
                            List<FolderItem>,
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
            pageBuilder: (context, state) => SlideTransitionPage(
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
            pageBuilder: (context, state) => SlideTransitionPage(
              key: state.pageKey,
              child: const TestLayout(),
            ),
          ),
        ],
        redirect: (context, state) {
          logger.d('redirect: ${state.fullPath}');
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
