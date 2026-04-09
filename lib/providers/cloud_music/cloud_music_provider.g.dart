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

@ProviderFor(recommendPlaylists)
final recommendPlaylistsProvider = RecommendPlaylistsFamily._();

final class RecommendPlaylistsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CloudMusicPlaylistData>>,
          List<CloudMusicPlaylistData>,
          FutureOr<List<CloudMusicPlaylistData>>
        >
    with
        $FutureModifier<List<CloudMusicPlaylistData>>,
        $FutureProvider<List<CloudMusicPlaylistData>> {
  RecommendPlaylistsProvider._({
    required RecommendPlaylistsFamily super.from,
    required ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
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
  $FutureProviderElement<List<CloudMusicPlaylistData>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CloudMusicPlaylistData>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return recommendPlaylists(
      ref,
      limit: argument.limit,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

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
    r'08edfc2325b300588690194bb9c34010fca28926';

final class RecommendPlaylistsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CloudMusicPlaylistData>>,
          ({int limit, Duration? cacheDuration, Duration? keepAliveDuration})
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => RecommendPlaylistsProvider._(
    argument: (
      limit: limit,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'recommendPlaylistsProvider';
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
