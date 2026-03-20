// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadHistoryNotifier)
final downloadHistoryProvider = DownloadHistoryNotifierFamily._();

final class DownloadHistoryNotifierProvider
    extends
        $NotifierProvider<DownloadHistoryNotifier, List<DownloadTaskRecord>> {
  DownloadHistoryNotifierProvider._({
    required DownloadHistoryNotifierFamily super.from,
    required ({DownloadType? filterType, DownloadStatus? filterStatus})
    super.argument,
  }) : super(
         retry: null,
         name: r'downloadHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadHistoryNotifierHash();

  @override
  String toString() {
    return r'downloadHistoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DownloadHistoryNotifier create() => DownloadHistoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DownloadTaskRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DownloadTaskRecord>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadHistoryNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadHistoryNotifierHash() =>
    r'0b1d06dfd57ad32afe9ca7b22e65b1506e121e43';

final class DownloadHistoryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DownloadHistoryNotifier,
          List<DownloadTaskRecord>,
          List<DownloadTaskRecord>,
          List<DownloadTaskRecord>,
          ({DownloadType? filterType, DownloadStatus? filterStatus})
        > {
  DownloadHistoryNotifierFamily._()
    : super(
        retry: null,
        name: r'downloadHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadHistoryNotifierProvider call({
    DownloadType? filterType,
    DownloadStatus? filterStatus,
  }) => DownloadHistoryNotifierProvider._(
    argument: (filterType: filterType, filterStatus: filterStatus),
    from: this,
  );

  @override
  String toString() => r'downloadHistoryProvider';
}

abstract class _$DownloadHistoryNotifier
    extends $Notifier<List<DownloadTaskRecord>> {
  late final _$args =
      ref.$arg as ({DownloadType? filterType, DownloadStatus? filterStatus});
  DownloadType? get filterType => _$args.filterType;
  DownloadStatus? get filterStatus => _$args.filterStatus;

  List<DownloadTaskRecord> build({
    DownloadType? filterType,
    DownloadStatus? filterStatus,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<DownloadTaskRecord>, List<DownloadTaskRecord>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DownloadTaskRecord>, List<DownloadTaskRecord>>,
              List<DownloadTaskRecord>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        filterType: _$args.filterType,
        filterStatus: _$args.filterStatus,
      ),
    );
  }
}
