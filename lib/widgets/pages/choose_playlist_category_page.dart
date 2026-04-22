import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';

class ChoosePlaylistCategoryPage extends HookConsumerWidget {
  const ChoosePlaylistCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    var width = size.width;
    var targetWidth = 0.0;
    if (size.xlAndUp) {
      targetWidth = width * 0.35;
    } else if (size.isLg) {
      targetWidth = width * 0.45;
    } else if (size.isMd) {
      targetWidth = width * 0.55;
    } else {
      targetWidth = double.infinity;
    }

    return Container(
      width: targetWidth,
      color: colorScheme.surfaceContainerHighest,
      height: double.infinity,
      child: Column(
        children: [
          Container(height: 20, color: colorScheme.surfaceContainerHighest),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: _buildCategoryGroups(ref, colorScheme, size),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryGroups(
    WidgetRef ref,
    ColorScheme colorScheme,
    Size size,
  ) {
    return CloudPlaylistStaticData.categoryGroups.entries
        .map(
          (entry) => _buildCategoryGroup(
            ref,
            entry.key,
            entry.value,
            colorScheme,
            size,
          ),
        )
        .toList();
  }

  Widget _buildCategoryGroup(
    WidgetRef ref,
    int groupId,
    String groupName,
    ColorScheme colorScheme,
    Size size,
  ) {
    final categories = CloudPlaylistStaticData.getByCategory(groupId);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15 * size.multiplier),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: 10 * size.multiplier),
            _buildGroupName(groupName, colorScheme, size),
            SizedBox(width: 10 * size.multiplier),
            _buildDivider(colorScheme, size),
            SizedBox(width: 10 * size.multiplier),
            Expanded(
              child: _buildCategoryWrap(ref, categories, colorScheme, size),
            ),
            SizedBox(width: 10 * size.multiplier),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupName(String name, ColorScheme colorScheme, Size size) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 28 * size.multiplier,
        fontWeight: FontWeight.bold,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }

  Widget _buildDivider(ColorScheme colorScheme, Size size) {
    return Container(width: 2 * size.multiplier, color: colorScheme.outline);
  }

  Widget _buildCategoryWrap(
    WidgetRef ref,
    List<CloudPlaylistCategory> categories,
    ColorScheme colorScheme,
    Size size,
  ) {
    final chooseCategories = ref.watch(cloudMusicCategoryProvider);
    return Wrap(
      spacing: 2 * size.multiplier,
      runSpacing: 2 * size.multiplier,
      children: categories.map((category) {
        final isSelected = chooseCategories.contains(category.name);
        return TextButton(
          onPressed: () {
            if (isSelected) {
              ref
                  .read(cloudMusicCategoryProvider.notifier)
                  .removeCategory(category.name);
            } else {
              ref
                  .read(cloudMusicCategoryProvider.notifier)
                  .addCategory(category.name);
            }
          },
          child: Text(
            category.name,
            style: TextStyle(
              fontSize: 18 * size.multiplier,
              color: isSelected
                  ? colorScheme.onPrimaryContainer
                  : colorScheme.onSurface,
            ),
          ),
        );
      }).toList(),
    );
  }
}
