import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/utils/responsive.dart';

mixin BuildItem {
  Widget buildAppBar(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    String title,
    Size size, {
    List<Widget>? actions,
  }) {
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: size.lgAndUp
          ? colorScheme.tertiary.withValues(alpha: 0.1)
          : Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16 * size.multiplier2,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      centerTitle: false,
    );
  }

  Widget buildSectionTitle(
    String title,
    ColorScheme colorScheme,
    double multiplier,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.secondary,
        ),
      ),
    );
  }

  Widget buildDropdownTile<T>({
    required String title,
    required List<T> items,
    required T value,
    required ColorScheme colorScheme,
    required ValueChanged<T?>? onChanged,
    required double multiplier,
    String Function(T)? labelBuilder,
  }) {
    return ListTile(
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      trailing: DropdownButton<T>(
        value: value ?? items.first,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  labelBuilder?.call(e) ?? e.toString().split('.').last,
                  style: TextStyle(fontSize: 14 * multiplier),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget buildSliderTile({
    required String title,
    required double value,
    required Function(double) onChanged,
    required double minValue,
    required double maxValue,
    required ColorScheme colorScheme,
    required double multiplier,
  }) {
    return ListTile(
      title: Text(
        '$title: ${value.toStringAsFixed(1)}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      trailing: SizedBox(
        width: 200,
        child: Slider(
          value: value,
          min: minValue,
          max: maxValue,
          divisions: ((maxValue - minValue) * 10).toInt(),
          onChanged: (v) => onChanged(v),
          activeColor: colorScheme.secondary.withValues(alpha: 0.9),
          inactiveColor: colorScheme.outline.withValues(alpha: 0.9),
          thumbColor: colorScheme.secondary.withValues(alpha: 0.9),
        ),
      ),
    );
  }

  Widget buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    double multiplier,
    Function(bool) onChanged,
    ColorScheme colorScheme, {
    String? title2,
    String? subtitle2,
  }) {
    if (title2 == null || title2.isEmpty) {
      title2 = title;
    }
    if (subtitle2 == null || subtitle2.isEmpty) {
      subtitle2 = subtitle;
    }
    return ListTile(
      title: Text(
        value ? title : title2,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15 * multiplier,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        value ? subtitle : subtitle2,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12 * multiplier,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: colorScheme.secondary.withValues(alpha: 0.9),
        activeThumbColor: colorScheme.secondaryContainer.withValues(alpha: 0.9),
        inactiveTrackColor: colorScheme.outline.withValues(alpha: 0.9),
      ),
    );
  }

  List<Widget> buildItem(
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    String title,
    Widget child,
    double multiplier,
  ) {
    return [
      if (title.isNotEmpty) buildSectionTitle(title, colorScheme, multiplier),
      Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: colorScheme.tertiary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.tertiary.withValues(alpha: 0.2),
          ),
        ),
        child: child,
      ),
    ];
  }

  Widget buildContent(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    ColorScheme colorScheme,
    List<Widget> children,
  ) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
