import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/cloud_music/cloud_music_models.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

class CloudAlbumListPage<T extends ExtraProvider<CloudAlbumListData>>
    extends HookConsumerWidget {
  final $AsyncNotifierProvider<T, CloudAlbumListData> baseProvider;
  final String title;

  const CloudAlbumListPage({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAppBar(ref, colorScheme, size),
        const SizedBox(height: 16),
        Expanded(child: CloudAlbumsCat(baseProvider: baseProvider)),
      ],
    );
  }
}
