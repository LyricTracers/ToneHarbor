// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UseHttp)
final useHttpProvider = UseHttpProvider._();

final class UseHttpProvider extends $AsyncNotifierProvider<UseHttp, bool> {
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
}

String _$useHttpHash() => r'5a8af9503d6726715bef148212e3ef35c1b2ecd3';

abstract class _$UseHttp extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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

String _$serverUrlHash() => r'7fe209fd0931762ef5f770232c4f9a28b70a00a8';

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

String _$accountInfoHash() => r'a936422207f3bf1189a29d1e9eb0744f11e1474f';

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
    r'2ec79ae53a31714571925f469d785dd9469bbfc5';

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
        isAutoDispose: true,
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

String _$authTokenHash() => r'ee9f70a1395287e265aa506873093ddc938596f3';

@ProviderFor(login)
final loginProvider = LoginProvider._();

final class LoginProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthResponse>,
          AuthResponse,
          FutureOr<AuthResponse>
        >
    with $FutureModifier<AuthResponse>, $FutureProvider<AuthResponse> {
  LoginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @$internal
  @override
  $FutureProviderElement<AuthResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthResponse> create(Ref ref) {
    return login(ref);
  }
}

String _$loginHash() => r'628707a6e0744c2957ea3ef3da1be649a26aa7e1';
