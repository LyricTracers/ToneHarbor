// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MostPlayerNotifier)
final mostPlayerProvider = MostPlayerNotifierFamily._();

final class MostPlayerNotifierProvider
    extends
        $AsyncNotifierProvider<MostPlayerNotifier, ToneHarborTrackObjectList> {
  MostPlayerNotifierProvider._({
    required MostPlayerNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mostPlayerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mostPlayerNotifierHash();

  @override
  String toString() {
    return r'mostPlayerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MostPlayerNotifier create() => MostPlayerNotifier();

  @override
  bool operator ==(Object other) {
    return other is MostPlayerNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mostPlayerNotifierHash() =>
    r'cf36817cdab9adffa6579d429da8a43f99b015f7';

final class MostPlayerNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MostPlayerNotifier,
          AsyncValue<ToneHarborTrackObjectList>,
          ToneHarborTrackObjectList,
          FutureOr<ToneHarborTrackObjectList>,
          String
        > {
  MostPlayerNotifierFamily._()
    : super(
        retry: null,
        name: r'mostPlayerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MostPlayerNotifierProvider call({String sortDirection = 'desc'}) =>
      MostPlayerNotifierProvider._(argument: sortDirection, from: this);

  @override
  String toString() => r'mostPlayerProvider';
}

abstract class _$MostPlayerNotifier
    extends $AsyncNotifier<ToneHarborTrackObjectList> {
  late final _$args = ref.$arg as String;
  String get sortDirection => _$args;

  FutureOr<ToneHarborTrackObjectList> build({String sortDirection = 'desc'});
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
    element.handleCreate(ref, () => build(sortDirection: _$args));
  }
}
