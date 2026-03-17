// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_playlist_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoritePlaylistState _$FavoritePlaylistStateFromJson(
  Map<String, dynamic> json,
) => _FavoritePlaylistState(
  playlists: (json['playlists'] as List<dynamic>)
      .map((e) => FavoritePlaylistItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FavoritePlaylistStateToJson(
  _FavoritePlaylistState instance,
) => <String, dynamic>{'playlists': instance.playlists};

_FavoritePlaylistItem _$FavoritePlaylistItemFromJson(
  Map<String, dynamic> json,
) => _FavoritePlaylistItem(
  playlistId: json['playlistId'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$FavoritePlaylistItemToJson(
  _FavoritePlaylistItem instance,
) => <String, dynamic>{
  'playlistId': instance.playlistId,
  'title': instance.title,
};
