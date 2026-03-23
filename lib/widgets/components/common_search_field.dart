import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';

class CommonSearchField extends HookConsumerWidget {
  const CommonSearchField({
    super.key,
    required this.searchController,
    this.onChanged,
    this.showClearButton = true,
  });

  final TextEditingController searchController;
  final ValueChanged<String>? onChanged;
  final bool showClearButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(maxWidth: 200, maxHeight: 35),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: l10n.searchHint,
          hintStyle: const TextStyle(fontSize: 14),
          prefixIcon: const Icon(Icons.search, size: 18),
          suffixIcon: showClearButton
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 14),
                  onPressed: () {
                    searchController.clear();
                    onChanged?.call('');
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        ),
        style: const TextStyle(fontSize: 14),
        onChanged: onChanged,
      ),
    );
  }
}

String useSearchQuery(TextEditingController controller) {
  final searchQuery = useState('');
  
  useEffect(() {
    void listener() {
      searchQuery.value = controller.text;
    }
    
    controller.addListener(listener);
    return () => controller.removeListener(listener);
  }, [controller]);
  
  return searchQuery.value;
}
