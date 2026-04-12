import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_playlists_cat.dart';
import 'package:toneharbor/widgets/pages/choose_playlist_category_page.dart';

class CloudPlaylistCategoryListPage extends HookConsumerWidget {
  const CloudPlaylistCategoryListPage({
    super.key,
    this.category = const CloudPlaylistCategory(
      name: '全部',
      category: -1,
      enabled: true,
    ),
  });
  final CloudPlaylistCategory category;

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    Size size,
    String currentCategoryName,
  ) {
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    return AppBar(
      centerTitle: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: size.lgAndUp
          ? colorScheme.tertiary.withValues(alpha: 0.1)
          : Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: Text(
        currentCategoryName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16 * size.multiplier2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseCategories = CloudPlaylistStaticData.staticCategories;
    final categories = ref.watch(cloudMusicCategoryProvider);
    final currentCategory = useState(category.name);
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final tempIndex = baseCategories.indexOf(category);
    final selectedIndex = useState(tempIndex == -1 ? 0 : tempIndex);
    final totalCategories = categories.length + baseCategories.length;
    useEffect(() {
      if (totalCategories <= selectedIndex.value) {
        selectedIndex.value = 0;
      }
      currentCategory.value = selectedIndex.value < baseCategories.length
          ? baseCategories[selectedIndex.value].name
          : categories[selectedIndex.value - baseCategories.length];
      return null;
    }, [categories.length, selectedIndex.value]);

    final categoryChips = List.generate(totalCategories, (index) {
      final isSelected = index == selectedIndex.value;
      final isBaseCategory = index < baseCategories.length;
      final categoryName = isBaseCategory
          ? baseCategories[index].name
          : categories[index - baseCategories.length];

      return RawChip(
        label: Text(categoryName),
        labelStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14 * size.multiplier2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8 * size.multiplier2,
          vertical: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isSelected
              ? BorderSide(color: colorScheme.primary, width: 1.2)
              : BorderSide(color: colorScheme.outline, width: 0.8),
        ),
        onSelected: (selected) {
          if (selected) {
            selectedIndex.value = index;
            currentCategory.value = categoryName;
          }
        },
        onDeleted: isBaseCategory
            ? null
            : () {
                ref
                    .read(cloudMusicCategoryProvider.notifier)
                    .removeCategory(categoryName);
              },
      );
    });

    final addButton = IconButton(
      icon: Icon(Icons.add, size: 18),
      onPressed: () {
        if (size.mdAndUp) {
          showSlidePanel(
            context: context,
            builder: (context) => const ChoosePlaylistCategoryPage(),
          );
        } else {
          showModalBottomSheetWidget(
            context,
            colorScheme,
            (context) => const ChoosePlaylistCategoryPage(),
          );
        }
      },
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.primaryContainer,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        minimumSize: Size(32 * size.multiplier2, 32 * size.multiplier2),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAppBar(ref, colorScheme, size, currentCategory.value),
        Padding(
          padding: EdgeInsets.all(size.smAndUp ? 24 : 16),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: categoryChips,
                  ),
                ),
              ),
              SizedBox(width: 8),
              addButton,
            ],
          ),
        ),
        Expanded(
          child: CloudPlaylistsCat(
            mainAxisSpacing: size.mdAndUp ? 24 : 10,
            crossAxisSpacing: size.mdAndUp ? 24 : 16,
            childAspectRatio: 0.75,
            baseProvider: cloudMusicPlaylistCatlistProvider(
              cat: currentCategory.value,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
