import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class Aria2SettingsPage extends HookConsumerWidget with BuildItem {
  const Aria2SettingsPage({super.key});

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
          'Aria2 ${l10n.settings}',
          size,
        ),
        buildContent(context, ref, l10n, colorScheme, [
          ...buildItem(
            ref,
            l10n,
            colorScheme,
            l10n.settings,
            _buildSettings(ref, l10n, colorScheme, multiplier),
            multiplier,
          ),
        ]),
      ],
    );
  }

  Widget _buildSettings(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    final enabled = ref.watch(aria2EnabledProvider);
    final host = ref.watch(aria2HostProvider);
    final port = ref.watch(aria2PortProvider);
    final secret = ref.watch(aria2SecretProvider);
    final useHttps = ref.watch(aria2UseHttpsProvider);
    final downloadDir = ref.watch(aria2DownloadDirProvider);

    final hostController = useTextEditingController(text: host);
    final portController = useTextEditingController(text: port.toString());
    final secretController = useTextEditingController(text: secret ?? '');
    final downloadDirController = useTextEditingController(
      text: downloadDir ?? '',
    );

    final hostFocusNode = useFocusNode();
    final portFocusNode = useFocusNode();
    final secretFocusNode = useFocusNode();
    final downloadDirFocusNode = useFocusNode();

    useEffect(() {
      if (hostController.text != host) {
        hostController.text = host;
      }
      return null;
    }, [host]);

    useEffect(() {
      if (portController.text != port.toString()) {
        portController.text = port.toString();
      }
      return null;
    }, [port]);

    useEffect(() {
      final secretValue = secret ?? '';
      if (secretController.text != secretValue) {
        secretController.text = secretValue;
      }
      return null;
    }, [secret]);

    useEffect(() {
      final downloadDirValue = downloadDir ?? '';
      if (downloadDirController.text != downloadDirValue) {
        downloadDirController.text = downloadDirValue;
      }
      return null;
    }, [downloadDir]);

    useEffect(() {
      void listener() {
        if (!hostFocusNode.hasFocus) {
          ref.read(aria2HostProvider.notifier).setHost(hostController.text);
        }
      }

      hostFocusNode.addListener(listener);
      return () => hostFocusNode.removeListener(listener);
    }, [hostController, hostFocusNode]);

    useEffect(() {
      void listener() {
        if (!portFocusNode.hasFocus) {
          final portValue = int.tryParse(portController.text) ?? 6800;
          ref.read(aria2PortProvider.notifier).setPort(portValue);
        }
      }

      portFocusNode.addListener(listener);
      return () => portFocusNode.removeListener(listener);
    }, [portController, portFocusNode]);

    useEffect(() {
      void listener() {
        if (!secretFocusNode.hasFocus) {
          final value = secretController.text;
          ref
              .read(aria2SecretProvider.notifier)
              .setSecret(value.isEmpty ? null : value);
        }
      }

      secretFocusNode.addListener(listener);
      return () => secretFocusNode.removeListener(listener);
    }, [secretController, secretFocusNode]);

    useEffect(() {
      void listener() {
        if (!downloadDirFocusNode.hasFocus) {
          final value = downloadDirController.text;
          ref
              .read(aria2DownloadDirProvider.notifier)
              .setDownloadDir(value.isEmpty ? null : value);
        }
      }

      downloadDirFocusNode.addListener(listener);
      return () => downloadDirFocusNode.removeListener(listener);
    }, [downloadDirController, downloadDirFocusNode]);

    return Column(
      children: [
        buildSwitchTile(
          '${l10n.enable} Aria2',
          l10n.aria2_download_description,
          enabled,
          multiplier,
          (value) async {
            await ref.read(aria2EnabledProvider.notifier).setEnabled(value);
          },
          colorScheme,
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        _buildTextField(
          hostController,
          hostFocusNode,
          l10n.server_address,
          'localhost',
          colorScheme,
          multiplier,
          (value) async {
            await ref.read(aria2HostProvider.notifier).setHost(value);
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        _buildPortField(
          portController,
          portFocusNode,
          l10n.port,
          colorScheme,
          multiplier,
          (value) async {
            await ref.read(aria2PortProvider.notifier).setPort(value);
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        _buildTextField(
          secretController,
          secretFocusNode,
          'RPC ${l10n.secret}',
          l10n.optional,
          colorScheme,
          multiplier,
          (value) async {
            await ref
                .read(aria2SecretProvider.notifier)
                .setSecret(value.isEmpty ? null : value);
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        _buildTextField(
          downloadDirController,
          downloadDirFocusNode,
          l10n.download_dir,
          l10n.download_dir_optional,
          colorScheme,
          multiplier,
          (value) async {
            await ref
                .read(aria2DownloadDirProvider.notifier)
                .setDownloadDir(value.isEmpty ? null : value);
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        buildSwitchTile(
          'HTTPS',
          l10n.aria2_https_description,
          useHttps,
          multiplier,
          (value) async {
            await ref.read(aria2UseHttpsProvider.notifier).setUseHttps(value);
          },
          colorScheme,
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        ListTile(
          title: Text(
            l10n.testConnection,
            style: TextStyle(
              fontSize: 15 * multiplier,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          trailing: Icon(Icons.network_check_rounded, size: 20),
          onTap: () async {
            ref.read(requestFlagProvider.notifier).setRequestFlag(true);
            final aria2 = ref.read(aria2ClientProvider.notifier);
            final (success, message) = await aria2.testConnection();
            ref.read(requestFlagProvider.notifier).setRequestFlag(false);
            final ctx = ref.context;
            if (!ctx.mounted) return;
            showSnackBar(
              message,
              ctx,
              success ? colorScheme.secondary : colorScheme.error,
            );
          },
        ),
        Divider(
          height: 1,
          color: colorScheme.outline.withValues(alpha: 0.2),
          indent: 15,
          endIndent: 15,
        ),
        ListTile(
          title: Text(
            l10n.reset_settings,
            style: TextStyle(
              fontSize: 15 * multiplier,
              fontWeight: FontWeight.bold,
              color: colorScheme.error,
            ),
          ),
          trailing: Icon(
            Icons.restore_rounded,
            size: 20,
            color: colorScheme.error,
          ),
          onTap: () async {
            await ref.read(aria2EnabledProvider.notifier).setEnabled(false);
            await ref.read(aria2HostProvider.notifier).setHost('localhost');
            await ref.read(aria2PortProvider.notifier).setPort(6800);
            await ref.read(aria2SecretProvider.notifier).setSecret(null);
            await ref.read(aria2UseHttpsProvider.notifier).setUseHttps(false);
            await ref
                .read(aria2DownloadDirProvider.notifier)
                .setDownloadDir(null);
            final ctx = ref.context;
            if (!ctx.mounted) return;
            showSnackBar(l10n.settings_reset, ctx, colorScheme.secondary);
          },
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    FocusNode focusNode,
    String title,
    String hint,
    ColorScheme colorScheme,
    double multiplier,
    Future<void> Function(String) onSubmitted,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 12 * multiplier,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4 * multiplier),
        ),
        style: TextStyle(
          fontSize: 13 * multiplier,
          color: colorScheme.onSurface.withValues(alpha: 0.8),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }

  Widget _buildPortField(
    TextEditingController controller,
    FocusNode focusNode,
    String title,
    ColorScheme colorScheme,
    double multiplier,
    Future<void> Function(int) onSubmitted,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '6800',
          hintStyle: TextStyle(
            fontSize: 12 * multiplier,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4 * multiplier),
        ),
        style: TextStyle(
          fontSize: 13 * multiplier,
          color: colorScheme.onSurface.withValues(alpha: 0.8),
        ),
        onSubmitted: (value) async {
          final port = int.tryParse(value) ?? 6800;
          await onSubmitted(port);
        },
      ),
    );
  }
}
