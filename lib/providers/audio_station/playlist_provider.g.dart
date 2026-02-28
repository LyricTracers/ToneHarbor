// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlists)
final playlistsProvider = PlaylistsFamily._();

final class PlaylistsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaylistListResponse>,
          PlaylistListResponse,
          FutureOr<PlaylistListResponse>
        >
    with
        $FutureModifier<PlaylistListResponse>,
        $FutureProvider<PlaylistListResponse> {
  PlaylistsProvider._({
    required PlaylistsFamily super.from,
    required ({
      int limit,
      int offset,
      String library,
      String sortBy,
      String sortDirection,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'playlistsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistsHash();

  @override
  String toString() {
    return r'playlistsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PlaylistListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlaylistListResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int limit,
              int offset,
              String library,
              String sortBy,
              String sortDirection,
              Duration? cacheDuration,
            });
    return playlists(
      ref,
      limit: argument.limit,
      offset: argument.offset,
      library: argument.library,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      cacheDuration: argument.cacheDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistsHash() => r'f46029f4501e65abf4b53c1efa8605c6a4ce5296';

final class PlaylistsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PlaylistListResponse>,
          ({
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            Duration? cacheDuration,
          })
        > {
  PlaylistsFamily._()
    : super(
        retry: null,
        name: r'playlistsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistsProvider call({
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = '',
    String sortDirection = 'ASC',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => PlaylistsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'playlistsProvider';
}

@ProviderFor(playlistDetail)
final playlistDetailProvider = PlaylistDetailFamily._();

final class PlaylistDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaylistDetailResponse>,
          PlaylistDetailResponse,
          FutureOr<PlaylistDetailResponse>
        >
    with
        $FutureModifier<PlaylistDetailResponse>,
        $FutureProvider<PlaylistDetailResponse> {
  PlaylistDetailProvider._({
    required PlaylistDetailFamily super.from,
    required ({
      String id,
      String library,
      String additional,
      int limit,
      int offset,
      String sortBy,
      String sortDirection,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'playlistDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistDetailHash();

  @override
  String toString() {
    return r'playlistDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PlaylistDetailResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlaylistDetailResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String id,
              String library,
              String additional,
              int limit,
              int offset,
              String sortBy,
              String sortDirection,
              Duration? cacheDuration,
            });
    return playlistDetail(
      ref,
      id: argument.id,
      library: argument.library,
      additional: argument.additional,
      limit: argument.limit,
      offset: argument.offset,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      cacheDuration: argument.cacheDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistDetailHash() => r'3137e7b917e2ee54f3cb102060c97fa70c21339c';

final class PlaylistDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PlaylistDetailResponse>,
          ({
            String id,
            String library,
            String additional,
            int limit,
            int offset,
            String sortBy,
            String sortDirection,
            Duration? cacheDuration,
          })
        > {
  PlaylistDetailFamily._()
    : super(
        retry: null,
        name: r'playlistDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistDetailProvider call({
    required String id,
    String library = 'shared',
    String additional = 'songs,song_tag,song_audio,song_rating,sharing_info',
    int limit = 100,
    int offset = 0,
    String sortBy = '',
    String sortDirection = 'ASC',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => PlaylistDetailProvider._(
    argument: (
      id: id,
      library: library,
      additional: additional,
      limit: limit,
      offset: offset,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'playlistDetailProvider';
}

@ProviderFor(playlistInfo)
final playlistInfoProvider = PlaylistInfoFamily._();

final class PlaylistInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaylistDetailResponse>,
          PlaylistDetailResponse,
          FutureOr<PlaylistDetailResponse>
        >
    with
        $FutureModifier<PlaylistDetailResponse>,
        $FutureProvider<PlaylistDetailResponse> {
  PlaylistInfoProvider._({
    required PlaylistInfoFamily super.from,
    required ({String id, String additional, Duration? cacheDuration})
    super.argument,
  }) : super(
         retry: null,
         name: r'playlistInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistInfoHash();

  @override
  String toString() {
    return r'playlistInfoProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PlaylistDetailResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlaylistDetailResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({String id, String additional, Duration? cacheDuration});
    return playlistInfo(
      ref,
      id: argument.id,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistInfoHash() => r'c89d5f4e17ab9ecb8cee36bcd40f4639576f81dc';

final class PlaylistInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PlaylistDetailResponse>,
          ({String id, String additional, Duration? cacheDuration})
        > {
  PlaylistInfoFamily._()
    : super(
        retry: null,
        name: r'playlistInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistInfoProvider call({
    required String id,
    String additional = 'songs',
    Duration? cacheDuration = const Duration(minutes: 5),
  }) => PlaylistInfoProvider._(
    argument: (id: id, additional: additional, cacheDuration: cacheDuration),
    from: this,
  );

  @override
  String toString() => r'playlistInfoProvider';
}

@ProviderFor(PlaylistsState)
final playlistsStateProvider = PlaylistsStateProvider._();

final class PlaylistsStateProvider
    extends $NotifierProvider<PlaylistsState, PlaylistListResponse?> {
  PlaylistsStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistsStateHash();

  @$internal
  @override
  PlaylistsState create() => PlaylistsState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistListResponse? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistListResponse?>(value),
    );
  }
}

String _$playlistsStateHash() => r'4044215d80c73ba2853e9c7b7acc8a9fe3da6147';

abstract class _$PlaylistsState extends $Notifier<PlaylistListResponse?> {
  PlaylistListResponse? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PlaylistListResponse?, PlaylistListResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlaylistListResponse?, PlaylistListResponse?>,
              PlaylistListResponse?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
