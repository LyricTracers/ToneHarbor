// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(folders)
final foldersProvider = FoldersFamily._();

final class FoldersProvider
    extends
        $FunctionalProvider<
          AsyncValue<FolderResponse>,
          FolderResponse,
          FutureOr<FolderResponse>
        >
    with $FutureModifier<FolderResponse>, $FutureProvider<FolderResponse> {
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
  $FutureProviderElement<FolderResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FolderResponse> create(Ref ref) {
    final argument =
        this.argument
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
    return folders(
      ref,
      id: argument.id,
      limit: argument.limit,
      offset: argument.offset,
      library: argument.library,
      sortBy: argument.sortBy,
      sortDirection: argument.sortDirection,
      additional: argument.additional,
      cacheDuration: argument.cacheDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FoldersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$foldersHash() => r'495be1a142cf5b890d0df602a94fa128cb4da700';

final class FoldersFamily extends $Family
    with
        $FunctionalFamilyOverride<
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
    int limit = 1000,
    int offset = 0,
    String library = 'shared',
    String sortBy = 'song_rating',
    String sortDirection = 'DESC',
    String additional = 'song_tag,song_audio,song_rating',
    Duration? cacheDuration = const Duration(minutes: 5),
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

@ProviderFor(FoldersState)
final foldersStateProvider = FoldersStateProvider._();

final class FoldersStateProvider
    extends $NotifierProvider<FoldersState, FolderResponse?> {
  FoldersStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foldersStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foldersStateHash();

  @$internal
  @override
  FoldersState create() => FoldersState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FolderResponse? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FolderResponse?>(value),
    );
  }
}

String _$foldersStateHash() => r'5d3d67841ea8be5389f2229b7b02b089f97af046';

abstract class _$FoldersState extends $Notifier<FolderResponse?> {
  FolderResponse? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FolderResponse?, FolderResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FolderResponse?, FolderResponse?>,
              FolderResponse?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
