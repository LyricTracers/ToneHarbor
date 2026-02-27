// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RequestFlag)
final requestFlagProvider = RequestFlagProvider._();

final class RequestFlagProvider extends $NotifierProvider<RequestFlag, bool> {
  RequestFlagProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestFlagProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestFlagHash();

  @$internal
  @override
  RequestFlag create() => RequestFlag();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$requestFlagHash() => r'e2dbd48ea8bbe2c0f9098f62a1301d06aba6e723';

abstract class _$RequestFlag extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
