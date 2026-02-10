// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DynamicScheme)
final dynamicSchemeProvider = DynamicSchemeProvider._();

final class DynamicSchemeProvider
    extends $AsyncNotifierProvider<DynamicScheme, DynamicSchemeVariant> {
  DynamicSchemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dynamicSchemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dynamicSchemeHash();

  @$internal
  @override
  DynamicScheme create() => DynamicScheme();
}

String _$dynamicSchemeHash() => r'a8a9322c27d129ad8f45e7b7479ed2bbfc09cf42';

abstract class _$DynamicScheme extends $AsyncNotifier<DynamicSchemeVariant> {
  FutureOr<DynamicSchemeVariant> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<DynamicSchemeVariant>, DynamicSchemeVariant>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DynamicSchemeVariant>,
                DynamicSchemeVariant
              >,
              AsyncValue<DynamicSchemeVariant>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ContrastLevel)
final contrastLevelProvider = ContrastLevelProvider._();

final class ContrastLevelProvider
    extends $AsyncNotifierProvider<ContrastLevel, double> {
  ContrastLevelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contrastLevelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contrastLevelHash();

  @$internal
  @override
  ContrastLevel create() => ContrastLevel();
}

String _$contrastLevelHash() => r'e98df1179f5fead0499e5799e60e7b3ae5744ab0';

abstract class _$ContrastLevel extends $AsyncNotifier<double> {
  FutureOr<double> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<double>, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<double>, double>,
              AsyncValue<double>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(getColorScheme)
final getColorSchemeProvider = GetColorSchemeProvider._();

final class GetColorSchemeProvider
    extends
        $FunctionalProvider<
          AsyncValue<ColorScheme>,
          ColorScheme,
          FutureOr<ColorScheme>
        >
    with $FutureModifier<ColorScheme>, $FutureProvider<ColorScheme> {
  GetColorSchemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getColorSchemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getColorSchemeHash();

  @$internal
  @override
  $FutureProviderElement<ColorScheme> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ColorScheme> create(Ref ref) {
    return getColorScheme(ref);
  }
}

String _$getColorSchemeHash() => r'b4096180b70a2378bc596fc961e8a7a342f376ea';

@ProviderFor(SyncSongIcon)
final syncSongIconProvider = SyncSongIconProvider._();

final class SyncSongIconProvider
    extends $AsyncNotifierProvider<SyncSongIcon, bool> {
  SyncSongIconProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncSongIconProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncSongIconHash();

  @$internal
  @override
  SyncSongIcon create() => SyncSongIcon();
}

String _$syncSongIconHash() => r'6f541b148ff2e8d563482375f791880de8cf951b';

abstract class _$SyncSongIcon extends $AsyncNotifier<bool> {
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

@ProviderFor(SongIconBase64)
final songIconBase64Provider = SongIconBase64Provider._();

final class SongIconBase64Provider
    extends $NotifierProvider<SongIconBase64, String> {
  SongIconBase64Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songIconBase64Provider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songIconBase64Hash();

  @$internal
  @override
  SongIconBase64 create() => SongIconBase64();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$songIconBase64Hash() => r'f961fd9ecac34c0070a7ff082948e283d93d8135';

abstract class _$SongIconBase64 extends $Notifier<String> {
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

@ProviderFor(SongIcon)
final songIconProvider = SongIconProvider._();

final class SongIconProvider
    extends $AsyncNotifierProvider<SongIcon, ImageProvider<Object>> {
  SongIconProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songIconProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songIconHash();

  @$internal
  @override
  SongIcon create() => SongIcon();
}

String _$songIconHash() => r'730fd3cb941a6a9c497e08dc4264f37f7ac12efa';

abstract class _$SongIcon extends $AsyncNotifier<ImageProvider<Object>> {
  FutureOr<ImageProvider<Object>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ImageProvider<Object>>, ImageProvider<Object>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ImageProvider<Object>>,
                ImageProvider<Object>
              >,
              AsyncValue<ImageProvider<Object>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(loadDefaultThemeIcon)
final loadDefaultThemeIconProvider = LoadDefaultThemeIconProvider._();

final class LoadDefaultThemeIconProvider
    extends
        $FunctionalProvider<
          AsyncValue<ImageProvider<Object>?>,
          ImageProvider<Object>?,
          FutureOr<ImageProvider<Object>?>
        >
    with
        $FutureModifier<ImageProvider<Object>?>,
        $FutureProvider<ImageProvider<Object>?> {
  LoadDefaultThemeIconProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadDefaultThemeIconProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadDefaultThemeIconHash();

  @$internal
  @override
  $FutureProviderElement<ImageProvider<Object>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ImageProvider<Object>?> create(Ref ref) {
    return loadDefaultThemeIcon(ref);
  }
}

String _$loadDefaultThemeIconHash() =>
    r'14e251e90a8812e1fee55397bc8499dd08e561db';
