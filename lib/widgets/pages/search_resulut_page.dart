import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_utils.dart';
import 'package:toneharbor/widgets/components/audio_equalizer_loader.dart';
import 'package:toneharbor/widgets/components/common_albums.dart';
import 'package:toneharbor/widgets/components/common_artists.dart';
import 'package:toneharbor/widgets/widgets.dart';

class SearchResulutPage extends HookConsumerWidget {
  final String query;
  const SearchResulutPage({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final searchResult = ref.watch(mixSearchProvider(query: query));
    return Column(
      children: [
        AppBar(
          centerTitle: false,
          title: Row(
            children: [
              Text(
                "${l10n.search}:",
                style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
              ),
              SizedBox(width: 5),
              Text(
                query,
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: searchResult.when(
            data: (data) {
              if (data.albums == null &&
                  data.artists == null &&
                  data.songs == null) {
                return buildErrorView(context, ref, colorScheme, () {});
              }
              final artists = data.artists;
              final albums = data.albums;
              final songs = data.songs;
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (artists != null &&
                          artists.data != null &&
                          artists.data!.artists != null &&
                          artists.data!.artists!.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            l10n.artist,
                            style: TextStyle(
                              color: colorScheme.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AritistHorizontalList(artists: artists.data!.artists!),
                      ],
                      if (albums != null) ...[
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            l10n.albums,
                            style: TextStyle(
                              color: colorScheme.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AlbumHorizontalList(albums: albums.data?.albums ?? []),
                      ],
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(child: AudioEqualizerLoader()),
            error: (error, stackTrace) {
              return buildErrorView(context, ref, colorScheme, () {});
            },
          ),
        ),
      ],
    );
  }
}
