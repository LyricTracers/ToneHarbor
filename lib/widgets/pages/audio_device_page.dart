import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart' as mk;
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/services/audio_player/audio_player.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class AudioDevicePage extends HookConsumerWidget with BuildItem {
  const AudioDevicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);

    final devicesFuture = useFuture(audioPlayer.devices);
    final devicesStream = useStream(audioPlayer.devicesStream);
    final selectedDeviceFuture = useFuture(audioPlayer.selectedDevice);
    final selectedDeviceStream = useStream(audioPlayer.selectedDeviceStream);

    final devices = devicesStream.data ?? devicesFuture.data;
    final selectedDevice =
        selectedDeviceStream.data ?? selectedDeviceFuture.data;

    return Column(
      children: [
        buildAppBar(context, ref, l10n, colorScheme, l10n.audio_device),
        buildContent(context, ref, l10n, colorScheme, [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              color: colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Connect AirPlay or Bluetooth devices in System Settings first, then they will appear here.',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (devices == null)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            )
          else if (devices.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  l10n.no_audio_devices_found,
                  style: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            )
          else
            _buildDeviceList(
              context,
              ref,
              l10n,
              colorScheme,
              devices,
              selectedDevice,
            ),
        ]),
      ],
    );
  }

  Widget _buildDeviceList(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    List<mk.AudioDevice> devices,
    mk.AudioDevice? selectedDevice,
  ) {
    if (devices.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            l10n.no_audio_devices_found,
            style: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.speaker, size: 20, color: colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                l10n.available_devices,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...devices.map(
          (device) => _buildDeviceTile(
            context,
            ref,
            l10n,
            colorScheme,
            device,
            selectedDevice,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            l10n.audio_device_hint,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceTile(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    mk.AudioDevice device,
    mk.AudioDevice? selectedDevice,
  ) {
    final isSelected = selectedDevice?.name == device.name;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primaryContainer.withValues(alpha: 0.3)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: colorScheme.primary, width: 2)
            : null,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.2)
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getDeviceIcon(device.name),
            color: isSelected ? colorScheme.primary : colorScheme.onSurface,
            size: 24,
          ),
        ),
        title: Text(
          device.description.isNotEmpty ? device.description : device.name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? colorScheme.primary : colorScheme.onSurface,
          ),
        ),
        subtitle: device.description.isNotEmpty
            ? Text(
                device.name,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              )
            : null,
        trailing: isSelected
            ? Icon(Icons.check_circle, color: colorScheme.primary)
            : null,
        onTap: () async {
          await audioPlayer.setAudioDevice(device);
        },
      ),
    );
  }

  IconData _getDeviceIcon(String deviceName) {
    final name = deviceName.toLowerCase();
    if (name.contains('airplay') ||
        name.contains('apple tv') ||
        name.contains('homepod')) {
      return Icons.airplay;
    } else if (name.contains('bluetooth') || name.contains('bt')) {
      return Icons.bluetooth_audio;
    } else if (name.contains('headphone') ||
        name.contains('headset') ||
        name.contains('earphone')) {
      return Icons.headphones;
    } else if (name.contains('hdmi') || name.contains('displayport')) {
      return Icons.tv;
    } else if (name.contains('usb')) {
      return Icons.usb;
    } else if (name.contains('speaker') || name.contains('built-in')) {
      return Icons.speaker;
    }
    return Icons.speaker;
  }
}
