// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioStationInfo)
final audioStationInfoProvider = AudioStationInfoFamily._();

final class AudioStationInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<AudioStationInfoResponse>,
          AudioStationInfoResponse,
          FutureOr<AudioStationInfoResponse>
        >
    with
        $FutureModifier<AudioStationInfoResponse>,
        $FutureProvider<AudioStationInfoResponse> {
  AudioStationInfoProvider._({
    required AudioStationInfoFamily super.from,
    required Duration? super.argument,
  }) : super(
         retry: null,
         name: r'audioStationInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$audioStationInfoHash();

  @override
  String toString() {
    return r'audioStationInfoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AudioStationInfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AudioStationInfoResponse> create(Ref ref) {
    final argument = this.argument as Duration?;
    return audioStationInfo(ref, cacheDuration: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AudioStationInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$audioStationInfoHash() => r'84f4d2f9e26220901e51c78a5a271cf6e5edcebc';

final class AudioStationInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AudioStationInfoResponse>,
          Duration?
        > {
  AudioStationInfoFamily._()
    : super(
        retry: null,
        name: r'audioStationInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AudioStationInfoProvider call({Duration? cacheDuration}) =>
      AudioStationInfoProvider._(argument: cacheDuration, from: this);

  @override
  String toString() => r'audioStationInfoProvider';
}

@ProviderFor(dsmInfo)
final dsmInfoProvider = DsmInfoFamily._();

final class DsmInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<DSMInfoResponse>,
          DSMInfoResponse,
          FutureOr<DSMInfoResponse>
        >
    with $FutureModifier<DSMInfoResponse>, $FutureProvider<DSMInfoResponse> {
  DsmInfoProvider._({
    required DsmInfoFamily super.from,
    required Duration? super.argument,
  }) : super(
         retry: null,
         name: r'dsmInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dsmInfoHash();

  @override
  String toString() {
    return r'dsmInfoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DSMInfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DSMInfoResponse> create(Ref ref) {
    final argument = this.argument as Duration?;
    return dsmInfo(ref, cacheDuration: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DsmInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dsmInfoHash() => r'fc59140b3e4224fa157047fbd4251ebf5f0468c9';

final class DsmInfoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DSMInfoResponse>, Duration?> {
  DsmInfoFamily._()
    : super(
        retry: null,
        name: r'dsmInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DsmInfoProvider call({Duration? cacheDuration}) =>
      DsmInfoProvider._(argument: cacheDuration, from: this);

  @override
  String toString() => r'dsmInfoProvider';
}
