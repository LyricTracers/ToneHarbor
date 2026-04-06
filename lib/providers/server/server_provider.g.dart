// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ServerController)
final serverControllerProvider = ServerControllerProvider._();

final class ServerControllerProvider
    extends $AsyncNotifierProvider<ServerController, HttpServer> {
  ServerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverControllerHash();

  @$internal
  @override
  ServerController create() => ServerController();
}

String _$serverControllerHash() => r'a1aaf2ea802db0e5544dd53849c3964023627bb2';

abstract class _$ServerController extends $AsyncNotifier<HttpServer> {
  FutureOr<HttpServer> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HttpServer>, HttpServer>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HttpServer>, HttpServer>,
              AsyncValue<HttpServer>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
