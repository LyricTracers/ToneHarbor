// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(queryAPI)
final queryAPIProvider = QueryAPIFamily._();

final class QueryAPIProvider
    extends
        $FunctionalProvider<
          AsyncValue<SynoAPIInfoResponse>,
          SynoAPIInfoResponse,
          FutureOr<SynoAPIInfoResponse>
        >
    with
        $FutureModifier<SynoAPIInfoResponse>,
        $FutureProvider<SynoAPIInfoResponse> {
  QueryAPIProvider._({
    required QueryAPIFamily super.from,
    required ({
      String query,
      Duration? cacheDuration,
      Duration? keepAliveDuration,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'queryAPIProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queryAPIHash();

  @override
  String toString() {
    return r'queryAPIProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<SynoAPIInfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SynoAPIInfoResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String query,
              Duration? cacheDuration,
              Duration? keepAliveDuration,
            });
    return queryAPI(
      ref,
      query: argument.query,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QueryAPIProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$queryAPIHash() => r'b76614e1b53ed99457913e8f9d925bdccedafe5b';

final class QueryAPIFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<SynoAPIInfoResponse>,
          ({String query, Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  QueryAPIFamily._()
    : super(
        retry: null,
        name: r'queryAPIProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QueryAPIProvider call({
    String query = 'all',
    Duration? cacheDuration = const Duration(days: 365),
    Duration? keepAliveDuration,
  }) => QueryAPIProvider._(
    argument: (
      query: query,
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'queryAPIProvider';
}

@ProviderFor(testConnection)
final testConnectionProvider = TestConnectionProvider._();

final class TestConnectionProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  TestConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testConnectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testConnectionHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    return testConnection(ref);
  }
}

String _$testConnectionHash() => r'828b729f576cd6534d48f8e8d1f0d269f6bdaaac';

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
    required ({Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AudioStationInfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AudioStationInfoResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({Duration? cacheDuration, Duration? keepAliveDuration});
    return audioStationInfo(
      ref,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
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

String _$audioStationInfoHash() => r'dca049f78fa2c2ed12cc05b82831a3cccb0c8acf';

final class AudioStationInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AudioStationInfoResponse>,
          ({Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  AudioStationInfoFamily._()
    : super(
        retry: null,
        name: r'audioStationInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AudioStationInfoProvider call({
    Duration? cacheDuration,
    Duration? keepAliveDuration,
  }) => AudioStationInfoProvider._(
    argument: (
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

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
    required ({Duration? cacheDuration, Duration? keepAliveDuration})
    super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<DSMInfoResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DSMInfoResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({Duration? cacheDuration, Duration? keepAliveDuration});
    return dsmInfo(
      ref,
      cacheDuration: argument.cacheDuration,
      keepAliveDuration: argument.keepAliveDuration,
    );
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

String _$dsmInfoHash() => r'6d6fe27716c3388dbca8b51805d9993384413c59';

final class DsmInfoFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<DSMInfoResponse>,
          ({Duration? cacheDuration, Duration? keepAliveDuration})
        > {
  DsmInfoFamily._()
    : super(
        retry: null,
        name: r'dsmInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DsmInfoProvider call({
    Duration? cacheDuration,
    Duration? keepAliveDuration,
  }) => DsmInfoProvider._(
    argument: (
      cacheDuration: cacheDuration,
      keepAliveDuration: keepAliveDuration,
    ),
    from: this,
  );

  @override
  String toString() => r'dsmInfoProvider';
}
