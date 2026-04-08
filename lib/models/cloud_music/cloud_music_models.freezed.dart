// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_music_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CloudMusicPlaylist {

 int get id; String get name; String? get picUrl; String? get coverImgUrl; String? get description; int? get playCount; int? get trackCount; String? get updateFrequency; String? get copywriter; int? get privacy;
/// Create a copy of CloudMusicPlaylist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPlaylistCopyWith<CloudMusicPlaylist> get copyWith => _$CloudMusicPlaylistCopyWithImpl<CloudMusicPlaylist>(this as CloudMusicPlaylist, _$identity);

  /// Serializes this CloudMusicPlaylist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPlaylist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.updateFrequency, updateFrequency) || other.updateFrequency == updateFrequency)&&(identical(other.copywriter, copywriter) || other.copywriter == copywriter)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,coverImgUrl,description,playCount,trackCount,updateFrequency,copywriter,privacy);

@override
String toString() {
  return 'CloudMusicPlaylist(id: $id, name: $name, picUrl: $picUrl, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, updateFrequency: $updateFrequency, copywriter: $copywriter, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPlaylistCopyWith<$Res>  {
  factory $CloudMusicPlaylistCopyWith(CloudMusicPlaylist value, $Res Function(CloudMusicPlaylist) _then) = _$CloudMusicPlaylistCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl, String? coverImgUrl, String? description, int? playCount, int? trackCount, String? updateFrequency, String? copywriter, int? privacy
});




}
/// @nodoc
class _$CloudMusicPlaylistCopyWithImpl<$Res>
    implements $CloudMusicPlaylistCopyWith<$Res> {
  _$CloudMusicPlaylistCopyWithImpl(this._self, this._then);

  final CloudMusicPlaylist _self;
  final $Res Function(CloudMusicPlaylist) _then;

/// Create a copy of CloudMusicPlaylist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? updateFrequency = freezed,Object? copywriter = freezed,Object? privacy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,updateFrequency: freezed == updateFrequency ? _self.updateFrequency : updateFrequency // ignore: cast_nullable_to_non_nullable
as String?,copywriter: freezed == copywriter ? _self.copywriter : copywriter // ignore: cast_nullable_to_non_nullable
as String?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicPlaylist].
extension CloudMusicPlaylistPatterns on CloudMusicPlaylist {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicPlaylist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicPlaylist() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicPlaylist value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylist():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicPlaylist value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylist() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  String? updateFrequency,  String? copywriter,  int? privacy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicPlaylist() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.updateFrequency,_that.copywriter,_that.privacy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  String? updateFrequency,  String? copywriter,  int? privacy)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylist():
return $default(_that.id,_that.name,_that.picUrl,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.updateFrequency,_that.copywriter,_that.privacy);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? picUrl,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  String? updateFrequency,  String? copywriter,  int? privacy)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylist() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.updateFrequency,_that.copywriter,_that.privacy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPlaylist extends CloudMusicPlaylist {
  const _CloudMusicPlaylist({required this.id, required this.name, this.picUrl, this.coverImgUrl, this.description, this.playCount, this.trackCount, this.updateFrequency, this.copywriter, this.privacy}): super._();
  factory _CloudMusicPlaylist.fromJson(Map<String, dynamic> json) => _$CloudMusicPlaylistFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;
@override final  String? coverImgUrl;
@override final  String? description;
@override final  int? playCount;
@override final  int? trackCount;
@override final  String? updateFrequency;
@override final  String? copywriter;
@override final  int? privacy;

/// Create a copy of CloudMusicPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicPlaylistCopyWith<_CloudMusicPlaylist> get copyWith => __$CloudMusicPlaylistCopyWithImpl<_CloudMusicPlaylist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicPlaylistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPlaylist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.updateFrequency, updateFrequency) || other.updateFrequency == updateFrequency)&&(identical(other.copywriter, copywriter) || other.copywriter == copywriter)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,coverImgUrl,description,playCount,trackCount,updateFrequency,copywriter,privacy);

@override
String toString() {
  return 'CloudMusicPlaylist(id: $id, name: $name, picUrl: $picUrl, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, updateFrequency: $updateFrequency, copywriter: $copywriter, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPlaylistCopyWith<$Res> implements $CloudMusicPlaylistCopyWith<$Res> {
  factory _$CloudMusicPlaylistCopyWith(_CloudMusicPlaylist value, $Res Function(_CloudMusicPlaylist) _then) = __$CloudMusicPlaylistCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl, String? coverImgUrl, String? description, int? playCount, int? trackCount, String? updateFrequency, String? copywriter, int? privacy
});




}
/// @nodoc
class __$CloudMusicPlaylistCopyWithImpl<$Res>
    implements _$CloudMusicPlaylistCopyWith<$Res> {
  __$CloudMusicPlaylistCopyWithImpl(this._self, this._then);

  final _CloudMusicPlaylist _self;
  final $Res Function(_CloudMusicPlaylist) _then;

/// Create a copy of CloudMusicPlaylist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? updateFrequency = freezed,Object? copywriter = freezed,Object? privacy = freezed,}) {
  return _then(_CloudMusicPlaylist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,updateFrequency: freezed == updateFrequency ? _self.updateFrequency : updateFrequency // ignore: cast_nullable_to_non_nullable
as String?,copywriter: freezed == copywriter ? _self.copywriter : copywriter // ignore: cast_nullable_to_non_nullable
as String?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicAlbum {

 int get id; String get name; String? get picUrl; String? get blurPicUrl; CloudMusicArtist? get artist; List<CloudMusicArtist>? get artists; int? get publishTime; int? get size; String? get description; String? get company; String? get type; int? get mark; int? get copyrightId;
/// Create a copy of CloudMusicAlbum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicAlbumCopyWith<CloudMusicAlbum> get copyWith => _$CloudMusicAlbumCopyWithImpl<CloudMusicAlbum>(this as CloudMusicAlbum, _$identity);

  /// Serializes this CloudMusicAlbum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.blurPicUrl, blurPicUrl) || other.blurPicUrl == blurPicUrl)&&(identical(other.artist, artist) || other.artist == artist)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.size, size) || other.size == size)&&(identical(other.description, description) || other.description == description)&&(identical(other.company, company) || other.company == company)&&(identical(other.type, type) || other.type == type)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.copyrightId, copyrightId) || other.copyrightId == copyrightId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,blurPicUrl,artist,const DeepCollectionEquality().hash(artists),publishTime,size,description,company,type,mark,copyrightId);

@override
String toString() {
  return 'CloudMusicAlbum(id: $id, name: $name, picUrl: $picUrl, blurPicUrl: $blurPicUrl, artist: $artist, artists: $artists, publishTime: $publishTime, size: $size, description: $description, company: $company, type: $type, mark: $mark, copyrightId: $copyrightId)';
}


}

/// @nodoc
abstract mixin class $CloudMusicAlbumCopyWith<$Res>  {
  factory $CloudMusicAlbumCopyWith(CloudMusicAlbum value, $Res Function(CloudMusicAlbum) _then) = _$CloudMusicAlbumCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl, String? blurPicUrl, CloudMusicArtist? artist, List<CloudMusicArtist>? artists, int? publishTime, int? size, String? description, String? company, String? type, int? mark, int? copyrightId
});


$CloudMusicArtistCopyWith<$Res>? get artist;

}
/// @nodoc
class _$CloudMusicAlbumCopyWithImpl<$Res>
    implements $CloudMusicAlbumCopyWith<$Res> {
  _$CloudMusicAlbumCopyWithImpl(this._self, this._then);

  final CloudMusicAlbum _self;
  final $Res Function(CloudMusicAlbum) _then;

/// Create a copy of CloudMusicAlbum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? blurPicUrl = freezed,Object? artist = freezed,Object? artists = freezed,Object? publishTime = freezed,Object? size = freezed,Object? description = freezed,Object? company = freezed,Object? type = freezed,Object? mark = freezed,Object? copyrightId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,blurPicUrl: freezed == blurPicUrl ? _self.blurPicUrl : blurPicUrl // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as CloudMusicArtist?,artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>?,publishTime: freezed == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,copyrightId: freezed == copyrightId ? _self.copyrightId : copyrightId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CloudMusicAlbum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicArtistCopyWith<$Res>? get artist {
    if (_self.artist == null) {
    return null;
  }

  return $CloudMusicArtistCopyWith<$Res>(_self.artist!, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicAlbum].
extension CloudMusicAlbumPatterns on CloudMusicAlbum {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicAlbum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicAlbum() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicAlbum value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbum():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicAlbum value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbum() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? blurPicUrl,  CloudMusicArtist? artist,  List<CloudMusicArtist>? artists,  int? publishTime,  int? size,  String? description,  String? company,  String? type,  int? mark,  int? copyrightId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicAlbum() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.blurPicUrl,_that.artist,_that.artists,_that.publishTime,_that.size,_that.description,_that.company,_that.type,_that.mark,_that.copyrightId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? blurPicUrl,  CloudMusicArtist? artist,  List<CloudMusicArtist>? artists,  int? publishTime,  int? size,  String? description,  String? company,  String? type,  int? mark,  int? copyrightId)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicAlbum():
return $default(_that.id,_that.name,_that.picUrl,_that.blurPicUrl,_that.artist,_that.artists,_that.publishTime,_that.size,_that.description,_that.company,_that.type,_that.mark,_that.copyrightId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? picUrl,  String? blurPicUrl,  CloudMusicArtist? artist,  List<CloudMusicArtist>? artists,  int? publishTime,  int? size,  String? description,  String? company,  String? type,  int? mark,  int? copyrightId)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicAlbum() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.blurPicUrl,_that.artist,_that.artists,_that.publishTime,_that.size,_that.description,_that.company,_that.type,_that.mark,_that.copyrightId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicAlbum extends CloudMusicAlbum {
  const _CloudMusicAlbum({required this.id, required this.name, this.picUrl, this.blurPicUrl, this.artist, final  List<CloudMusicArtist>? artists, this.publishTime, this.size, this.description, this.company, this.type, this.mark, this.copyrightId}): _artists = artists,super._();
  factory _CloudMusicAlbum.fromJson(Map<String, dynamic> json) => _$CloudMusicAlbumFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;
@override final  String? blurPicUrl;
@override final  CloudMusicArtist? artist;
 final  List<CloudMusicArtist>? _artists;
@override List<CloudMusicArtist>? get artists {
  final value = _artists;
  if (value == null) return null;
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? publishTime;
@override final  int? size;
@override final  String? description;
@override final  String? company;
@override final  String? type;
@override final  int? mark;
@override final  int? copyrightId;

/// Create a copy of CloudMusicAlbum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicAlbumCopyWith<_CloudMusicAlbum> get copyWith => __$CloudMusicAlbumCopyWithImpl<_CloudMusicAlbum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicAlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.blurPicUrl, blurPicUrl) || other.blurPicUrl == blurPicUrl)&&(identical(other.artist, artist) || other.artist == artist)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.size, size) || other.size == size)&&(identical(other.description, description) || other.description == description)&&(identical(other.company, company) || other.company == company)&&(identical(other.type, type) || other.type == type)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.copyrightId, copyrightId) || other.copyrightId == copyrightId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,blurPicUrl,artist,const DeepCollectionEquality().hash(_artists),publishTime,size,description,company,type,mark,copyrightId);

@override
String toString() {
  return 'CloudMusicAlbum(id: $id, name: $name, picUrl: $picUrl, blurPicUrl: $blurPicUrl, artist: $artist, artists: $artists, publishTime: $publishTime, size: $size, description: $description, company: $company, type: $type, mark: $mark, copyrightId: $copyrightId)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicAlbumCopyWith<$Res> implements $CloudMusicAlbumCopyWith<$Res> {
  factory _$CloudMusicAlbumCopyWith(_CloudMusicAlbum value, $Res Function(_CloudMusicAlbum) _then) = __$CloudMusicAlbumCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl, String? blurPicUrl, CloudMusicArtist? artist, List<CloudMusicArtist>? artists, int? publishTime, int? size, String? description, String? company, String? type, int? mark, int? copyrightId
});


@override $CloudMusicArtistCopyWith<$Res>? get artist;

}
/// @nodoc
class __$CloudMusicAlbumCopyWithImpl<$Res>
    implements _$CloudMusicAlbumCopyWith<$Res> {
  __$CloudMusicAlbumCopyWithImpl(this._self, this._then);

  final _CloudMusicAlbum _self;
  final $Res Function(_CloudMusicAlbum) _then;

/// Create a copy of CloudMusicAlbum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? blurPicUrl = freezed,Object? artist = freezed,Object? artists = freezed,Object? publishTime = freezed,Object? size = freezed,Object? description = freezed,Object? company = freezed,Object? type = freezed,Object? mark = freezed,Object? copyrightId = freezed,}) {
  return _then(_CloudMusicAlbum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,blurPicUrl: freezed == blurPicUrl ? _self.blurPicUrl : blurPicUrl // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as CloudMusicArtist?,artists: freezed == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>?,publishTime: freezed == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,copyrightId: freezed == copyrightId ? _self.copyrightId : copyrightId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CloudMusicAlbum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicArtistCopyWith<$Res>? get artist {
    if (_self.artist == null) {
    return null;
  }

  return $CloudMusicArtistCopyWith<$Res>(_self.artist!, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicArtist {

 int get id; String get name; int? get picId; int? get img1v1Id; String? get picUrl; String? get img1v1Url; int? get musicSize; int? get albumSize; String? get briefDesc; String? get trans; List<String>? get alias; List<String>? get transNames;
/// Create a copy of CloudMusicArtist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicArtistCopyWith<CloudMusicArtist> get copyWith => _$CloudMusicArtistCopyWithImpl<CloudMusicArtist>(this as CloudMusicArtist, _$identity);

  /// Serializes this CloudMusicArtist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picId, picId) || other.picId == picId)&&(identical(other.img1v1Id, img1v1Id) || other.img1v1Id == img1v1Id)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.img1v1Url, img1v1Url) || other.img1v1Url == img1v1Url)&&(identical(other.musicSize, musicSize) || other.musicSize == musicSize)&&(identical(other.albumSize, albumSize) || other.albumSize == albumSize)&&(identical(other.briefDesc, briefDesc) || other.briefDesc == briefDesc)&&(identical(other.trans, trans) || other.trans == trans)&&const DeepCollectionEquality().equals(other.alias, alias)&&const DeepCollectionEquality().equals(other.transNames, transNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picId,img1v1Id,picUrl,img1v1Url,musicSize,albumSize,briefDesc,trans,const DeepCollectionEquality().hash(alias),const DeepCollectionEquality().hash(transNames));

@override
String toString() {
  return 'CloudMusicArtist(id: $id, name: $name, picId: $picId, img1v1Id: $img1v1Id, picUrl: $picUrl, img1v1Url: $img1v1Url, musicSize: $musicSize, albumSize: $albumSize, briefDesc: $briefDesc, trans: $trans, alias: $alias, transNames: $transNames)';
}


}

/// @nodoc
abstract mixin class $CloudMusicArtistCopyWith<$Res>  {
  factory $CloudMusicArtistCopyWith(CloudMusicArtist value, $Res Function(CloudMusicArtist) _then) = _$CloudMusicArtistCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? picId, int? img1v1Id, String? picUrl, String? img1v1Url, int? musicSize, int? albumSize, String? briefDesc, String? trans, List<String>? alias, List<String>? transNames
});




}
/// @nodoc
class _$CloudMusicArtistCopyWithImpl<$Res>
    implements $CloudMusicArtistCopyWith<$Res> {
  _$CloudMusicArtistCopyWithImpl(this._self, this._then);

  final CloudMusicArtist _self;
  final $Res Function(CloudMusicArtist) _then;

/// Create a copy of CloudMusicArtist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picId = freezed,Object? img1v1Id = freezed,Object? picUrl = freezed,Object? img1v1Url = freezed,Object? musicSize = freezed,Object? albumSize = freezed,Object? briefDesc = freezed,Object? trans = freezed,Object? alias = freezed,Object? transNames = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picId: freezed == picId ? _self.picId : picId // ignore: cast_nullable_to_non_nullable
as int?,img1v1Id: freezed == img1v1Id ? _self.img1v1Id : img1v1Id // ignore: cast_nullable_to_non_nullable
as int?,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,img1v1Url: freezed == img1v1Url ? _self.img1v1Url : img1v1Url // ignore: cast_nullable_to_non_nullable
as String?,musicSize: freezed == musicSize ? _self.musicSize : musicSize // ignore: cast_nullable_to_non_nullable
as int?,albumSize: freezed == albumSize ? _self.albumSize : albumSize // ignore: cast_nullable_to_non_nullable
as int?,briefDesc: freezed == briefDesc ? _self.briefDesc : briefDesc // ignore: cast_nullable_to_non_nullable
as String?,trans: freezed == trans ? _self.trans : trans // ignore: cast_nullable_to_non_nullable
as String?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as List<String>?,transNames: freezed == transNames ? _self.transNames : transNames // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicArtist].
extension CloudMusicArtistPatterns on CloudMusicArtist {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicArtist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicArtist() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicArtist value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicArtist():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicArtist value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicArtist() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int? picId,  int? img1v1Id,  String? picUrl,  String? img1v1Url,  int? musicSize,  int? albumSize,  String? briefDesc,  String? trans,  List<String>? alias,  List<String>? transNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicArtist() when $default != null:
return $default(_that.id,_that.name,_that.picId,_that.img1v1Id,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias,_that.transNames);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int? picId,  int? img1v1Id,  String? picUrl,  String? img1v1Url,  int? musicSize,  int? albumSize,  String? briefDesc,  String? trans,  List<String>? alias,  List<String>? transNames)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicArtist():
return $default(_that.id,_that.name,_that.picId,_that.img1v1Id,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias,_that.transNames);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int? picId,  int? img1v1Id,  String? picUrl,  String? img1v1Url,  int? musicSize,  int? albumSize,  String? briefDesc,  String? trans,  List<String>? alias,  List<String>? transNames)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicArtist() when $default != null:
return $default(_that.id,_that.name,_that.picId,_that.img1v1Id,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias,_that.transNames);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicArtist extends CloudMusicArtist {
  const _CloudMusicArtist({required this.id, required this.name, this.picId, this.img1v1Id, this.picUrl, this.img1v1Url, this.musicSize, this.albumSize, this.briefDesc, this.trans, final  List<String>? alias, final  List<String>? transNames}): _alias = alias,_transNames = transNames,super._();
  factory _CloudMusicArtist.fromJson(Map<String, dynamic> json) => _$CloudMusicArtistFromJson(json);

@override final  int id;
@override final  String name;
@override final  int? picId;
@override final  int? img1v1Id;
@override final  String? picUrl;
@override final  String? img1v1Url;
@override final  int? musicSize;
@override final  int? albumSize;
@override final  String? briefDesc;
@override final  String? trans;
 final  List<String>? _alias;
@override List<String>? get alias {
  final value = _alias;
  if (value == null) return null;
  if (_alias is EqualUnmodifiableListView) return _alias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _transNames;
@override List<String>? get transNames {
  final value = _transNames;
  if (value == null) return null;
  if (_transNames is EqualUnmodifiableListView) return _transNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CloudMusicArtist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicArtistCopyWith<_CloudMusicArtist> get copyWith => __$CloudMusicArtistCopyWithImpl<_CloudMusicArtist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picId, picId) || other.picId == picId)&&(identical(other.img1v1Id, img1v1Id) || other.img1v1Id == img1v1Id)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.img1v1Url, img1v1Url) || other.img1v1Url == img1v1Url)&&(identical(other.musicSize, musicSize) || other.musicSize == musicSize)&&(identical(other.albumSize, albumSize) || other.albumSize == albumSize)&&(identical(other.briefDesc, briefDesc) || other.briefDesc == briefDesc)&&(identical(other.trans, trans) || other.trans == trans)&&const DeepCollectionEquality().equals(other._alias, _alias)&&const DeepCollectionEquality().equals(other._transNames, _transNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picId,img1v1Id,picUrl,img1v1Url,musicSize,albumSize,briefDesc,trans,const DeepCollectionEquality().hash(_alias),const DeepCollectionEquality().hash(_transNames));

@override
String toString() {
  return 'CloudMusicArtist(id: $id, name: $name, picId: $picId, img1v1Id: $img1v1Id, picUrl: $picUrl, img1v1Url: $img1v1Url, musicSize: $musicSize, albumSize: $albumSize, briefDesc: $briefDesc, trans: $trans, alias: $alias, transNames: $transNames)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicArtistCopyWith<$Res> implements $CloudMusicArtistCopyWith<$Res> {
  factory _$CloudMusicArtistCopyWith(_CloudMusicArtist value, $Res Function(_CloudMusicArtist) _then) = __$CloudMusicArtistCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? picId, int? img1v1Id, String? picUrl, String? img1v1Url, int? musicSize, int? albumSize, String? briefDesc, String? trans, List<String>? alias, List<String>? transNames
});




}
/// @nodoc
class __$CloudMusicArtistCopyWithImpl<$Res>
    implements _$CloudMusicArtistCopyWith<$Res> {
  __$CloudMusicArtistCopyWithImpl(this._self, this._then);

  final _CloudMusicArtist _self;
  final $Res Function(_CloudMusicArtist) _then;

/// Create a copy of CloudMusicArtist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picId = freezed,Object? img1v1Id = freezed,Object? picUrl = freezed,Object? img1v1Url = freezed,Object? musicSize = freezed,Object? albumSize = freezed,Object? briefDesc = freezed,Object? trans = freezed,Object? alias = freezed,Object? transNames = freezed,}) {
  return _then(_CloudMusicArtist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picId: freezed == picId ? _self.picId : picId // ignore: cast_nullable_to_non_nullable
as int?,img1v1Id: freezed == img1v1Id ? _self.img1v1Id : img1v1Id // ignore: cast_nullable_to_non_nullable
as int?,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,img1v1Url: freezed == img1v1Url ? _self.img1v1Url : img1v1Url // ignore: cast_nullable_to_non_nullable
as String?,musicSize: freezed == musicSize ? _self.musicSize : musicSize // ignore: cast_nullable_to_non_nullable
as int?,albumSize: freezed == albumSize ? _self.albumSize : albumSize // ignore: cast_nullable_to_non_nullable
as int?,briefDesc: freezed == briefDesc ? _self.briefDesc : briefDesc // ignore: cast_nullable_to_non_nullable
as String?,trans: freezed == trans ? _self.trans : trans // ignore: cast_nullable_to_non_nullable
as String?,alias: freezed == alias ? _self._alias : alias // ignore: cast_nullable_to_non_nullable
as List<String>?,transNames: freezed == transNames ? _self._transNames : transNames // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicSong {

 int get id; String get name; List<CloudMusicArtist>? get ar; CloudMusicAlbumSimple? get al; int? get dt; int? get pop; int? get no; List<String>? get reason; int? get fee; int? get copyright; int? get mark; int? get mv;
/// Create a copy of CloudMusicSong
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicSongCopyWith<CloudMusicSong> get copyWith => _$CloudMusicSongCopyWithImpl<CloudMusicSong>(this as CloudMusicSong, _$identity);

  /// Serializes this CloudMusicSong to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicSong&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.ar, ar)&&(identical(other.al, al) || other.al == al)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.no, no) || other.no == no)&&const DeepCollectionEquality().equals(other.reason, reason)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.mv, mv) || other.mv == mv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(ar),al,dt,pop,no,const DeepCollectionEquality().hash(reason),fee,copyright,mark,mv);

@override
String toString() {
  return 'CloudMusicSong(id: $id, name: $name, ar: $ar, al: $al, dt: $dt, pop: $pop, no: $no, reason: $reason, fee: $fee, copyright: $copyright, mark: $mark, mv: $mv)';
}


}

/// @nodoc
abstract mixin class $CloudMusicSongCopyWith<$Res>  {
  factory $CloudMusicSongCopyWith(CloudMusicSong value, $Res Function(CloudMusicSong) _then) = _$CloudMusicSongCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<CloudMusicArtist>? ar, CloudMusicAlbumSimple? al, int? dt, int? pop, int? no, List<String>? reason, int? fee, int? copyright, int? mark, int? mv
});


$CloudMusicAlbumSimpleCopyWith<$Res>? get al;

}
/// @nodoc
class _$CloudMusicSongCopyWithImpl<$Res>
    implements $CloudMusicSongCopyWith<$Res> {
  _$CloudMusicSongCopyWithImpl(this._self, this._then);

  final CloudMusicSong _self;
  final $Res Function(CloudMusicSong) _then;

/// Create a copy of CloudMusicSong
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ar = freezed,Object? al = freezed,Object? dt = freezed,Object? pop = freezed,Object? no = freezed,Object? reason = freezed,Object? fee = freezed,Object? copyright = freezed,Object? mark = freezed,Object? mv = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>?,al: freezed == al ? _self.al : al // ignore: cast_nullable_to_non_nullable
as CloudMusicAlbumSimple?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,pop: freezed == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as int?,no: freezed == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as List<String>?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int?,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as int?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,mv: freezed == mv ? _self.mv : mv // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CloudMusicSong
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicAlbumSimpleCopyWith<$Res>? get al {
    if (_self.al == null) {
    return null;
  }

  return $CloudMusicAlbumSimpleCopyWith<$Res>(_self.al!, (value) {
    return _then(_self.copyWith(al: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicSong].
extension CloudMusicSongPatterns on CloudMusicSong {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicSong value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicSong() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicSong value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicSong():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicSong value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicSong() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<CloudMusicArtist>? ar,  CloudMusicAlbumSimple? al,  int? dt,  int? pop,  int? no,  List<String>? reason,  int? fee,  int? copyright,  int? mark,  int? mv)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicSong() when $default != null:
return $default(_that.id,_that.name,_that.ar,_that.al,_that.dt,_that.pop,_that.no,_that.reason,_that.fee,_that.copyright,_that.mark,_that.mv);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<CloudMusicArtist>? ar,  CloudMusicAlbumSimple? al,  int? dt,  int? pop,  int? no,  List<String>? reason,  int? fee,  int? copyright,  int? mark,  int? mv)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicSong():
return $default(_that.id,_that.name,_that.ar,_that.al,_that.dt,_that.pop,_that.no,_that.reason,_that.fee,_that.copyright,_that.mark,_that.mv);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<CloudMusicArtist>? ar,  CloudMusicAlbumSimple? al,  int? dt,  int? pop,  int? no,  List<String>? reason,  int? fee,  int? copyright,  int? mark,  int? mv)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicSong() when $default != null:
return $default(_that.id,_that.name,_that.ar,_that.al,_that.dt,_that.pop,_that.no,_that.reason,_that.fee,_that.copyright,_that.mark,_that.mv);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicSong extends CloudMusicSong {
  const _CloudMusicSong({required this.id, required this.name, final  List<CloudMusicArtist>? ar, this.al, this.dt, this.pop, this.no, final  List<String>? reason, this.fee, this.copyright, this.mark, this.mv}): _ar = ar,_reason = reason,super._();
  factory _CloudMusicSong.fromJson(Map<String, dynamic> json) => _$CloudMusicSongFromJson(json);

@override final  int id;
@override final  String name;
 final  List<CloudMusicArtist>? _ar;
@override List<CloudMusicArtist>? get ar {
  final value = _ar;
  if (value == null) return null;
  if (_ar is EqualUnmodifiableListView) return _ar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CloudMusicAlbumSimple? al;
@override final  int? dt;
@override final  int? pop;
@override final  int? no;
 final  List<String>? _reason;
@override List<String>? get reason {
  final value = _reason;
  if (value == null) return null;
  if (_reason is EqualUnmodifiableListView) return _reason;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? fee;
@override final  int? copyright;
@override final  int? mark;
@override final  int? mv;

/// Create a copy of CloudMusicSong
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicSongCopyWith<_CloudMusicSong> get copyWith => __$CloudMusicSongCopyWithImpl<_CloudMusicSong>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicSongToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicSong&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._ar, _ar)&&(identical(other.al, al) || other.al == al)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.no, no) || other.no == no)&&const DeepCollectionEquality().equals(other._reason, _reason)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.mv, mv) || other.mv == mv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_ar),al,dt,pop,no,const DeepCollectionEquality().hash(_reason),fee,copyright,mark,mv);

@override
String toString() {
  return 'CloudMusicSong(id: $id, name: $name, ar: $ar, al: $al, dt: $dt, pop: $pop, no: $no, reason: $reason, fee: $fee, copyright: $copyright, mark: $mark, mv: $mv)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicSongCopyWith<$Res> implements $CloudMusicSongCopyWith<$Res> {
  factory _$CloudMusicSongCopyWith(_CloudMusicSong value, $Res Function(_CloudMusicSong) _then) = __$CloudMusicSongCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<CloudMusicArtist>? ar, CloudMusicAlbumSimple? al, int? dt, int? pop, int? no, List<String>? reason, int? fee, int? copyright, int? mark, int? mv
});


@override $CloudMusicAlbumSimpleCopyWith<$Res>? get al;

}
/// @nodoc
class __$CloudMusicSongCopyWithImpl<$Res>
    implements _$CloudMusicSongCopyWith<$Res> {
  __$CloudMusicSongCopyWithImpl(this._self, this._then);

  final _CloudMusicSong _self;
  final $Res Function(_CloudMusicSong) _then;

/// Create a copy of CloudMusicSong
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ar = freezed,Object? al = freezed,Object? dt = freezed,Object? pop = freezed,Object? no = freezed,Object? reason = freezed,Object? fee = freezed,Object? copyright = freezed,Object? mark = freezed,Object? mv = freezed,}) {
  return _then(_CloudMusicSong(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ar: freezed == ar ? _self._ar : ar // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>?,al: freezed == al ? _self.al : al // ignore: cast_nullable_to_non_nullable
as CloudMusicAlbumSimple?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,pop: freezed == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as int?,no: freezed == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self._reason : reason // ignore: cast_nullable_to_non_nullable
as List<String>?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int?,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as int?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,mv: freezed == mv ? _self.mv : mv // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CloudMusicSong
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicAlbumSimpleCopyWith<$Res>? get al {
    if (_self.al == null) {
    return null;
  }

  return $CloudMusicAlbumSimpleCopyWith<$Res>(_self.al!, (value) {
    return _then(_self.copyWith(al: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicAlbumSimple {

 int get id; String get name; String? get picUrl;
/// Create a copy of CloudMusicAlbumSimple
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicAlbumSimpleCopyWith<CloudMusicAlbumSimple> get copyWith => _$CloudMusicAlbumSimpleCopyWithImpl<CloudMusicAlbumSimple>(this as CloudMusicAlbumSimple, _$identity);

  /// Serializes this CloudMusicAlbumSimple to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicAlbumSimple&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl);

@override
String toString() {
  return 'CloudMusicAlbumSimple(id: $id, name: $name, picUrl: $picUrl)';
}


}

/// @nodoc
abstract mixin class $CloudMusicAlbumSimpleCopyWith<$Res>  {
  factory $CloudMusicAlbumSimpleCopyWith(CloudMusicAlbumSimple value, $Res Function(CloudMusicAlbumSimple) _then) = _$CloudMusicAlbumSimpleCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl
});




}
/// @nodoc
class _$CloudMusicAlbumSimpleCopyWithImpl<$Res>
    implements $CloudMusicAlbumSimpleCopyWith<$Res> {
  _$CloudMusicAlbumSimpleCopyWithImpl(this._self, this._then);

  final CloudMusicAlbumSimple _self;
  final $Res Function(CloudMusicAlbumSimple) _then;

/// Create a copy of CloudMusicAlbumSimple
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicAlbumSimple].
extension CloudMusicAlbumSimplePatterns on CloudMusicAlbumSimple {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicAlbumSimple value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicAlbumSimple() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicAlbumSimple value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbumSimple():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicAlbumSimple value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbumSimple() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicAlbumSimple() when $default != null:
return $default(_that.id,_that.name,_that.picUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicAlbumSimple():
return $default(_that.id,_that.name,_that.picUrl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? picUrl)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicAlbumSimple() when $default != null:
return $default(_that.id,_that.name,_that.picUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicAlbumSimple extends CloudMusicAlbumSimple {
  const _CloudMusicAlbumSimple({required this.id, required this.name, this.picUrl}): super._();
  factory _CloudMusicAlbumSimple.fromJson(Map<String, dynamic> json) => _$CloudMusicAlbumSimpleFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;

/// Create a copy of CloudMusicAlbumSimple
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicAlbumSimpleCopyWith<_CloudMusicAlbumSimple> get copyWith => __$CloudMusicAlbumSimpleCopyWithImpl<_CloudMusicAlbumSimple>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicAlbumSimpleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicAlbumSimple&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl);

@override
String toString() {
  return 'CloudMusicAlbumSimple(id: $id, name: $name, picUrl: $picUrl)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicAlbumSimpleCopyWith<$Res> implements $CloudMusicAlbumSimpleCopyWith<$Res> {
  factory _$CloudMusicAlbumSimpleCopyWith(_CloudMusicAlbumSimple value, $Res Function(_CloudMusicAlbumSimple) _then) = __$CloudMusicAlbumSimpleCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl
});




}
/// @nodoc
class __$CloudMusicAlbumSimpleCopyWithImpl<$Res>
    implements _$CloudMusicAlbumSimpleCopyWith<$Res> {
  __$CloudMusicAlbumSimpleCopyWithImpl(this._self, this._then);

  final _CloudMusicAlbumSimple _self;
  final $Res Function(_CloudMusicAlbumSimple) _then;

/// Create a copy of CloudMusicAlbumSimple
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,}) {
  return _then(_CloudMusicAlbumSimple(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicPlaylistDetailData {

 int get id; String get name; String? get coverImgUrl; String? get description; int? get playCount; int? get trackCount; List<CloudMusicSong>? get tracks; List<CloudMusicTrackId>? get trackIds; CloudMusicUser? get creator; int? get createTime; int? get updateTime; int? get subscribedCount; int? get commentCount; List<String>? get tags; int? get privacy; bool? get subscribed;
/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPlaylistDetailDataCopyWith<CloudMusicPlaylistDetailData> get copyWith => _$CloudMusicPlaylistDetailDataCopyWithImpl<CloudMusicPlaylistDetailData>(this as CloudMusicPlaylistDetailData, _$identity);

  /// Serializes this CloudMusicPlaylistDetailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPlaylistDetailData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&const DeepCollectionEquality().equals(other.trackIds, trackIds)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.subscribedCount, subscribedCount) || other.subscribedCount == subscribedCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.subscribed, subscribed) || other.subscribed == subscribed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverImgUrl,description,playCount,trackCount,const DeepCollectionEquality().hash(tracks),const DeepCollectionEquality().hash(trackIds),creator,createTime,updateTime,subscribedCount,commentCount,const DeepCollectionEquality().hash(tags),privacy,subscribed);

@override
String toString() {
  return 'CloudMusicPlaylistDetailData(id: $id, name: $name, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, tracks: $tracks, trackIds: $trackIds, creator: $creator, createTime: $createTime, updateTime: $updateTime, subscribedCount: $subscribedCount, commentCount: $commentCount, tags: $tags, privacy: $privacy, subscribed: $subscribed)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPlaylistDetailDataCopyWith<$Res>  {
  factory $CloudMusicPlaylistDetailDataCopyWith(CloudMusicPlaylistDetailData value, $Res Function(CloudMusicPlaylistDetailData) _then) = _$CloudMusicPlaylistDetailDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? coverImgUrl, String? description, int? playCount, int? trackCount, List<CloudMusicSong>? tracks, List<CloudMusicTrackId>? trackIds, CloudMusicUser? creator, int? createTime, int? updateTime, int? subscribedCount, int? commentCount, List<String>? tags, int? privacy, bool? subscribed
});


$CloudMusicUserCopyWith<$Res>? get creator;

}
/// @nodoc
class _$CloudMusicPlaylistDetailDataCopyWithImpl<$Res>
    implements $CloudMusicPlaylistDetailDataCopyWith<$Res> {
  _$CloudMusicPlaylistDetailDataCopyWithImpl(this._self, this._then);

  final CloudMusicPlaylistDetailData _self;
  final $Res Function(CloudMusicPlaylistDetailData) _then;

/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? tracks = freezed,Object? trackIds = freezed,Object? creator = freezed,Object? createTime = freezed,Object? updateTime = freezed,Object? subscribedCount = freezed,Object? commentCount = freezed,Object? tags = freezed,Object? privacy = freezed,Object? subscribed = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSong>?,trackIds: freezed == trackIds ? _self.trackIds : trackIds // ignore: cast_nullable_to_non_nullable
as List<CloudMusicTrackId>?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUser?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,updateTime: freezed == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int?,subscribedCount: freezed == subscribedCount ? _self.subscribedCount : subscribedCount // ignore: cast_nullable_to_non_nullable
as int?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,subscribed: freezed == subscribed ? _self.subscribed : subscribed // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicUserCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CloudMusicUserCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicPlaylistDetailData].
extension CloudMusicPlaylistDetailDataPatterns on CloudMusicPlaylistDetailData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicPlaylistDetailData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicPlaylistDetailData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicPlaylistDetailData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  List<CloudMusicSong>? tracks,  List<CloudMusicTrackId>? trackIds,  CloudMusicUser? creator,  int? createTime,  int? updateTime,  int? subscribedCount,  int? commentCount,  List<String>? tags,  int? privacy,  bool? subscribed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData() when $default != null:
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.tracks,_that.trackIds,_that.creator,_that.createTime,_that.updateTime,_that.subscribedCount,_that.commentCount,_that.tags,_that.privacy,_that.subscribed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  List<CloudMusicSong>? tracks,  List<CloudMusicTrackId>? trackIds,  CloudMusicUser? creator,  int? createTime,  int? updateTime,  int? subscribedCount,  int? commentCount,  List<String>? tags,  int? privacy,  bool? subscribed)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData():
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.tracks,_that.trackIds,_that.creator,_that.createTime,_that.updateTime,_that.subscribedCount,_that.commentCount,_that.tags,_that.privacy,_that.subscribed);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  List<CloudMusicSong>? tracks,  List<CloudMusicTrackId>? trackIds,  CloudMusicUser? creator,  int? createTime,  int? updateTime,  int? subscribedCount,  int? commentCount,  List<String>? tags,  int? privacy,  bool? subscribed)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData() when $default != null:
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.tracks,_that.trackIds,_that.creator,_that.createTime,_that.updateTime,_that.subscribedCount,_that.commentCount,_that.tags,_that.privacy,_that.subscribed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPlaylistDetailData extends CloudMusicPlaylistDetailData {
  const _CloudMusicPlaylistDetailData({required this.id, required this.name, this.coverImgUrl, this.description, this.playCount, this.trackCount, final  List<CloudMusicSong>? tracks, final  List<CloudMusicTrackId>? trackIds, this.creator, this.createTime, this.updateTime, this.subscribedCount, this.commentCount, final  List<String>? tags, this.privacy, this.subscribed}): _tracks = tracks,_trackIds = trackIds,_tags = tags,super._();
  factory _CloudMusicPlaylistDetailData.fromJson(Map<String, dynamic> json) => _$CloudMusicPlaylistDetailDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? coverImgUrl;
@override final  String? description;
@override final  int? playCount;
@override final  int? trackCount;
 final  List<CloudMusicSong>? _tracks;
@override List<CloudMusicSong>? get tracks {
  final value = _tracks;
  if (value == null) return null;
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CloudMusicTrackId>? _trackIds;
@override List<CloudMusicTrackId>? get trackIds {
  final value = _trackIds;
  if (value == null) return null;
  if (_trackIds is EqualUnmodifiableListView) return _trackIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CloudMusicUser? creator;
@override final  int? createTime;
@override final  int? updateTime;
@override final  int? subscribedCount;
@override final  int? commentCount;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? privacy;
@override final  bool? subscribed;

/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicPlaylistDetailDataCopyWith<_CloudMusicPlaylistDetailData> get copyWith => __$CloudMusicPlaylistDetailDataCopyWithImpl<_CloudMusicPlaylistDetailData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicPlaylistDetailDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPlaylistDetailData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._trackIds, _trackIds)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.subscribedCount, subscribedCount) || other.subscribedCount == subscribedCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.subscribed, subscribed) || other.subscribed == subscribed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverImgUrl,description,playCount,trackCount,const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_trackIds),creator,createTime,updateTime,subscribedCount,commentCount,const DeepCollectionEquality().hash(_tags),privacy,subscribed);

@override
String toString() {
  return 'CloudMusicPlaylistDetailData(id: $id, name: $name, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, tracks: $tracks, trackIds: $trackIds, creator: $creator, createTime: $createTime, updateTime: $updateTime, subscribedCount: $subscribedCount, commentCount: $commentCount, tags: $tags, privacy: $privacy, subscribed: $subscribed)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPlaylistDetailDataCopyWith<$Res> implements $CloudMusicPlaylistDetailDataCopyWith<$Res> {
  factory _$CloudMusicPlaylistDetailDataCopyWith(_CloudMusicPlaylistDetailData value, $Res Function(_CloudMusicPlaylistDetailData) _then) = __$CloudMusicPlaylistDetailDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? coverImgUrl, String? description, int? playCount, int? trackCount, List<CloudMusicSong>? tracks, List<CloudMusicTrackId>? trackIds, CloudMusicUser? creator, int? createTime, int? updateTime, int? subscribedCount, int? commentCount, List<String>? tags, int? privacy, bool? subscribed
});


@override $CloudMusicUserCopyWith<$Res>? get creator;

}
/// @nodoc
class __$CloudMusicPlaylistDetailDataCopyWithImpl<$Res>
    implements _$CloudMusicPlaylistDetailDataCopyWith<$Res> {
  __$CloudMusicPlaylistDetailDataCopyWithImpl(this._self, this._then);

  final _CloudMusicPlaylistDetailData _self;
  final $Res Function(_CloudMusicPlaylistDetailData) _then;

/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? tracks = freezed,Object? trackIds = freezed,Object? creator = freezed,Object? createTime = freezed,Object? updateTime = freezed,Object? subscribedCount = freezed,Object? commentCount = freezed,Object? tags = freezed,Object? privacy = freezed,Object? subscribed = freezed,}) {
  return _then(_CloudMusicPlaylistDetailData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSong>?,trackIds: freezed == trackIds ? _self._trackIds : trackIds // ignore: cast_nullable_to_non_nullable
as List<CloudMusicTrackId>?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUser?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,updateTime: freezed == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int?,subscribedCount: freezed == subscribedCount ? _self.subscribedCount : subscribedCount // ignore: cast_nullable_to_non_nullable
as int?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,subscribed: freezed == subscribed ? _self.subscribed : subscribed // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicUserCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CloudMusicUserCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicTrackId {

 int get id; int? get v; int? get alg; int? get uid;
/// Create a copy of CloudMusicTrackId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicTrackIdCopyWith<CloudMusicTrackId> get copyWith => _$CloudMusicTrackIdCopyWithImpl<CloudMusicTrackId>(this as CloudMusicTrackId, _$identity);

  /// Serializes this CloudMusicTrackId to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicTrackId&&(identical(other.id, id) || other.id == id)&&(identical(other.v, v) || other.v == v)&&(identical(other.alg, alg) || other.alg == alg)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,v,alg,uid);

@override
String toString() {
  return 'CloudMusicTrackId(id: $id, v: $v, alg: $alg, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $CloudMusicTrackIdCopyWith<$Res>  {
  factory $CloudMusicTrackIdCopyWith(CloudMusicTrackId value, $Res Function(CloudMusicTrackId) _then) = _$CloudMusicTrackIdCopyWithImpl;
@useResult
$Res call({
 int id, int? v, int? alg, int? uid
});




}
/// @nodoc
class _$CloudMusicTrackIdCopyWithImpl<$Res>
    implements $CloudMusicTrackIdCopyWith<$Res> {
  _$CloudMusicTrackIdCopyWithImpl(this._self, this._then);

  final CloudMusicTrackId _self;
  final $Res Function(CloudMusicTrackId) _then;

/// Create a copy of CloudMusicTrackId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? v = freezed,Object? alg = freezed,Object? uid = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,alg: freezed == alg ? _self.alg : alg // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicTrackId].
extension CloudMusicTrackIdPatterns on CloudMusicTrackId {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicTrackId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicTrackId() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicTrackId value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicTrackId():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicTrackId value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicTrackId() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? v,  int? alg,  int? uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicTrackId() when $default != null:
return $default(_that.id,_that.v,_that.alg,_that.uid);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? v,  int? alg,  int? uid)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicTrackId():
return $default(_that.id,_that.v,_that.alg,_that.uid);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? v,  int? alg,  int? uid)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicTrackId() when $default != null:
return $default(_that.id,_that.v,_that.alg,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicTrackId extends CloudMusicTrackId {
  const _CloudMusicTrackId({required this.id, this.v, this.alg, this.uid}): super._();
  factory _CloudMusicTrackId.fromJson(Map<String, dynamic> json) => _$CloudMusicTrackIdFromJson(json);

@override final  int id;
@override final  int? v;
@override final  int? alg;
@override final  int? uid;

/// Create a copy of CloudMusicTrackId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicTrackIdCopyWith<_CloudMusicTrackId> get copyWith => __$CloudMusicTrackIdCopyWithImpl<_CloudMusicTrackId>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicTrackIdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicTrackId&&(identical(other.id, id) || other.id == id)&&(identical(other.v, v) || other.v == v)&&(identical(other.alg, alg) || other.alg == alg)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,v,alg,uid);

@override
String toString() {
  return 'CloudMusicTrackId(id: $id, v: $v, alg: $alg, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicTrackIdCopyWith<$Res> implements $CloudMusicTrackIdCopyWith<$Res> {
  factory _$CloudMusicTrackIdCopyWith(_CloudMusicTrackId value, $Res Function(_CloudMusicTrackId) _then) = __$CloudMusicTrackIdCopyWithImpl;
@override @useResult
$Res call({
 int id, int? v, int? alg, int? uid
});




}
/// @nodoc
class __$CloudMusicTrackIdCopyWithImpl<$Res>
    implements _$CloudMusicTrackIdCopyWith<$Res> {
  __$CloudMusicTrackIdCopyWithImpl(this._self, this._then);

  final _CloudMusicTrackId _self;
  final $Res Function(_CloudMusicTrackId) _then;

/// Create a copy of CloudMusicTrackId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? v = freezed,Object? alg = freezed,Object? uid = freezed,}) {
  return _then(_CloudMusicTrackId(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,alg: freezed == alg ? _self.alg : alg // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicSongDetailResponse {

 List<CloudMusicSong> get songs; List<CloudMusicPrivilege>? get privileges;
/// Create a copy of CloudMusicSongDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicSongDetailResponseCopyWith<CloudMusicSongDetailResponse> get copyWith => _$CloudMusicSongDetailResponseCopyWithImpl<CloudMusicSongDetailResponse>(this as CloudMusicSongDetailResponse, _$identity);

  /// Serializes this CloudMusicSongDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicSongDetailResponse&&const DeepCollectionEquality().equals(other.songs, songs)&&const DeepCollectionEquality().equals(other.privileges, privileges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(songs),const DeepCollectionEquality().hash(privileges));

@override
String toString() {
  return 'CloudMusicSongDetailResponse(songs: $songs, privileges: $privileges)';
}


}

/// @nodoc
abstract mixin class $CloudMusicSongDetailResponseCopyWith<$Res>  {
  factory $CloudMusicSongDetailResponseCopyWith(CloudMusicSongDetailResponse value, $Res Function(CloudMusicSongDetailResponse) _then) = _$CloudMusicSongDetailResponseCopyWithImpl;
@useResult
$Res call({
 List<CloudMusicSong> songs, List<CloudMusicPrivilege>? privileges
});




}
/// @nodoc
class _$CloudMusicSongDetailResponseCopyWithImpl<$Res>
    implements $CloudMusicSongDetailResponseCopyWith<$Res> {
  _$CloudMusicSongDetailResponseCopyWithImpl(this._self, this._then);

  final CloudMusicSongDetailResponse _self;
  final $Res Function(CloudMusicSongDetailResponse) _then;

/// Create a copy of CloudMusicSongDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? songs = null,Object? privileges = freezed,}) {
  return _then(_self.copyWith(
songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSong>,privileges: freezed == privileges ? _self.privileges : privileges // ignore: cast_nullable_to_non_nullable
as List<CloudMusicPrivilege>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicSongDetailResponse].
extension CloudMusicSongDetailResponsePatterns on CloudMusicSongDetailResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicSongDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicSongDetailResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicSongDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicSongDetailResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicSongDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicSongDetailResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CloudMusicSong> songs,  List<CloudMusicPrivilege>? privileges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicSongDetailResponse() when $default != null:
return $default(_that.songs,_that.privileges);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CloudMusicSong> songs,  List<CloudMusicPrivilege>? privileges)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicSongDetailResponse():
return $default(_that.songs,_that.privileges);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CloudMusicSong> songs,  List<CloudMusicPrivilege>? privileges)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicSongDetailResponse() when $default != null:
return $default(_that.songs,_that.privileges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicSongDetailResponse extends CloudMusicSongDetailResponse {
  const _CloudMusicSongDetailResponse({required final  List<CloudMusicSong> songs, final  List<CloudMusicPrivilege>? privileges}): _songs = songs,_privileges = privileges,super._();
  factory _CloudMusicSongDetailResponse.fromJson(Map<String, dynamic> json) => _$CloudMusicSongDetailResponseFromJson(json);

 final  List<CloudMusicSong> _songs;
@override List<CloudMusicSong> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

 final  List<CloudMusicPrivilege>? _privileges;
@override List<CloudMusicPrivilege>? get privileges {
  final value = _privileges;
  if (value == null) return null;
  if (_privileges is EqualUnmodifiableListView) return _privileges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CloudMusicSongDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicSongDetailResponseCopyWith<_CloudMusicSongDetailResponse> get copyWith => __$CloudMusicSongDetailResponseCopyWithImpl<_CloudMusicSongDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicSongDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicSongDetailResponse&&const DeepCollectionEquality().equals(other._songs, _songs)&&const DeepCollectionEquality().equals(other._privileges, _privileges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs),const DeepCollectionEquality().hash(_privileges));

@override
String toString() {
  return 'CloudMusicSongDetailResponse(songs: $songs, privileges: $privileges)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicSongDetailResponseCopyWith<$Res> implements $CloudMusicSongDetailResponseCopyWith<$Res> {
  factory _$CloudMusicSongDetailResponseCopyWith(_CloudMusicSongDetailResponse value, $Res Function(_CloudMusicSongDetailResponse) _then) = __$CloudMusicSongDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 List<CloudMusicSong> songs, List<CloudMusicPrivilege>? privileges
});




}
/// @nodoc
class __$CloudMusicSongDetailResponseCopyWithImpl<$Res>
    implements _$CloudMusicSongDetailResponseCopyWith<$Res> {
  __$CloudMusicSongDetailResponseCopyWithImpl(this._self, this._then);

  final _CloudMusicSongDetailResponse _self;
  final $Res Function(_CloudMusicSongDetailResponse) _then;

/// Create a copy of CloudMusicSongDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? songs = null,Object? privileges = freezed,}) {
  return _then(_CloudMusicSongDetailResponse(
songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSong>,privileges: freezed == privileges ? _self._privileges : privileges // ignore: cast_nullable_to_non_nullable
as List<CloudMusicPrivilege>?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicPrivilege {

 int get id; int? get fee; int? get payed; int? get st; int? get pl; int? get dl; int? get sp; int? get cp; int? get subp; bool? get cs; int? get maxbr; int? get fl; bool? get toast; int? get flag;
/// Create a copy of CloudMusicPrivilege
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPrivilegeCopyWith<CloudMusicPrivilege> get copyWith => _$CloudMusicPrivilegeCopyWithImpl<CloudMusicPrivilege>(this as CloudMusicPrivilege, _$identity);

  /// Serializes this CloudMusicPrivilege to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPrivilege&&(identical(other.id, id) || other.id == id)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.payed, payed) || other.payed == payed)&&(identical(other.st, st) || other.st == st)&&(identical(other.pl, pl) || other.pl == pl)&&(identical(other.dl, dl) || other.dl == dl)&&(identical(other.sp, sp) || other.sp == sp)&&(identical(other.cp, cp) || other.cp == cp)&&(identical(other.subp, subp) || other.subp == subp)&&(identical(other.cs, cs) || other.cs == cs)&&(identical(other.maxbr, maxbr) || other.maxbr == maxbr)&&(identical(other.fl, fl) || other.fl == fl)&&(identical(other.toast, toast) || other.toast == toast)&&(identical(other.flag, flag) || other.flag == flag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fee,payed,st,pl,dl,sp,cp,subp,cs,maxbr,fl,toast,flag);

@override
String toString() {
  return 'CloudMusicPrivilege(id: $id, fee: $fee, payed: $payed, st: $st, pl: $pl, dl: $dl, sp: $sp, cp: $cp, subp: $subp, cs: $cs, maxbr: $maxbr, fl: $fl, toast: $toast, flag: $flag)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPrivilegeCopyWith<$Res>  {
  factory $CloudMusicPrivilegeCopyWith(CloudMusicPrivilege value, $Res Function(CloudMusicPrivilege) _then) = _$CloudMusicPrivilegeCopyWithImpl;
@useResult
$Res call({
 int id, int? fee, int? payed, int? st, int? pl, int? dl, int? sp, int? cp, int? subp, bool? cs, int? maxbr, int? fl, bool? toast, int? flag
});




}
/// @nodoc
class _$CloudMusicPrivilegeCopyWithImpl<$Res>
    implements $CloudMusicPrivilegeCopyWith<$Res> {
  _$CloudMusicPrivilegeCopyWithImpl(this._self, this._then);

  final CloudMusicPrivilege _self;
  final $Res Function(CloudMusicPrivilege) _then;

/// Create a copy of CloudMusicPrivilege
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fee = freezed,Object? payed = freezed,Object? st = freezed,Object? pl = freezed,Object? dl = freezed,Object? sp = freezed,Object? cp = freezed,Object? subp = freezed,Object? cs = freezed,Object? maxbr = freezed,Object? fl = freezed,Object? toast = freezed,Object? flag = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int?,payed: freezed == payed ? _self.payed : payed // ignore: cast_nullable_to_non_nullable
as int?,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as int?,pl: freezed == pl ? _self.pl : pl // ignore: cast_nullable_to_non_nullable
as int?,dl: freezed == dl ? _self.dl : dl // ignore: cast_nullable_to_non_nullable
as int?,sp: freezed == sp ? _self.sp : sp // ignore: cast_nullable_to_non_nullable
as int?,cp: freezed == cp ? _self.cp : cp // ignore: cast_nullable_to_non_nullable
as int?,subp: freezed == subp ? _self.subp : subp // ignore: cast_nullable_to_non_nullable
as int?,cs: freezed == cs ? _self.cs : cs // ignore: cast_nullable_to_non_nullable
as bool?,maxbr: freezed == maxbr ? _self.maxbr : maxbr // ignore: cast_nullable_to_non_nullable
as int?,fl: freezed == fl ? _self.fl : fl // ignore: cast_nullable_to_non_nullable
as int?,toast: freezed == toast ? _self.toast : toast // ignore: cast_nullable_to_non_nullable
as bool?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicPrivilege].
extension CloudMusicPrivilegePatterns on CloudMusicPrivilege {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicPrivilege value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicPrivilege() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicPrivilege value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPrivilege():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicPrivilege value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPrivilege() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? fee,  int? payed,  int? st,  int? pl,  int? dl,  int? sp,  int? cp,  int? subp,  bool? cs,  int? maxbr,  int? fl,  bool? toast,  int? flag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicPrivilege() when $default != null:
return $default(_that.id,_that.fee,_that.payed,_that.st,_that.pl,_that.dl,_that.sp,_that.cp,_that.subp,_that.cs,_that.maxbr,_that.fl,_that.toast,_that.flag);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? fee,  int? payed,  int? st,  int? pl,  int? dl,  int? sp,  int? cp,  int? subp,  bool? cs,  int? maxbr,  int? fl,  bool? toast,  int? flag)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPrivilege():
return $default(_that.id,_that.fee,_that.payed,_that.st,_that.pl,_that.dl,_that.sp,_that.cp,_that.subp,_that.cs,_that.maxbr,_that.fl,_that.toast,_that.flag);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? fee,  int? payed,  int? st,  int? pl,  int? dl,  int? sp,  int? cp,  int? subp,  bool? cs,  int? maxbr,  int? fl,  bool? toast,  int? flag)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPrivilege() when $default != null:
return $default(_that.id,_that.fee,_that.payed,_that.st,_that.pl,_that.dl,_that.sp,_that.cp,_that.subp,_that.cs,_that.maxbr,_that.fl,_that.toast,_that.flag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPrivilege implements CloudMusicPrivilege {
  const _CloudMusicPrivilege({required this.id, this.fee, this.payed, this.st, this.pl, this.dl, this.sp, this.cp, this.subp, this.cs, this.maxbr, this.fl, this.toast, this.flag});
  factory _CloudMusicPrivilege.fromJson(Map<String, dynamic> json) => _$CloudMusicPrivilegeFromJson(json);

@override final  int id;
@override final  int? fee;
@override final  int? payed;
@override final  int? st;
@override final  int? pl;
@override final  int? dl;
@override final  int? sp;
@override final  int? cp;
@override final  int? subp;
@override final  bool? cs;
@override final  int? maxbr;
@override final  int? fl;
@override final  bool? toast;
@override final  int? flag;

/// Create a copy of CloudMusicPrivilege
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicPrivilegeCopyWith<_CloudMusicPrivilege> get copyWith => __$CloudMusicPrivilegeCopyWithImpl<_CloudMusicPrivilege>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicPrivilegeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPrivilege&&(identical(other.id, id) || other.id == id)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.payed, payed) || other.payed == payed)&&(identical(other.st, st) || other.st == st)&&(identical(other.pl, pl) || other.pl == pl)&&(identical(other.dl, dl) || other.dl == dl)&&(identical(other.sp, sp) || other.sp == sp)&&(identical(other.cp, cp) || other.cp == cp)&&(identical(other.subp, subp) || other.subp == subp)&&(identical(other.cs, cs) || other.cs == cs)&&(identical(other.maxbr, maxbr) || other.maxbr == maxbr)&&(identical(other.fl, fl) || other.fl == fl)&&(identical(other.toast, toast) || other.toast == toast)&&(identical(other.flag, flag) || other.flag == flag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fee,payed,st,pl,dl,sp,cp,subp,cs,maxbr,fl,toast,flag);

@override
String toString() {
  return 'CloudMusicPrivilege(id: $id, fee: $fee, payed: $payed, st: $st, pl: $pl, dl: $dl, sp: $sp, cp: $cp, subp: $subp, cs: $cs, maxbr: $maxbr, fl: $fl, toast: $toast, flag: $flag)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPrivilegeCopyWith<$Res> implements $CloudMusicPrivilegeCopyWith<$Res> {
  factory _$CloudMusicPrivilegeCopyWith(_CloudMusicPrivilege value, $Res Function(_CloudMusicPrivilege) _then) = __$CloudMusicPrivilegeCopyWithImpl;
@override @useResult
$Res call({
 int id, int? fee, int? payed, int? st, int? pl, int? dl, int? sp, int? cp, int? subp, bool? cs, int? maxbr, int? fl, bool? toast, int? flag
});




}
/// @nodoc
class __$CloudMusicPrivilegeCopyWithImpl<$Res>
    implements _$CloudMusicPrivilegeCopyWith<$Res> {
  __$CloudMusicPrivilegeCopyWithImpl(this._self, this._then);

  final _CloudMusicPrivilege _self;
  final $Res Function(_CloudMusicPrivilege) _then;

/// Create a copy of CloudMusicPrivilege
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fee = freezed,Object? payed = freezed,Object? st = freezed,Object? pl = freezed,Object? dl = freezed,Object? sp = freezed,Object? cp = freezed,Object? subp = freezed,Object? cs = freezed,Object? maxbr = freezed,Object? fl = freezed,Object? toast = freezed,Object? flag = freezed,}) {
  return _then(_CloudMusicPrivilege(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int?,payed: freezed == payed ? _self.payed : payed // ignore: cast_nullable_to_non_nullable
as int?,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as int?,pl: freezed == pl ? _self.pl : pl // ignore: cast_nullable_to_non_nullable
as int?,dl: freezed == dl ? _self.dl : dl // ignore: cast_nullable_to_non_nullable
as int?,sp: freezed == sp ? _self.sp : sp // ignore: cast_nullable_to_non_nullable
as int?,cp: freezed == cp ? _self.cp : cp // ignore: cast_nullable_to_non_nullable
as int?,subp: freezed == subp ? _self.subp : subp // ignore: cast_nullable_to_non_nullable
as int?,cs: freezed == cs ? _self.cs : cs // ignore: cast_nullable_to_non_nullable
as bool?,maxbr: freezed == maxbr ? _self.maxbr : maxbr // ignore: cast_nullable_to_non_nullable
as int?,fl: freezed == fl ? _self.fl : fl // ignore: cast_nullable_to_non_nullable
as int?,toast: freezed == toast ? _self.toast : toast // ignore: cast_nullable_to_non_nullable
as bool?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicUser {

 int get userId; String get nickname; String? get avatarUrl; int? get vipType; int? get createTime; String? get signature; String? get userName;
/// Create a copy of CloudMusicUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicUserCopyWith<CloudMusicUser> get copyWith => _$CloudMusicUserCopyWithImpl<CloudMusicUser>(this as CloudMusicUser, _$identity);

  /// Serializes this CloudMusicUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.vipType, vipType) || other.vipType == vipType)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,avatarUrl,vipType,createTime,signature,userName);

@override
String toString() {
  return 'CloudMusicUser(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, vipType: $vipType, createTime: $createTime, signature: $signature, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $CloudMusicUserCopyWith<$Res>  {
  factory $CloudMusicUserCopyWith(CloudMusicUser value, $Res Function(CloudMusicUser) _then) = _$CloudMusicUserCopyWithImpl;
@useResult
$Res call({
 int userId, String nickname, String? avatarUrl, int? vipType, int? createTime, String? signature, String? userName
});




}
/// @nodoc
class _$CloudMusicUserCopyWithImpl<$Res>
    implements $CloudMusicUserCopyWith<$Res> {
  _$CloudMusicUserCopyWithImpl(this._self, this._then);

  final CloudMusicUser _self;
  final $Res Function(CloudMusicUser) _then;

/// Create a copy of CloudMusicUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? nickname = null,Object? avatarUrl = freezed,Object? vipType = freezed,Object? createTime = freezed,Object? signature = freezed,Object? userName = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,vipType: freezed == vipType ? _self.vipType : vipType // ignore: cast_nullable_to_non_nullable
as int?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicUser].
extension CloudMusicUserPatterns on CloudMusicUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicUser value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicUser():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicUser value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String nickname,  String? avatarUrl,  int? vipType,  int? createTime,  String? signature,  String? userName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicUser() when $default != null:
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.vipType,_that.createTime,_that.signature,_that.userName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String nickname,  String? avatarUrl,  int? vipType,  int? createTime,  String? signature,  String? userName)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicUser():
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.vipType,_that.createTime,_that.signature,_that.userName);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String nickname,  String? avatarUrl,  int? vipType,  int? createTime,  String? signature,  String? userName)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicUser() when $default != null:
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.vipType,_that.createTime,_that.signature,_that.userName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicUser implements CloudMusicUser {
  const _CloudMusicUser({required this.userId, required this.nickname, this.avatarUrl, this.vipType, this.createTime, this.signature, this.userName});
  factory _CloudMusicUser.fromJson(Map<String, dynamic> json) => _$CloudMusicUserFromJson(json);

@override final  int userId;
@override final  String nickname;
@override final  String? avatarUrl;
@override final  int? vipType;
@override final  int? createTime;
@override final  String? signature;
@override final  String? userName;

/// Create a copy of CloudMusicUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicUserCopyWith<_CloudMusicUser> get copyWith => __$CloudMusicUserCopyWithImpl<_CloudMusicUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.vipType, vipType) || other.vipType == vipType)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,avatarUrl,vipType,createTime,signature,userName);

@override
String toString() {
  return 'CloudMusicUser(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, vipType: $vipType, createTime: $createTime, signature: $signature, userName: $userName)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicUserCopyWith<$Res> implements $CloudMusicUserCopyWith<$Res> {
  factory _$CloudMusicUserCopyWith(_CloudMusicUser value, $Res Function(_CloudMusicUser) _then) = __$CloudMusicUserCopyWithImpl;
@override @useResult
$Res call({
 int userId, String nickname, String? avatarUrl, int? vipType, int? createTime, String? signature, String? userName
});




}
/// @nodoc
class __$CloudMusicUserCopyWithImpl<$Res>
    implements _$CloudMusicUserCopyWith<$Res> {
  __$CloudMusicUserCopyWithImpl(this._self, this._then);

  final _CloudMusicUser _self;
  final $Res Function(_CloudMusicUser) _then;

/// Create a copy of CloudMusicUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? nickname = null,Object? avatarUrl = freezed,Object? vipType = freezed,Object? createTime = freezed,Object? signature = freezed,Object? userName = freezed,}) {
  return _then(_CloudMusicUser(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,vipType: freezed == vipType ? _self.vipType : vipType // ignore: cast_nullable_to_non_nullable
as int?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
