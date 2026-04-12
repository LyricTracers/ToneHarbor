import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/cloud_playlist_static_data.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/pages/choose_playlist_category_page.dart';
import 'package:toneharbor/widgets/widgets.dart';

class _CategoryChipLayout extends HookConsumerWidget {
  _CategoryChipLayout({required this.categoryChips, required this.addButton});

  final List<Widget> categoryChips;
  final Widget addButton;
  final _measurementKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final needScroll = useState<bool?>(null);
    final allChips = [...categoryChips, const SizedBox(width: 8), addButton];

    useEffect(() {
      void checkLayout() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final renderBox =
              _measurementKey.currentContext?.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            final totalWidth = renderBox.size.width;
            final parentWidth =
                (context.findRenderObject() as RenderBox).size.width;
            needScroll.value = totalWidth > parentWidth;
          }
        });
      }

      checkLayout();

      final observer = _LayoutObserver(() {
        checkLayout();
      });
      WidgetsBinding.instance.addObserver(observer);

      return () {
        WidgetsBinding.instance.removeObserver(observer);
      };
    }, [categoryChips.length]);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              left: -10000,
              child: Opacity(
                opacity: 0,
                alwaysIncludeSemantics: false,
                child: Wrap(
                  key: _measurementKey,
                  spacing: 5,
                  runSpacing: 5,
                  children: allChips,
                ),
              ),
            ),
            if (needScroll.value == null)
              const SizedBox.shrink()
            else if (needScroll.value!)
              Row(
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
                  const SizedBox(width: 8),
                  addButton,
                ],
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Center(
                    child: Wrap(spacing: 5, runSpacing: 5, children: allChips),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _LayoutObserver extends WidgetsBindingObserver {
  _LayoutObserver(this.onMetricsChanged);

  final VoidCallback onMetricsChanged;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    onMetricsChanged();
  }
}

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
    String currentCategoryName,
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
              currentCategoryName,
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
    }, [categories.length, selectedIndex.value]);

    final categoryChips = List.generate(categories.length + 4, (index) {
      final isSelected = index == selectedIndex.value;
      final isBaseCategory = index < 4;
      final categoryName = isBaseCategory
          ? baseCategories[index].name
          : categories[index - 4];

      return RawChip(
        label: Text(categoryName),
        labelStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
        minimumSize: Size(32, 32),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAppBar(
          ref,
          colorScheme,
          searchController,
          size,
          currentCategory.value,
        ),
        Padding(
          padding: EdgeInsets.all(size.smAndUp ? 24 : 16),
          child: _CategoryChipLayout(
            categoryChips: categoryChips,
            addButton: addButton,
          ),
        ),
      ],
    );
  }
}
