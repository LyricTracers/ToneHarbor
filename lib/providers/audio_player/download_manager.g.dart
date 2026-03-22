// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadManager)
final downloadManagerProvider = DownloadManagerProvider._();

final class DownloadManagerProvider
    extends $NotifierProvider<DownloadManager, List<DownloadTask>> {
  DownloadManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadManagerHash();

  @$internal
  @override
  DownloadManager create() => DownloadManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DownloadTask> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DownloadTask>>(value),
    );
  }
}

String _$downloadManagerHash() => r'dba86f04d3a093c0182d185c7d7cde63b25ebd26';

abstract class _$DownloadManager extends $Notifier<List<DownloadTask>> {
  List<DownloadTask> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<DownloadTask>, List<DownloadTask>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DownloadTask>, List<DownloadTask>>,
              List<DownloadTask>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
