// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Folders)
final foldersProvider = FoldersFamily._();

final class FoldersProvider
    extends $AsyncNotifierProvider<Folders, FolderResponse> {
  FoldersProvider._({
    required FoldersFamily super.from,
    required ({
      String? id,
      int limit,
      int offset,
      String library,
      String sortBy,
      String sortDirection,
      String additional,
      Duration? cacheDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'foldersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$foldersHash();

  @override
  String toString() {
    return r'foldersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  Folders create() => Folders();

  @override
  bool operator ==(Object other) {
    return other is FoldersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$foldersHash() => r'242907b8316fc4b90de2fe6903414d8802f4bc90';

final class FoldersFamily extends $Family
    with
        $ClassFamilyOverride<
          Folders,
          AsyncValue<FolderResponse>,
          FolderResponse,
          FutureOr<FolderResponse>,
          ({
            String? id,
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            Duration? cacheDuration,
          })
        > {
  FoldersFamily._()
    : super(
        retry: null,
        name: r'foldersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FoldersProvider call({
    String? id,
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'song_rating',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 100),
  }) => FoldersProvider._(
    argument: (
      id: id,
      limit: limit,
      offset: offset,
      library: library,
      sortBy: sortBy,
      sortDirection: sortDirection,
      additional: additional,
      cacheDuration: cacheDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'foldersProvider';
}

abstract class _$Folders extends $AsyncNotifier<FolderResponse> {
  late final _$args =
      ref.$arg
          as ({
            String? id,
            int limit,
            int offset,
            String library,
            String sortBy,
            String sortDirection,
            String additional,
            Duration? cacheDuration,
          });
  String? get id => _$args.id;
  int get limit => _$args.limit;
  int get offset => _$args.offset;
  String get library => _$args.library;
  String get sortBy => _$args.sortBy;
  String get sortDirection => _$args.sortDirection;
  String get additional => _$args.additional;
  Duration? get cacheDuration => _$args.cacheDuration;

  FutureOr<FolderResponse> build({
    String? id,
    int limit = 100,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'song_rating',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 100),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FolderResponse>, FolderResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FolderResponse>, FolderResponse>,
              AsyncValue<FolderResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        id: _$args.id,
        limit: _$args.limit,
        offset: _$args.offset,
        library: _$args.library,
        sortBy: _$args.sortBy,
        sortDirection: _$args.sortDirection,
        additional: _$args.additional,
        cacheDuration: _$args.cacheDuration,
      ),
    );
  }
}
