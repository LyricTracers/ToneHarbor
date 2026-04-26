// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageInfo)
final storageInfoProvider = StorageInfoProvider._();

final class StorageInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StorageInfo>>,
          List<StorageInfo>,
          FutureOr<List<StorageInfo>>
        >
    with
        $FutureModifier<List<StorageInfo>>,
        $FutureProvider<List<StorageInfo>> {
  StorageInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageInfoHash();

  @$internal
  @override
  $FutureProviderElement<List<StorageInfo>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StorageInfo>> create(Ref ref) {
    return storageInfo(ref);
  }
}

String _$storageInfoHash() => r'aba4d81850aececc43f93f1ac100365c48ee6157';
