import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:toneharbor/providers/providers.dart';

final apiCacheRelatedProviders = <ProviderOrFamily>[
  randomAlbumsProvider,
  recentAlbumsProvider,
  artistAlbumsProvider,
  searchAlbumsProvider,
  albumsProvider,

  searchArtistProvider,
  artistsProvider,

  foldersProvider,

  queryAPIProvider,
  dsmInfoProvider,
  audioStationInfoProvider,

  playlistResponseProvider,
  playlistDetailProvider,

  searchSongsProvider,

  randomSongsProvider,
  favoriteSongsProvider,
  artistSongsProvider,
  albumSongsProvider,
  songsProvider,

  searchCloudHotProvider,

  cloudUserInfoProvider,

  recommendPlaylistsProvider,
  recommendTopArtistProvider,
  cloudMusicPlaylistDetailProvider,
  cloudMusicPlaylistCatlistProvider,
  cloudMusicArtistDetailProvider,
  getCloudAlbumDetailProvider,
  cloudDailyRecommendProvider,
  cloudToplistProvider,
  cloudMusicArtistAllSongsProvider,
  cloudMusicAlbumNewProvider,
  cloudMusicArtistGroupListProvider,
  cloudMusicSearchSongsProvider,
  cloudMusicSearchArtistsProvider,
  cloudMusicSearchAlbumsProvider,
  cloudMusicSearchPlaylistsProvider,

  mixSearchProvider,
];

void invalidateApiCacheProviders(Ref ref) {
  for (final provider in apiCacheRelatedProviders) {
    ref.invalidate(provider);
  }
}
