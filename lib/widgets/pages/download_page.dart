import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/audio_player/download_history_provider.dart';
import 'package:toneharbor/providers/audio_player/download_manager.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';

class DownloadPage extends HookConsumerWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(0);
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);

    return Column(
      children: [
        AppBar(
          title: Text(
            l10n.download_center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [
            _buildTabButton(
              icon: Icons.download_rounded,
              isSelected: selectedTab.value == 0,
              colorScheme: colorScheme,
              onPressed: () => selectedTab.value = 0,
            ),
            _buildTabButton(
              icon: Icons.history_rounded,
              isSelected: selectedTab.value == 1,
              colorScheme: colorScheme,
              onPressed: () {
                ref.invalidate(downloadHistoryProvider);
                selectedTab.value = 1;
              },
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings_rounded, size: 18),
            ),
          ],
          centerTitle: false,
        ),
        Expanded(
          child: selectedTab.value == 0
              ? _DownloadListTab(l10n: l10n)
              : _DownloadHistoryTab(l10n: l10n),
        ),
      ],
    );
  }

  Widget _buildTabButton({
    required IconData icon,
    required bool isSelected,
    required ColorScheme colorScheme,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 18, color: colorScheme.onSurface),
        ),
        if (isSelected)
          Container(
            height: 2,
            width: 20,
            decoration: BoxDecoration(color: colorScheme.primary),
          ),
      ],
    );
  }
}

class _DownloadListTab extends HookConsumerWidget {
  final AppLocalizations l10n;

  const _DownloadListTab({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadNormalTasks = ref.watch(
      downloadManagerProvider.select(
        (tasks) => tasks.where((t) => t.type == DownloadType.normal).toList(),
      ),
    );
    final downloadPreloadTasks = ref.watch(
      downloadManagerProvider.select(
        (tasks) => tasks.where((t) => t.type == DownloadType.preload).toList(),
      ),
    );
    final colorScheme = getColorSchemeWhenReady(ref);

    if (downloadNormalTasks.isEmpty && downloadPreloadTasks.isEmpty) {
      return _buildEmptyState(colorScheme);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (downloadNormalTasks.isNotEmpty)
            _buildSection(
              title: l10n.normal_download,
              tasks: downloadNormalTasks,
              colorScheme: colorScheme,
            ),
          if (downloadPreloadTasks.isNotEmpty)
            _buildSection(
              title: l10n.preload,
              tasks: downloadPreloadTasks,
              colorScheme: colorScheme,
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    final color = colorScheme.onSurface.withValues(alpha: 0.5);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.download_outlined, size: 64, color: color),
          SizedBox(height: 16),
          Text(l10n.no_download_tasks, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<DownloadTask> tasks,
    required ColorScheme colorScheme,
  }) {
    final dividerColor = colorScheme.onSurface.withValues(alpha: 0.5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(
            left: 50,
            right: 30,
            top: 10,
            bottom: 2,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(thickness: 1, indent: 50, endIndent: 30, color: dividerColor),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) => _DownloadTaskItem(
            key: ValueKey(tasks[index].track.id),
            task: tasks[index],
            index: index,
            colorScheme: colorScheme,
            l10n: l10n,
          ),
        ),
      ],
    );
  }
}

class _DownloadTaskItem extends HookConsumerWidget {
  final DownloadTask task;
  final int index;
  final ColorScheme colorScheme;
  final AppLocalizations l10n;

  const _DownloadTaskItem({
    required this.task,
    super.key,
    required this.index,
    required this.colorScheme,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);
    final progress = task.totalSizeBytes != null && task.totalSizeBytes! > 0
        ? task.downloadedBytes / task.totalSizeBytes!
        : 0.0;

    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        color: isHovered.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: ListTile(
          leading: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 14, color: colorScheme.primary),
          ),
          title: Text(task.track.title),
          subtitle: _buildSubtitle(progress),
          trailing: _buildTrailingButton(ref),
        ),
      ),
    );
  }

  Widget _buildSubtitle(double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(task.track.artist),
        SizedBox(height: 4),
        LinearProgressIndicator(value: progress),
        SizedBox(height: 4),
        Text(
          '${(progress * 100).toStringAsFixed(1)}% - ${_getStatusText(task.status)}',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildTrailingButton(WidgetRef ref) {
    switch (task.status) {
      case DownloadStatus.downloading:
        return IconButton(
          icon: Icon(Icons.pause),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).pause(task.track);
          },
        );
      case DownloadStatus.paused:
        return IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).resume(task.track);
          },
        );
      case DownloadStatus.failed:
        return IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).retry(task.track);
          },
        );
      case DownloadStatus.canceled:
        return IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).retry(task.track);
          },
        );
      default:
        return SizedBox.shrink();
    }
  }

  String _getStatusText(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.queued:
        return l10n.status_queued;
      case DownloadStatus.downloading:
        return l10n.status_downloading;
      case DownloadStatus.paused:
        return l10n.status_paused;
      case DownloadStatus.completed:
        return l10n.status_completed;
      case DownloadStatus.failed:
        return l10n.status_failed;
      case DownloadStatus.canceled:
        return l10n.status_canceled;
    }
  }
}

class _DownloadHistoryTab extends HookConsumerWidget {
  final AppLocalizations l10n;

  const _DownloadHistoryTab({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(downloadHistoryProvider());
    final historyNotifier = ref.read(downloadHistoryProvider().notifier);
    final colorScheme = getColorSchemeWhenReady(ref);
    if (history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              l10n.no_download_history,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: history.length + (historyNotifier.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == history.length) {
          historyNotifier.loadMore();
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          );
        }

        final record = history[index];
        return _DownloadHistoryItem(
          key: ValueKey(record.track.id),
          record: record,
          colorScheme: colorScheme,
          index: index,
        );
      },
    );
  }
}

class _DownloadHistoryItem extends HookConsumerWidget {
  final DownloadTaskRecord record;
  final ColorScheme colorScheme;
  final int index;

  const _DownloadHistoryItem({
    super.key,
    required this.record,
    required this.colorScheme,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        color: isHovered.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: ListTile(
          minTileHeight: 56,
          leading: Text(
            '${index + 1}',
            style: TextStyle(fontSize: 14, color: colorScheme.primary),
          ),
          title: Text(
            record.track.title,
            style: TextStyle(fontSize: 14, color: colorScheme.onSurface),
          ),
          subtitle: Text(
            record.track.artist,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          trailing: _buildStatusIcon(),
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    switch (record.status) {
      case DownloadStatus.completed:
        return Icon(Icons.check_circle, color: Colors.green);
      case DownloadStatus.canceled:
        return Icon(Icons.cancel, color: Colors.orange);
      default:
        return SizedBox.shrink();
    }
  }
}
