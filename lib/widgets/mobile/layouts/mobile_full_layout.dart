import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/layouts/base_bg_layout.dart';
import 'package:toneharbor/widgets/pages/bottom_player.dart';

class MobileFullLayout extends BaseBgLayout {
  final Widget child;
  const MobileFullLayout({super.key, required this.child, super.appbar});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    useEffect(() {
      Future.microtask(() {
        ref.invalidate(songSelectionProvider);
      });
      return null;
    }, []);
    var selectionTypeState = ref.watch(
      songSelectionProvider.select((state) {
        return SongSelectionState(
          selectionType: state.selectionType,
          ids: {},
          boxState: false,
        );
      }),
    );
    return Column(
      children: [
        Expanded(child: child),
        if (!selectionTypeState.selectionType) const BottomPlayer(),
      ],
    );
  }
}
