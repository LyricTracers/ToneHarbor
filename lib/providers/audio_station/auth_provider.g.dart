// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerUrl)
final serverUrlProvider = ServerUrlProvider._();

final class ServerUrlProvider
    extends $AsyncNotifierProvider<ServerUrl, String> {
  ServerUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverUrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverUrlHash();

  @$internal
  @override
  ServerUrl create() => ServerUrl();
}

String _$serverUrlHash() => r'bf7a41a365262675b772167d08499071fea42d4e';

abstract class _$ServerUrl extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AccountInfo)
final accountInfoProvider = AccountInfoProvider._();

final class AccountInfoProvider
    extends $AsyncNotifierProvider<AccountInfo, Account?> {
  AccountInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountInfoHash();

  @$internal
  @override
  AccountInfo create() => AccountInfo();
}

String _$accountInfoHash() => r'e281258fe0da70ad8822979891205d5c11e79c20';

abstract class _$AccountInfo extends $AsyncNotifier<Account?> {
  FutureOr<Account?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Account?>, Account?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Account?>, Account?>,
              AsyncValue<Account?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AudioStationCookiesInfo)
final audioStationCookiesInfoProvider = AudioStationCookiesInfoProvider._();

final class AudioStationCookiesInfoProvider
    extends
        $AsyncNotifierProvider<AudioStationCookiesInfo, AudioStationCookies?> {
  AudioStationCookiesInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioStationCookiesInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioStationCookiesInfoHash();

  @$internal
  @override
  AudioStationCookiesInfo create() => AudioStationCookiesInfo();
}

String _$audioStationCookiesInfoHash() =>
    r'170a6ac60b1710fe2d8fdb3cb50adede76f70718';

abstract class _$AudioStationCookiesInfo
    extends $AsyncNotifier<AudioStationCookies?> {
  FutureOr<AudioStationCookies?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<AudioStationCookies?>, AudioStationCookies?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AudioStationCookies?>,
                AudioStationCookies?
              >,
              AsyncValue<AudioStationCookies?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
