import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

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
    TextEditingController searchController,
    Size size,
  ) {
    final showSearch = useState(false);
    useEffect(() {
      showSearch.value = false;
      searchController.clear();
      return null;
    }, [size.lgAndUp]);
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    return showSearch.value
        ? AppBar(
            leading: IconButton(
              onPressed: () {
                showSearch.value = false;
                searchController.clear();
              },
              icon: Icon(Icons.arrow_back_ios_sharp),
            ),
            toolbarHeight: toolbarHeight,
            backgroundColor: size.lgAndUp
                ? colorScheme.tertiary.withValues(alpha: 0.1)
                : Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            actions: [
              CommonSearchField(
                searchController: searchController,
                autofocus: true,
              ),
              SizedBox(width: 16),
            ],
          )
        : AppBar(
            toolbarHeight: toolbarHeight,
            backgroundColor: size.lgAndUp
                ? colorScheme.tertiary.withValues(alpha: 0.1)
                : Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            title: Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16 * size.multiplier2,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              size.lgAndUp
                  ? CommonSearchField(searchController: searchController)
                  : IconButton(
                      onPressed: () {
                        showSearch.value = true;
                        searchController.clear();
                      },
                      icon: const Icon(Icons.search, size: 18),
                    ),
              SizedBox(width: 16),
            ],
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseCategories = CloudPlaylistStaticData.staticCategories;
    final categories = ref.watch(cloudMusicCategoryProvider);
    final currentCategory = useState(category.name);
    final colorScheme = getColorSchemeWhenReady(ref);
    final searchController = useTextEditingController();
    final searchQuery = useSearchQuery(searchController);
    final size = MediaQuery.of(context).size;
    final tempIndex = baseCategories.indexOf(category);
    final selectedIndex = useState(tempIndex == -1 ? 0 : tempIndex);
    useEffect(() {
      if (categories.length + 4 <= selectedIndex.value) {
        selectedIndex.value = 0;
      }
      return null;
    }, [categories.length]);
    return Column(
      children: [
        _buildAppBar(ref, colorScheme, searchController, size),
        Padding(
          padding: EdgeInsets.all(size.smAndUp ? 24 : 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: List.generate(categories.length + 4, (index) {
                final isSelected = index == selectedIndex.value;
                final isBaseCategory = index < 4;
                final categoryName = isBaseCategory
                    ? baseCategories[index].name
                    : categories[index - 4];

                return RawChip(
                  label: Text(categoryName),
                  labelStyle: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  backgroundColor: Colors.transparent,
                  selectedColor: colorScheme.primaryContainer.withValues(
                    alpha: 0.5,
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
              }),
            ),
          ),
        ),
      ],
    );
  }
}
