import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';

part 'song_selection_provider.g.dart';

@riverpod
class SongSelection extends _$SongSelection {
  @override
  SongSelectionState build() {
    return SongSelectionState(
      selectionType: false,
      ids: {},
      boxState: AllCheckBoxState.none,
    );
  }

  void toggle() {
    state = state.copyWith(selectionType: !state.selectionType, ids: {});
  }

  // void toggleSelection(String songId) {
  //   final isSelected = state.ids.contains(songId);
  //   state = state.copyWith(
  //     ids: isSelected
  //         ? state.ids.difference({songId})
  //         : state.ids.union({songId}),
  //   );
  // }

  void select(String songId) {
    state = state.copyWith(ids: state.ids.union({songId}));
  }

  void deSelect(String songId) {
    state = state.copyWith(ids: state.ids.difference({songId}));
  }

  void selectAll(Set<String> allIds) {
    state = state.copyWith(
      ids: allIds,
      boxState: AllCheckBoxState.selectionAll,
    );
  }

  void deSelectAll() {
    state = state.copyWith(ids: {}, boxState: AllCheckBoxState.deSelectionAll);
  }

  bool get isSelectionState => state.selectionType;
  bool isSelected(String songId) => state.ids.contains(songId);

  int get count => state.ids.length;
}
