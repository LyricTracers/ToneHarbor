import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';

class SearchHistoryTextField extends HookConsumerWidget {
  final bool hasFocusExpand;
  final bool showHistoryIcon;
  final bool showDeleteIcon;
  final bool enableHistory;
  final bool enableSave;
  final bool enableFilterHistory;
  final bool showHistoryList;
  final IconData? historyIcon;
  final double? historyIconSize;
  final IconData? deleteIcon;
  final double? deleteIconSize;
  final TextStyle? listTextStyle;
  final Color? listRowColor;
  final BoxDecoration? listDecoration;
  final List<String>? lockItems;
  final Color? lockTextColor;
  final String? query;
  final Function(String)? onSubmitSearch;
  final Function(bool)? onFocusChanged;
  final bool updateSelectedHistoryItemDateTime;
  final InputDecoration? decoration;

  const SearchHistoryTextField({
    super.key,
    this.hasFocusExpand = true,
    this.showHistoryIcon = true,
    this.showDeleteIcon = true,
    this.enableHistory = true,
    this.enableSave = true,
    this.enableFilterHistory = true,
    this.showHistoryList = true,
    this.historyIcon,
    this.historyIconSize,
    this.deleteIcon,
    this.deleteIconSize,
    this.listTextStyle,
    this.listRowColor,
    this.listDecoration,
    this.lockItems,
    this.lockTextColor,
    this.onSubmitSearch,
    this.onFocusChanged,
    this.query,
    this.updateSelectedHistoryItemDateTime = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: query);
    final focusNode = useFocusNode();
    final historyList = ref.watch(searchHistoryProvider);
    final currentText = useState(query ?? controller.text);
    final menuWidth = useState<double?>(null);
    final menuController = useMemoized(() => MenuController());

    final displayList = useMemoized(() {
      final historyData = historyList;
      final searchText = currentText.value.toLowerCase();
      final filteredList = enableFilterHistory && currentText.value.isNotEmpty
          ? historyData
                .where((item) => item.toLowerCase().contains(searchText))
                .toList()
          : historyData;
      return <String>[...(lockItems ?? []), ...filteredList];
    }, [historyList, currentText.value, enableFilterHistory, lockItems]);

    useEffect(() {
      void onTextChanged() {
        currentText.value = controller.text;
      }

      controller.addListener(onTextChanged);
      return () {
        controller.removeListener(onTextChanged);
      };
    }, [controller]);

    useEffect(() {
      void onFocusChange() {
        onFocusChanged?.call(focusNode.hasFocus);
      }

      focusNode.addListener(onFocusChange);
      return () {
        focusNode.removeListener(onFocusChange);
      };
    }, [focusNode, onFocusChanged]);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (menuWidth.value != constraints.maxWidth) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            menuWidth.value = constraints.maxWidth;
          });
        }

        return MenuAnchor(
          controller: menuController,
          crossAxisUnconstrained: false,
          style: MenuStyle(
            elevation: const WidgetStatePropertyAll(4),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            backgroundColor: WidgetStatePropertyAll(
              listDecoration?.color ?? Theme.of(context).colorScheme.surface,
            ),
            minimumSize: menuWidth.value != null
                ? WidgetStatePropertyAll(Size(menuWidth.value!, 0))
                : null,
            maximumSize: menuWidth.value != null
                ? WidgetStatePropertyAll(
                    Size(menuWidth.value!, double.infinity),
                  )
                : null,
          ),
          builder: (context, _, child) {
            return TextField(
              style: listTextStyle,
              controller: controller,
              focusNode: focusNode,
              onTap: () {
                if (hasFocusExpand &&
                    showHistoryList &&
                    enableHistory &&
                    displayList.isNotEmpty) {
                  menuController.open();
                }
              },
              onChanged: (value) {
                if (displayList.isNotEmpty) {
                  menuController.open();
                }
              },
              onSubmitted: (value) {
                if (enableSave && value.isNotEmpty) {
                  ref.read(searchHistoryProvider.notifier).addSearch(value);
                }
                menuController.close();
                focusNode.unfocus();
                onSubmitSearch?.call(value);
              },
              decoration: decoration?.copyWith(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showHistoryIcon && enableHistory)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          historyIcon ?? Icons.history,
                          size: historyIconSize ?? 16,
                        ),
                      ),
                    if (!showHistoryIcon && controller.text.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            controller.clear();
                            currentText.value = '';
                          },
                          child: Icon(
                            deleteIcon ?? Icons.clear,
                            size: deleteIconSize ?? 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
          menuChildren: displayList.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLockItem = index < (lockItems?.length ?? 0);
            return SizedBox(
              width: menuWidth.value,
              child: MenuItemButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    listRowColor ?? Colors.transparent,
                  ),
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                leadingIcon: Icon(
                  isLockItem ? Icons.lock : (historyIcon ?? Icons.history),
                  size: historyIconSize ?? 18,
                  color: isLockItem ? lockTextColor : null,
                ),
                trailingIcon: !isLockItem && showDeleteIcon
                    ? IconButton(
                        icon: Icon(
                          deleteIcon ?? Icons.close,
                          size: deleteIconSize ?? 18,
                        ),
                        onPressed: () {
                          ref
                              .read(searchHistoryProvider.notifier)
                              .removeSearch(item);
                        },
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      )
                    : null,
                onPressed: () async {
                  controller.text = item;
                  currentText.value = item;
                  if (updateSelectedHistoryItemDateTime) {
                    await ref
                        .read(searchHistoryProvider.notifier)
                        .addSearch(item);
                  }
                  menuController.close();
                  focusNode.unfocus();
                  onSubmitSearch?.call(item);
                },
                child: Text(
                  item,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      listTextStyle?.copyWith(
                        color: isLockItem ? lockTextColor : null,
                      ) ??
                      const TextStyle(fontSize: 14),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
