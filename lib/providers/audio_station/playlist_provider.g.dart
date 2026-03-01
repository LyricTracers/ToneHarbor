// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(removeMissingSongs)
final removeMissingSongsProvider = RemoveMissingSongsFamily._();

final class RemoveMissingSongsProvider
    extends
        $FunctionalProvider<
          AsyncValue<RemoveMissingSongsResponse>,
          RemoveMissingSongsResponse,
          FutureOr<RemoveMissingSongsResponse>
        >
    with
        $FutureModifier<RemoveMissingSongsResponse>,
        $FutureProvider<RemoveMissingSongsResponse> {
  RemoveMissingSongsProvider._({
    required RemoveMissingSongsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'removeMissingSongsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$removeMissingSongsHash();

  @override
  String toString() {
    return r'removeMissingSongsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RemoveMissingSongsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RemoveMissingSongsResponse> create(Ref ref) {
    final argument = this.argument as String;
    return removeMissingSongs(ref, id: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveMissingSongsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$removeMissingSongsHash() =>
    r'0bf676e70c20957a80dd563a47f97d123e039db8';

final class RemoveMissingSongsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<RemoveMissingSongsResponse>,
          String
        > {
  RemoveMissingSongsFamily._()
    : super(
        retry: null,
        name: r'removeMissingSongsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemoveMissingSongsProvider call({required String id}) =>
      RemoveMissingSongsProvider._(argument: id, from: this);

  @override
  String toString() => r'removeMissingSongsProvider';
}

@ProviderFor(removeSongsFromPlaylist)
final removeSongsFromPlaylistProvider = RemoveSongsFromPlaylistFamily._();

final class RemoveSongsFromPlaylistProvider
    extends
        $FunctionalProvider<
          AsyncValue<AddPlaylistSongsResponse>,
          AddPlaylistSongsResponse,
          FutureOr<AddPlaylistSongsResponse>
        >
    with
        $FutureModifier<AddPlaylistSongsResponse>,
        $FutureProvider<AddPlaylistSongsResponse> {
  RemoveSongsFromPlaylistProvider._({
    required RemoveSongsFromPlaylistFamily super.from,
    required ({String id, int offset, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'removeSongsFromPlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$removeSongsFromPlaylistHash();

  @override
  String toString() {
    return r'removeSongsFromPlaylistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AddPlaylistSongsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AddPlaylistSongsResponse> create(Ref ref) {
    final argument = this.argument as ({String id, int offset, int limit});
    return removeSongsFromPlaylist(
      ref,
      id: argument.id,
      offset: argument.offset,
      limit: argument.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveSongsFromPlaylistProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$removeSongsFromPlaylistHash() =>
    r'50dc06dea57a2facc850428868f110ad08ce103f';

final class RemoveSongsFromPlaylistFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AddPlaylistSongsResponse>,
          ({String id, int offset, int limit})
        > {
  RemoveSongsFromPlaylistFamily._()
    : super(
        retry: null,
        name: r'removeSongsFromPlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemoveSongsFromPlaylistProvider call({
    required String id,
    required int offset,
    required int limit,
  }) => RemoveSongsFromPlaylistProvider._(
    argument: (id: id, offset: offset, limit: limit),
    from: this,
  );

  @override
  String toString() => r'removeSongsFromPlaylistProvider';
}

@ProviderFor(addSongsToPlaylist)
final addSongsToPlaylistProvider = AddSongsToPlaylistFamily._();

final class AddSongsToPlaylistProvider
    extends
        $FunctionalProvider<
          AsyncValue<AddPlaylistSongsResponse>,
          AddPlaylistSongsResponse,
          FutureOr<AddPlaylistSongsResponse>
        >
    with
        $FutureModifier<AddPlaylistSongsResponse>,
        $FutureProvider<AddPlaylistSongsResponse> {
  AddSongsToPlaylistProvider._({
    required AddSongsToPlaylistFamily super.from,
    required ({
      String id,
      List<String> songIds,
      int offset,
      int limit,
      bool skipDuplicate,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'addSongsToPlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addSongsToPlaylistHash();

  @override
  String toString() {
    return r'addSongsToPlaylistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AddPlaylistSongsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AddPlaylistSongsResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String id,
              List<String> songIds,
              int offset,
              int limit,
              bool skipDuplicate,
            });
    return addSongsToPlaylist(
      ref,
      id: argument.id,
      songIds: argument.songIds,
      offset: argument.offset,
      limit: argument.limit,
      skipDuplicate: argument.skipDuplicate,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddSongsToPlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addSongsToPlaylistHash() =>
    r'41bf239e09e1f3d6c52891af6b02d1cca3450b19';

final class AddSongsToPlaylistFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AddPlaylistSongsResponse>,
          ({
            String id,
            List<String> songIds,
            int offset,
            int limit,
            bool skipDuplicate,
          })
        > {
  AddSongsToPlaylistFamily._()
    : super(
        retry: null,
        name: r'addSongsToPlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddSongsToPlaylistProvider call({
    required String id,
    required List<String> songIds,
    int offset = -1,
    int limit = 0,
    bool skipDuplicate = false,
  }) => AddSongsToPlaylistProvider._(
    argument: (
      id: id,
      songIds: songIds,
      offset: offset,
      limit: limit,
      skipDuplicate: skipDuplicate,
    ),
    from: this,
  );

  @override
  String toString() => r'addSongsToPlaylistProvider';
}

@ProviderFor(addSongToPlaylist)
final addSongToPlaylistProvider = AddSongToPlaylistFamily._();

final class AddSongToPlaylistProvider
    extends
        $FunctionalProvider<
          AsyncValue<AddPlaylistSongsResponse>,
          AddPlaylistSongsResponse,
          FutureOr<AddPlaylistSongsResponse>
        >
    with
        $FutureModifier<AddPlaylistSongsResponse>,
        $FutureProvider<AddPlaylistSongsResponse> {
  AddSongToPlaylistProvider._({
    required AddSongToPlaylistFamily super.from,
    required ({
      String id,
      String songId,
      int offset,
      int limit,
      bool skipDuplicate,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'addSongToPlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addSongToPlaylistHash();

  @override
  String toString() {
    return r'addSongToPlaylistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AddPlaylistSongsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AddPlaylistSongsResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String id,
              String songId,
              int offset,
              int limit,
              bool skipDuplicate,
            });
    return addSongToPlaylist(
      ref,
      id: argument.id,
      songId: argument.songId,
      offset: argument.offset,
      limit: argument.limit,
      skipDuplicate: argument.skipDuplicate,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddSongToPlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addSongToPlaylistHash() => r'a38e09ff698ad7e8705efa43f3cd0f15d777fb5a';

final class AddSongToPlaylistFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AddPlaylistSongsResponse>,
          ({
            String id,
            String songId,
            int offset,
            int limit,
            bool skipDuplicate,
          })
        > {
  AddSongToPlaylistFamily._()
    : super(
        retry: null,
        name: r'addSongToPlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddSongToPlaylistProvider call({
    required String id,
    required String songId,
    int offset = -1,
    int limit = 0,
    bool skipDuplicate = false,
  }) => AddSongToPlaylistProvider._(
    argument: (
      id: id,
      songId: songId,
      offset: offset,
      limit: limit,
      skipDuplicate: skipDuplicate,
    ),
    from: this,
  );

  @override
  String toString() => r'addSongToPlaylistProvider';
}

@ProviderFor(deletePlaylist)
final deletePlaylistProvider = DeletePlaylistFamily._();

final class DeletePlaylistProvider
    extends
        $FunctionalProvider<
          AsyncValue<DeletePlaylistResponse>,
          DeletePlaylistResponse,
          FutureOr<DeletePlaylistResponse>
        >
    with
        $FutureModifier<DeletePlaylistResponse>,
        $FutureProvider<DeletePlaylistResponse> {
  DeletePlaylistProvider._({
    required DeletePlaylistFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deletePlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deletePlaylistHash();

  @override
  String toString() {
    return r'deletePlaylistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DeletePlaylistResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DeletePlaylistResponse> create(Ref ref) {
    final argument = this.argument as String;
    return deletePlaylist(ref, id: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeletePlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deletePlaylistHash() => r'd833c7ad60fa1cecc8f98303678fdbf95bf9a493';

final class DeletePlaylistFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DeletePlaylistResponse>, String> {
  DeletePlaylistFamily._()
    : super(
        retry: null,
        name: r'deletePlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeletePlaylistProvider call({required String id}) =>
      DeletePlaylistProvider._(argument: id, from: this);

  @override
  String toString() => r'deletePlaylistProvider';
}

@ProviderFor(renamePlaylist)
final renamePlaylistProvider = RenamePlaylistFamily._();

final class RenamePlaylistProvider
    extends
        $FunctionalProvider<
          AsyncValue<RenamePlaylistResponse>,
          RenamePlaylistResponse,
          FutureOr<RenamePlaylistResponse>
        >
    with
        $FutureModifier<RenamePlaylistResponse>,
        $FutureProvider<RenamePlaylistResponse> {
  RenamePlaylistProvider._({
    required RenamePlaylistFamily super.from,
    required ({String id, String newName}) super.argument,
  }) : super(
         retry: null,
         name: r'renamePlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$renamePlaylistHash();

  @override
  String toString() {
    return r'renamePlaylistProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<RenamePlaylistResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RenamePlaylistResponse> create(Ref ref) {
    final argument = this.argument as ({String id, String newName});
    return renamePlaylist(ref, id: argument.id, newName: argument.newName);
  }

  @override
  bool operator ==(Object other) {
    return other is RenamePlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$renamePlaylistHash() => r'e9fb6798bd54d18ddf8d13139553788430484535';

final class RenamePlaylistFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<RenamePlaylistResponse>,
          ({String id, String newName})
        > {
  RenamePlaylistFamily._()
    : super(
        retry: null,
        name: r'renamePlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RenamePlaylistProvider call({required String id, required String newName}) =>
      RenamePlaylistProvider._(
        argument: (id: id, newName: newName),
        from: this,
      );

  @override
  String toString() => r'renamePlaylistProvider';
}

@ProviderFor(createPlaylist)
final createPlaylistProvider = CreatePlaylistFamily._();

final class CreatePlaylistProvider
    extends
        $FunctionalProvider<
          AsyncValue<CreatePlaylistResponse>,
          CreatePlaylistResponse,
          FutureOr<CreatePlaylistResponse>
        >
    with
        $FutureModifier<CreatePlaylistResponse>,
        $FutureProvider<CreatePlaylistResponse> {
  CreatePlaylistProvider._({
    required CreatePlaylistFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'createPlaylistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createPlaylistHash();

  @override
  String toString() {
    return r'createPlaylistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CreatePlaylistResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CreatePlaylistResponse> create(Ref ref) {
    final argument = this.argument as String;
    return createPlaylist(ref, name: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePlaylistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createPlaylistHash() => r'04ccda0729d234e1eee086e61ea79680aba91bc4';

final class CreatePlaylistFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CreatePlaylistResponse>, String> {
  CreatePlaylistFamily._()
    : super(
        retry: null,
        name: r'createPlaylistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreatePlaylistProvider call({required String name}) =>
      CreatePlaylistProvider._(argument: name, from: this);

  @override
  String toString() => r'createPlaylistProvider';
}

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
      Duration? keepAliveDuration,
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
              Duration? keepAliveDuration,
            });
    return playlists(
      ref,
      limit: argument.limit,
      offset: argument.offset,
      library: argument.library,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
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

String _$playlistsHash() => r'6a9e98a3ed7258f7bebd1ffa8242f28c5e54c218';

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
            Duration? keepAliveDuration,
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => PlaylistsProvider._(
    argument: (
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
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
      Duration? keepAliveDuration,
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
              Duration? keepAliveDuration,
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
      keepAliveDuration: argument.keepAliveDuration,
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

String _$playlistDetailHash() => r'd78bd83e8cfd081a811783b0872bb9c3548f090b';

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
            Duration? keepAliveDuration,
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
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
      keepAliveDuration: keepAliveDuration,
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
    required ({
      String id,
      String additional,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
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
            as ({
              String id,
              String additional,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return playlistInfo(
      ref,
      id: argument.id,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
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

String _$playlistInfoHash() => r'618c75f7e815af1829fa39ff9a4151d24e75fb96';

final class PlaylistInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PlaylistDetailResponse>,
          ({
            String id,
            String additional,
            Duration? cacheDuration,
            Duration? keepAliveDuration,
          })
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
    Duration? keepAliveDuration = const Duration(minutes: 5),
  }) => PlaylistInfoProvider._(
    argument: (
      id: id,
      additional: additional,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
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
