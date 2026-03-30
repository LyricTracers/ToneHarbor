import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';
import 'package:toneharbor/providers/providers.dart';
import 'package:toneharbor/widgets/pages/bottom_player.dart';
import 'package:toneharbor/widgets/pages/songs_page.dart';

class LocalSongsLayout extends HookConsumerWidget {
  const LocalSongsLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          SizedBox(height: 20),
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
