// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaybackHistory)
final playbackHistoryProvider = PlaybackHistoryProvider._();

final class PlaybackHistoryProvider
    extends
        $AsyncNotifierProvider<PlaybackHistory, List<PlaybackHistoryEntry>> {
  PlaybackHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackHistoryHash();

  @$internal
  @override
  PlaybackHistory create() => PlaybackHistory();
}

String _$playbackHistoryHash() => r'17679510521cb2e197b3e8f572d29400de5b8097';

abstract class _$PlaybackHistory
    extends $AsyncNotifier<List<PlaybackHistoryEntry>> {
  FutureOr<List<PlaybackHistoryEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<PlaybackHistoryEntry>>,
              List<PlaybackHistoryEntry>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PlaybackHistoryEntry>>,
                List<PlaybackHistoryEntry>
              >,
              AsyncValue<List<PlaybackHistoryEntry>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(recentTracks)
final recentTracksProvider = RecentTracksFamily._();

final class RecentTracksProvider
    extends $FunctionalProvider<List<Song>, List<Song>, List<Song>>
    with $Provider<List<Song>> {
  RecentTracksProvider._({
    required RecentTracksFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'recentTracksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recentTracksHash();

  @override
  String toString() {
    return r'recentTracksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Song>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Song> create(Ref ref) {
    final argument = this.argument as int;
    return recentTracks(ref, limit: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Song> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Song>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecentTracksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recentTracksHash() => r'e368d02629ca14dbf86df9da957882412aac7cde';

final class RecentTracksFamily extends $Family
    with $FunctionalFamilyOverride<List<Song>, int> {
  RecentTracksFamily._()
    : super(
        retry: null,
        name: r'recentTracksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecentTracksProvider call({int limit = 20}) =>
      RecentTracksProvider._(argument: limit, from: this);

  @override
  String toString() => r'recentTracksProvider';
}

@ProviderFor(mostPlayedTracks)
final mostPlayedTracksProvider = MostPlayedTracksFamily._();

final class MostPlayedTracksProvider
    extends
        $FunctionalProvider<
          Map<String, int>,
          Map<String, int>,
          Map<String, int>
        >
    with $Provider<Map<String, int>> {
  MostPlayedTracksProvider._({
    required MostPlayedTracksFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'mostPlayedTracksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mostPlayedTracksHash();

  @override
  String toString() {
    return r'mostPlayedTracksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<String, int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<String, int> create(Ref ref) {
    final argument = this.argument as int;
    return mostPlayedTracks(ref, limit: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MostPlayedTracksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mostPlayedTracksHash() => r'ac62fdf7a1c81def0278bb3a7479f17b50d2f937';

final class MostPlayedTracksFamily extends $Family
    with $FunctionalFamilyOverride<Map<String, int>, int> {
  MostPlayedTracksFamily._()
    : super(
        retry: null,
        name: r'mostPlayedTracksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MostPlayedTracksProvider call({int limit = 10}) =>
      MostPlayedTracksProvider._(argument: limit, from: this);

  @override
  String toString() => r'mostPlayedTracksProvider';
}
