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
          AsyncValue<List<CloudMusicPlaylist>>,
          List<CloudMusicPlaylist>,
          FutureOr<List<CloudMusicPlaylist>>
        >
    with
        $FutureModifier<List<CloudMusicPlaylist>>,
        $FutureProvider<List<CloudMusicPlaylist>> {
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
  $FutureProviderElement<List<CloudMusicPlaylist>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CloudMusicPlaylist>> create(Ref ref) {
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
    r'f4e4112839864dc3f8aa2d3fc9b9de4607d4238b';

final class RecommendPlaylistsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CloudMusicPlaylist>>,
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
          AsyncValue<List<CloudMusicArtist>>,
          List<CloudMusicArtist>,
          FutureOr<List<CloudMusicArtist>>
        >
    with
        $FutureModifier<List<CloudMusicArtist>>,
        $FutureProvider<List<CloudMusicArtist>> {
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
  $FutureProviderElement<List<CloudMusicArtist>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CloudMusicArtist>> create(Ref ref) {
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
    r'cbca66a1732694ff08d77f05feb7e26c10b86b52';

final class RecommendTopArtistFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CloudMusicArtist>>,
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
    r'281f70c3643b66d5d07088e226d26e5c377a8e62';

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
    extends $AsyncNotifierProvider<CloudUserInfo, CloudMusicUser?> {
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

String _$cloudUserInfoHash() => r'a41a9a372686e6b1e770743e6b24ac3d5540db81';

abstract class _$CloudUserInfo extends $AsyncNotifier<CloudMusicUser?> {
  FutureOr<CloudMusicUser?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CloudMusicUser?>, CloudMusicUser?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CloudMusicUser?>, CloudMusicUser?>,
              AsyncValue<CloudMusicUser?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
