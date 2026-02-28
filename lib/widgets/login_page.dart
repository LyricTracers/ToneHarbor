import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_station/auth.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/excetions.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';

class LoginPage extends BaseBgLayout {
  const LoginPage({super.key, super.showLoading = true});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final l10n = lookupAppLocalizations(
      getValueWhenReadyWithWidgetRef(ref, localeProvider, Locale('zh')),
    );
    final colorScheme = getColorSchemeWhenReady(ref);
    final serverUrlAsync = ref.watch(serverUrlProvider);
    final accountInfo = ref.watch(accountInfoProvider);
    final serverUrlController = useTextEditingController();

    useEffect(() {
      if (serverUrlAsync.hasValue && serverUrlAsync.value != null) {
        serverUrlController.text = serverUrlAsync.value!;
      }
      return null;
    }, [serverUrlAsync]);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    useEffect(() {
      if (accountInfo.hasValue && accountInfo.value != null) {
        usernameController.text = accountInfo.value!.account;
        passwordController.text = accountInfo.value!.passwd;
      }
      return null;
    }, [accountInfo]);

    final useHttps = getValueWhenReadyWithWidgetRef(ref, useHttpProvider, true);
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

      testingConnection.value = true;
      try {
        await testConnection(ref: ref);
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
        final response = await login(ref);
        ref.read(requestFlagProvider.notifier).setRequestFlag(false);

        if (response.success) {
          logger.i("登录成功");
          if (context.mounted) {
            ref.invalidate(authTokenProvider);
            context.go('/');
          }
        }
      } catch (e) {
        logger.e("登录异常: $e");

        ref.read(requestFlagProvider.notifier).setRequestFlag(false);

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
      }
    }

    return Center(
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
                    hintText: '192.168.1.100:5000',
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
                Row(
                  children: [
                    Checkbox(
                      value: useHttps,
                      onChanged: (value) =>
                          ref.read(useHttpProvider.notifier).toggle(),
                    ),
                    Text(l10n.useHttps),
                  ],
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: requestFlag ? null : () => handleLogin(context),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(l10n.signIn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
