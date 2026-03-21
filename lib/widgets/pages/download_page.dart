import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/audio_player/download_history_provider.dart';
import 'package:toneharbor/providers/audio_player/download_manager.dart';
import 'package:toneharbor/utils/base_utils.dart';

class DownloadPage extends HookConsumerWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(0);
    final colorScheme = getColorSchemeWhenReady(ref);

    return Column(
      children: [
        AppBar(
          title: const Text(
            "下载中心",
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
              ? _DownloadListTab()
              : _DownloadHistoryTab(),
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
              title: "普通下载",
              tasks: downloadNormalTasks,
              colorScheme: colorScheme,
            ),
          if (downloadPreloadTasks.isNotEmpty)
            _buildSection(
              title: "预加载",
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
          Text('暂无下载任务', style: TextStyle(color: color)),
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

  const _DownloadTaskItem({
    required this.task,
    super.key,
    required this.index,
    required this.colorScheme,
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
        return '排队中';
      case DownloadStatus.downloading:
        return '下载中';
      case DownloadStatus.paused:
        return '已暂停';
      case DownloadStatus.completed:
        return '已完成';
      case DownloadStatus.failed:
        return '下载失败';
      case DownloadStatus.canceled:
        return '已取消';
    }
  }
}

class _DownloadHistoryTab extends HookConsumerWidget {
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
            Text('暂无下载历史', style: TextStyle(color: Colors.grey)),
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
