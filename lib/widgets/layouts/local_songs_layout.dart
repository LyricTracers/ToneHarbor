import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/widgets.dart';

class LocalSongsLayout extends BaseBgLayout {
  const LocalSongsLayout({super.key});

  @override
  Widget buildContent(BuildContext context, WidgetRef ref, bool requestFlag) {
    final l10n = ref.watch(l10nProvider);

    useEffect(() {
      Future.microtask(() {
        ref.invalidate(localSongsProvider);
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

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SongsPage(
              title: l10n.local_songs,
              baseProvider: localSongsProvider,
              limitTotal: -1,
              sortAction: SongsPageSortAction.none,
              isLocal: true,
              fromNoLoginLocal: true,
            ),
          ),
          if (!selectionTypeState.selectionType) const BottomPlayer(),
        ],
      ),
    );
  }
}
