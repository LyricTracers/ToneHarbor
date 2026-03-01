import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyricskit/lyricskit.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/widgets.dart';
import 'init/initialized.dart';
import 'utils/base_utils.dart';
import 'l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SlideTransitionPage extends CustomTransitionPage<void> {
  const SlideTransitionPage({
    required super.child,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
  }) : super(transitionsBuilder: _buildSlideTransition);

  static Widget _buildSlideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutSine));

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutSine));

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
    final colorScheme = getColorSchemeWhenReady(ref);
    final localeAsync = ref.watch(localeProvider);
    final synotokenAsync = ref.watch(authTokenProvider);

    final router = useMemoized(() {
      return GoRouter(
        routes: [
          ShellRoute(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => SlideTransitionPage(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      context.push('/test');
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("跳转测试页"),
                  ),
                ),
              ),
            ],
            builder: (context, state, child) {
              return HomeLayout(child: child);
            },
          ),
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) =>
                const MaterialPage(child: LoginLayout()),
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
      locale: localeAsync.value ?? const Locale('zh'),
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
