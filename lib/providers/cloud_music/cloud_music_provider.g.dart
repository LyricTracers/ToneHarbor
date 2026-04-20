// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_music_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shouldUseCloudMusicHome)
final shouldUseCloudMusicHomeProvider = ShouldUseCloudMusicHomeProvider._();

final class ShouldUseCloudMusicHomeProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  ShouldUseCloudMusicHomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shouldUseCloudMusicHomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shouldUseCloudMusicHomeHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return shouldUseCloudMusicHome(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$shouldUseCloudMusicHomeHash() =>
    r'9e560abf60ff1ec7433de82cc93033490f003971';

@ProviderFor(RecommendPlaylists)
final recommendPlaylistsProvider = RecommendPlaylistsFamily._();

final class RecommendPlaylistsProvider
    extends
        $AsyncNotifierProvider<RecommendPlaylists, CloudMusicPlaylistDataList> {
  RecommendPlaylistsProvider._({
    required RecommendPlaylistsFamily super.from,
    required ({int limit, Duration? cacheDuration}) super.argument,
  }) : super(
         retry: null,
         name: r'recommendPlaylistsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recommendPlaylistsHash();

  @override
  String toString() {
    return r'recommendPlaylistsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  RecommendPlaylists create() => RecommendPlaylists();

  @override
  bool operator ==(Object other) {
    return other is RecommendPlaylistsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recommendPlaylistsHash() =>
    r'ca677eeab6854980159f4677a10edda9f6bbb80d';

final class RecommendPlaylistsFamily extends $Family
    with
        $ClassFamilyOverride<
          RecommendPlaylists,
          AsyncValue<CloudMusicPlaylistDataList>,
          CloudMusicPlaylistDataList,
          FutureOr<CloudMusicPlaylistDataList>,
          ({int limit, Duration? cacheDuration})
        > {
  RecommendPlaylistsFamily._()
    : super(
        retry: null,
        name: r'recommendPlaylistsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecommendPlaylistsProvider call({
    int limit = 10,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) => RecommendPlaylistsProvider._(
    argument: (limit: limit, cacheDuration: cacheDuration),
    from: this,
  );

  @override
  String toString() => r'recommendPlaylistsProvider';
}

abstract class _$RecommendPlaylists
    extends $AsyncNotifier<CloudMusicPlaylistDataList> {
  late final _$args = ref.$arg as ({int limit, Duration? cacheDuration});
  int get limit => _$args.limit;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<CloudMusicPlaylistDataList> build({
    int limit = 10,
    Duration? cacheDuration = const Duration(minutes: 60),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CloudMusicPlaylistDataList>,
              CloudMusicPlaylistDataList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CloudMusicPlaylistDataList>,
                CloudMusicPlaylistDataList
              >,
              AsyncValue<CloudMusicPlaylistDataList>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(limit: _$args.limit, cacheDuration: _$args.cacheDuration),
    );
  }
}

@ProviderFor(recommendTopArtist)
final recommendTopArtistProvider = RecommendTopArtistFamily._();

final class RecommendTopArtistProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CloudMusicArtistData>>,
          List<CloudMusicArtistData>,
          FutureOr<List<CloudMusicArtistData>>
        >
    with
        $FutureModifier<List<CloudMusicArtistData>>,
        $FutureProvider<List<CloudMusicArtistData>> {
  RecommendTopArtistProvider._({
    required RecommendTopArtistFamily super.from,
    required ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'recommendTopArtistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recommendTopArtistHash();

  @override
  String toString() {
    return r'recommendTopArtistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CloudMusicArtistData>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CloudMusicArtistData>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return recommendTopArtist(
      ref,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecommendTopArtistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recommendTopArtistHash() =>
    r'63d397529858502e5c38e3c162fddb6735c80f07';

final class RecommendTopArtistFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CloudMusicArtistData>>,
          ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  RecommendTopArtistFamily._()
    : super(
        retry: null,
        name: r'recommendTopArtistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecommendTopArtistProvider call({
    int limit = 6,
    Duration? cacheDuration = const Duration(minutes: 60),
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => RecommendTopArtistProvider._(
    argument: (
      limit: limit,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'recommendTopArtistProvider';
}

@ProviderFor(CloudMusicPlaylistDetail)
final cloudMusicPlaylistDetailProvider = CloudMusicPlaylistDetailFamily._();

final class CloudMusicPlaylistDetailProvider
    extends
        $AsyncNotifierProvider<
          CloudMusicPlaylistDetail,
          CloudMusicPlaylistDetailData?
        > {
  CloudMusicPlaylistDetailProvider._({
    required CloudMusicPlaylistDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'cloudMusicPlaylistDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicPlaylistDetailHash();

  @override
  String toString() {
    return r'cloudMusicPlaylistDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CloudMusicPlaylistDetail create() => CloudMusicPlaylistDetail();

  @override
  bool operator ==(Object other) {
    return other is CloudMusicPlaylistDetailProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cloudMusicPlaylistDetailHash() =>
    r'896f49b3ac46c40e7f80663243facd3a0156061c';

final class CloudMusicPlaylistDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          CloudMusicPlaylistDetail,
          AsyncValue<CloudMusicPlaylistDetailData?>,
          CloudMusicPlaylistDetailData?,
          FutureOr<CloudMusicPlaylistDetailData?>,
          int
        > {
  CloudMusicPlaylistDetailFamily._()
    : super(
        retry: null,
        name: r'cloudMusicPlaylistDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CloudMusicPlaylistDetailProvider call(int playlistId) =>
      CloudMusicPlaylistDetailProvider._(argument: playlistId, from: this);

  @override
  String toString() => r'cloudMusicPlaylistDetailProvider';
}

abstract class _$CloudMusicPlaylistDetail
    extends $AsyncNotifier<CloudMusicPlaylistDetailData?> {
  late final _$args = ref.$arg as int;
  int get playlistId => _$args;

  FutureOr<CloudMusicPlaylistDetailData?> build(int playlistId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CloudMusicPlaylistDetailData?>,
              CloudMusicPlaylistDetailData?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CloudMusicPlaylistDetailData?>,
                CloudMusicPlaylistDetailData?
              >,
              AsyncValue<CloudMusicPlaylistDetailData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(CloudUserInfo)
final cloudUserInfoProvider = CloudUserInfoProvider._();

final class CloudUserInfoProvider
    extends $AsyncNotifierProvider<CloudUserInfo, CloudMusicUserData?> {
  CloudUserInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudUserInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudUserInfoHash();

  @$internal
  @override
  CloudUserInfo create() => CloudUserInfo();
}

String _$cloudUserInfoHash() => r'05162859e086b83aa7d6fd649a4ab4c4733a9232';

abstract class _$CloudUserInfo extends $AsyncNotifier<CloudMusicUserData?> {
  FutureOr<CloudMusicUserData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<CloudMusicUserData?>, CloudMusicUserData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CloudMusicUserData?>, CloudMusicUserData?>,
              AsyncValue<CloudMusicUserData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CloudMusicPlaylistCatlist)
final cloudMusicPlaylistCatlistProvider = CloudMusicPlaylistCatlistFamily._();

final class CloudMusicPlaylistCatlistProvider
    extends
        $AsyncNotifierProvider<
          CloudMusicPlaylistCatlist,
          CloudMusicPlaylistDataList
        > {
  CloudMusicPlaylistCatlistProvider._({
    required CloudMusicPlaylistCatlistFamily super.from,
    required ({String cat, int limit, int offset, Duration? cacheDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'cloudMusicPlaylistCatlistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicPlaylistCatlistHash();

  @override
  String toString() {
    return r'cloudMusicPlaylistCatlistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CloudMusicPlaylistCatlist create() => CloudMusicPlaylistCatlist();

  @override
  bool operator ==(Object other) {
    return other is CloudMusicPlaylistCatlistProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cloudMusicPlaylistCatlistHash() =>
    r'6bbd8e6080d51492194017a8bb49c203a02e2fe3';

final class CloudMusicPlaylistCatlistFamily extends $Family
    with
        $ClassFamilyOverride<
          CloudMusicPlaylistCatlist,
          AsyncValue<CloudMusicPlaylistDataList>,
          CloudMusicPlaylistDataList,
          FutureOr<CloudMusicPlaylistDataList>,
          ({String cat, int limit, int offset, Duration? cacheDuration})
        > {
  CloudMusicPlaylistCatlistFamily._()
    : super(
        retry: null,
        name: r'cloudMusicPlaylistCatlistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CloudMusicPlaylistCatlistProvider call({
    required String cat,
    int limit = 50,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 60),
  }) => CloudMusicPlaylistCatlistProvider._(
    argument: (
      cat: cat,
      limit: limit,
      offset: offset,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'cloudMusicPlaylistCatlistProvider';
}

abstract class _$CloudMusicPlaylistCatlist
    extends $AsyncNotifier<CloudMusicPlaylistDataList> {
  late final _$args =
      ref.$arg
          as ({String cat, int limit, int offset, Duration? cacheDuration});
  String get cat => _$args.cat;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<CloudMusicPlaylistDataList> build({
    required String cat,
    int limit = 50,
    int offset = 0,
    Duration? cacheDuration = const Duration(minutes: 60),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CloudMusicPlaylistDataList>,
              CloudMusicPlaylistDataList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CloudMusicPlaylistDataList>,
                CloudMusicPlaylistDataList
              >,
              AsyncValue<CloudMusicPlaylistDataList>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        cat: _$args.cat,
        limit: _$args.limit,
        offset: _$args.offset,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}

@ProviderFor(CloudMusicArtistDetail)
final cloudMusicArtistDetailProvider = CloudMusicArtistDetailFamily._();

final class CloudMusicArtistDetailProvider
    extends
        $NotifierProvider<CloudMusicArtistDetail, CloudMusicAristDetailData> {
  CloudMusicArtistDetailProvider._({
    required CloudMusicArtistDetailFamily super.from,
    required (CloudMusicArtistData, {Duration? cacheDuration}) super.argument,
  }) : super(
         retry: null,
         name: r'cloudMusicArtistDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicArtistDetailHash();

  @override
  String toString() {
    return r'cloudMusicArtistDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CloudMusicArtistDetail create() => CloudMusicArtistDetail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CloudMusicAristDetailData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CloudMusicAristDetailData>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CloudMusicArtistDetailProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cloudMusicArtistDetailHash() =>
    r'a91f083df5b37788868ea1b9b170298fe37838fb';

final class CloudMusicArtistDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          CloudMusicArtistDetail,
          CloudMusicAristDetailData,
          CloudMusicAristDetailData,
          CloudMusicAristDetailData,
          (CloudMusicArtistData, {Duration? cacheDuration})
        > {
  CloudMusicArtistDetailFamily._()
    : super(
        retry: null,
        name: r'cloudMusicArtistDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CloudMusicArtistDetailProvider call(
    CloudMusicArtistData artistData, {
    Duration? cacheDuration = const Duration(days: 30),
  }) => CloudMusicArtistDetailProvider._(
    argument: (artistData, cacheDuration: cacheDuration),
    from: this,
  );

  @override
  String toString() => r'cloudMusicArtistDetailProvider';
}

abstract class _$CloudMusicArtistDetail
    extends $Notifier<CloudMusicAristDetailData> {
  late final _$args =
      ref.$arg as (CloudMusicArtistData, {Duration? cacheDuration});
  CloudMusicArtistData get artistData => _$args.$1;
  Duration? get cacheDuration => _$args.cacheDuration;

  CloudMusicAristDetailData build(
    CloudMusicArtistData artistData, {
    Duration? cacheDuration = const Duration(days: 30),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<CloudMusicAristDetailData, CloudMusicAristDetailData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CloudMusicAristDetailData, CloudMusicAristDetailData>,
              CloudMusicAristDetailData,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(_$args.$1, cacheDuration: _$args.cacheDuration),
    );
  }
}

@ProviderFor(getCloudAlbumDetail)
final getCloudAlbumDetailProvider = GetCloudAlbumDetailFamily._();

final class GetCloudAlbumDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<CloudMusicAlbumDetailData?>,
          CloudMusicAlbumDetailData?,
          FutureOr<CloudMusicAlbumDetailData?>
        >
    with
        $FutureModifier<CloudMusicAlbumDetailData?>,
        $FutureProvider<CloudMusicAlbumDetailData?> {
  GetCloudAlbumDetailProvider._({
    required GetCloudAlbumDetailFamily super.from,
    required ({
      int albumId,
      Duration? keepAliveDuration,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getCloudAlbumDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCloudAlbumDetailHash();

  @override
  String toString() {
    return r'getCloudAlbumDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CloudMusicAlbumDetailData?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CloudMusicAlbumDetailData?> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int albumId,
              Duration? keepAliveDuration,
              Duration? cacheDuration,
            });
    return getCloudAlbumDetail(
      ref,
      albumId: argument.albumId,
      keepAliveDuration: argument.keepAliveDuration,
      cacheDuration: argument.cacheDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetCloudAlbumDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCloudAlbumDetailHash() =>
    r'e31eba34891b4a31c2d954042a149739edfb0083';

final class GetCloudAlbumDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CloudMusicAlbumDetailData?>,
          ({int albumId, Duration? keepAliveDuration, Duration? cacheDuration})
        > {
  GetCloudAlbumDetailFamily._()
    : super(
        retry: null,
        name: r'getCloudAlbumDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCloudAlbumDetailProvider call({
    required int albumId,
    Duration? keepAliveDuration = const Duration(minutes: 5),
    Duration? cacheDuration = const Duration(days: 30),
  }) => GetCloudAlbumDetailProvider._(
    argument: (
      albumId: albumId,
      keepAliveDuration: keepAliveDuration,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'getCloudAlbumDetailProvider';
}

@ProviderFor(CloudLikelistState)
final cloudLikelistStateProvider = CloudLikelistStateProvider._();

final class CloudLikelistStateProvider
    extends
        $AsyncNotifierProvider<CloudLikelistState, ToneHarborTrackObjectList> {
  CloudLikelistStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudLikelistStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudLikelistStateHash();

  @$internal
  @override
  CloudLikelistState create() => CloudLikelistState();
}

String _$cloudLikelistStateHash() =>
    r'd77b995b166479c22223bc501f15fe6d70024654';

abstract class _$CloudLikelistState
    extends $AsyncNotifier<ToneHarborTrackObjectList> {
  FutureOr<ToneHarborTrackObjectList> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CloudDailyRecommend)
final cloudDailyRecommendProvider = CloudDailyRecommendProvider._();

final class CloudDailyRecommendProvider
    extends
        $AsyncNotifierProvider<CloudDailyRecommend, ToneHarborTrackObjectList> {
  CloudDailyRecommendProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudDailyRecommendProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudDailyRecommendHash();

  @$internal
  @override
  CloudDailyRecommend create() => CloudDailyRecommend();
}

String _$cloudDailyRecommendHash() =>
    r'083ee303cd2ed0dee1555494dcd67602af7e7e18';

abstract class _$CloudDailyRecommend
    extends $AsyncNotifier<ToneHarborTrackObjectList> {
  FutureOr<ToneHarborTrackObjectList> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CloudToplist)
final cloudToplistProvider = CloudToplistFamily._();

final class CloudToplistProvider
    extends $AsyncNotifierProvider<CloudToplist, CloudMusicPlaylistDataList> {
  CloudToplistProvider._({
    required CloudToplistFamily super.from,
    required Duration? super.argument,
  }) : super(
         retry: null,
         name: r'cloudToplistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cloudToplistHash();

  @override
  String toString() {
    return r'cloudToplistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CloudToplist create() => CloudToplist();

  @override
  bool operator ==(Object other) {
    return other is CloudToplistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cloudToplistHash() => r'ad346997c23cdeebb1a3e6409101532ca306ff0e';

final class CloudToplistFamily extends $Family
    with
        $ClassFamilyOverride<
          CloudToplist,
          AsyncValue<CloudMusicPlaylistDataList>,
          CloudMusicPlaylistDataList,
          FutureOr<CloudMusicPlaylistDataList>,
          Duration?
        > {
  CloudToplistFamily._()
    : super(
        retry: null,
        name: r'cloudToplistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CloudToplistProvider call({
    Duration? cacheDuration = const Duration(minutes: 60),
  }) => CloudToplistProvider._(argument: cacheDuration, from: this);

  @override
  String toString() => r'cloudToplistProvider';
}

abstract class _$CloudToplist
    extends $AsyncNotifier<CloudMusicPlaylistDataList> {
  late final _$args = ref.$arg as Duration?;
  Duration? get cacheDuration => _$args;

  FutureOr<CloudMusicPlaylistDataList> build({
    Duration? cacheDuration = const Duration(minutes: 60),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CloudMusicPlaylistDataList>,
              CloudMusicPlaylistDataList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CloudMusicPlaylistDataList>,
                CloudMusicPlaylistDataList
              >,
              AsyncValue<CloudMusicPlaylistDataList>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(cacheDuration: _$args));
  }
}

@ProviderFor(CloudMusicArtistAllSongs)
final cloudMusicArtistAllSongsProvider = CloudMusicArtistAllSongsFamily._();

final class CloudMusicArtistAllSongsProvider
    extends
        $AsyncNotifierProvider<
          CloudMusicArtistAllSongs,
          ToneHarborTrackObjectList
        > {
  CloudMusicArtistAllSongsProvider._({
    required CloudMusicArtistAllSongsFamily super.from,
    required ({
      String artistId,
      int limit,
      int offset,
      String order,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'cloudMusicArtistAllSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cloudMusicArtistAllSongsHash();

  @override
  String toString() {
    return r'cloudMusicArtistAllSongsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CloudMusicArtistAllSongs create() => CloudMusicArtistAllSongs();

  @override
  bool operator ==(Object other) {
    return other is CloudMusicArtistAllSongsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cloudMusicArtistAllSongsHash() =>
    r'7c50baadcea2e42c0188bb0fa99a855ab66763c7';

final class CloudMusicArtistAllSongsFamily extends $Family
    with
        $ClassFamilyOverride<
          CloudMusicArtistAllSongs,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
          ({
            String artistId,
            int limit,
            int offset,
            String order,
            Duration? cacheDuration,
          })
        > {
  CloudMusicArtistAllSongsFamily._()
    : super(
        retry: null,
        name: r'cloudMusicArtistAllSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CloudMusicArtistAllSongsProvider call({
    required String artistId,
    int limit = 50,
    int offset = 0,
    String order = 'hot',
    Duration? cacheDuration = const Duration(minutes: 60),
  }) => CloudMusicArtistAllSongsProvider._(
    argument: (
      artistId: artistId,
      limit: limit,
      offset: offset,
      order: order,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'cloudMusicArtistAllSongsProvider';
}

abstract class _$CloudMusicArtistAllSongs
    extends $AsyncNotifier<ToneHarborTrackObjectList> {
  late final _$args =
      ref.$arg
          as ({
            String artistId,
            int limit,
            int offset,
            String order,
            Duration? cacheDuration,
          });
  String get artistId => _$args.artistId;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get order => _$args.order; //hot ,time 按照热门或者时间排序
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<ToneHarborTrackObjectList> build({
    required String artistId,
    int limit = 50,
    int offset = 0,
    String order = 'hot',
    Duration? cacheDuration = const Duration(minutes: 60),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ToneHarborTrackObjectList>,
              ToneHarborTrackObjectList
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ToneHarborTrackObjectList>,
                ToneHarborTrackObjectList
              >,
              AsyncValue<ToneHarborTrackObjectList>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        artistId: _$args.artistId,
        limit: _$args.limit,
        offset: _$args.offset,
        order: _$args.order,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}
