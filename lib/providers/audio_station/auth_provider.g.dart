// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UseHttp)
final useHttpProvider = UseHttpProvider._();

final class UseHttpProvider extends $NotifierProvider<UseHttp, bool> {
  UseHttpProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'useHttpProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$useHttpHash();

  @$internal
  @override
  UseHttp create() => UseHttp();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$useHttpHash() => r'a92f2538f2181e12b98fbe37df11564936bbd896';

abstract class _$UseHttp extends $Notifier<bool> {
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

@ProviderFor(ServerUrl)
final serverUrlProvider = ServerUrlProvider._();

final class ServerUrlProvider extends $NotifierProvider<ServerUrl, String> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$serverUrlHash() => r'4f76d26d8207caa56cafa6dc8d6a06e614d8dc6b';

abstract class _$ServerUrl extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AccountInfo)
final accountInfoProvider = AccountInfoProvider._();

final class AccountInfoProvider
    extends $NotifierProvider<AccountInfo, Account?> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Account? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Account?>(value),
    );
  }
}

String _$accountInfoHash() => r'2c514707141e81cd294b5c1855e30afa4c053542';

abstract class _$AccountInfo extends $Notifier<Account?> {
  Account? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Account?, Account?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Account?, Account?>,
              Account?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AudioStationCookiesInfo)
final audioStationCookiesInfoProvider = AudioStationCookiesInfoProvider._();

final class AudioStationCookiesInfoProvider
    extends $NotifierProvider<AudioStationCookiesInfo, AudioStationCookies?> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioStationCookies? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioStationCookies?>(value),
    );
  }
}

String _$audioStationCookiesInfoHash() =>
    r'f38ed523f87416f9627983d387dcd51ea165ad4c';

abstract class _$AudioStationCookiesInfo
    extends $Notifier<AudioStationCookies?> {
  AudioStationCookies? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AudioStationCookies?, AudioStationCookies?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AudioStationCookies?, AudioStationCookies?>,
              AudioStationCookies?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(baseUrl)
final baseUrlProvider = BaseUrlProvider._();

final class BaseUrlProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  BaseUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseUrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return baseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$baseUrlHash() => r'7cfd93ec1d917e0fb10b3a36079b60ecb3492a91';

@ProviderFor(SynoToken)
final synoTokenProvider = SynoTokenProvider._();

final class SynoTokenProvider extends $NotifierProvider<SynoToken, String?> {
  SynoTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'synoTokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$synoTokenHash();

  @$internal
  @override
  SynoToken create() => SynoToken();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$synoTokenHash() => r'abcdbe877815306732e1fb5238b4b629ed013822';

abstract class _$SynoToken extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(authToken)
final authTokenProvider = AuthTokenProvider._();

final class AuthTokenProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  AuthTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return authToken(ref);
  }
}

String _$authTokenHash() => r'97f0a20e4a7e2564427cb79efb838eb0d1285460';

@ProviderFor(authHeaders)
final authHeadersProvider = AuthHeadersProvider._();

final class AuthHeadersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, String>?>,
          Map<String, String>?,
          FutureOr<Map<String, String>?>
        >
    with
        $FutureModifier<Map<String, String>?>,
        $FutureProvider<Map<String, String>?> {
  AuthHeadersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authHeadersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHeadersHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, String>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, String>?> create(Ref ref) {
    return authHeaders(ref);
  }
}

String _$authHeadersHash() => r'9b93e899c8e7fe127dea69884435c2034a4e0e0b';
