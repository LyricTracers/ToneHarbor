import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';

part 'log_provider.g.dart';

@riverpod
class LogNotifier extends _$LogNotifier {
  StreamSubscription<LogEntry>? _subscription;

  @override
  Future<List<LogEntry>> build() async {
    final fileLogs = await readLogFile();

    _subscription = memoryLogOutput.stream.listen((entry) {
      final current = state.value ?? [];
      state = AsyncData([...current, entry]);
    });

    ref.onDispose(() {
      _subscription?.cancel();
      _subscription = null;
    });

    return fileLogs;
  }

  void clear() {
    state = const AsyncData([]);
  }
}
