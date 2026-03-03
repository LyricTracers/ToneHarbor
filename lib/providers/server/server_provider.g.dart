// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(server)
final serverProvider = ServerProvider._();

final class ServerProvider
    extends
        $FunctionalProvider<
          AsyncValue<HttpServer>,
          HttpServer,
          FutureOr<HttpServer>
        >
    with $FutureModifier<HttpServer>, $FutureProvider<HttpServer> {
  ServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverHash();

  @$internal
  @override
  $FutureProviderElement<HttpServer> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HttpServer> create(Ref ref) {
    return server(ref);
  }
}

String _$serverHash() => r'bb965c36e36f8b7cad85089153b7740466ee87f5';
