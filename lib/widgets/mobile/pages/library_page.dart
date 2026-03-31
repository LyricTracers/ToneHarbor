import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/widgets/widgets.dart';

class LibraryPage extends HookConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = getColorSchemeWhenReady(ref);
    final l10n = ref.watch(l10nProvider);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchHistoryTextField(
              showHistoryIcon: false,
              listTextStyle: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                labelText: l10n.search,
                labelStyle: const TextStyle(fontSize: 14),
                hintText: l10n.searchHint,
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: const Icon(Icons.search, size: 16),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              onFocusChanged: (v) {},
              onSubmitSearch: (value) {
                var r = value.trim();
                if (r.isEmpty) return;
                // context.push("/search/${Uri.encodeComponent(r)}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
