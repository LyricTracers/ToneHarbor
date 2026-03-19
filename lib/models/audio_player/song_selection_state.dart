import 'package:freezed_annotation/freezed_annotation.dart';
part 'song_selection_state.freezed.dart';
part 'song_selection_state.g.dart';

@freezed
sealed class SongSelectionState with _$SongSelectionState {
  const SongSelectionState._();
  const factory SongSelectionState({
    required bool selectionType,
    required Set<String> ids,
    required bool boxState,
  }) = _SongSelectionState;
  factory SongSelectionState.fromJson(Map<String, dynamic> json) =>
      _$SongSelectionStateFromJson(json);
}
