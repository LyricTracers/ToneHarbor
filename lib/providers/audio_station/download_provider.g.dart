// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coverUrl)
final coverUrlProvider = CoverUrlFamily._();

final class CoverUrlProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  CoverUrlProvider._({
    required CoverUrlFamily super.from,
    required ({
      String albumName,
      String albumArtistName,
      String view,
      bool outputDefault,
      bool isHr,
      String library,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'coverUrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coverUrlHash();

  @override
  String toString() {
    return r'coverUrlProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String albumName,
              String albumArtistName,
              String view,
              bool outputDefault,
              bool isHr,
              String library,
            });
    return coverUrl(
      ref,
      albumName: argument.albumName,
      albumArtistName: argument.albumArtistName,
      view: argument.view,
      outputDefault: argument.outputDefault,
      isHr: argument.isHr,
      library: argument.library,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoverUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coverUrlHash() => r'eafd0ec2d8ed61908e64e238c65c5cf8fa6817ab';

final class CoverUrlFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String>,
          ({
            String albumName,
            String albumArtistName,
            String view,
            bool outputDefault,
            bool isHr,
            String library,
          })
        > {
  CoverUrlFamily._()
    : super(
        retry: null,
        name: r'coverUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoverUrlProvider call({
    required String albumName,
    required String albumArtistName,
    String view = 'album',
    bool outputDefault = true,
    bool isHr = true,
    String library = 'shared',
  }) => CoverUrlProvider._(
    argument: (
      albumName: albumName,
      albumArtistName: albumArtistName,
      view: view,
      outputDefault: outputDefault,
      isHr: isHr,
      library: library,
    ),
    from: this,
  );

  @override
  String toString() => r'coverUrlProvider';
}
