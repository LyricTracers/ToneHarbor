import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/components/cloud_common_artists.dart';
import 'package:toneharbor/widgets/components/common_artist_grid.dart';
import 'package:toneharbor/widgets/components/common_shimmer_loader.dart';

class CloudArtistListPage<T extends ExtraProvider<CloudArtistListData>>
    extends HookConsumerWidget {
  final $AsyncNotifierProvider<T, CloudArtistListData> baseProvider;
  final String title;

  const CloudArtistListPage({
    super.key,
    required this.baseProvider,
    required this.title,
  });

  PreferredSizeWidget _buildAppBar(
    WidgetRef ref,
    ColorScheme colorScheme,
    Size size,
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
        title,
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
    final colorScheme = getColorSchemeWhenReady(ref);
    final size = MediaQuery.of(context).size;
    final artistProvider = ref.watch(baseProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAppBar(ref, colorScheme, size),
        const SizedBox(height: 16),
        Expanded(
          child: artistProvider.when(
            data: (data) {
              return CommonArtistGrid(
                baseProvider: baseProvider,
                items: data.artists!,
                hasMore: data.hasMore ?? false,
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
              return Center(child: Text(error.toString()));
            },
          ),
        ),
      ],
    );
  }
}
