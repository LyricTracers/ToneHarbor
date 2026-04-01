import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';

const _chartColors = [
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.indigo,
];

class StorageManagePage extends HookConsumerWidget {
  const StorageManagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(storageInfoProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56 * size.multiplier3,
        backgroundColor: colorScheme.tertiary.withValues(alpha: 0.1),
        title: Text(
          l10n.storage_management,
          style: TextStyle(
            fontSize: 16 * size.multiplier2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: storageAsync.when(
        loading: () => const Center(child: AudioEqualizerLoader()),
        error: (e, _) =>
            Center(child: buildErrorView(context, ref, colorScheme, () {})),
        data: (infos) {
          final totalSize = infos.fold<int>(0, (sum, i) => sum + i.size);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: _PieChartWithTouch(infos: infos)),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildLegend(infos, totalSize, ref, colorScheme, l10n),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegend(
    List<StorageInfo> infos,
    int totalSize,
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    return ListView(
      children: [
        _buildTotalCard(totalSize, colorScheme, l10n),
        const SizedBox(height: 12),
        ...infos.asMap().entries.map((entry) {
          final color = _chartColors[entry.key % _chartColors.length];
          return _buildStorageItem(entry.value, color, ref, colorScheme, l10n);
        }),
      ],
    );
  }

  Widget _buildTotalCard(
    int totalSize,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.total,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          Text(
            formatBytes(totalSize),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorageItem(
    StorageInfo info,
    Color color,
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        title: Text(info.category.localizedLabel(l10n)),
        subtitle: Text(
          info.formattedSize,
          style: TextStyle(color: colorScheme.primary),
        ),
        trailing: info.canDelete
            ? IconButton(
                icon: Icon(Icons.delete_outline, color: colorScheme.error),
                onPressed: () => _showClearDialog(info, ref, colorScheme, l10n),
              )
            : null,
      ),
    );
  }

  void _showClearDialog(
    StorageInfo info,
    WidgetRef ref,
    ColorScheme colorScheme,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.confirm_clear,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
          '${l10n.confirm_clear_message.replaceFirst('%s', info.category.localizedLabel(l10n))}\n${l10n.size}: ${info.formattedSize}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(clearStorageProvider)(info);
            },
            child: Text(
              l10n.delete,
              style: TextStyle(color: colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _PieChartWithTouch extends StatefulWidget {
  final List<StorageInfo> infos;

  const _PieChartWithTouch({required this.infos});

  @override
  State<_PieChartWithTouch> createState() => _PieChartWithTouchState();
}

class _PieChartWithTouchState extends State<_PieChartWithTouch> {
  int? _touchedIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;
        final baseRadius = (size - 60) / 3 - 10;
        final touchedRadius = baseRadius + 20;
        final centerRadius = baseRadius * 0.3;

        return PieChart(
          PieChartData(
            sectionsSpace: 2,
            centerSpaceRadius: centerRadius,
            pieTouchData: PieTouchData(
              touchCallback: (event, response) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      response == null ||
                      response.touchedSection == null) {
                    _touchedIndex = null;
                    return;
                  }
                  _touchedIndex = response.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            sections: widget.infos.asMap().entries.map((entry) {
              final index = entry.key;
              final info = entry.value;
              final isTouched = index == _touchedIndex;

              return PieChartSectionData(
                color: _chartColors[index % _chartColors.length],
                value: info.size > 0 ? info.size.toDouble() : 0.1,
                title: info.percentage >= 5
                    ? '${info.percentage.toStringAsFixed(1)}%'
                    : '',
                radius: isTouched ? touchedRadius : baseRadius,
                titleStyle: TextStyle(
                  fontSize: baseRadius * 0.15,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
