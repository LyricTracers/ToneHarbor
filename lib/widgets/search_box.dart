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
  final Offset listOffset;
  final TextStyle? listTextStyle;
  final BoxDecoration? listRowDecoration;
  final BoxDecoration? listDecoration;
  final List<String>? lockItems;
  final Color? lockTextColor;
  final Function(String)? onSubmitSearch;
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
    this.listOffset = Offset.zero,
    this.listTextStyle,
    this.listRowDecoration,
    this.listDecoration,
    this.lockItems,
    this.lockTextColor,
    this.onSubmitSearch,
    this.updateSelectedHistoryItemDateTime = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final showHistory = useState(false);
    final historyList = ref.watch(searchHistoryProvider);
    final overlayEntry = useState<OverlayEntry?>(null);
    final textFieldKey = useMemoized(() => GlobalKey());
    final currentText = useState(controller.text);

    final displayList = useMemoized(() {
      final historyData = historyList.value ?? [];
      final searchText = currentText.value.toLowerCase();
      final filteredList = enableFilterHistory && currentText.value.isNotEmpty
          ? historyData
                .where((item) => item.toLowerCase().contains(searchText))
                .toList()
          : historyData;
      return <String>[...(lockItems ?? []), ...filteredList];
    }, [historyList.value, currentText.value, enableFilterHistory, lockItems]);

    useEffect(() {
      void onFocusChanged() {
        if (hasFocusExpand && showHistoryList && focusNode.hasFocus) {
          showHistory.value = true;
        }
      }

      focusNode.addListener(onFocusChanged);
      return () {
        focusNode.removeListener(onFocusChanged);
      };
    }, [focusNode]);

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
      if (showHistory.value && enableHistory) {
        overlayEntry.value?.remove();
        overlayEntry.value = null;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          final renderBox =
              textFieldKey.currentContext?.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            final offset = renderBox.localToGlobal(Offset.zero);
            final size = renderBox.size;

            overlayEntry.value = OverlayEntry(
              builder: (overlayContext) => _HistoryOverlay(
                textFieldOffset: offset,
                textFieldSize: size,
                displayList: displayList,
                lockItems: lockItems,
                historyIcon: historyIcon,
                historyIconSize: historyIconSize,
                deleteIcon: deleteIcon,
                deleteIconSize: deleteIconSize,
                listTextStyle: listTextStyle,
                listDecoration: listDecoration,
                lockTextColor: lockTextColor,
                showDeleteIcon: showDeleteIcon,
                onHistoryItemSelected: (value) async {
                  controller.text = value;
                  currentText.value = value;
                  if (updateSelectedHistoryItemDateTime) {
                    await ref
                        .read(searchHistoryProvider.notifier)
                        .addSearch(value);
                  }
                  showHistory.value = false;
                  onSubmitSearch?.call(value);
                },
                onRemoveHistory: (value) {
                  ref.read(searchHistoryProvider.notifier).removeSearch(value);
                },
                onDismiss: () {
                  showHistory.value = false;
                  focusNode.unfocus();
                },
              ),
            );

            final overlayState = Overlay.of(textFieldKey.currentContext!);
            overlayState.insert(overlayEntry.value!);
          }
        });
      } else {
        overlayEntry.value?.remove();
        overlayEntry.value = null;
      }

      return () {
        overlayEntry.value?.remove();
        overlayEntry.value = null;
      };
    }, [showHistory.value, displayList]);

    return TextField(
      key: textFieldKey,
      controller: controller,
      focusNode: focusNode,
      onTap: () {
        if (hasFocusExpand && showHistoryList) {
          showHistory.value = true;
        }
      },
      onSubmitted: (value) {
        if (enableSave && value.isNotEmpty) {
          ref.read(searchHistoryProvider.notifier).addSearch(value);
        }
        showHistory.value = false;
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
  }
}

class _HistoryOverlay extends StatelessWidget {
  final Offset textFieldOffset;
  final Size textFieldSize;
  final List<String> displayList;
  final List<String>? lockItems;
  final IconData? historyIcon;
  final double? historyIconSize;
  final IconData? deleteIcon;
  final double? deleteIconSize;
  final TextStyle? listTextStyle;
  final BoxDecoration? listDecoration;
  final Color? lockTextColor;
  final bool showDeleteIcon;
  final Function(String) onHistoryItemSelected;
  final Function(String) onRemoveHistory;
  final VoidCallback onDismiss;

  const _HistoryOverlay({
    required this.textFieldOffset,
    required this.textFieldSize,
    required this.displayList,
    required this.lockItems,
    required this.historyIcon,
    required this.historyIconSize,
    required this.deleteIcon,
    required this.deleteIconSize,
    required this.listTextStyle,
    required this.listDecoration,
    required this.lockTextColor,
    required this.showDeleteIcon,
    required this.onHistoryItemSelected,
    required this.onRemoveHistory,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final itemHeight = 48.0;
    final listHeight = displayList.length * itemHeight;
    final maxHeight = listHeight > 300 ? 300.0 : listHeight;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              onDismiss();
            },
          ),
        ),
        Positioned(
          top: textFieldOffset.dy + textFieldSize.height,
          left: textFieldOffset.dx,
          width: textFieldSize.width,
          height: maxHeight,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration:
                  listDecoration ??
                  BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) {
                    final isLockItem = index < (lockItems?.length ?? 0);
                    final item = displayList[index];

                    return InkWell(
                      onTap: () {
                        onHistoryItemSelected(item);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: SizedBox(
                        height: itemHeight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isLockItem ? Icons.lock : Icons.history,
                                size: historyIconSize ?? 18,
                                color: isLockItem ? lockTextColor : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item,
                                  style: listTextStyle?.copyWith(
                                    color: isLockItem ? lockTextColor : null,
                                  ),
                                ),
                              ),
                              if (!isLockItem && showDeleteIcon)
                                InkWell(
                                  onTap: () {
                                    onRemoveHistory(item);
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(
                                      deleteIcon ?? Icons.close,
                                      size: deleteIconSize ?? 18,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
