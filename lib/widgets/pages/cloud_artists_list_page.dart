import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/l10n/app_localizations.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/common_artist_grid.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';
import 'package:toneharbor/widgets/widgets.dart';

class CloudArtistsListPage extends HookConsumerWidget {
  const CloudArtistsListPage({super.key});

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    Size size,
    TextEditingController searchController,
    AppLocalizations l10n,
    ValueNotifier<CloudMusicLanguageType> selectedLanguage,
    ValueNotifier<CloudMusicArtistType> selectedArtistType,
  ) {
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    final showSearch = useState(false);

    useEffect(() {
      showSearch.value = false;
      searchController.clear();
      return null;
    }, [size.lgAndUp]);

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
            centerTitle: false,
            toolbarHeight: toolbarHeight,
            backgroundColor: size.lgAndUp
                ? colorScheme.tertiary.withValues(alpha: 0.1)
                : Colors.transparent,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            title: Text(
              l10n.group_artists,
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
                      icon: const Icon(Icons.filter_list_rounded, size: 18),
                      tooltip: l10n.filter,
                    ),
              SizedBox(width: 8 * size.multiplier),
              _buildDropdown<CloudMusicLanguageType>(
                value: selectedLanguage.value,
                items: CloudMusicLanguageType.values,
                labelBuilder: (lang) => lang.displayName,
                onChanged: (value) {
                  if (value != null) {
                    selectedLanguage.value = value;
                    ref.read(cloudMusicLanguageProvider.notifier).set(value);
                  }
                },
                colorScheme: colorScheme,
                size: size,
                toolbarHeight: toolbarHeight,
              ),
              SizedBox(width: 8 * size.multiplier),
              _buildDropdown<CloudMusicArtistType>(
                value: selectedArtistType.value,
                items: CloudMusicArtistType.values,
                labelBuilder: (type) => type.displayName,
                onChanged: (value) {
                  if (value != null) {
                    selectedArtistType.value = value;
                  }
                },
                colorScheme: colorScheme,
                size: size,
                toolbarHeight: toolbarHeight,
              ),
              SizedBox(width: 8 * size.multiplier),
            ],
          );
  }

  Widget _buildDropdown<T>({
    required T value,
    required List<T> items,
    required String Function(T) labelBuilder,
    required ValueChanged<T?>? onChanged,
    required ColorScheme colorScheme,
    required Size size,
    required double toolbarHeight,
  }) {
    return Container(
      height: toolbarHeight * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          focusColor: Colors.transparent,
          value: value,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 16 * size.multiplier,
            color: colorScheme.onSurfaceVariant,
          ),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8 * size.multiplier),
                child: Text(
                  labelBuilder(item),
                  style: TextStyle(
                    fontSize: 14 * size.multiplier,
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          dropdownColor: colorScheme.surfaceContainer,
          elevation: 8,
          style: TextStyle(
            fontSize: 14 * size.multiplier,
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final l10n = ref.watch(l10nProvider);
    final searchController = useTextEditingController();
    final searchQuery = useSearchQuery(searchController);
    final selectedLetterIndex = useState(0);
    final selectedLanguage = useState(ref.read(cloudMusicLanguageProvider));
    final selectedArtistType = useState(CloudMusicArtistType.male);

    final letterChips = List.generate(27, (index) {
      final isSelected = index == selectedLetterIndex.value;
      final letter = index == 0
          ? l10n.default_label
          : String.fromCharCode(64 + index);

      return RawChip(
        label: Text(letter),
        labelStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14 * size.multiplier2,
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6 * size.multiplier2,
          vertical: 4 * size.multiplier2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isSelected
              ? BorderSide(color: colorScheme.primary, width: 1.2)
              : BorderSide(color: colorScheme.outline, width: 0.8),
        ),
        backgroundColor: isSelected
            ? colorScheme.primary.withValues(alpha: 0.1)
            : colorScheme.surfaceContainer,
        onSelected: (selected) {
          if (selected) {
            selectedLetterIndex.value = index;
          }
        },
      );
    });

    final artistGroupList = ref.watch(
      cloudMusicArtistGroupListProvider(
        area: selectedLanguage.value.areaIndex,
        type: selectedArtistType.value.value,
        limit: 50,
        offset: 0,
        initial: (selectedLetterIndex.value == 0)
            ? ''
            : String.fromCharCode(64 + selectedLetterIndex.value),
      ),
    );

    final artistItems = artistGroupList.value?.artists ?? [];
    final hasMore = artistGroupList.value?.more ?? false;

    final filteredItems = useMemoized(() {
      if (searchQuery.isEmpty) {
        return artistItems;
      }
      final query = searchQuery.toLowerCase();
      return artistItems.where((artist) {
        final name = artist.name.toLowerCase();
        return name.contains(query);
      }).toList();
    }, [artistItems, searchQuery]);

    final displayHasMore = searchQuery.isEmpty && hasMore;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAppBar(
          ref,
          colorScheme,
          size,
          searchController,
          l10n,
          selectedLanguage,
          selectedArtistType,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: size.smAndUp ? 16 : 8,
            right: size.smAndUp ? 16 : 8,
            top: size.smAndUp ? 8 : 4,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(spacing: 5, runSpacing: 5, children: letterChips),
          ),
        ),
        Expanded(
          child: artistGroupList.when(
            data: (data) {
              return CommonArtistGrid(
                baseProvider: cloudMusicArtistGroupListProvider(
                  area: selectedLanguage.value.areaIndex,
                  type: selectedArtistType.value.value,
                  limit: 50,
                  offset: 0,
                  initial: (selectedLetterIndex.value == 0)
                      ? ''
                      : String.fromCharCode(64 + selectedLetterIndex.value),
                ),
                items: filteredItems,
                hasMore: displayHasMore,
                itemBuilder: (context, artist, index) {
                  return CloudMusicArtistItem(
                    artist: artist,
                    colorScheme: colorScheme,
                    cloudLayoutConfig: ArtistLayoutConfig.defaultConfig
                        .copyWith(
                          height: 220,
                          fontSize: 14,
                          horizontalPadding: 24,
                          itemSpacing: 24,
                          itemWidth: 180,
                        ),
                  );
                },
                maxCrossAxisExtent: 180,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.75,
              );
            },
            loading: () => CommonShimmerLoader.artistGrid(
              colorScheme: colorScheme,
              size: size,
              maxCrossAxisExtent: 180,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 0.75,
            ),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
      ],
    );
  }
}
