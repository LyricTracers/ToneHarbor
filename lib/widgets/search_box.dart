import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/providers/providers.dart';

class InputHistoryTextField extends HookConsumerWidget {
  final String historyKey;
  final int limit;
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
  final Widget Function(
    TextEditingController controller,
    String value,
    int index,
  )?
  historyListItemLayoutBuilder;
  final Function(String)? onHistoryItemSelected;
  final bool updateSelectedHistoryItemDateTime;
  final InputDecoration? decoration;
  final int? maxLines;
  final int? minLines;

  const InputHistoryTextField({
    super.key,
    required this.historyKey,
    this.limit = 5,
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
    this.historyListItemLayoutBuilder,
    this.onHistoryItemSelected,
    this.updateSelectedHistoryItemDateTime = false,
    this.decoration,
    this.maxLines = 1,
    this.minLines = 1,
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
        } else if (!focusNode.hasFocus) {
          showHistory.value = false;
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
              builder: (context) => _HistoryOverlay(
                textFieldOffset: offset,
                textFieldSize: size,
                displayList: displayList,
                lockItems: lockItems,
                historyIcon: historyIcon,
                historyIconSize: historyIconSize,
                deleteIcon: deleteIcon,
                deleteIconSize: deleteIconSize,
                listTextStyle: listTextStyle,
                listRowDecoration: listRowDecoration,
                listDecoration: listDecoration,
                lockTextColor: lockTextColor,
                historyListItemLayoutBuilder: historyListItemLayoutBuilder,
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
                  onHistoryItemSelected?.call(value);
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
            Overlay.of(context).insert(overlayEntry.value!);
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
      maxLines: maxLines,
      minLines: minLines,
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
                  size: historyIconSize ?? 20,
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
  final BoxDecoration? listRowDecoration;
  final BoxDecoration? listDecoration;
  final Color? lockTextColor;
  final Widget Function(
    TextEditingController controller,
    String value,
    int index,
  )?
  historyListItemLayoutBuilder;
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
    required this.listRowDecoration,
    required this.listDecoration,
    required this.lockTextColor,
    required this.historyListItemLayoutBuilder,
    required this.showDeleteIcon,
    required this.onHistoryItemSelected,
    required this.onRemoveHistory,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onDismiss,
          child: Container(color: Colors.black.withValues(alpha: 0.3)),
        ),
        Positioned(
          top: textFieldOffset.dy + textFieldSize.height,
          left: textFieldOffset.dx,
          width: textFieldSize.width,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              decoration:
                  listDecoration ??
                  BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) {
                    final isLockItem = index < (lockItems?.length ?? 0);
                    final item = displayList[index];

                    if (historyListItemLayoutBuilder != null) {
                      return historyListItemLayoutBuilder!(
                        TextEditingController(),
                        item,
                        index,
                      );
                    }

                    return Container(
                      decoration: listRowDecoration,
                      child: ListTile(
                        dense: true,
                        leading: Icon(
                          isLockItem ? Icons.lock : Icons.history,
                          size: historyIconSize ?? 18,
                          color: isLockItem ? lockTextColor : null,
                        ),
                        title: Text(
                          item,
                          style: listTextStyle?.copyWith(
                            color: isLockItem ? lockTextColor : null,
                          ),
                        ),
                        trailing: !isLockItem && showDeleteIcon
                            ? GestureDetector(
                                onTap: () => onRemoveHistory(item),
                                child: Icon(
                                  deleteIcon ?? Icons.close,
                                  size: deleteIconSize ?? 18,
                                ),
                              )
                            : null,
                        onTap: () => onHistoryItemSelected(item),
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
