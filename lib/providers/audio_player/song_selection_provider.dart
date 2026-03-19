import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';

part 'song_selection_provider.g.dart';

@riverpod
class SongSelection extends _$SongSelection {
  @override
  SongSelectionState build() {
    return SongSelectionState(selectionType: false, ids: {});
  }

  void toggle() {
    state = state.copyWith(selectionType: !state.selectionType, ids: {});
  }

  void toggleSelection(String songId) {
    final isSelected = state.ids.contains(songId);
    state = state.copyWith(
      ids: isSelected
          ? state.ids.difference({songId})
          : state.ids.union({songId}),
    );
  }

  void selectAll(Set<String> allIds) {
    state = state.copyWith(ids: allIds);
  }

  void deSelectAll() {
    state = state.copyWith(ids: {});
  }

  bool get isSelectionState => state.selectionType;

  int get count => state.ids.length;
}
