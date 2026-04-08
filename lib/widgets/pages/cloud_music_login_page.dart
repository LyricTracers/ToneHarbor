import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/cloud_music/cloud_music_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';

class CloudMusicLoginPage extends HookConsumerWidget {
  const CloudMusicLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final isLoading = useState<bool>(true);
    final loginSuccess = useState<bool>(false);
    final hasError = useState<bool>(false);
    final errorMessage = useState<String>('');
    final loginChecked = useState<bool>(false);
    final size = MediaQuery.of(context).size;

    useEffect(() {
      _checkExistingCookies(
        ref,
        context,
        isLoading,
        loginSuccess,
        loginChecked,
        colorScheme,
        l10n,
      );
      return null;
    }, []);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (loginSuccess.value) {
          Navigator.of(context).pop();
        } else {
          _showExitConfirmDialog(context, colorScheme, l10n);
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: size.lgAndUp
              ? colorScheme.tertiary.withValues(alpha: 0.1)
              : Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close, color: colorScheme.onSurface),
            onPressed: () {
              if (loginSuccess.value) {
                Navigator.of(context).pop();
              } else {
                _showExitConfirmDialog(context, colorScheme, l10n);
              }
            },
          ),
          title: Text(
            l10n.cloud_music_login,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            if (!loginSuccess.value && !hasError.value)
              _buildWebView(
                ref,
                context,
                isLoading,
                loginSuccess,
                hasError,
                errorMessage,
                loginChecked,
                colorScheme,
                l10n,
              )
            else if (hasError.value)
              _buildErrorView(colorScheme, l10n, errorMessage.value, () {
                hasError.value = false;
                isLoading.value = true;
              })
            else
              _buildSuccessView(colorScheme, l10n),
            if (isLoading.value && !hasError.value && !loginSuccess.value)
              _buildLoadingOverlay(colorScheme, l10n),
          ],
        ),
      ),
    );
  }

  Future<void> _checkExistingCookies(
    WidgetRef ref,
    BuildContext context,
    ValueNotifier<bool> isLoading,
    ValueNotifier<bool> loginSuccess,
    ValueNotifier<bool> loginChecked,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) async {
    try {
      final existingCookies = await CloudMusicAuth.getCookiesFromWebView();

      if (existingCookies != null &&
          CloudMusicAuth.isLoggedIn(existingCookies)) {
        logger.i('检测到 WebView 中已存在登录 cookies，直接使用');
        await ref
            .read(cloudMusicAuthStateProvider.notifier)
            .loginSuccess(existingCookies);
        loginSuccess.value = true;
        loginChecked.value = true;
        isLoading.value = false;

        if (context.mounted) {
          showCommonDialog(
            context: context,
            colorScheme: colorScheme,
            title: l10n.login_success,
            content: Text(l10n.login_success_desc),
            confirmText: l10n.confirm,
            onConfirm: () async {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          );
        }
        return;
      }

      logger.d('WebView 中无现有 cookies，需要用户登录');
      isLoading.value = false;
    } catch (e) {
      logger.e('检查现有 cookies 失败: $e');
      isLoading.value = false;
    }
  }

  Widget _buildWebView(
    WidgetRef ref,
    BuildContext context,
    ValueNotifier<bool> isLoading,
    ValueNotifier<bool> loginSuccess,
    ValueNotifier<bool> hasError,
    ValueNotifier<String> errorMessage,
    ValueNotifier<bool> loginChecked,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final webViewController = useState<InAppWebViewController?>(null);
    final lastCheckTime = useState<DateTime?>(null);

    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(CloudMusicAuth.loginUrl)),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        domStorageEnabled: true,
        cacheEnabled: true,
        useWideViewPort: true,
        loadWithOverviewMode: true,
        supportZoom: true,
        builtInZoomControls: true,
        displayZoomControls: false,
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      ),
      onWebViewCreated: (controller) {
        webViewController.value = controller;
      },
      onLoadStart: (controller, url) {
        if (!loginSuccess.value) {
          isLoading.value = true;
        }
      },
      onLoadStop: (controller, url) async {
        if (loginChecked.value || loginSuccess.value) return;

        final now = DateTime.now();
        final lastCheck = lastCheckTime.value;
        if (lastCheck != null && now.difference(lastCheck).inSeconds < 2) {
          return;
        }
        lastCheckTime.value = now;

        await _checkLoginStatus(
          ref,
          context,
          url,
          loginSuccess,
          loginChecked,
          colorScheme,
          l10n,
        );

        if (!loginSuccess.value) {
          isLoading.value = false;
        }
      },
      onReceivedError: (controller, request, error) {
        logger.e('WebView 加载错误: ${error.description}');
        if (request.isForMainFrame ?? false) {
          hasError.value = true;
          errorMessage.value = error.description.isNotEmpty
              ? error.description
              : 'Failed to load page';
          isLoading.value = false;
        }
      },
      onProgressChanged: (controller, progress) {
        if (progress >= 90 && progress < 100 && !loginSuccess.value) {
          isLoading.value = false;
        } else if (progress == 100 && !loginSuccess.value) {
          isLoading.value = false;
        }
      },
    );
  }

  Widget _buildSuccessView(ColorScheme colorScheme, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.check_circle,
                size: 40,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.login_success,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.login_success_desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay(ColorScheme colorScheme, AppLocalizations l10n) {
    return Container(
      color: colorScheme.surface.withValues(alpha: 0.9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.loading_text,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(
    ColorScheme colorScheme,
    AppLocalizations l10n,
    String error,
    VoidCallback onRetry,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: colorScheme.error.withValues(alpha: 0.8),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.failed_to_load_page,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, color: colorScheme.onPrimary),
              label: Text(
                l10n.retry,
                style: TextStyle(color: colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkLoginStatus(
    WidgetRef ref,
    BuildContext context,
    WebUri? url,
    ValueNotifier<bool> loginSuccess,
    ValueNotifier<bool> loginChecked,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) async {
    if (url == null) return;

    final urlString = url.toString();
    if (!CloudMusicAuth.isLoginSuccessUrl(urlString)) {
      return;
    }

    try {
      final cookieString = await CloudMusicAuth.getCookiesFromWebView();

      if (cookieString == null || cookieString.isEmpty) {
        logger.d('未获取到 cookies，等待用户操作');
        return;
      }

      if (CloudMusicAuth.isLoggedIn(cookieString)) {
        logger.i('检测到登录成功，保存 cookies');
        await ref
            .read(cloudMusicAuthStateProvider.notifier)
            .loginSuccess(cookieString);
        loginSuccess.value = true;
        loginChecked.value = true;

        if (context.mounted) {
          showCommonDialog(
            context: context,
            colorScheme: colorScheme,
            title: l10n.login_success,
            content: Text(l10n.login_success_desc),
            confirmText: l10n.confirm,
            onConfirm: () async {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          );
        }
      }
    } catch (e) {
      logger.e('获取 cookies 失败: $e');
    }
    return;
  }

  void _showExitConfirmDialog(
    BuildContext context,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    showCommonDialog(
      context: context,
      colorScheme: colorScheme,
      title: l10n.confirm_exit_login,
      content: Text(l10n.confirm_exit_login_desc),
      cancelText: l10n.cancel,
      confirmText: l10n.confirm_exit,
      onConfirm: () async => Navigator.of(context).pop(),
    );
  }
}
