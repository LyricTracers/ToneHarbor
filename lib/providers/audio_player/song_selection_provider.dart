import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/models/audio_player/song_selection_state.dart';

part 'song_selection_provider.g.dart';

@riverpod
class SongSelection extends _$SongSelection {
  @override
  SongSelectionState build() {
    return SongSelectionState(selectionType: false, ids: {}, boxState: false);
  }

  void toggle() {
    state = state.copyWith(selectionType: !state.selectionType, ids: {});
  }

  void select(String songId) {
    state = state.copyWith(ids: state.ids.union({songId}));
  }

  void deSelect(String songId) {
    state = state.copyWith(ids: state.ids.difference({songId}));
  }

  void selectAll(Set<String> allIds) {
    state = state.copyWith(ids: allIds, boxState: !state.boxState);
  }

  void deSelectAll() {
    state = state.copyWith(ids: {}, boxState: !state.boxState);
  }

  bool get isSelectionState => state.selectionType;
  bool isSelected(String songId) => state.ids.contains(songId);

  int get count => state.ids.length;
}
