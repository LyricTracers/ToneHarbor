import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/providers/audio_player/download_history_provider.dart';
import 'package:toneharbor/providers/audio_player/download_manager.dart';
import 'package:toneharbor/providers/audio_player/song_selection_provider.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

class DownloadPage extends HookConsumerWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(0);
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final songSelectionState = ref.watch(
      songSelectionProvider.select(
        (state) => SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: state.boxState,
        ),
      ),
    );
    List<DownloadTask>? downloadNormalTasks;
    List<DownloadTask>? downloadPreloadTasks;
    var total = 0;
    if (selectedTab.value == 0) {
      downloadNormalTasks = ref.watch(
        downloadManagerProvider.select(
          (tasks) => tasks.where((t) => t.type == DownloadType.normal).toList(),
        ),
      );
      downloadPreloadTasks = ref.watch(
        downloadManagerProvider.select(
          (tasks) =>
              tasks.where((t) => t.type == DownloadType.preload).toList(),
        ),
      );
      total = downloadNormalTasks!.length + downloadPreloadTasks!.length;
    }

    return Column(
      children: [
        if (songSelectionState.selectionType)
          AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                ref.invalidate(songSelectionProvider);
              },
              icon: Icon(Icons.arrow_back_ios_sharp),
            ),
            centerTitle: true,
            title: Consumer(
              builder: (context, ref, child) {
                final selection = ref.watch(songSelectionProvider);
                return Text(
                  l10n.selected_download_count.replaceFirst(
                    '%s',
                    '${selection.ids.length}',
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            actions: [
              Text(
                l10n.select_all,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final selection = ref.watch(songSelectionProvider);
                  return Checkbox(
                    shape: const CircleBorder(),
                    value: selection.ids.length == total,
                    onChanged: (b) {
                      if (b == true) {
                        if (selectedTab.value == 0) {
                          final allIds = {
                            ...downloadNormalTasks!.map((t) => t.track.id),
                            ...downloadPreloadTasks!.map((t) => t.track.id),
                          };
                          ref
                              .read(songSelectionProvider.notifier)
                              .selectAll(allIds);
                        }
                      } else {
                        ref.read(songSelectionProvider.notifier).deSelectAll();
                      }
                    },
                  );
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        if (!songSelectionState.selectionType)
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
                onPressed: () {
                  ref.read(songSelectionProvider.notifier).toggle();
                },
                icon: Icon(Icons.fact_check_rounded, size: 18),
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
              ? _DownloadListTab(l10n: l10n, state: songSelectionState)
              : _DownloadHistoryTab(l10n: l10n),
        ),
        if (songSelectionState.selectionType)
          AppBar(
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  ref
                      .read(downloadManagerProvider.notifier)
                      .cancelList(ref.read(songSelectionProvider).ids);
                  ref.invalidate(songSelectionProvider);
                },
                icon: Icon(Icons.cancel_rounded),
                tooltip: "取消下载",
              ),
              IconButton(
                onPressed: () {
                  ref
                      .read(downloadManagerProvider.notifier)
                      .pauseList(ref.read(songSelectionProvider).ids);
                  ref.invalidate(songSelectionProvider);
                },
                icon: Icon(Icons.pause_circle_rounded),
                tooltip: "暂停下载",
              ),
              IconButton(
                onPressed: () {
                  ref
                      .read(downloadManagerProvider.notifier)
                      .resumeList(ref.read(songSelectionProvider).ids);
                  ref.invalidate(songSelectionProvider);
                },
                icon: Icon(Icons.play_arrow_rounded),
                tooltip: "继续下载",
              ),

              const SizedBox(width: 15),
            ],
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
  final SongSelectionState state;
  const _DownloadListTab({required this.l10n, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadTasks = ref.watch(downloadManagerProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final requestFlag = ref.watch(requestFlagProvider);
    if (requestFlag) {
      return SizedBox();
    }
    if (downloadTasks.isEmpty) {
      return _buildEmptyState(colorScheme);
    }

    var downloadNormalTasks = downloadTasks
        .where((element) => element.type == DownloadType.normal)
        .toList();
    var downloadPreloadTasks = downloadTasks
        .where((element) => element.type == DownloadType.preload)
        .toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (downloadPreloadTasks.isNotEmpty)
            _buildSection(
              ref: ref,
              title: l10n.preload,
              tasks: downloadPreloadTasks,
              colorScheme: colorScheme,
              state: state,
            ),
          if (downloadNormalTasks.isNotEmpty)
            _buildSection(
              ref: ref,
              title: l10n.normal_download,
              tasks: downloadNormalTasks,
              colorScheme: colorScheme,
              state: state,
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
    required WidgetRef ref,
    required String title,
    required List<DownloadTask> tasks,
    required ColorScheme colorScheme,
    required SongSelectionState state,
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
          itemBuilder: (context, index) => ContextMenuRegion(
            enableDefaultGestures: !state.selectionType,
            contextMenu: ContextMenu(
              entriesBuilder: () {
                return <ContextMenuEntry<DownloadTask>>[
                  MenuHeader(text: tasks[index].track.title),
                  MenuDivider(),
                  if (tasks[index].status == DownloadStatus.downloading)
                    MenuItem(
                      label: Text("暂停下载"),
                      icon: Icon(Icons.pause_circle_rounded),
                      onSelected: (value) async {
                        ref
                            .read(downloadManagerProvider.notifier)
                            .pause(tasks[index].track);
                      },
                    ),
                  if (tasks[index].status == DownloadStatus.paused)
                    MenuItem(
                      label: Text("继续下载"),
                      icon: Icon(Icons.play_arrow_rounded),
                      onSelected: (value) async {
                        ref
                            .read(downloadManagerProvider.notifier)
                            .resume(tasks[index].track);
                      },
                    ),
                  if (tasks[index].status == DownloadStatus.failed)
                    MenuItem(
                      label: Text("重试"),
                      icon: Icon(Icons.restore_rounded),
                      onSelected: (value) async {
                        ref
                            .read(downloadManagerProvider.notifier)
                            .retry(tasks[index].track);
                      },
                    ),

                  MenuItem(
                    label: Text("取消下载"),
                    icon: Icon(Icons.cancel_rounded),
                    onSelected: (value) async {
                      ref
                          .read(downloadManagerProvider.notifier)
                          .cancel(tasks[index].track);
                    },
                  ),
                ];
              },
              padding: const EdgeInsets.all(8.0),
            ),
            child: _DownloadTaskItem(
              key: ValueKey(tasks[index].track.id),
              task: tasks[index],
              index: index,
              colorScheme: colorScheme,
              l10n: l10n,
              state: state,
            ),
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
  final SongSelectionState state;

  const _DownloadTaskItem({
    required this.task,
    super.key,
    required this.index,
    required this.colorScheme,
    required this.l10n,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);
    final progress = task.totalSizeBytes != null && task.totalSizeBytes! > 0
        ? task.downloadedBytes / task.totalSizeBytes!
        : 0.0;
    var localSelected = useState(false);
    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(task.track.id);
      return null;
    }, [state.selectionType]);

    useEffect(() {
      localSelected.value = ref
          .read(songSelectionProvider.notifier)
          .isSelected(task.track.id);
      return null;
    }, [state.boxState]);
    void updateState() {
      localSelected.value = !ref
          .read(songSelectionProvider.notifier)
          .isSelected(task.track.id);
      var flag = localSelected.value;
      Future.microtask(() {
        if (flag) {
          ref.read(songSelectionProvider.notifier).select(task.track.id);
        } else {
          ref.read(songSelectionProvider.notifier).deSelect(task.track.id);
        }
      });
    }

    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        color: isHovered.value
            ? colorScheme.outline.withValues(alpha: .1)
            : Colors.transparent,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(fontSize: 14, color: colorScheme.primary),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.track.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                task.track.artist,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${(progress * 100).toStringAsFixed(1)}% - ${_getStatusText(task.status)}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  value: progress > 0 ? progress : null,
                  backgroundColor: colorScheme.onSurface.withValues(alpha: 0.3),
                  strokeWidth: 3.0,
                ),
              ),
              SizedBox(width: 10),
              state.selectionType
                  ? Checkbox(
                      shape: const CircleBorder(),
                      value: localSelected.value,
                      onChanged: (_) {
                        updateState();
                      },
                    )
                  : _buildTrailingButton(ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrailingButton(WidgetRef ref) {
    switch (task.status) {
      case DownloadStatus.downloading:
        return IconButton(
          icon: Icon(Icons.pause_rounded),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).pause(task.track);
          },
        );
      case DownloadStatus.paused:
        return IconButton(
          icon: Icon(Icons.play_arrow_rounded),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).resume(task.track);
          },
        );
      case DownloadStatus.failed:
        return IconButton(
          icon: Icon(Icons.refresh_rounded),
          onPressed: () {
            ref.read(downloadManagerProvider.notifier).retry(task.track);
          },
        );
      case DownloadStatus.canceled:
        return IconButton(
          icon: Icon(Icons.refresh_rounded),
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
