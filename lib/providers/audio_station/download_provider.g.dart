// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(streamUrl)
final streamUrlProvider = StreamUrlFamily._();

final class StreamUrlProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  StreamUrlProvider._({
    required StreamUrlFamily super.from,
    required ({String id, String format}) super.argument,
  }) : super(
         retry: null,
         name: r'streamUrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$streamUrlHash();

  @override
  String toString() {
    return r'streamUrlProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as ({String id, String format});
    return streamUrl(ref, id: argument.id, format: argument.format);
  }

  @override
  bool operator ==(Object other) {
    return other is StreamUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$streamUrlHash() => r'2b85c01835e40e4f84058f8117a88313bc9f0290';

final class StreamUrlFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<String>,
          ({String id, String format})
        > {
  StreamUrlFamily._()
    : super(
        retry: null,
        name: r'streamUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StreamUrlProvider call({required String id, String format = 'mp3'}) =>
      StreamUrlProvider._(argument: (id: id, format: format), from: this);

  @override
  String toString() => r'streamUrlProvider';
}

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

String _$coverUrlHash() => r'50b35c98ef877849651aad31dec72351728d8db2';

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
