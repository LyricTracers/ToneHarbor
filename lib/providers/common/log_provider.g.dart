// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogNotifier)
final logProvider = LogNotifierProvider._();

final class LogNotifierProvider
    extends $AsyncNotifierProvider<LogNotifier, List<LogEntry>> {
  LogNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logNotifierHash();

  @$internal
  @override
  LogNotifier create() => LogNotifier();
}

String _$logNotifierHash() => r'82ca2044223477452d7daf10498daa50e2cdcc59';

abstract class _$LogNotifier extends $AsyncNotifier<List<LogEntry>> {
  FutureOr<List<LogEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<LogEntry>>, List<LogEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LogEntry>>, List<LogEntry>>,
              AsyncValue<List<LogEntry>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
