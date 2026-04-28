import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/api_cache_providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/excetions.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/layouts/base_bg_layout.dart';

class LoginLayout extends BaseBgLayout {
  const LoginLayout({
    super.key,
    super.enableLoading = true,
    super.appbar = false,
  });

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final l10n = ref.watch(l10nProvider);

    final colorScheme = getColorSchemeWhenReady(ref);
    final serverUrlAsync = ref.watch(serverUrlProvider);
    final accountInfo = ref.watch(accountInfoProvider);
    final serverUrlController = useTextEditingController();

    useEffect(() {
      if (serverUrlAsync.isNotEmpty) {
        serverUrlController.text = serverUrlAsync;
      }
      return null;
    }, [serverUrlAsync]);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    useEffect(() {
      if (accountInfo != null) {
        usernameController.text = accountInfo.account;
        passwordController.text = accountInfo.passwd;
      }
      return null;
    }, [accountInfo]);

    final useHttps = ref.watch(useHttpProvider);
    final obscurePassword = useState(true);
    final serverUrlError = useState<String?>(null);
    final usernameError = useState<String?>(null);
    final passwordError = useState<String?>(null);
    final testingConnection = useState(false);

    Future<void> handleTestConnection() async {
      final serverUrl = serverUrlController.text.trim();
      serverUrlError.value = null;

      if (serverUrl.isEmpty) {
        serverUrlError.value = l10n.error_serverUrl;
        return;
      }

      if (!isValidServerUrl(serverUrl)) {
        serverUrlError.value = l10n.error_invalidUrl;
        return;
      }

      final serverUrlNotifier = ref.read(serverUrlProvider.notifier);
      await serverUrlNotifier.setServerUrl(serverUrl);
      ref.invalidate(baseUrlProvider);
      testingConnection.value = true;
      try {
        if (!serverUrl.contains('.') &&
            !serverUrl.contains(':') &&
            serverUrl.length >= 3) {
          await ref.read(quickConnectTestProvider(serverUrl).future);
        }

        final response = await ref.read(testConnectionProvider.future);
        logger.i("测试连通性响应: $response");
        if (context.mounted) {
          showSnackBar(
            l10n.testConnectionSuccess,
            context,
            colorScheme.primary,
          );
        }
      } catch (e) {
        logger.e("测试连通性异常: $e");
        if (context.mounted) {
          if (e is AudioStationException) {
            showSnackBar(e.message, context, colorScheme.secondary);
          } else {
            showSnackBar(
              l10n.error_network_error,
              context,
              colorScheme.secondary,
            );
          }
        }
      } finally {
        testingConnection.value = false;
      }
    }

    Future<void> handleLogin(BuildContext context) async {
      final serverUrl = serverUrlController.text.trim();
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      serverUrlError.value = null;
      usernameError.value = null;
      passwordError.value = null;

      if (serverUrl.isEmpty) {
        serverUrlError.value = l10n.error_serverUrl;
        return;
      }

      if (!isValidServerUrl(serverUrl)) {
        serverUrlError.value = l10n.error_invalidUrl;
        return;
      }

      if (username.isEmpty) {
        usernameError.value = l10n.error_username;
        return;
      }

      if (password.isEmpty) {
        passwordError.value = l10n.error_password;
        return;
      }

      final serverUrlNotifier = ref.read(serverUrlProvider.notifier);
      await serverUrlNotifier.setServerUrl(serverUrl);

      final accountInfoNotifier = ref.read(accountInfoProvider.notifier);
      await accountInfoNotifier.setAccount(
        Account(account: username, passwd: password),
      );

      try {
        ref.read(requestFlagProvider.notifier).setRequestFlag(true);
        ref.invalidate(baseUrlProvider);
        final response = await ref.read(loginProvider.future);
        if (response.success) {
          ref.invalidate(baseUrlProvider);
          invalidateApiCacheProvidersForWidget(ref);
          logger.i("登录成功");
          if (context.mounted) {
            // ref.invalidate(authTokenProvider);
            ref.invalidate(audioStationCookiesInfoProvider);
            context.go('/');
          }
        }
      } catch (e) {
        logger.e("登录异常: $e");

        if (context.mounted) {
          if (e is AudioStationException) {
            showSnackBar(e.message, context, colorScheme.secondary);
          } else {
            showSnackBar(
              l10n.error_login_failed,
              context,
              colorScheme.secondary,
            );
          }
        }
      } finally {
        ref.read(requestFlagProvider.notifier).setRequestFlag(false);
      }
    }

    return Stack(
      children: [
        Positioned(
          right: 16,
          top: 16,
          child: SafeArea(
            child: IconButton(
              onPressed: () {
                ref.context.pushWrapper("/full_log");
              },
              icon: const Icon(Icons.more_vert_outlined, size: 18),
              tooltip: l10n.log_viewer,
            ),
          ),
        ),

        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.appTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.appSubtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onSurface.withValues(alpha: .7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: serverUrlController,
                      decoration: InputDecoration(
                        labelText: l10n.serverUrl,
                        hintText: l10n.server_url_hint,
                        prefixIcon: const Icon(Icons.dns),
                        suffixIcon: IconButton(
                          icon: Icon(
                            testingConnection.value
                                ? Icons.hourglass_empty
                                : Icons.wifi,
                          ),
                          onPressed: testingConnection.value || requestFlag
                              ? null
                              : handleTestConnection,
                          tooltip: l10n.testConnection,
                        ),
                        border: const OutlineInputBorder(),
                        errorText: serverUrlError.value,
                        errorBorder: serverUrlError.value != null
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 2,
                                ),
                              )
                            : null,
                      ),
                      keyboardType: TextInputType.url,
                      enabled: !requestFlag,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: l10n.username,
                        prefixIcon: const Icon(Icons.person),
                        border: const OutlineInputBorder(),
                        errorText: usernameError.value,
                        errorBorder: usernameError.value != null
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 2,
                                ),
                              )
                            : null,
                      ),
                      keyboardType: TextInputType.text,
                      enabled: !requestFlag,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: l10n.password,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            obscurePassword.value = !obscurePassword.value;
                          },
                        ),
                        border: const OutlineInputBorder(),
                        errorText: passwordError.value,
                        errorBorder: passwordError.value != null
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 2,
                                ),
                              )
                            : null,
                      ),
                      obscureText: obscurePassword.value,
                      enabled: !requestFlag,
                      onSubmitted: (_) => handleLogin(context),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: useHttps,
                              onChanged: (value) =>
                                  ref.read(useHttpProvider.notifier).toggle(),
                            ),
                            Text(l10n.useHttps),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: requestFlag
                          ? null
                          : () => handleLogin(context),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(l10n.signIn),
                    ),
                    const SizedBox(height: 16),
                    TextButton.icon(
                      onPressed: () {
                        context.pushWrapper('/local_music');
                      },
                      icon: const Icon(Icons.library_music_outlined, size: 18),
                      label: Text(l10n.local_songs),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
