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
    required DownloadHistoryFilter super.argument,
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
        '($argument)';
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
    r'861036b287924de2e039fe574ca1e6b0b82ac13a';

final class DownloadHistoryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DownloadHistoryNotifier,
          List<DownloadTaskRecord>,
          List<DownloadTaskRecord>,
          List<DownloadTaskRecord>,
          DownloadHistoryFilter
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
    DownloadHistoryFilter filter = DownloadHistoryFilter.all,
  }) => DownloadHistoryNotifierProvider._(argument: filter, from: this);

  @override
  String toString() => r'downloadHistoryProvider';
}

abstract class _$DownloadHistoryNotifier
    extends $Notifier<List<DownloadTaskRecord>> {
  late final _$args = ref.$arg as DownloadHistoryFilter;
  DownloadHistoryFilter get filter => _$args;

  List<DownloadTaskRecord> build({
    DownloadHistoryFilter filter = DownloadHistoryFilter.all,
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
    element.handleCreate(ref, () => build(filter: _$args));
  }
}
