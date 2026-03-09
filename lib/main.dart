import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/providers/server/server_provider.dart';
import 'package:toneharbor/providers/audio_player/audio_player_streams.dart';
import 'package:toneharbor/widgets/layouts/playing_detail_layout.dart';
import 'package:toneharbor/widgets/widgets.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'init/initialized.dart';
import 'utils/base_utils.dart';
import 'l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

enum SlideDirection { rightToLeft, bottomToTop }

class SlideTransitionPage extends CustomTransitionPage<void> {
  SlideTransitionPage({
    required super.child,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.slideDirection = SlideDirection.rightToLeft,
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return _buildSlideTransition(
             context,
             animation,
             secondaryAnimation,
             child,
             slideDirection,
           );
         },
       );

  final SlideDirection slideDirection;

  static Widget _buildSlideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    SlideDirection direction,
  ) {
    Offset beginOffset;
    switch (direction) {
      case SlideDirection.rightToLeft:
        beginOffset = const Offset(1.0, 0.0);
        break;
      case SlideDirection.bottomToTop:
        beginOffset = const Offset(0.0, 1.0);
        break;
    }

    final slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(0.8, 1.0, curve: Curves.easeInBack),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
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
                pageBuilder: (context, state) =>
                    SlideTransitionPage(child: const RecommendPage()),
              ),
            ],
            builder: (context, state, child) {
              return HomeLayout(child: child);
            },
          ),
          GoRoute(
            path: "/playing_detail",
            pageBuilder: (context, state) => SlideTransitionPage(
              child: const PlayingDetailLayout(),
              slideDirection: SlideDirection.bottomToTop,
            ),
          ),
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) =>
                SlideTransitionPage(child: LoginLayout()),
          ),
          GoRoute(
            path: '/test',
            pageBuilder: (context, state) =>
                const MaterialPage(child: TestLayout()),
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
