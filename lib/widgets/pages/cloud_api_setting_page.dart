import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/cloud_music/cloud_music_auth.dart';
import 'package:toneharbor/services/cloud_music/song_url.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class CloudApiSettingPage extends HookConsumerWidget with BuildItem {
  const CloudApiSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;

    return Column(
      children: [
        buildAppBar(
          context,
          ref,
          l10n,
          colorScheme,
          l10n.cloud_music_api,
          size,
        ),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.api_url_list,
            _buildUrlSection(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
          if (ref.watch(cloudMusicApiUrlsProvider).defaultUrl.isNotEmpty) ...[
            const SizedBox(height: 16),
            ...buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.cloud_music_login,
              _buildLoginSection(ref, l10n, colorScheme, multiplier),
              multiplier,
            ),
            const SizedBox(height: 16),
            ...buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.preferences_settings,
              _buildPreferencesSection(ref, l10n, colorScheme, multiplier),
              multiplier,
            ),
          ],
        ]),
      ],
    );
  }

  Widget _buildUrlSection(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final apiState = ref.watch(cloudMusicApiUrlsProvider);

    return Column(
      children: [
        if (apiState.urls.isNotEmpty)
          SlidableAutoCloseBehavior(
            child: Column(
              children: apiState.urls.map((url) {
                final isDefault = url == apiState.defaultUrl;
                return _buildUrlItem(
                  ref,
                  l10n,
                  colorScheme,
                  multiplier,
                  url,
                  isDefault,
                );
              }).toList(),
            ),
          ),
        if (apiState.urls.isNotEmpty)
          Divider(
            height: 1,
            color: colorScheme.outline.withValues(alpha: 0.2),
            indent: 15,
            endIndent: 15,
          ),
        _buildAddButton(ref, l10n, colorScheme, multiplier),
      ],
    );
  }

  Widget _buildUrlItem(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
    String url,
    bool isDefault,
  ) {
    return Slidable(
      key: ValueKey(url),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              ref.read(cloudMusicApiUrlsProvider.notifier).removeUrl(url);
            },
            backgroundColor: colorScheme.errorContainer,
            foregroundColor: colorScheme.onErrorContainer,
            icon: Icons.delete,
            label: l10n.delete,
          ),
        ],
      ),
      child: RadioGroup<String>(
        groupValue: ref.watch(cloudMusicApiUrlsProvider).defaultUrl,
        onChanged: (value) {
          if (value != null) {
            ref.read(cloudMusicApiUrlsProvider.notifier).setDefaultUrl(value);
          }
        },
        child: ListTile(
          leading: Radio<String>(value: url, activeColor: colorScheme.primary),
          title: Text(
            url,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14 * multiplier,
              color: colorScheme.onSurface,
              fontWeight: isDefault ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          subtitle: isDefault
              ? Text(
                  l10n.default_url,
                  style: TextStyle(
                    fontSize: 11 * multiplier,
                    color: colorScheme.primary,
                  ),
                )
              : null,
          trailing: isDefault
              ? Icon(Icons.check_circle, color: colorScheme.primary, size: 20)
              : null,
        ),
      ),
    );
  }

  Widget _buildUseAsHomeSwitch(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final apiState = ref.watch(cloudMusicApiUrlsProvider);
    return buildSwitchTile(
      l10n.use_cloud_music_as_home,
      l10n.use_cloud_music_as_home_desc,
      apiState.useAsHome,
      multiplier,
      (value) {
        ref.read(cloudMusicApiUrlsProvider.notifier).setUseAsHome(value);
      },
      colorScheme,
    );
  }

  Widget _buildAddButton(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.add_circle_outline, color: colorScheme.primary),
          title: Text(
            l10n.add_api_url,
            style: TextStyle(
              fontSize: 15 * multiplier,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          subtitle: Text(
            l10n.cloud_music_api_hint,
            style: TextStyle(
              fontSize: 11 * multiplier,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          onTap: () => _showAddUrlDialog(ref, colorScheme, l10n),
        ),
      ],
    );
  }

  void _showAddUrlDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController();

    showCommonDialog(
      context: ref.context,
      colorScheme: colorScheme,
      title: l10n.add_api_url,
      contentBuilder: (innerContext) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: l10n.api_url,
              hintText: 'https://api.example.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
            ),
            keyboardType: TextInputType.url,
            autocorrect: false,
            enableSuggestions: false,
          ),
        );
      },
      cancelText: l10n.cancel,
      confirmText: l10n.confirm,
      onConfirm: (innerContext) async {
        final url = controller.text.trim();
        if (url.isEmpty) return;

        if (!_isValidUrl(url)) {
          if (innerContext.mounted) {
            showSnackBar(
              l10n.invalid_url_format,
              innerContext,
              colorScheme.secondary,
            );
          }
          return;
        }

        final apiState = ref.read(cloudMusicApiUrlsProvider);
        if (apiState.urls.contains(url)) {
          if (innerContext.mounted) {
            showSnackBar(
              l10n.url_already_exists,
              innerContext,
              colorScheme.secondary,
            );
          }
          return;
        }

        ref.read(cloudMusicApiUrlsProvider.notifier).addUrl(url);
      },
    );
  }

  bool _isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    if (!uri.hasScheme || uri.host.isEmpty) return false;
    if (uri.scheme != 'http' && uri.scheme != 'https') return false;
    return true;
  }

  Widget _buildLanguageSection(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final languageType = ref.watch(cloudMusicLanguageProvider);
    return Column(
      children: [
        buildDropdownTile<CloudMusicLanguageType>(
          title: _getLanguageDisplayName(languageType, l10n),
          items: CloudMusicLanguageType.values,
          value: languageType,
          colorScheme: colorScheme,
          onChanged: (value) {
            if (value != null) {
              ref.read(cloudMusicLanguageProvider.notifier).set(value);
            }
          },
          multiplier: multiplier,
          labelBuilder: (lang) => _getLanguageDisplayName(lang, l10n),
        ),
      ],
    );
  }

  String _getLanguageDisplayName(
    CloudMusicLanguageType type,
    AppLocalizations l10n,
  ) {
    switch (type) {
      case CloudMusicLanguageType.unKnow:
        return l10n.language_all;
      case CloudMusicLanguageType.zh:
        return l10n.language_chinese;
      case CloudMusicLanguageType.en:
        return l10n.language_euro;
      case CloudMusicLanguageType.jp:
        return l10n.language_japanese;
      case CloudMusicLanguageType.kr:
        return l10n.language_korean;
    }
  }

  Widget _buildQualitySection(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final quality = ref.watch(cloudMusicQualitySettingProvider);
    return Column(
      children: [
        buildDropdownTile<CloudMusicQuality>(
          title: _getQualityDisplayName(quality, l10n),
          items: CloudMusicQuality.values,
          value: quality,
          colorScheme: colorScheme,
          onChanged: (value) {
            if (value != null) {
              ref.read(cloudMusicQualitySettingProvider.notifier).set(value);
            }
          },
          multiplier: multiplier,
          labelBuilder: (q) => _getQualityDisplayName(q, l10n),
        ),
      ],
    );
  }

  String _getQualityDisplayName(
    CloudMusicQuality quality,
    AppLocalizations l10n,
  ) {
    switch (quality) {
      case CloudMusicQuality.standard:
        return l10n.quality_standard;
      case CloudMusicQuality.higher:
        return l10n.quality_higher;
      case CloudMusicQuality.exhigh:
        return l10n.quality_exhigh;
      case CloudMusicQuality.lossless:
        return l10n.quality_lossless;
      case CloudMusicQuality.hires:
        return l10n.quality_hires;
    }
  }

  Widget _buildPreferencesSection(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    return Column(
      children: [
        _buildUseAsHomeSwitch(ref, l10n, colorScheme, multiplier),
        Divider(height: 1, color: colorScheme.onSurface.withValues(alpha: 0.1)),
        _buildLanguageSection(ref, l10n, colorScheme, multiplier),
        Divider(height: 1, color: colorScheme.onSurface.withValues(alpha: 0.1)),
        _buildQualitySection(ref, l10n, colorScheme, multiplier),
      ],
    );
  }

  Widget _buildLoginSection(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);
    final userInfo = ref.watch(cloudUserInfoProvider);

    return Slidable(
      key: ValueKey('login'),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          if (isLoggedIn) ...[
            SlidableAction(
              onPressed: (context) {
                ref.read(cloudMusicAuthStateProvider.notifier).logout();
              },
              backgroundColor: colorScheme.errorContainer,
              foregroundColor: colorScheme.onErrorContainer,
              icon: Icons.logout,
              label: l10n.cloud_music_logout,
            ),
            SlidableAction(
              onPressed: (context) {
                final cookies = CloudMusicAuth.getCookies();
                if (cookies == null || cookies.isEmpty) return;
                if (context.mounted) {
                  copyToClipboard(cookies, context, colorScheme.secondary);
                }
              },
              backgroundColor: colorScheme.tertiaryContainer,
              foregroundColor: colorScheme.onTertiaryContainer,
              icon: Icons.copy,
              label: l10n.copy,
            ),
          ],
          if (!isLoggedIn) ...[
            SlidableAction(
              onPressed: (context) {
                ref.context.pushWrapper("/cloud-login");
              },
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
              icon: Icons.login,
              label: l10n.web_login,
            ),
            SlidableAction(
              onPressed: (context) {
                _showCookieInputDialog(ref, colorScheme, l10n);
              },
              backgroundColor: colorScheme.tertiaryContainer,
              foregroundColor: colorScheme.onTertiaryContainer,
              icon: Icons.login,
              label: l10n.cookie_login,
            ),
          ],
        ],
      ),
      child: ListTile(
        leading: isLoggedIn && userInfo.value != null
            ? CircleAvatar(
                radius: 18,
                backgroundImage: userInfo.value!.avatarUrl != null
                    ? NetworkImage(userInfo.value!.avatarUrl!)
                    : null,
                backgroundColor: colorScheme.primaryContainer,
                child: userInfo.value!.avatarUrl == null
                    ? Icon(
                        Icons.person,
                        color: colorScheme.onPrimaryContainer,
                        size: 20,
                      )
                    : null,
              )
            : null,
        trailing: Icon(isLoggedIn ? null : Icons.arrow_forward_ios),
        title: Text(
          isLoggedIn
              ? userInfo.value?.nickname ?? l10n.cloud_music_logged_in
              : l10n.cloud_music_not_logged_in,
          style: TextStyle(
            fontSize: 15 * multiplier,
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          isLoggedIn
              ? userInfo.value?.signature ?? userInfo.value?.userName ?? ''
              : l10n.cloud_music_login,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12 * multiplier,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        onTap: () {
          if (isLoggedIn) {
            showSnackBar(
              l10n.cloud_music_logged_in,
              ref.context,
              colorScheme.secondary,
            );
            return;
          }
          _showLoginMethodDialog(ref, colorScheme, l10n);
        },
      ),
    );
  }

  void _showLoginMethodDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final context = ref.context;
    showCommonDialog(
      context: context,
      colorScheme: colorScheme,
      title: l10n.select_login_method,
      contentBuilder: (innerContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.language, color: colorScheme.primary),
              title: Text(l10n.web_login),
              onTap: () async {
                Navigator.pop(innerContext);
                ref.context.pushWrapper("/cloud-login");
              },
            ),
            ListTile(
              leading: Icon(Icons.cookie, color: colorScheme.tertiary),
              title: Text(l10n.cookie_login),
              onTap: () {
                Navigator.pop(innerContext);
                _showCookieInputDialog(ref, colorScheme, l10n);
              },
            ),
          ],
        );
      },
    );
  }

  void _showCookieInputDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController();
    final context = ref.context;
    showCommonDialog(
      context: context,
      colorScheme: colorScheme,
      title: l10n.cookie_login,
      contentBuilder: (innerContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.manual_cookie_input_hint),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: l10n.cookie_input_placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
              ),
            ),
          ],
        );
      },
      cancelText: l10n.cancel,
      confirmText: l10n.confirm,
      onConfirm: (innerContext) async {
        final cookieString = controller.text.trim();
        if (cookieString.isEmpty) {
          if (innerContext.mounted) {
            showSnackBar(
              l10n.cookie_input_empty,
              innerContext,
              colorScheme.error,
            );
          }
          return;
        }

        if (!cookieString.contains('MUSIC_U')) {
          if (innerContext.mounted) {
            showSnackBar(
              l10n.invalid_cookie_format,
              innerContext,
              colorScheme.error,
            );
          }
          return;
        }

        await ref
            .read(cloudMusicAuthStateProvider.notifier)
            .loginSuccess(cookieString);
        if (innerContext.mounted) {
          showSnackBar(l10n.login_success, innerContext, Colors.green);
        }
      },
    );
  }
}
