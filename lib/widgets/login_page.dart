import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/base_bg_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends BaseBgLayout {
  const LoginPage({super.key});

  @override
  Widget buildContent(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> loadFlag,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = getColorSchemeWhenReady(ref);
    final serverUrlController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final useHttps = useState(true);
    final obscurePassword = useState(true);
    final serverUrlError = useState<String?>(null);
    final usernameError = useState<String?>(null);
    final passwordError = useState<String?>(null);

    Future<void> handleLogin() async {
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

      if (!_isValidServerUrl(serverUrl)) {
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

      loadFlag.value = true;

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('serverUrl', serverUrl);
      await prefs.setString('username', username);
      await prefs.setBool('useHttps', useHttps.value);
      await Future.delayed(const Duration(seconds: 1));
      loadFlag.value = false;
    }

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
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
                  enabled: !loadFlag.value,
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
                  enabled: !loadFlag.value,
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
                  enabled: !loadFlag.value,
                  onSubmitted: (_) => handleLogin(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: useHttps.value,
                      onChanged: (value) => useHttps.value = value ?? true,
                    ),
                    Text(l10n.useHttps),
                  ],
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: loadFlag.value ? null : handleLogin,
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

  static bool _isValidServerUrl(String url) {
    final ipPortPattern = RegExp(
      r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,5}$',
    );
    final domainPortPattern = RegExp(
      r'^[a-zA-Z0-9][a-zA-Z0-9\-\.]+\.[a-zA-Z0-9\-]+:\d{1,5}$',
    );
    final localhostPattern = RegExp(r'^localhost:\d{1,5}$');

    return ipPortPattern.hasMatch(url) ||
        domainPortPattern.hasMatch(url) ||
        localhostPattern.hasMatch(url);
  }
}
