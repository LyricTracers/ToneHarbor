part of 'home_layout.dart';

void onSubmitSearch(WidgetRef ref, String value) async {
  if (value.trim().isEmpty) return;
  ref.read(requestFlagProvider.notifier).setRequestFlag(true);
  final result = await ref.read(
    mixSearchProvider(value, SearchType.all).future,
  );
  ref.read(requestFlagProvider.notifier).setRequestFlag(false);
  logger.i("onSubmitSearch result: $result");
}
