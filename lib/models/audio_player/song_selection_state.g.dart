// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_selection_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongSelectionState _$SongSelectionStateFromJson(Map<String, dynamic> json) =>
    _SongSelectionState(
      selectionType: json['selectionType'] as bool,
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toSet(),
      boxState: json['boxState'] as bool,
    );

Map<String, dynamic> _$SongSelectionStateToJson(_SongSelectionState instance) =>
    <String, dynamic>{
      'selectionType': instance.selectionType,
      'ids': instance.ids.toList(),
      'boxState': instance.boxState,
    };
