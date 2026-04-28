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
    r'e3b2b481d2b18baf20c8ef63ef826d82429f9c50';

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
final baseUrlProvider = BaseUrlFamily._();

final class BaseUrlProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  BaseUrlProvider._({
    required BaseUrlFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'baseUrlProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$baseUrlHash();

  @override
  String toString() {
    return r'baseUrlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    final argument = this.argument as bool;
    return baseUrl(ref, ignoreLANIP: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BaseUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$baseUrlHash() => r'4eccafcc0fefa8db98d06c92c70fcc2651d531f3';

final class BaseUrlFamily extends $Family
    with $FunctionalFamilyOverride<String, bool> {
  BaseUrlFamily._()
    : super(
        retry: null,
        name: r'baseUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  BaseUrlProvider call({bool ignoreLANIP = false}) =>
      BaseUrlProvider._(argument: ignoreLANIP, from: this);

  @override
  String toString() => r'baseUrlProvider';
}

@ProviderFor(AuthToken)
final authTokenProvider = AuthTokenProvider._();

final class AuthTokenProvider
    extends $AsyncNotifierProvider<AuthToken, String?> {
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
  AuthToken create() => AuthToken();
}

String _$authTokenHash() => r'58fcb4195360e4d8e5d2bf73e2f81710ed0ffb14';

abstract class _$AuthToken extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(authHeaders)
final authHeadersProvider = AuthHeadersProvider._();

final class AuthHeadersProvider
    extends
        $FunctionalProvider<
          Map<String, String>?,
          Map<String, String>?,
          Map<String, String>?
        >
    with $Provider<Map<String, String>?> {
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
  $ProviderElement<Map<String, String>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, String>? create(Ref ref) {
    return authHeaders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>?>(value),
    );
  }
}

String _$authHeadersHash() => r'706b83e92dbff1fa816c2e09baf310f28f5877e3';

/// 测试 QuickConnect ID 解析（用于测试连通性）

@ProviderFor(quickConnectTest)
final quickConnectTestProvider = QuickConnectTestFamily._();

/// 测试 QuickConnect ID 解析（用于测试连通性）

final class QuickConnectTestProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// 测试 QuickConnect ID 解析（用于测试连通性）
  QuickConnectTestProvider._({
    required QuickConnectTestFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'quickConnectTestProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$quickConnectTestHash();

  @override
  String toString() {
    return r'quickConnectTestProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return quickConnectTest(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is QuickConnectTestProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quickConnectTestHash() => r'891f372edd2f2b56068bf411fdb5fac9d0f1430d';

/// 测试 QuickConnect ID 解析（用于测试连通性）

final class QuickConnectTestFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  QuickConnectTestFamily._()
    : super(
        retry: null,
        name: r'quickConnectTestProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 测试 QuickConnect ID 解析（用于测试连通性）

  QuickConnectTestProvider call(String quickConnectId) =>
      QuickConnectTestProvider._(argument: quickConnectId, from: this);

  @override
  String toString() => r'quickConnectTestProvider';
}

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

String _$loginHash() => r'b810c904f047507aa7338ab9604c59568af01877';
