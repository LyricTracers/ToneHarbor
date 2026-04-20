import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/utils/base_funs.dart';
import 'package:toneharbor/utils/responsive.dart';
import 'package:toneharbor/widgets/widgets.dart';

class CloudSearchPage extends HookConsumerWidget {
  final String query;
  const CloudSearchPage({super.key, required this.query});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = getColorSchemeWhenReady(ref);
    final queryState = useState(query);
    final size = MediaQuery.of(context).size;
    final multiplier = size.multiplier2;
    final toolbarHeight = kToolbarHeight * size.multiplier3;
    return Column(
      children: [
        AppBar(
          toolbarHeight: toolbarHeight,
          backgroundColor: size.lgAndUp
              ? colorScheme.tertiary.withValues(alpha: 0.1)
              : Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          centerTitle: false,
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: 200, maxHeight: 36),
                child: SearchHistoryTextField(
                  query: queryState.value,
                  showHistoryIcon: false,
                  listTextStyle: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: l10n.searchHint,
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search, size: 18),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear, size: 14),
                      onPressed: () {
                        queryState.value = '';
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  onFocusChanged: (v) {},
                  onSubmitSearch: (value) {
                    var r = value.trim();
                    if (r.isEmpty) return;
                    queryState.value = r;
                  },
                ),
              ),
            ),
            if (size.lgAndUp)
              IconButton(
                onPressed: () {
                  context.pushWrapper("/setting");
                },
                icon: const Icon(Icons.settings_rounded, size: 18),
                tooltip: l10n.settings,
              ),
          ],
        ),
      ],
    );
  }
}
