part of 'home_layout.dart';

void onSubmitSearch(WidgetRef ref, String value) async {
  if (value.trim().isEmpty) return;
  ref.read(requestFlagProvider.notifier).setRequestFlag(true);
  invalidateAllSearchProvidersWithWidgetRef(ref);
  await ref
      .read(mixSearchResultsProvider.notifier)
      .search(value, SearchType.all);
  ref.read(requestFlagProvider.notifier).setRequestFlag(false);
  logger.i("onSubmitSearch: ${ref.read(mixSearchResultsProvider)}");
}
