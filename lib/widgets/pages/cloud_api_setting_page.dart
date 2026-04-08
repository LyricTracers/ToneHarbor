import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';
import 'package:toneharbor/widgets/pages/cloud_music_login_page.dart';

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
              l10n.home_page_settings,
              _buildUseAsHomeSwitch(ref, l10n, colorScheme, multiplier),
              multiplier,
            ),
            const SizedBox(height: 16),
            ...buildItem(
              ref,
              l10n,
              colorScheme,
              l10n.cloud_music_login,
              _buildLoginSection(ref, l10n, colorScheme, multiplier),
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
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: l10n.api_url,
            hintText: 'https://api.example.com',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
          ),
          keyboardType: TextInputType.url,
          autocorrect: false,
          enableSuggestions: false,
        ),
      ),
      cancelText: l10n.cancel,
      confirmText: l10n.confirm,
      onConfirm: () async {
        final url = controller.text.trim();
        if (url.isEmpty) return;

        if (!_isValidUrl(url)) {
          if (ref.context.mounted) {
            ScaffoldMessenger.of(ref.context).showSnackBar(
              SnackBar(
                content: Text(l10n.invalid_url_format),
                backgroundColor: colorScheme.error,
              ),
            );
          }
          return;
        }

        final apiState = ref.read(cloudMusicApiUrlsProvider);
        if (apiState.urls.contains(url)) {
          if (ref.context.mounted) {
            ScaffoldMessenger.of(ref.context).showSnackBar(
              SnackBar(
                content: Text(l10n.url_already_exists),
                backgroundColor: colorScheme.errorContainer,
              ),
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

  Widget _buildLoginSection(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final isLoggedIn = ref.watch(cloudMusicAuthStateProvider);

    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.login,
            color: isLoggedIn ? Colors.green : colorScheme.primary,
          ),
          title: Text(
            isLoggedIn
                ? l10n.cloud_music_logged_in
                : l10n.cloud_music_not_logged_in,
            style: TextStyle(
              fontSize: 15 * multiplier,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            isLoggedIn ? l10n.cloud_music_logged_in : l10n.cloud_music_login,
            style: TextStyle(
              fontSize: 12 * multiplier,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          trailing: isLoggedIn
              ? IconButton(
                  icon: Icon(Icons.logout, color: colorScheme.error),
                  onPressed: () => _showLogoutDialog(ref, colorScheme, l10n),
                  tooltip: l10n.cloud_music_logout,
                )
              : Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
          onTap: () {
            Navigator.of(ref.context).push(
              MaterialPageRoute(
                builder: (context) => const CloudMusicLoginPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showLogoutDialog(
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    showCommonDialog(
      context: ref.context,
      colorScheme: colorScheme,
      title: l10n.cloud_music_logout,
      content: Text(l10n.confirm_exit_login_desc),
      cancelText: l10n.cancel,
      confirmText: l10n.confirm_exit,
      onConfirm: () async {
        await ref.read(cloudMusicAuthStateProvider.notifier).logout();
      },
    );
  }
}
