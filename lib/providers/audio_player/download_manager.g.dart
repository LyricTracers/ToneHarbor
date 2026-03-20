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

String _$downloadManagerHash() => r'62fd730cd7787e7eeb491b49ed30efd067e40410';

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
