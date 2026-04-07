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

 int get id; String get name; String? get picUrl; String? get img1v1Url; int? get musicSize; int? get albumSize; String? get briefDesc; int? get trans; String? get alias;
/// Create a copy of CloudMusicArtist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicArtistCopyWith<CloudMusicArtist> get copyWith => _$CloudMusicArtistCopyWithImpl<CloudMusicArtist>(this as CloudMusicArtist, _$identity);

  /// Serializes this CloudMusicArtist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.img1v1Url, img1v1Url) || other.img1v1Url == img1v1Url)&&(identical(other.musicSize, musicSize) || other.musicSize == musicSize)&&(identical(other.albumSize, albumSize) || other.albumSize == albumSize)&&(identical(other.briefDesc, briefDesc) || other.briefDesc == briefDesc)&&(identical(other.trans, trans) || other.trans == trans)&&(identical(other.alias, alias) || other.alias == alias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,img1v1Url,musicSize,albumSize,briefDesc,trans,alias);

@override
String toString() {
  return 'CloudMusicArtist(id: $id, name: $name, picUrl: $picUrl, img1v1Url: $img1v1Url, musicSize: $musicSize, albumSize: $albumSize, briefDesc: $briefDesc, trans: $trans, alias: $alias)';
}


}

/// @nodoc
abstract mixin class $CloudMusicArtistCopyWith<$Res>  {
  factory $CloudMusicArtistCopyWith(CloudMusicArtist value, $Res Function(CloudMusicArtist) _then) = _$CloudMusicArtistCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl, String? img1v1Url, int? musicSize, int? albumSize, String? briefDesc, int? trans, String? alias
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? img1v1Url = freezed,Object? musicSize = freezed,Object? albumSize = freezed,Object? briefDesc = freezed,Object? trans = freezed,Object? alias = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,img1v1Url: freezed == img1v1Url ? _self.img1v1Url : img1v1Url // ignore: cast_nullable_to_non_nullable
as String?,musicSize: freezed == musicSize ? _self.musicSize : musicSize // ignore: cast_nullable_to_non_nullable
as int?,albumSize: freezed == albumSize ? _self.albumSize : albumSize // ignore: cast_nullable_to_non_nullable
as int?,briefDesc: freezed == briefDesc ? _self.briefDesc : briefDesc // ignore: cast_nullable_to_non_nullable
as String?,trans: freezed == trans ? _self.trans : trans // ignore: cast_nullable_to_non_nullable
as int?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? img1v1Url,  int? musicSize,  int? albumSize,  String? briefDesc,  int? trans,  String? alias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicArtist() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? img1v1Url,  int? musicSize,  int? albumSize,  String? briefDesc,  int? trans,  String? alias)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicArtist():
return $default(_that.id,_that.name,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? picUrl,  String? img1v1Url,  int? musicSize,  int? albumSize,  String? briefDesc,  int? trans,  String? alias)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicArtist() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicArtist extends CloudMusicArtist {
  const _CloudMusicArtist({required this.id, required this.name, this.picUrl, this.img1v1Url, this.musicSize, this.albumSize, this.briefDesc, this.trans, this.alias}): super._();
  factory _CloudMusicArtist.fromJson(Map<String, dynamic> json) => _$CloudMusicArtistFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;
@override final  String? img1v1Url;
@override final  int? musicSize;
@override final  int? albumSize;
@override final  String? briefDesc;
@override final  int? trans;
@override final  String? alias;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicArtist&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.img1v1Url, img1v1Url) || other.img1v1Url == img1v1Url)&&(identical(other.musicSize, musicSize) || other.musicSize == musicSize)&&(identical(other.albumSize, albumSize) || other.albumSize == albumSize)&&(identical(other.briefDesc, briefDesc) || other.briefDesc == briefDesc)&&(identical(other.trans, trans) || other.trans == trans)&&(identical(other.alias, alias) || other.alias == alias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,img1v1Url,musicSize,albumSize,briefDesc,trans,alias);

@override
String toString() {
  return 'CloudMusicArtist(id: $id, name: $name, picUrl: $picUrl, img1v1Url: $img1v1Url, musicSize: $musicSize, albumSize: $albumSize, briefDesc: $briefDesc, trans: $trans, alias: $alias)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicArtistCopyWith<$Res> implements $CloudMusicArtistCopyWith<$Res> {
  factory _$CloudMusicArtistCopyWith(_CloudMusicArtist value, $Res Function(_CloudMusicArtist) _then) = __$CloudMusicArtistCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl, String? img1v1Url, int? musicSize, int? albumSize, String? briefDesc, int? trans, String? alias
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? img1v1Url = freezed,Object? musicSize = freezed,Object? albumSize = freezed,Object? briefDesc = freezed,Object? trans = freezed,Object? alias = freezed,}) {
  return _then(_CloudMusicArtist(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,img1v1Url: freezed == img1v1Url ? _self.img1v1Url : img1v1Url // ignore: cast_nullable_to_non_nullable
as String?,musicSize: freezed == musicSize ? _self.musicSize : musicSize // ignore: cast_nullable_to_non_nullable
as int?,albumSize: freezed == albumSize ? _self.albumSize : albumSize // ignore: cast_nullable_to_non_nullable
as int?,briefDesc: freezed == briefDesc ? _self.briefDesc : briefDesc // ignore: cast_nullable_to_non_nullable
as String?,trans: freezed == trans ? _self.trans : trans // ignore: cast_nullable_to_non_nullable
as int?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,
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
mixin _$CloudMusicPlaylistDetail {

 int get id; String get name; String? get coverImgUrl; String? get description; int? get playCount; int? get trackCount; List<CloudMusicSong>? get tracks; CloudMusicUser? get creator; int? get createTime; int? get updateTime; int? get subscribedCount; int? get commentCount; List<String>? get tags; int? get privacy;
/// Create a copy of CloudMusicPlaylistDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPlaylistDetailCopyWith<CloudMusicPlaylistDetail> get copyWith => _$CloudMusicPlaylistDetailCopyWithImpl<CloudMusicPlaylistDetail>(this as CloudMusicPlaylistDetail, _$identity);

  /// Serializes this CloudMusicPlaylistDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPlaylistDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.subscribedCount, subscribedCount) || other.subscribedCount == subscribedCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverImgUrl,description,playCount,trackCount,const DeepCollectionEquality().hash(tracks),creator,createTime,updateTime,subscribedCount,commentCount,const DeepCollectionEquality().hash(tags),privacy);

@override
String toString() {
  return 'CloudMusicPlaylistDetail(id: $id, name: $name, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, tracks: $tracks, creator: $creator, createTime: $createTime, updateTime: $updateTime, subscribedCount: $subscribedCount, commentCount: $commentCount, tags: $tags, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPlaylistDetailCopyWith<$Res>  {
  factory $CloudMusicPlaylistDetailCopyWith(CloudMusicPlaylistDetail value, $Res Function(CloudMusicPlaylistDetail) _then) = _$CloudMusicPlaylistDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? coverImgUrl, String? description, int? playCount, int? trackCount, List<CloudMusicSong>? tracks, CloudMusicUser? creator, int? createTime, int? updateTime, int? subscribedCount, int? commentCount, List<String>? tags, int? privacy
});


$CloudMusicUserCopyWith<$Res>? get creator;

}
/// @nodoc
class _$CloudMusicPlaylistDetailCopyWithImpl<$Res>
    implements $CloudMusicPlaylistDetailCopyWith<$Res> {
  _$CloudMusicPlaylistDetailCopyWithImpl(this._self, this._then);

  final CloudMusicPlaylistDetail _self;
  final $Res Function(CloudMusicPlaylistDetail) _then;

/// Create a copy of CloudMusicPlaylistDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? tracks = freezed,Object? creator = freezed,Object? createTime = freezed,Object? updateTime = freezed,Object? subscribedCount = freezed,Object? commentCount = freezed,Object? tags = freezed,Object? privacy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSong>?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUser?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,updateTime: freezed == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int?,subscribedCount: freezed == subscribedCount ? _self.subscribedCount : subscribedCount // ignore: cast_nullable_to_non_nullable
as int?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CloudMusicPlaylistDetail
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


/// Adds pattern-matching-related methods to [CloudMusicPlaylistDetail].
extension CloudMusicPlaylistDetailPatterns on CloudMusicPlaylistDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicPlaylistDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicPlaylistDetail value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicPlaylistDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  List<CloudMusicSong>? tracks,  CloudMusicUser? creator,  int? createTime,  int? updateTime,  int? subscribedCount,  int? commentCount,  List<String>? tags,  int? privacy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetail() when $default != null:
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.tracks,_that.creator,_that.createTime,_that.updateTime,_that.subscribedCount,_that.commentCount,_that.tags,_that.privacy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  List<CloudMusicSong>? tracks,  CloudMusicUser? creator,  int? createTime,  int? updateTime,  int? subscribedCount,  int? commentCount,  List<String>? tags,  int? privacy)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetail():
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.tracks,_that.creator,_that.createTime,_that.updateTime,_that.subscribedCount,_that.commentCount,_that.tags,_that.privacy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  List<CloudMusicSong>? tracks,  CloudMusicUser? creator,  int? createTime,  int? updateTime,  int? subscribedCount,  int? commentCount,  List<String>? tags,  int? privacy)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetail() when $default != null:
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.tracks,_that.creator,_that.createTime,_that.updateTime,_that.subscribedCount,_that.commentCount,_that.tags,_that.privacy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPlaylistDetail extends CloudMusicPlaylistDetail {
  const _CloudMusicPlaylistDetail({required this.id, required this.name, this.coverImgUrl, this.description, this.playCount, this.trackCount, final  List<CloudMusicSong>? tracks, this.creator, this.createTime, this.updateTime, this.subscribedCount, this.commentCount, final  List<String>? tags, this.privacy}): _tracks = tracks,_tags = tags,super._();
  factory _CloudMusicPlaylistDetail.fromJson(Map<String, dynamic> json) => _$CloudMusicPlaylistDetailFromJson(json);

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

/// Create a copy of CloudMusicPlaylistDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicPlaylistDetailCopyWith<_CloudMusicPlaylistDetail> get copyWith => __$CloudMusicPlaylistDetailCopyWithImpl<_CloudMusicPlaylistDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicPlaylistDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPlaylistDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.subscribedCount, subscribedCount) || other.subscribedCount == subscribedCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverImgUrl,description,playCount,trackCount,const DeepCollectionEquality().hash(_tracks),creator,createTime,updateTime,subscribedCount,commentCount,const DeepCollectionEquality().hash(_tags),privacy);

@override
String toString() {
  return 'CloudMusicPlaylistDetail(id: $id, name: $name, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, tracks: $tracks, creator: $creator, createTime: $createTime, updateTime: $updateTime, subscribedCount: $subscribedCount, commentCount: $commentCount, tags: $tags, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPlaylistDetailCopyWith<$Res> implements $CloudMusicPlaylistDetailCopyWith<$Res> {
  factory _$CloudMusicPlaylistDetailCopyWith(_CloudMusicPlaylistDetail value, $Res Function(_CloudMusicPlaylistDetail) _then) = __$CloudMusicPlaylistDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? coverImgUrl, String? description, int? playCount, int? trackCount, List<CloudMusicSong>? tracks, CloudMusicUser? creator, int? createTime, int? updateTime, int? subscribedCount, int? commentCount, List<String>? tags, int? privacy
});


@override $CloudMusicUserCopyWith<$Res>? get creator;

}
/// @nodoc
class __$CloudMusicPlaylistDetailCopyWithImpl<$Res>
    implements _$CloudMusicPlaylistDetailCopyWith<$Res> {
  __$CloudMusicPlaylistDetailCopyWithImpl(this._self, this._then);

  final _CloudMusicPlaylistDetail _self;
  final $Res Function(_CloudMusicPlaylistDetail) _then;

/// Create a copy of CloudMusicPlaylistDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? tracks = freezed,Object? creator = freezed,Object? createTime = freezed,Object? updateTime = freezed,Object? subscribedCount = freezed,Object? commentCount = freezed,Object? tags = freezed,Object? privacy = freezed,}) {
  return _then(_CloudMusicPlaylistDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSong>?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUser?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,updateTime: freezed == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as int?,subscribedCount: freezed == subscribedCount ? _self.subscribedCount : subscribedCount // ignore: cast_nullable_to_non_nullable
as int?,commentCount: freezed == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CloudMusicPlaylistDetail
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
mixin _$CloudMusicUser {

 int? get userId; String? get nickname; String? get avatarUrl; String? get signature; String? get backgroundUrl;
/// Create a copy of CloudMusicUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicUserCopyWith<CloudMusicUser> get copyWith => _$CloudMusicUserCopyWithImpl<CloudMusicUser>(this as CloudMusicUser, _$identity);

  /// Serializes this CloudMusicUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.backgroundUrl, backgroundUrl) || other.backgroundUrl == backgroundUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,avatarUrl,signature,backgroundUrl);

@override
String toString() {
  return 'CloudMusicUser(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, signature: $signature, backgroundUrl: $backgroundUrl)';
}


}

/// @nodoc
abstract mixin class $CloudMusicUserCopyWith<$Res>  {
  factory $CloudMusicUserCopyWith(CloudMusicUser value, $Res Function(CloudMusicUser) _then) = _$CloudMusicUserCopyWithImpl;
@useResult
$Res call({
 int? userId, String? nickname, String? avatarUrl, String? signature, String? backgroundUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? nickname = freezed,Object? avatarUrl = freezed,Object? signature = freezed,Object? backgroundUrl = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,backgroundUrl: freezed == backgroundUrl ? _self.backgroundUrl : backgroundUrl // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? userId,  String? nickname,  String? avatarUrl,  String? signature,  String? backgroundUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicUser() when $default != null:
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.signature,_that.backgroundUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? userId,  String? nickname,  String? avatarUrl,  String? signature,  String? backgroundUrl)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicUser():
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.signature,_that.backgroundUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? userId,  String? nickname,  String? avatarUrl,  String? signature,  String? backgroundUrl)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicUser() when $default != null:
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.signature,_that.backgroundUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicUser implements CloudMusicUser {
  const _CloudMusicUser({this.userId, this.nickname, this.avatarUrl, this.signature, this.backgroundUrl});
  factory _CloudMusicUser.fromJson(Map<String, dynamic> json) => _$CloudMusicUserFromJson(json);

@override final  int? userId;
@override final  String? nickname;
@override final  String? avatarUrl;
@override final  String? signature;
@override final  String? backgroundUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.backgroundUrl, backgroundUrl) || other.backgroundUrl == backgroundUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,avatarUrl,signature,backgroundUrl);

@override
String toString() {
  return 'CloudMusicUser(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, signature: $signature, backgroundUrl: $backgroundUrl)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicUserCopyWith<$Res> implements $CloudMusicUserCopyWith<$Res> {
  factory _$CloudMusicUserCopyWith(_CloudMusicUser value, $Res Function(_CloudMusicUser) _then) = __$CloudMusicUserCopyWithImpl;
@override @useResult
$Res call({
 int? userId, String? nickname, String? avatarUrl, String? signature, String? backgroundUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? nickname = freezed,Object? avatarUrl = freezed,Object? signature = freezed,Object? backgroundUrl = freezed,}) {
  return _then(_CloudMusicUser(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,backgroundUrl: freezed == backgroundUrl ? _self.backgroundUrl : backgroundUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicTopArtistsResponse {

 CloudMusicArtistList get list;
/// Create a copy of CloudMusicTopArtistsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicTopArtistsResponseCopyWith<CloudMusicTopArtistsResponse> get copyWith => _$CloudMusicTopArtistsResponseCopyWithImpl<CloudMusicTopArtistsResponse>(this as CloudMusicTopArtistsResponse, _$identity);

  /// Serializes this CloudMusicTopArtistsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicTopArtistsResponse&&(identical(other.list, list) || other.list == list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,list);

@override
String toString() {
  return 'CloudMusicTopArtistsResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class $CloudMusicTopArtistsResponseCopyWith<$Res>  {
  factory $CloudMusicTopArtistsResponseCopyWith(CloudMusicTopArtistsResponse value, $Res Function(CloudMusicTopArtistsResponse) _then) = _$CloudMusicTopArtistsResponseCopyWithImpl;
@useResult
$Res call({
 CloudMusicArtistList list
});


$CloudMusicArtistListCopyWith<$Res> get list;

}
/// @nodoc
class _$CloudMusicTopArtistsResponseCopyWithImpl<$Res>
    implements $CloudMusicTopArtistsResponseCopyWith<$Res> {
  _$CloudMusicTopArtistsResponseCopyWithImpl(this._self, this._then);

  final CloudMusicTopArtistsResponse _self;
  final $Res Function(CloudMusicTopArtistsResponse) _then;

/// Create a copy of CloudMusicTopArtistsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as CloudMusicArtistList,
  ));
}
/// Create a copy of CloudMusicTopArtistsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicArtistListCopyWith<$Res> get list {
  
  return $CloudMusicArtistListCopyWith<$Res>(_self.list, (value) {
    return _then(_self.copyWith(list: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicTopArtistsResponse].
extension CloudMusicTopArtistsResponsePatterns on CloudMusicTopArtistsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicTopArtistsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicTopArtistsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicTopArtistsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicTopArtistsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicTopArtistsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicTopArtistsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CloudMusicArtistList list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicTopArtistsResponse() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CloudMusicArtistList list)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicTopArtistsResponse():
return $default(_that.list);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CloudMusicArtistList list)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicTopArtistsResponse() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicTopArtistsResponse implements CloudMusicTopArtistsResponse {
  const _CloudMusicTopArtistsResponse({required this.list});
  factory _CloudMusicTopArtistsResponse.fromJson(Map<String, dynamic> json) => _$CloudMusicTopArtistsResponseFromJson(json);

@override final  CloudMusicArtistList list;

/// Create a copy of CloudMusicTopArtistsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicTopArtistsResponseCopyWith<_CloudMusicTopArtistsResponse> get copyWith => __$CloudMusicTopArtistsResponseCopyWithImpl<_CloudMusicTopArtistsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicTopArtistsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicTopArtistsResponse&&(identical(other.list, list) || other.list == list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,list);

@override
String toString() {
  return 'CloudMusicTopArtistsResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicTopArtistsResponseCopyWith<$Res> implements $CloudMusicTopArtistsResponseCopyWith<$Res> {
  factory _$CloudMusicTopArtistsResponseCopyWith(_CloudMusicTopArtistsResponse value, $Res Function(_CloudMusicTopArtistsResponse) _then) = __$CloudMusicTopArtistsResponseCopyWithImpl;
@override @useResult
$Res call({
 CloudMusicArtistList list
});


@override $CloudMusicArtistListCopyWith<$Res> get list;

}
/// @nodoc
class __$CloudMusicTopArtistsResponseCopyWithImpl<$Res>
    implements _$CloudMusicTopArtistsResponseCopyWith<$Res> {
  __$CloudMusicTopArtistsResponseCopyWithImpl(this._self, this._then);

  final _CloudMusicTopArtistsResponse _self;
  final $Res Function(_CloudMusicTopArtistsResponse) _then;

/// Create a copy of CloudMusicTopArtistsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_CloudMusicTopArtistsResponse(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as CloudMusicArtistList,
  ));
}

/// Create a copy of CloudMusicTopArtistsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicArtistListCopyWith<$Res> get list {
  
  return $CloudMusicArtistListCopyWith<$Res>(_self.list, (value) {
    return _then(_self.copyWith(list: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicArtistList {

 List<CloudMusicArtist> get artists;
/// Create a copy of CloudMusicArtistList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicArtistListCopyWith<CloudMusicArtistList> get copyWith => _$CloudMusicArtistListCopyWithImpl<CloudMusicArtistList>(this as CloudMusicArtistList, _$identity);

  /// Serializes this CloudMusicArtistList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicArtistList&&const DeepCollectionEquality().equals(other.artists, artists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(artists));

@override
String toString() {
  return 'CloudMusicArtistList(artists: $artists)';
}


}

/// @nodoc
abstract mixin class $CloudMusicArtistListCopyWith<$Res>  {
  factory $CloudMusicArtistListCopyWith(CloudMusicArtistList value, $Res Function(CloudMusicArtistList) _then) = _$CloudMusicArtistListCopyWithImpl;
@useResult
$Res call({
 List<CloudMusicArtist> artists
});




}
/// @nodoc
class _$CloudMusicArtistListCopyWithImpl<$Res>
    implements $CloudMusicArtistListCopyWith<$Res> {
  _$CloudMusicArtistListCopyWithImpl(this._self, this._then);

  final CloudMusicArtistList _self;
  final $Res Function(CloudMusicArtistList) _then;

/// Create a copy of CloudMusicArtistList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artists = null,}) {
  return _then(_self.copyWith(
artists: null == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicArtistList].
extension CloudMusicArtistListPatterns on CloudMusicArtistList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicArtistList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicArtistList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicArtistList value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicArtistList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicArtistList value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicArtistList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CloudMusicArtist> artists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicArtistList() when $default != null:
return $default(_that.artists);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CloudMusicArtist> artists)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicArtistList():
return $default(_that.artists);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CloudMusicArtist> artists)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicArtistList() when $default != null:
return $default(_that.artists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicArtistList implements CloudMusicArtistList {
  const _CloudMusicArtistList({required final  List<CloudMusicArtist> artists}): _artists = artists;
  factory _CloudMusicArtistList.fromJson(Map<String, dynamic> json) => _$CloudMusicArtistListFromJson(json);

 final  List<CloudMusicArtist> _artists;
@override List<CloudMusicArtist> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}


/// Create a copy of CloudMusicArtistList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicArtistListCopyWith<_CloudMusicArtistList> get copyWith => __$CloudMusicArtistListCopyWithImpl<_CloudMusicArtistList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicArtistListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicArtistList&&const DeepCollectionEquality().equals(other._artists, _artists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_artists));

@override
String toString() {
  return 'CloudMusicArtistList(artists: $artists)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicArtistListCopyWith<$Res> implements $CloudMusicArtistListCopyWith<$Res> {
  factory _$CloudMusicArtistListCopyWith(_CloudMusicArtistList value, $Res Function(_CloudMusicArtistList) _then) = __$CloudMusicArtistListCopyWithImpl;
@override @useResult
$Res call({
 List<CloudMusicArtist> artists
});




}
/// @nodoc
class __$CloudMusicArtistListCopyWithImpl<$Res>
    implements _$CloudMusicArtistListCopyWith<$Res> {
  __$CloudMusicArtistListCopyWithImpl(this._self, this._then);

  final _CloudMusicArtistList _self;
  final $Res Function(_CloudMusicArtistList) _then;

/// Create a copy of CloudMusicArtistList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artists = null,}) {
  return _then(_CloudMusicArtistList(
artists: null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>,
  ));
}


}


/// @nodoc
mixin _$CloudMusicNewAlbumsResponse {

 List<CloudMusicAlbum> get albums;
/// Create a copy of CloudMusicNewAlbumsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicNewAlbumsResponseCopyWith<CloudMusicNewAlbumsResponse> get copyWith => _$CloudMusicNewAlbumsResponseCopyWithImpl<CloudMusicNewAlbumsResponse>(this as CloudMusicNewAlbumsResponse, _$identity);

  /// Serializes this CloudMusicNewAlbumsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicNewAlbumsResponse&&const DeepCollectionEquality().equals(other.albums, albums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(albums));

@override
String toString() {
  return 'CloudMusicNewAlbumsResponse(albums: $albums)';
}


}

/// @nodoc
abstract mixin class $CloudMusicNewAlbumsResponseCopyWith<$Res>  {
  factory $CloudMusicNewAlbumsResponseCopyWith(CloudMusicNewAlbumsResponse value, $Res Function(CloudMusicNewAlbumsResponse) _then) = _$CloudMusicNewAlbumsResponseCopyWithImpl;
@useResult
$Res call({
 List<CloudMusicAlbum> albums
});




}
/// @nodoc
class _$CloudMusicNewAlbumsResponseCopyWithImpl<$Res>
    implements $CloudMusicNewAlbumsResponseCopyWith<$Res> {
  _$CloudMusicNewAlbumsResponseCopyWithImpl(this._self, this._then);

  final CloudMusicNewAlbumsResponse _self;
  final $Res Function(CloudMusicNewAlbumsResponse) _then;

/// Create a copy of CloudMusicNewAlbumsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? albums = null,}) {
  return _then(_self.copyWith(
albums: null == albums ? _self.albums : albums // ignore: cast_nullable_to_non_nullable
as List<CloudMusicAlbum>,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicNewAlbumsResponse].
extension CloudMusicNewAlbumsResponsePatterns on CloudMusicNewAlbumsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicNewAlbumsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicNewAlbumsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicNewAlbumsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicNewAlbumsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicNewAlbumsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicNewAlbumsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CloudMusicAlbum> albums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicNewAlbumsResponse() when $default != null:
return $default(_that.albums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CloudMusicAlbum> albums)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicNewAlbumsResponse():
return $default(_that.albums);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CloudMusicAlbum> albums)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicNewAlbumsResponse() when $default != null:
return $default(_that.albums);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicNewAlbumsResponse implements CloudMusicNewAlbumsResponse {
  const _CloudMusicNewAlbumsResponse({required final  List<CloudMusicAlbum> albums}): _albums = albums;
  factory _CloudMusicNewAlbumsResponse.fromJson(Map<String, dynamic> json) => _$CloudMusicNewAlbumsResponseFromJson(json);

 final  List<CloudMusicAlbum> _albums;
@override List<CloudMusicAlbum> get albums {
  if (_albums is EqualUnmodifiableListView) return _albums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_albums);
}


/// Create a copy of CloudMusicNewAlbumsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicNewAlbumsResponseCopyWith<_CloudMusicNewAlbumsResponse> get copyWith => __$CloudMusicNewAlbumsResponseCopyWithImpl<_CloudMusicNewAlbumsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicNewAlbumsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicNewAlbumsResponse&&const DeepCollectionEquality().equals(other._albums, _albums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_albums));

@override
String toString() {
  return 'CloudMusicNewAlbumsResponse(albums: $albums)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicNewAlbumsResponseCopyWith<$Res> implements $CloudMusicNewAlbumsResponseCopyWith<$Res> {
  factory _$CloudMusicNewAlbumsResponseCopyWith(_CloudMusicNewAlbumsResponse value, $Res Function(_CloudMusicNewAlbumsResponse) _then) = __$CloudMusicNewAlbumsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<CloudMusicAlbum> albums
});




}
/// @nodoc
class __$CloudMusicNewAlbumsResponseCopyWithImpl<$Res>
    implements _$CloudMusicNewAlbumsResponseCopyWith<$Res> {
  __$CloudMusicNewAlbumsResponseCopyWithImpl(this._self, this._then);

  final _CloudMusicNewAlbumsResponse _self;
  final $Res Function(_CloudMusicNewAlbumsResponse) _then;

/// Create a copy of CloudMusicNewAlbumsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? albums = null,}) {
  return _then(_CloudMusicNewAlbumsResponse(
albums: null == albums ? _self._albums : albums // ignore: cast_nullable_to_non_nullable
as List<CloudMusicAlbum>,
  ));
}


}


/// @nodoc
mixin _$CloudMusicHomeData {

 List<CloudMusicPlaylist> get recommendPlaylists; List<CloudMusicAlbum> get newAlbums; List<CloudMusicPlaylist> get topLists; List<CloudMusicArtist> get topArtists;
/// Create a copy of CloudMusicHomeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicHomeDataCopyWith<CloudMusicHomeData> get copyWith => _$CloudMusicHomeDataCopyWithImpl<CloudMusicHomeData>(this as CloudMusicHomeData, _$identity);

  /// Serializes this CloudMusicHomeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicHomeData&&const DeepCollectionEquality().equals(other.recommendPlaylists, recommendPlaylists)&&const DeepCollectionEquality().equals(other.newAlbums, newAlbums)&&const DeepCollectionEquality().equals(other.topLists, topLists)&&const DeepCollectionEquality().equals(other.topArtists, topArtists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recommendPlaylists),const DeepCollectionEquality().hash(newAlbums),const DeepCollectionEquality().hash(topLists),const DeepCollectionEquality().hash(topArtists));

@override
String toString() {
  return 'CloudMusicHomeData(recommendPlaylists: $recommendPlaylists, newAlbums: $newAlbums, topLists: $topLists, topArtists: $topArtists)';
}


}

/// @nodoc
abstract mixin class $CloudMusicHomeDataCopyWith<$Res>  {
  factory $CloudMusicHomeDataCopyWith(CloudMusicHomeData value, $Res Function(CloudMusicHomeData) _then) = _$CloudMusicHomeDataCopyWithImpl;
@useResult
$Res call({
 List<CloudMusicPlaylist> recommendPlaylists, List<CloudMusicAlbum> newAlbums, List<CloudMusicPlaylist> topLists, List<CloudMusicArtist> topArtists
});




}
/// @nodoc
class _$CloudMusicHomeDataCopyWithImpl<$Res>
    implements $CloudMusicHomeDataCopyWith<$Res> {
  _$CloudMusicHomeDataCopyWithImpl(this._self, this._then);

  final CloudMusicHomeData _self;
  final $Res Function(CloudMusicHomeData) _then;

/// Create a copy of CloudMusicHomeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recommendPlaylists = null,Object? newAlbums = null,Object? topLists = null,Object? topArtists = null,}) {
  return _then(_self.copyWith(
recommendPlaylists: null == recommendPlaylists ? _self.recommendPlaylists : recommendPlaylists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicPlaylist>,newAlbums: null == newAlbums ? _self.newAlbums : newAlbums // ignore: cast_nullable_to_non_nullable
as List<CloudMusicAlbum>,topLists: null == topLists ? _self.topLists : topLists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicPlaylist>,topArtists: null == topArtists ? _self.topArtists : topArtists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicHomeData].
extension CloudMusicHomeDataPatterns on CloudMusicHomeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicHomeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicHomeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicHomeData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicHomeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicHomeData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicHomeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CloudMusicPlaylist> recommendPlaylists,  List<CloudMusicAlbum> newAlbums,  List<CloudMusicPlaylist> topLists,  List<CloudMusicArtist> topArtists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicHomeData() when $default != null:
return $default(_that.recommendPlaylists,_that.newAlbums,_that.topLists,_that.topArtists);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CloudMusicPlaylist> recommendPlaylists,  List<CloudMusicAlbum> newAlbums,  List<CloudMusicPlaylist> topLists,  List<CloudMusicArtist> topArtists)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicHomeData():
return $default(_that.recommendPlaylists,_that.newAlbums,_that.topLists,_that.topArtists);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CloudMusicPlaylist> recommendPlaylists,  List<CloudMusicAlbum> newAlbums,  List<CloudMusicPlaylist> topLists,  List<CloudMusicArtist> topArtists)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicHomeData() when $default != null:
return $default(_that.recommendPlaylists,_that.newAlbums,_that.topLists,_that.topArtists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicHomeData implements CloudMusicHomeData {
  const _CloudMusicHomeData({final  List<CloudMusicPlaylist> recommendPlaylists = const [], final  List<CloudMusicAlbum> newAlbums = const [], final  List<CloudMusicPlaylist> topLists = const [], final  List<CloudMusicArtist> topArtists = const []}): _recommendPlaylists = recommendPlaylists,_newAlbums = newAlbums,_topLists = topLists,_topArtists = topArtists;
  factory _CloudMusicHomeData.fromJson(Map<String, dynamic> json) => _$CloudMusicHomeDataFromJson(json);

 final  List<CloudMusicPlaylist> _recommendPlaylists;
@override@JsonKey() List<CloudMusicPlaylist> get recommendPlaylists {
  if (_recommendPlaylists is EqualUnmodifiableListView) return _recommendPlaylists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendPlaylists);
}

 final  List<CloudMusicAlbum> _newAlbums;
@override@JsonKey() List<CloudMusicAlbum> get newAlbums {
  if (_newAlbums is EqualUnmodifiableListView) return _newAlbums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newAlbums);
}

 final  List<CloudMusicPlaylist> _topLists;
@override@JsonKey() List<CloudMusicPlaylist> get topLists {
  if (_topLists is EqualUnmodifiableListView) return _topLists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topLists);
}

 final  List<CloudMusicArtist> _topArtists;
@override@JsonKey() List<CloudMusicArtist> get topArtists {
  if (_topArtists is EqualUnmodifiableListView) return _topArtists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topArtists);
}


/// Create a copy of CloudMusicHomeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicHomeDataCopyWith<_CloudMusicHomeData> get copyWith => __$CloudMusicHomeDataCopyWithImpl<_CloudMusicHomeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicHomeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicHomeData&&const DeepCollectionEquality().equals(other._recommendPlaylists, _recommendPlaylists)&&const DeepCollectionEquality().equals(other._newAlbums, _newAlbums)&&const DeepCollectionEquality().equals(other._topLists, _topLists)&&const DeepCollectionEquality().equals(other._topArtists, _topArtists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recommendPlaylists),const DeepCollectionEquality().hash(_newAlbums),const DeepCollectionEquality().hash(_topLists),const DeepCollectionEquality().hash(_topArtists));

@override
String toString() {
  return 'CloudMusicHomeData(recommendPlaylists: $recommendPlaylists, newAlbums: $newAlbums, topLists: $topLists, topArtists: $topArtists)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicHomeDataCopyWith<$Res> implements $CloudMusicHomeDataCopyWith<$Res> {
  factory _$CloudMusicHomeDataCopyWith(_CloudMusicHomeData value, $Res Function(_CloudMusicHomeData) _then) = __$CloudMusicHomeDataCopyWithImpl;
@override @useResult
$Res call({
 List<CloudMusicPlaylist> recommendPlaylists, List<CloudMusicAlbum> newAlbums, List<CloudMusicPlaylist> topLists, List<CloudMusicArtist> topArtists
});




}
/// @nodoc
class __$CloudMusicHomeDataCopyWithImpl<$Res>
    implements _$CloudMusicHomeDataCopyWith<$Res> {
  __$CloudMusicHomeDataCopyWithImpl(this._self, this._then);

  final _CloudMusicHomeData _self;
  final $Res Function(_CloudMusicHomeData) _then;

/// Create a copy of CloudMusicHomeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recommendPlaylists = null,Object? newAlbums = null,Object? topLists = null,Object? topArtists = null,}) {
  return _then(_CloudMusicHomeData(
recommendPlaylists: null == recommendPlaylists ? _self._recommendPlaylists : recommendPlaylists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicPlaylist>,newAlbums: null == newAlbums ? _self._newAlbums : newAlbums // ignore: cast_nullable_to_non_nullable
as List<CloudMusicAlbum>,topLists: null == topLists ? _self._topLists : topLists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicPlaylist>,topArtists: null == topArtists ? _self._topArtists : topArtists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtist>,
  ));
}


}

// dart format on
