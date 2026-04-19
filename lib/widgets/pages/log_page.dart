import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/build_item.dart';

class LogPage extends HookConsumerWidget with BuildItem {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final logsAsync = ref.watch(logProvider);
    final scrollController = useScrollController();
    final autoScroll = useState(true);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier3;
    final toolbarHeight = kToolbarHeight * multiplier;

    useEffect(() {
      void listener() {
        if (!scrollController.hasClients) return;
        if (scrollController.position.pixels <
            scrollController.position.maxScrollExtent - 100) {
          autoScroll.value = false;
        } else {
          autoScroll.value = true;
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    useEffect(() {
      if (!autoScroll.value) return null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (autoScroll.value && scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
      return null;
    }, [logsAsync.value?.length]);

    return Column(
      children: [
        AppBar(
          toolbarHeight: toolbarHeight,
          backgroundColor: size.lgAndUp
              ? colorScheme.tertiary.withValues(alpha: 0.1)
              : Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: Text(
            l10n.log_viewer,
            style: TextStyle(
              fontSize: 16 * multiplier,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outline, size: 18),
              onPressed: () {
                ref.read(logProvider.notifier).clear();
              },
              tooltip: l10n.clear_log,
            ),
            IconButton(
              icon: Icon(
                autoScroll.value
                    ? Icons.vertical_align_bottom
                    : Icons.vertical_align_center,
                size: 18,
              ),
              onPressed: () {
                autoScroll.value = !autoScroll.value;
                if (autoScroll.value && scrollController.hasClients) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                }
              },
              tooltip: autoScroll.value
                  ? l10n.stop_auto_scroll
                  : l10n.start_auto_scroll,
            ),
          ],
        ),
        Expanded(
          child: Container(
            color: colorScheme.surface,
            child: logsAsync.when(
              data: (logs) => logs.isEmpty
                  ? Center(
                      child: Text(
                        l10n.no_logs,
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 14 * multiplier,
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      itemCount: logs.length,
                      itemBuilder: (context, index) {
                        final log = logs[index];
                        return _LogEntryItem(
                          log: log,
                          colorScheme: colorScheme,
                          multiplier: multiplier,
                        );
                      },
                    ),
              loading: () => Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
              ),
              error: (error, stack) => Center(
                child: Text(
                  '${l10n.load_log_failed}: $error',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 14 * multiplier,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LogEntryItem extends StatelessWidget {
  final LogEntry log;
  final ColorScheme colorScheme;
  final double multiplier;

  const _LogEntryItem({
    required this.log,
    required this.colorScheme,
    required this.multiplier,
  });

  Color _getLevelColor(Level level) {
    return switch (level) {
      Level.trace => colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      Level.debug => Colors.grey,
      Level.info => Colors.blue,
      Level.warning => Colors.orange,
      Level.error => Colors.red,
      Level.fatal => Colors.purple,
      _ => colorScheme.onSurface,
    };
  }

  String _getLevelLabel(Level level) {
    return switch (level) {
      Level.trace => 'T',
      Level.debug => 'D',
      Level.info => 'I',
      Level.warning => 'W',
      Level.error => 'E',
      Level.fatal => 'F',
      _ => '?',
    };
  }

  @override
  Widget build(BuildContext context) {
    final timeStr =
        '${log.timestamp.hour.toString().padLeft(2, '0')}:${log.timestamp.minute.toString().padLeft(2, '0')}:${log.timestamp.second.toString().padLeft(2, '0')}';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8 * multiplier,
        vertical: 4 * multiplier,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '[$timeStr] ',
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 12 * multiplier,
                fontFamily: 'monospace',
              ),
            ),
            TextSpan(
              text: '[${_getLevelLabel(log.level)}] ',
              style: TextStyle(
                color: _getLevelColor(log.level),
                fontSize: 12 * multiplier,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
            TextSpan(
              text: log.message,
              style: TextStyle(
                color: _getLevelColor(log.level),
                fontSize: 12 * multiplier,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
