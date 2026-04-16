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
    r'05ba20abc55e1e31cb561c0e13c40f89ec19c92b';

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
        isAutoDispose: false,
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
    r'798c6d7135e7309f9849ff9e83e3c75cd8175d6f';

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
        isAutoDispose: false,
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
    r'1f89a680806427cdf14d32b0306960d21960d01f';

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
