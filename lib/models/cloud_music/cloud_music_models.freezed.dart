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
mixin _$CloudMusicPlaylistData {

 int get id; String get name; String? get picUrl; CloudMusicUserData? get creator; String? get coverImgUrl; String? get description; int? get playCount; int? get trackCount; int? get createTime; String? get updateFrequency; String? get copywriter; int? get privacy;
/// Create a copy of CloudMusicPlaylistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPlaylistDataCopyWith<CloudMusicPlaylistData> get copyWith => _$CloudMusicPlaylistDataCopyWithImpl<CloudMusicPlaylistData>(this as CloudMusicPlaylistData, _$identity);

  /// Serializes this CloudMusicPlaylistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPlaylistData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateFrequency, updateFrequency) || other.updateFrequency == updateFrequency)&&(identical(other.copywriter, copywriter) || other.copywriter == copywriter)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,creator,coverImgUrl,description,playCount,trackCount,createTime,updateFrequency,copywriter,privacy);

@override
String toString() {
  return 'CloudMusicPlaylistData(id: $id, name: $name, picUrl: $picUrl, creator: $creator, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, createTime: $createTime, updateFrequency: $updateFrequency, copywriter: $copywriter, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPlaylistDataCopyWith<$Res>  {
  factory $CloudMusicPlaylistDataCopyWith(CloudMusicPlaylistData value, $Res Function(CloudMusicPlaylistData) _then) = _$CloudMusicPlaylistDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl, CloudMusicUserData? creator, String? coverImgUrl, String? description, int? playCount, int? trackCount, int? createTime, String? updateFrequency, String? copywriter, int? privacy
});


$CloudMusicUserDataCopyWith<$Res>? get creator;

}
/// @nodoc
class _$CloudMusicPlaylistDataCopyWithImpl<$Res>
    implements $CloudMusicPlaylistDataCopyWith<$Res> {
  _$CloudMusicPlaylistDataCopyWithImpl(this._self, this._then);

  final CloudMusicPlaylistData _self;
  final $Res Function(CloudMusicPlaylistData) _then;

/// Create a copy of CloudMusicPlaylistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? creator = freezed,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? createTime = freezed,Object? updateFrequency = freezed,Object? copywriter = freezed,Object? privacy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUserData?,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,updateFrequency: freezed == updateFrequency ? _self.updateFrequency : updateFrequency // ignore: cast_nullable_to_non_nullable
as String?,copywriter: freezed == copywriter ? _self.copywriter : copywriter // ignore: cast_nullable_to_non_nullable
as String?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CloudMusicPlaylistData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicUserDataCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CloudMusicUserDataCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicPlaylistData].
extension CloudMusicPlaylistDataPatterns on CloudMusicPlaylistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicPlaylistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicPlaylistData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicPlaylistData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPlaylistData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  CloudMusicUserData? creator,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  int? createTime,  String? updateFrequency,  String? copywriter,  int? privacy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistData() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.creator,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.createTime,_that.updateFrequency,_that.copywriter,_that.privacy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  CloudMusicUserData? creator,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  int? createTime,  String? updateFrequency,  String? copywriter,  int? privacy)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistData():
return $default(_that.id,_that.name,_that.picUrl,_that.creator,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.createTime,_that.updateFrequency,_that.copywriter,_that.privacy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? picUrl,  CloudMusicUserData? creator,  String? coverImgUrl,  String? description,  int? playCount,  int? trackCount,  int? createTime,  String? updateFrequency,  String? copywriter,  int? privacy)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistData() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.creator,_that.coverImgUrl,_that.description,_that.playCount,_that.trackCount,_that.createTime,_that.updateFrequency,_that.copywriter,_that.privacy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPlaylistData extends CloudMusicPlaylistData {
  const _CloudMusicPlaylistData({required this.id, required this.name, this.picUrl, this.creator, this.coverImgUrl, this.description, this.playCount, this.trackCount, this.createTime, this.updateFrequency, this.copywriter, this.privacy}): super._();
  factory _CloudMusicPlaylistData.fromJson(Map<String, dynamic> json) => _$CloudMusicPlaylistDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;
@override final  CloudMusicUserData? creator;
@override final  String? coverImgUrl;
@override final  String? description;
@override final  int? playCount;
@override final  int? trackCount;
@override final  int? createTime;
@override final  String? updateFrequency;
@override final  String? copywriter;
@override final  int? privacy;

/// Create a copy of CloudMusicPlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicPlaylistDataCopyWith<_CloudMusicPlaylistData> get copyWith => __$CloudMusicPlaylistDataCopyWithImpl<_CloudMusicPlaylistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicPlaylistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPlaylistData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateFrequency, updateFrequency) || other.updateFrequency == updateFrequency)&&(identical(other.copywriter, copywriter) || other.copywriter == copywriter)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,creator,coverImgUrl,description,playCount,trackCount,createTime,updateFrequency,copywriter,privacy);

@override
String toString() {
  return 'CloudMusicPlaylistData(id: $id, name: $name, picUrl: $picUrl, creator: $creator, coverImgUrl: $coverImgUrl, description: $description, playCount: $playCount, trackCount: $trackCount, createTime: $createTime, updateFrequency: $updateFrequency, copywriter: $copywriter, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPlaylistDataCopyWith<$Res> implements $CloudMusicPlaylistDataCopyWith<$Res> {
  factory _$CloudMusicPlaylistDataCopyWith(_CloudMusicPlaylistData value, $Res Function(_CloudMusicPlaylistData) _then) = __$CloudMusicPlaylistDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl, CloudMusicUserData? creator, String? coverImgUrl, String? description, int? playCount, int? trackCount, int? createTime, String? updateFrequency, String? copywriter, int? privacy
});


@override $CloudMusicUserDataCopyWith<$Res>? get creator;

}
/// @nodoc
class __$CloudMusicPlaylistDataCopyWithImpl<$Res>
    implements _$CloudMusicPlaylistDataCopyWith<$Res> {
  __$CloudMusicPlaylistDataCopyWithImpl(this._self, this._then);

  final _CloudMusicPlaylistData _self;
  final $Res Function(_CloudMusicPlaylistData) _then;

/// Create a copy of CloudMusicPlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? creator = freezed,Object? coverImgUrl = freezed,Object? description = freezed,Object? playCount = freezed,Object? trackCount = freezed,Object? createTime = freezed,Object? updateFrequency = freezed,Object? copywriter = freezed,Object? privacy = freezed,}) {
  return _then(_CloudMusicPlaylistData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUserData?,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,playCount: freezed == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as int?,updateFrequency: freezed == updateFrequency ? _self.updateFrequency : updateFrequency // ignore: cast_nullable_to_non_nullable
as String?,copywriter: freezed == copywriter ? _self.copywriter : copywriter // ignore: cast_nullable_to_non_nullable
as String?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CloudMusicPlaylistData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicUserDataCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CloudMusicUserDataCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicAlbumData {

 int get id; String get name; String? get picUrl; String? get blurPicUrl; CloudMusicArtistData? get artist; List<CloudMusicArtistData>? get artists; int? get publishTime; int? get size; String? get description; String? get company; String? get type; int? get mark; int? get copyrightId;
/// Create a copy of CloudMusicAlbumData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicAlbumDataCopyWith<CloudMusicAlbumData> get copyWith => _$CloudMusicAlbumDataCopyWithImpl<CloudMusicAlbumData>(this as CloudMusicAlbumData, _$identity);

  /// Serializes this CloudMusicAlbumData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicAlbumData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.blurPicUrl, blurPicUrl) || other.blurPicUrl == blurPicUrl)&&(identical(other.artist, artist) || other.artist == artist)&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.size, size) || other.size == size)&&(identical(other.description, description) || other.description == description)&&(identical(other.company, company) || other.company == company)&&(identical(other.type, type) || other.type == type)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.copyrightId, copyrightId) || other.copyrightId == copyrightId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,blurPicUrl,artist,const DeepCollectionEquality().hash(artists),publishTime,size,description,company,type,mark,copyrightId);

@override
String toString() {
  return 'CloudMusicAlbumData(id: $id, name: $name, picUrl: $picUrl, blurPicUrl: $blurPicUrl, artist: $artist, artists: $artists, publishTime: $publishTime, size: $size, description: $description, company: $company, type: $type, mark: $mark, copyrightId: $copyrightId)';
}


}

/// @nodoc
abstract mixin class $CloudMusicAlbumDataCopyWith<$Res>  {
  factory $CloudMusicAlbumDataCopyWith(CloudMusicAlbumData value, $Res Function(CloudMusicAlbumData) _then) = _$CloudMusicAlbumDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl, String? blurPicUrl, CloudMusicArtistData? artist, List<CloudMusicArtistData>? artists, int? publishTime, int? size, String? description, String? company, String? type, int? mark, int? copyrightId
});


$CloudMusicArtistDataCopyWith<$Res>? get artist;

}
/// @nodoc
class _$CloudMusicAlbumDataCopyWithImpl<$Res>
    implements $CloudMusicAlbumDataCopyWith<$Res> {
  _$CloudMusicAlbumDataCopyWithImpl(this._self, this._then);

  final CloudMusicAlbumData _self;
  final $Res Function(CloudMusicAlbumData) _then;

/// Create a copy of CloudMusicAlbumData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? blurPicUrl = freezed,Object? artist = freezed,Object? artists = freezed,Object? publishTime = freezed,Object? size = freezed,Object? description = freezed,Object? company = freezed,Object? type = freezed,Object? mark = freezed,Object? copyrightId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,blurPicUrl: freezed == blurPicUrl ? _self.blurPicUrl : blurPicUrl // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as CloudMusicArtistData?,artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtistData>?,publishTime: freezed == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,copyrightId: freezed == copyrightId ? _self.copyrightId : copyrightId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CloudMusicAlbumData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicArtistDataCopyWith<$Res>? get artist {
    if (_self.artist == null) {
    return null;
  }

  return $CloudMusicArtistDataCopyWith<$Res>(_self.artist!, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicAlbumData].
extension CloudMusicAlbumDataPatterns on CloudMusicAlbumData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicAlbumData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicAlbumData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicAlbumData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbumData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicAlbumData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbumData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? blurPicUrl,  CloudMusicArtistData? artist,  List<CloudMusicArtistData>? artists,  int? publishTime,  int? size,  String? description,  String? company,  String? type,  int? mark,  int? copyrightId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicAlbumData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? picUrl,  String? blurPicUrl,  CloudMusicArtistData? artist,  List<CloudMusicArtistData>? artists,  int? publishTime,  int? size,  String? description,  String? company,  String? type,  int? mark,  int? copyrightId)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicAlbumData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? picUrl,  String? blurPicUrl,  CloudMusicArtistData? artist,  List<CloudMusicArtistData>? artists,  int? publishTime,  int? size,  String? description,  String? company,  String? type,  int? mark,  int? copyrightId)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicAlbumData() when $default != null:
return $default(_that.id,_that.name,_that.picUrl,_that.blurPicUrl,_that.artist,_that.artists,_that.publishTime,_that.size,_that.description,_that.company,_that.type,_that.mark,_that.copyrightId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicAlbumData extends CloudMusicAlbumData {
  const _CloudMusicAlbumData({required this.id, required this.name, this.picUrl, this.blurPicUrl, this.artist, final  List<CloudMusicArtistData>? artists, this.publishTime, this.size, this.description, this.company, this.type, this.mark, this.copyrightId}): _artists = artists,super._();
  factory _CloudMusicAlbumData.fromJson(Map<String, dynamic> json) => _$CloudMusicAlbumDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;
@override final  String? blurPicUrl;
@override final  CloudMusicArtistData? artist;
 final  List<CloudMusicArtistData>? _artists;
@override List<CloudMusicArtistData>? get artists {
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

/// Create a copy of CloudMusicAlbumData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicAlbumDataCopyWith<_CloudMusicAlbumData> get copyWith => __$CloudMusicAlbumDataCopyWithImpl<_CloudMusicAlbumData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicAlbumDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicAlbumData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.blurPicUrl, blurPicUrl) || other.blurPicUrl == blurPicUrl)&&(identical(other.artist, artist) || other.artist == artist)&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.size, size) || other.size == size)&&(identical(other.description, description) || other.description == description)&&(identical(other.company, company) || other.company == company)&&(identical(other.type, type) || other.type == type)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.copyrightId, copyrightId) || other.copyrightId == copyrightId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl,blurPicUrl,artist,const DeepCollectionEquality().hash(_artists),publishTime,size,description,company,type,mark,copyrightId);

@override
String toString() {
  return 'CloudMusicAlbumData(id: $id, name: $name, picUrl: $picUrl, blurPicUrl: $blurPicUrl, artist: $artist, artists: $artists, publishTime: $publishTime, size: $size, description: $description, company: $company, type: $type, mark: $mark, copyrightId: $copyrightId)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicAlbumDataCopyWith<$Res> implements $CloudMusicAlbumDataCopyWith<$Res> {
  factory _$CloudMusicAlbumDataCopyWith(_CloudMusicAlbumData value, $Res Function(_CloudMusicAlbumData) _then) = __$CloudMusicAlbumDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl, String? blurPicUrl, CloudMusicArtistData? artist, List<CloudMusicArtistData>? artists, int? publishTime, int? size, String? description, String? company, String? type, int? mark, int? copyrightId
});


@override $CloudMusicArtistDataCopyWith<$Res>? get artist;

}
/// @nodoc
class __$CloudMusicAlbumDataCopyWithImpl<$Res>
    implements _$CloudMusicAlbumDataCopyWith<$Res> {
  __$CloudMusicAlbumDataCopyWithImpl(this._self, this._then);

  final _CloudMusicAlbumData _self;
  final $Res Function(_CloudMusicAlbumData) _then;

/// Create a copy of CloudMusicAlbumData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,Object? blurPicUrl = freezed,Object? artist = freezed,Object? artists = freezed,Object? publishTime = freezed,Object? size = freezed,Object? description = freezed,Object? company = freezed,Object? type = freezed,Object? mark = freezed,Object? copyrightId = freezed,}) {
  return _then(_CloudMusicAlbumData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,blurPicUrl: freezed == blurPicUrl ? _self.blurPicUrl : blurPicUrl // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as CloudMusicArtistData?,artists: freezed == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtistData>?,publishTime: freezed == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,copyrightId: freezed == copyrightId ? _self.copyrightId : copyrightId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CloudMusicAlbumData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicArtistDataCopyWith<$Res>? get artist {
    if (_self.artist == null) {
    return null;
  }

  return $CloudMusicArtistDataCopyWith<$Res>(_self.artist!, (value) {
    return _then(_self.copyWith(artist: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicArtistData {

 int get id; String get name; int? get picId; int? get img1v1Id; String? get picUrl; String? get img1v1Url; int? get musicSize; int? get albumSize; String? get briefDesc; String? get trans; List<String>? get alias; List<String>? get transNames;
/// Create a copy of CloudMusicArtistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicArtistDataCopyWith<CloudMusicArtistData> get copyWith => _$CloudMusicArtistDataCopyWithImpl<CloudMusicArtistData>(this as CloudMusicArtistData, _$identity);

  /// Serializes this CloudMusicArtistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicArtistData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picId, picId) || other.picId == picId)&&(identical(other.img1v1Id, img1v1Id) || other.img1v1Id == img1v1Id)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.img1v1Url, img1v1Url) || other.img1v1Url == img1v1Url)&&(identical(other.musicSize, musicSize) || other.musicSize == musicSize)&&(identical(other.albumSize, albumSize) || other.albumSize == albumSize)&&(identical(other.briefDesc, briefDesc) || other.briefDesc == briefDesc)&&(identical(other.trans, trans) || other.trans == trans)&&const DeepCollectionEquality().equals(other.alias, alias)&&const DeepCollectionEquality().equals(other.transNames, transNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picId,img1v1Id,picUrl,img1v1Url,musicSize,albumSize,briefDesc,trans,const DeepCollectionEquality().hash(alias),const DeepCollectionEquality().hash(transNames));

@override
String toString() {
  return 'CloudMusicArtistData(id: $id, name: $name, picId: $picId, img1v1Id: $img1v1Id, picUrl: $picUrl, img1v1Url: $img1v1Url, musicSize: $musicSize, albumSize: $albumSize, briefDesc: $briefDesc, trans: $trans, alias: $alias, transNames: $transNames)';
}


}

/// @nodoc
abstract mixin class $CloudMusicArtistDataCopyWith<$Res>  {
  factory $CloudMusicArtistDataCopyWith(CloudMusicArtistData value, $Res Function(CloudMusicArtistData) _then) = _$CloudMusicArtistDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? picId, int? img1v1Id, String? picUrl, String? img1v1Url, int? musicSize, int? albumSize, String? briefDesc, String? trans, List<String>? alias, List<String>? transNames
});




}
/// @nodoc
class _$CloudMusicArtistDataCopyWithImpl<$Res>
    implements $CloudMusicArtistDataCopyWith<$Res> {
  _$CloudMusicArtistDataCopyWithImpl(this._self, this._then);

  final CloudMusicArtistData _self;
  final $Res Function(CloudMusicArtistData) _then;

/// Create a copy of CloudMusicArtistData
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


/// Adds pattern-matching-related methods to [CloudMusicArtistData].
extension CloudMusicArtistDataPatterns on CloudMusicArtistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicArtistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicArtistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicArtistData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicArtistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicArtistData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicArtistData() when $default != null:
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
case _CloudMusicArtistData() when $default != null:
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
case _CloudMusicArtistData():
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
case _CloudMusicArtistData() when $default != null:
return $default(_that.id,_that.name,_that.picId,_that.img1v1Id,_that.picUrl,_that.img1v1Url,_that.musicSize,_that.albumSize,_that.briefDesc,_that.trans,_that.alias,_that.transNames);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicArtistData extends CloudMusicArtistData {
  const _CloudMusicArtistData({required this.id, required this.name, this.picId, this.img1v1Id, this.picUrl, this.img1v1Url, this.musicSize, this.albumSize, this.briefDesc, this.trans, final  List<String>? alias, final  List<String>? transNames}): _alias = alias,_transNames = transNames,super._();
  factory _CloudMusicArtistData.fromJson(Map<String, dynamic> json) => _$CloudMusicArtistDataFromJson(json);

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


/// Create a copy of CloudMusicArtistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicArtistDataCopyWith<_CloudMusicArtistData> get copyWith => __$CloudMusicArtistDataCopyWithImpl<_CloudMusicArtistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicArtistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicArtistData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picId, picId) || other.picId == picId)&&(identical(other.img1v1Id, img1v1Id) || other.img1v1Id == img1v1Id)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl)&&(identical(other.img1v1Url, img1v1Url) || other.img1v1Url == img1v1Url)&&(identical(other.musicSize, musicSize) || other.musicSize == musicSize)&&(identical(other.albumSize, albumSize) || other.albumSize == albumSize)&&(identical(other.briefDesc, briefDesc) || other.briefDesc == briefDesc)&&(identical(other.trans, trans) || other.trans == trans)&&const DeepCollectionEquality().equals(other._alias, _alias)&&const DeepCollectionEquality().equals(other._transNames, _transNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picId,img1v1Id,picUrl,img1v1Url,musicSize,albumSize,briefDesc,trans,const DeepCollectionEquality().hash(_alias),const DeepCollectionEquality().hash(_transNames));

@override
String toString() {
  return 'CloudMusicArtistData(id: $id, name: $name, picId: $picId, img1v1Id: $img1v1Id, picUrl: $picUrl, img1v1Url: $img1v1Url, musicSize: $musicSize, albumSize: $albumSize, briefDesc: $briefDesc, trans: $trans, alias: $alias, transNames: $transNames)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicArtistDataCopyWith<$Res> implements $CloudMusicArtistDataCopyWith<$Res> {
  factory _$CloudMusicArtistDataCopyWith(_CloudMusicArtistData value, $Res Function(_CloudMusicArtistData) _then) = __$CloudMusicArtistDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? picId, int? img1v1Id, String? picUrl, String? img1v1Url, int? musicSize, int? albumSize, String? briefDesc, String? trans, List<String>? alias, List<String>? transNames
});




}
/// @nodoc
class __$CloudMusicArtistDataCopyWithImpl<$Res>
    implements _$CloudMusicArtistDataCopyWith<$Res> {
  __$CloudMusicArtistDataCopyWithImpl(this._self, this._then);

  final _CloudMusicArtistData _self;
  final $Res Function(_CloudMusicArtistData) _then;

/// Create a copy of CloudMusicArtistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picId = freezed,Object? img1v1Id = freezed,Object? picUrl = freezed,Object? img1v1Url = freezed,Object? musicSize = freezed,Object? albumSize = freezed,Object? briefDesc = freezed,Object? trans = freezed,Object? alias = freezed,Object? transNames = freezed,}) {
  return _then(_CloudMusicArtistData(
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
mixin _$CloudMusicSongData {

 int get id; String get name; List<CloudMusicArtistData>? get ar; CloudMusicAlbumSimpleData? get al; CloudMusicPrivilegeData? get privilege; int? get dt; int? get pop; int? get no; int? get fee; int? get copyright; int? get mark; int? get mv; dynamic get noCopyrightRcmd;
/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicSongDataCopyWith<CloudMusicSongData> get copyWith => _$CloudMusicSongDataCopyWithImpl<CloudMusicSongData>(this as CloudMusicSongData, _$identity);

  /// Serializes this CloudMusicSongData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicSongData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.ar, ar)&&(identical(other.al, al) || other.al == al)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.no, no) || other.no == no)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.mv, mv) || other.mv == mv)&&const DeepCollectionEquality().equals(other.noCopyrightRcmd, noCopyrightRcmd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(ar),al,privilege,dt,pop,no,fee,copyright,mark,mv,const DeepCollectionEquality().hash(noCopyrightRcmd));

@override
String toString() {
  return 'CloudMusicSongData(id: $id, name: $name, ar: $ar, al: $al, privilege: $privilege, dt: $dt, pop: $pop, no: $no, fee: $fee, copyright: $copyright, mark: $mark, mv: $mv, noCopyrightRcmd: $noCopyrightRcmd)';
}


}

/// @nodoc
abstract mixin class $CloudMusicSongDataCopyWith<$Res>  {
  factory $CloudMusicSongDataCopyWith(CloudMusicSongData value, $Res Function(CloudMusicSongData) _then) = _$CloudMusicSongDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<CloudMusicArtistData>? ar, CloudMusicAlbumSimpleData? al, CloudMusicPrivilegeData? privilege, int? dt, int? pop, int? no, int? fee, int? copyright, int? mark, int? mv, dynamic noCopyrightRcmd
});


$CloudMusicAlbumSimpleDataCopyWith<$Res>? get al;$CloudMusicPrivilegeDataCopyWith<$Res>? get privilege;

}
/// @nodoc
class _$CloudMusicSongDataCopyWithImpl<$Res>
    implements $CloudMusicSongDataCopyWith<$Res> {
  _$CloudMusicSongDataCopyWithImpl(this._self, this._then);

  final CloudMusicSongData _self;
  final $Res Function(CloudMusicSongData) _then;

/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ar = freezed,Object? al = freezed,Object? privilege = freezed,Object? dt = freezed,Object? pop = freezed,Object? no = freezed,Object? fee = freezed,Object? copyright = freezed,Object? mark = freezed,Object? mv = freezed,Object? noCopyrightRcmd = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtistData>?,al: freezed == al ? _self.al : al // ignore: cast_nullable_to_non_nullable
as CloudMusicAlbumSimpleData?,privilege: freezed == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as CloudMusicPrivilegeData?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,pop: freezed == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as int?,no: freezed == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int?,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as int?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,mv: freezed == mv ? _self.mv : mv // ignore: cast_nullable_to_non_nullable
as int?,noCopyrightRcmd: freezed == noCopyrightRcmd ? _self.noCopyrightRcmd : noCopyrightRcmd // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicAlbumSimpleDataCopyWith<$Res>? get al {
    if (_self.al == null) {
    return null;
  }

  return $CloudMusicAlbumSimpleDataCopyWith<$Res>(_self.al!, (value) {
    return _then(_self.copyWith(al: value));
  });
}/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicPrivilegeDataCopyWith<$Res>? get privilege {
    if (_self.privilege == null) {
    return null;
  }

  return $CloudMusicPrivilegeDataCopyWith<$Res>(_self.privilege!, (value) {
    return _then(_self.copyWith(privilege: value));
  });
}
}


/// Adds pattern-matching-related methods to [CloudMusicSongData].
extension CloudMusicSongDataPatterns on CloudMusicSongData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicSongData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicSongData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicSongData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicSongData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicSongData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicSongData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<CloudMusicArtistData>? ar,  CloudMusicAlbumSimpleData? al,  CloudMusicPrivilegeData? privilege,  int? dt,  int? pop,  int? no,  int? fee,  int? copyright,  int? mark,  int? mv,  dynamic noCopyrightRcmd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicSongData() when $default != null:
return $default(_that.id,_that.name,_that.ar,_that.al,_that.privilege,_that.dt,_that.pop,_that.no,_that.fee,_that.copyright,_that.mark,_that.mv,_that.noCopyrightRcmd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<CloudMusicArtistData>? ar,  CloudMusicAlbumSimpleData? al,  CloudMusicPrivilegeData? privilege,  int? dt,  int? pop,  int? no,  int? fee,  int? copyright,  int? mark,  int? mv,  dynamic noCopyrightRcmd)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicSongData():
return $default(_that.id,_that.name,_that.ar,_that.al,_that.privilege,_that.dt,_that.pop,_that.no,_that.fee,_that.copyright,_that.mark,_that.mv,_that.noCopyrightRcmd);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<CloudMusicArtistData>? ar,  CloudMusicAlbumSimpleData? al,  CloudMusicPrivilegeData? privilege,  int? dt,  int? pop,  int? no,  int? fee,  int? copyright,  int? mark,  int? mv,  dynamic noCopyrightRcmd)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicSongData() when $default != null:
return $default(_that.id,_that.name,_that.ar,_that.al,_that.privilege,_that.dt,_that.pop,_that.no,_that.fee,_that.copyright,_that.mark,_that.mv,_that.noCopyrightRcmd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicSongData extends CloudMusicSongData {
  const _CloudMusicSongData({required this.id, required this.name, final  List<CloudMusicArtistData>? ar, this.al, this.privilege, this.dt, this.pop, this.no, this.fee, this.copyright, this.mark, this.mv, this.noCopyrightRcmd}): _ar = ar,super._();
  factory _CloudMusicSongData.fromJson(Map<String, dynamic> json) => _$CloudMusicSongDataFromJson(json);

@override final  int id;
@override final  String name;
 final  List<CloudMusicArtistData>? _ar;
@override List<CloudMusicArtistData>? get ar {
  final value = _ar;
  if (value == null) return null;
  if (_ar is EqualUnmodifiableListView) return _ar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CloudMusicAlbumSimpleData? al;
@override final  CloudMusicPrivilegeData? privilege;
@override final  int? dt;
@override final  int? pop;
@override final  int? no;
@override final  int? fee;
@override final  int? copyright;
@override final  int? mark;
@override final  int? mv;
@override final  dynamic noCopyrightRcmd;

/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicSongDataCopyWith<_CloudMusicSongData> get copyWith => __$CloudMusicSongDataCopyWithImpl<_CloudMusicSongData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicSongDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicSongData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._ar, _ar)&&(identical(other.al, al) || other.al == al)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.no, no) || other.no == no)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.mv, mv) || other.mv == mv)&&const DeepCollectionEquality().equals(other.noCopyrightRcmd, noCopyrightRcmd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_ar),al,privilege,dt,pop,no,fee,copyright,mark,mv,const DeepCollectionEquality().hash(noCopyrightRcmd));

@override
String toString() {
  return 'CloudMusicSongData(id: $id, name: $name, ar: $ar, al: $al, privilege: $privilege, dt: $dt, pop: $pop, no: $no, fee: $fee, copyright: $copyright, mark: $mark, mv: $mv, noCopyrightRcmd: $noCopyrightRcmd)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicSongDataCopyWith<$Res> implements $CloudMusicSongDataCopyWith<$Res> {
  factory _$CloudMusicSongDataCopyWith(_CloudMusicSongData value, $Res Function(_CloudMusicSongData) _then) = __$CloudMusicSongDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<CloudMusicArtistData>? ar, CloudMusicAlbumSimpleData? al, CloudMusicPrivilegeData? privilege, int? dt, int? pop, int? no, int? fee, int? copyright, int? mark, int? mv, dynamic noCopyrightRcmd
});


@override $CloudMusicAlbumSimpleDataCopyWith<$Res>? get al;@override $CloudMusicPrivilegeDataCopyWith<$Res>? get privilege;

}
/// @nodoc
class __$CloudMusicSongDataCopyWithImpl<$Res>
    implements _$CloudMusicSongDataCopyWith<$Res> {
  __$CloudMusicSongDataCopyWithImpl(this._self, this._then);

  final _CloudMusicSongData _self;
  final $Res Function(_CloudMusicSongData) _then;

/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ar = freezed,Object? al = freezed,Object? privilege = freezed,Object? dt = freezed,Object? pop = freezed,Object? no = freezed,Object? fee = freezed,Object? copyright = freezed,Object? mark = freezed,Object? mv = freezed,Object? noCopyrightRcmd = freezed,}) {
  return _then(_CloudMusicSongData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ar: freezed == ar ? _self._ar : ar // ignore: cast_nullable_to_non_nullable
as List<CloudMusicArtistData>?,al: freezed == al ? _self.al : al // ignore: cast_nullable_to_non_nullable
as CloudMusicAlbumSimpleData?,privilege: freezed == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as CloudMusicPrivilegeData?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,pop: freezed == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as int?,no: freezed == no ? _self.no : no // ignore: cast_nullable_to_non_nullable
as int?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int?,copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as int?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as int?,mv: freezed == mv ? _self.mv : mv // ignore: cast_nullable_to_non_nullable
as int?,noCopyrightRcmd: freezed == noCopyrightRcmd ? _self.noCopyrightRcmd : noCopyrightRcmd // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicAlbumSimpleDataCopyWith<$Res>? get al {
    if (_self.al == null) {
    return null;
  }

  return $CloudMusicAlbumSimpleDataCopyWith<$Res>(_self.al!, (value) {
    return _then(_self.copyWith(al: value));
  });
}/// Create a copy of CloudMusicSongData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudMusicPrivilegeDataCopyWith<$Res>? get privilege {
    if (_self.privilege == null) {
    return null;
  }

  return $CloudMusicPrivilegeDataCopyWith<$Res>(_self.privilege!, (value) {
    return _then(_self.copyWith(privilege: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicAlbumSimpleData {

 int get id; String get name; String? get picUrl;
/// Create a copy of CloudMusicAlbumSimpleData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicAlbumSimpleDataCopyWith<CloudMusicAlbumSimpleData> get copyWith => _$CloudMusicAlbumSimpleDataCopyWithImpl<CloudMusicAlbumSimpleData>(this as CloudMusicAlbumSimpleData, _$identity);

  /// Serializes this CloudMusicAlbumSimpleData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicAlbumSimpleData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl);

@override
String toString() {
  return 'CloudMusicAlbumSimpleData(id: $id, name: $name, picUrl: $picUrl)';
}


}

/// @nodoc
abstract mixin class $CloudMusicAlbumSimpleDataCopyWith<$Res>  {
  factory $CloudMusicAlbumSimpleDataCopyWith(CloudMusicAlbumSimpleData value, $Res Function(CloudMusicAlbumSimpleData) _then) = _$CloudMusicAlbumSimpleDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? picUrl
});




}
/// @nodoc
class _$CloudMusicAlbumSimpleDataCopyWithImpl<$Res>
    implements $CloudMusicAlbumSimpleDataCopyWith<$Res> {
  _$CloudMusicAlbumSimpleDataCopyWithImpl(this._self, this._then);

  final CloudMusicAlbumSimpleData _self;
  final $Res Function(CloudMusicAlbumSimpleData) _then;

/// Create a copy of CloudMusicAlbumSimpleData
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


/// Adds pattern-matching-related methods to [CloudMusicAlbumSimpleData].
extension CloudMusicAlbumSimpleDataPatterns on CloudMusicAlbumSimpleData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicAlbumSimpleData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicAlbumSimpleData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicAlbumSimpleData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbumSimpleData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicAlbumSimpleData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicAlbumSimpleData() when $default != null:
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
case _CloudMusicAlbumSimpleData() when $default != null:
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
case _CloudMusicAlbumSimpleData():
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
case _CloudMusicAlbumSimpleData() when $default != null:
return $default(_that.id,_that.name,_that.picUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicAlbumSimpleData extends CloudMusicAlbumSimpleData {
  const _CloudMusicAlbumSimpleData({required this.id, required this.name, this.picUrl}): super._();
  factory _CloudMusicAlbumSimpleData.fromJson(Map<String, dynamic> json) => _$CloudMusicAlbumSimpleDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? picUrl;

/// Create a copy of CloudMusicAlbumSimpleData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicAlbumSimpleDataCopyWith<_CloudMusicAlbumSimpleData> get copyWith => __$CloudMusicAlbumSimpleDataCopyWithImpl<_CloudMusicAlbumSimpleData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicAlbumSimpleDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicAlbumSimpleData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.picUrl, picUrl) || other.picUrl == picUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,picUrl);

@override
String toString() {
  return 'CloudMusicAlbumSimpleData(id: $id, name: $name, picUrl: $picUrl)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicAlbumSimpleDataCopyWith<$Res> implements $CloudMusicAlbumSimpleDataCopyWith<$Res> {
  factory _$CloudMusicAlbumSimpleDataCopyWith(_CloudMusicAlbumSimpleData value, $Res Function(_CloudMusicAlbumSimpleData) _then) = __$CloudMusicAlbumSimpleDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? picUrl
});




}
/// @nodoc
class __$CloudMusicAlbumSimpleDataCopyWithImpl<$Res>
    implements _$CloudMusicAlbumSimpleDataCopyWith<$Res> {
  __$CloudMusicAlbumSimpleDataCopyWithImpl(this._self, this._then);

  final _CloudMusicAlbumSimpleData _self;
  final $Res Function(_CloudMusicAlbumSimpleData) _then;

/// Create a copy of CloudMusicAlbumSimpleData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? picUrl = freezed,}) {
  return _then(_CloudMusicAlbumSimpleData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,picUrl: freezed == picUrl ? _self.picUrl : picUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicPlaylistDetailData {

 int get id; String get name; String? get coverImgUrl; String? get description; int? get trackCount; List<CloudMusicSongData>? get tracks; List<CloudMusicTrackIdData>? get trackIds; CloudMusicUserData? get creator; int? get createTime; List<String>? get tags; int? get privacy; bool? get subscribed;
/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPlaylistDetailDataCopyWith<CloudMusicPlaylistDetailData> get copyWith => _$CloudMusicPlaylistDetailDataCopyWithImpl<CloudMusicPlaylistDetailData>(this as CloudMusicPlaylistDetailData, _$identity);

  /// Serializes this CloudMusicPlaylistDetailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPlaylistDetailData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&const DeepCollectionEquality().equals(other.trackIds, trackIds)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.subscribed, subscribed) || other.subscribed == subscribed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverImgUrl,description,trackCount,const DeepCollectionEquality().hash(tracks),const DeepCollectionEquality().hash(trackIds),creator,createTime,const DeepCollectionEquality().hash(tags),privacy,subscribed);

@override
String toString() {
  return 'CloudMusicPlaylistDetailData(id: $id, name: $name, coverImgUrl: $coverImgUrl, description: $description, trackCount: $trackCount, tracks: $tracks, trackIds: $trackIds, creator: $creator, createTime: $createTime, tags: $tags, privacy: $privacy, subscribed: $subscribed)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPlaylistDetailDataCopyWith<$Res>  {
  factory $CloudMusicPlaylistDetailDataCopyWith(CloudMusicPlaylistDetailData value, $Res Function(CloudMusicPlaylistDetailData) _then) = _$CloudMusicPlaylistDetailDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? coverImgUrl, String? description, int? trackCount, List<CloudMusicSongData>? tracks, List<CloudMusicTrackIdData>? trackIds, CloudMusicUserData? creator, int? createTime, List<String>? tags, int? privacy, bool? subscribed
});


$CloudMusicUserDataCopyWith<$Res>? get creator;

}
/// @nodoc
class _$CloudMusicPlaylistDetailDataCopyWithImpl<$Res>
    implements $CloudMusicPlaylistDetailDataCopyWith<$Res> {
  _$CloudMusicPlaylistDetailDataCopyWithImpl(this._self, this._then);

  final CloudMusicPlaylistDetailData _self;
  final $Res Function(CloudMusicPlaylistDetailData) _then;

/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coverImgUrl = freezed,Object? description = freezed,Object? trackCount = freezed,Object? tracks = freezed,Object? trackIds = freezed,Object? creator = freezed,Object? createTime = freezed,Object? tags = freezed,Object? privacy = freezed,Object? subscribed = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSongData>?,trackIds: freezed == trackIds ? _self.trackIds : trackIds // ignore: cast_nullable_to_non_nullable
as List<CloudMusicTrackIdData>?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUserData?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
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
$CloudMusicUserDataCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CloudMusicUserDataCopyWith<$Res>(_self.creator!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? coverImgUrl,  String? description,  int? trackCount,  List<CloudMusicSongData>? tracks,  List<CloudMusicTrackIdData>? trackIds,  CloudMusicUserData? creator,  int? createTime,  List<String>? tags,  int? privacy,  bool? subscribed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData() when $default != null:
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.trackCount,_that.tracks,_that.trackIds,_that.creator,_that.createTime,_that.tags,_that.privacy,_that.subscribed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? coverImgUrl,  String? description,  int? trackCount,  List<CloudMusicSongData>? tracks,  List<CloudMusicTrackIdData>? trackIds,  CloudMusicUserData? creator,  int? createTime,  List<String>? tags,  int? privacy,  bool? subscribed)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData():
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.trackCount,_that.tracks,_that.trackIds,_that.creator,_that.createTime,_that.tags,_that.privacy,_that.subscribed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? coverImgUrl,  String? description,  int? trackCount,  List<CloudMusicSongData>? tracks,  List<CloudMusicTrackIdData>? trackIds,  CloudMusicUserData? creator,  int? createTime,  List<String>? tags,  int? privacy,  bool? subscribed)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicPlaylistDetailData() when $default != null:
return $default(_that.id,_that.name,_that.coverImgUrl,_that.description,_that.trackCount,_that.tracks,_that.trackIds,_that.creator,_that.createTime,_that.tags,_that.privacy,_that.subscribed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPlaylistDetailData extends CloudMusicPlaylistDetailData {
  const _CloudMusicPlaylistDetailData({required this.id, required this.name, this.coverImgUrl, this.description, this.trackCount, final  List<CloudMusicSongData>? tracks, final  List<CloudMusicTrackIdData>? trackIds, this.creator, this.createTime, final  List<String>? tags, this.privacy, this.subscribed}): _tracks = tracks,_trackIds = trackIds,_tags = tags,super._();
  factory _CloudMusicPlaylistDetailData.fromJson(Map<String, dynamic> json) => _$CloudMusicPlaylistDetailDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? coverImgUrl;
@override final  String? description;
@override final  int? trackCount;
 final  List<CloudMusicSongData>? _tracks;
@override List<CloudMusicSongData>? get tracks {
  final value = _tracks;
  if (value == null) return null;
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CloudMusicTrackIdData>? _trackIds;
@override List<CloudMusicTrackIdData>? get trackIds {
  final value = _trackIds;
  if (value == null) return null;
  if (_trackIds is EqualUnmodifiableListView) return _trackIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CloudMusicUserData? creator;
@override final  int? createTime;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPlaylistDetailData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImgUrl, coverImgUrl) || other.coverImgUrl == coverImgUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.trackCount, trackCount) || other.trackCount == trackCount)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._trackIds, _trackIds)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.privacy, privacy) || other.privacy == privacy)&&(identical(other.subscribed, subscribed) || other.subscribed == subscribed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coverImgUrl,description,trackCount,const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_trackIds),creator,createTime,const DeepCollectionEquality().hash(_tags),privacy,subscribed);

@override
String toString() {
  return 'CloudMusicPlaylistDetailData(id: $id, name: $name, coverImgUrl: $coverImgUrl, description: $description, trackCount: $trackCount, tracks: $tracks, trackIds: $trackIds, creator: $creator, createTime: $createTime, tags: $tags, privacy: $privacy, subscribed: $subscribed)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPlaylistDetailDataCopyWith<$Res> implements $CloudMusicPlaylistDetailDataCopyWith<$Res> {
  factory _$CloudMusicPlaylistDetailDataCopyWith(_CloudMusicPlaylistDetailData value, $Res Function(_CloudMusicPlaylistDetailData) _then) = __$CloudMusicPlaylistDetailDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? coverImgUrl, String? description, int? trackCount, List<CloudMusicSongData>? tracks, List<CloudMusicTrackIdData>? trackIds, CloudMusicUserData? creator, int? createTime, List<String>? tags, int? privacy, bool? subscribed
});


@override $CloudMusicUserDataCopyWith<$Res>? get creator;

}
/// @nodoc
class __$CloudMusicPlaylistDetailDataCopyWithImpl<$Res>
    implements _$CloudMusicPlaylistDetailDataCopyWith<$Res> {
  __$CloudMusicPlaylistDetailDataCopyWithImpl(this._self, this._then);

  final _CloudMusicPlaylistDetailData _self;
  final $Res Function(_CloudMusicPlaylistDetailData) _then;

/// Create a copy of CloudMusicPlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coverImgUrl = freezed,Object? description = freezed,Object? trackCount = freezed,Object? tracks = freezed,Object? trackIds = freezed,Object? creator = freezed,Object? createTime = freezed,Object? tags = freezed,Object? privacy = freezed,Object? subscribed = freezed,}) {
  return _then(_CloudMusicPlaylistDetailData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImgUrl: freezed == coverImgUrl ? _self.coverImgUrl : coverImgUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,trackCount: freezed == trackCount ? _self.trackCount : trackCount // ignore: cast_nullable_to_non_nullable
as int?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<CloudMusicSongData>?,trackIds: freezed == trackIds ? _self._trackIds : trackIds // ignore: cast_nullable_to_non_nullable
as List<CloudMusicTrackIdData>?,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CloudMusicUserData?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
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
$CloudMusicUserDataCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CloudMusicUserDataCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// @nodoc
mixin _$CloudMusicTrackIdData {

 int get id; int? get v; String? get alg; int? get uid;
/// Create a copy of CloudMusicTrackIdData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicTrackIdDataCopyWith<CloudMusicTrackIdData> get copyWith => _$CloudMusicTrackIdDataCopyWithImpl<CloudMusicTrackIdData>(this as CloudMusicTrackIdData, _$identity);

  /// Serializes this CloudMusicTrackIdData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicTrackIdData&&(identical(other.id, id) || other.id == id)&&(identical(other.v, v) || other.v == v)&&(identical(other.alg, alg) || other.alg == alg)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,v,alg,uid);

@override
String toString() {
  return 'CloudMusicTrackIdData(id: $id, v: $v, alg: $alg, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $CloudMusicTrackIdDataCopyWith<$Res>  {
  factory $CloudMusicTrackIdDataCopyWith(CloudMusicTrackIdData value, $Res Function(CloudMusicTrackIdData) _then) = _$CloudMusicTrackIdDataCopyWithImpl;
@useResult
$Res call({
 int id, int? v, String? alg, int? uid
});




}
/// @nodoc
class _$CloudMusicTrackIdDataCopyWithImpl<$Res>
    implements $CloudMusicTrackIdDataCopyWith<$Res> {
  _$CloudMusicTrackIdDataCopyWithImpl(this._self, this._then);

  final CloudMusicTrackIdData _self;
  final $Res Function(CloudMusicTrackIdData) _then;

/// Create a copy of CloudMusicTrackIdData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? v = freezed,Object? alg = freezed,Object? uid = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,alg: freezed == alg ? _self.alg : alg // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudMusicTrackIdData].
extension CloudMusicTrackIdDataPatterns on CloudMusicTrackIdData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicTrackIdData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicTrackIdData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicTrackIdData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicTrackIdData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicTrackIdData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicTrackIdData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? v,  String? alg,  int? uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudMusicTrackIdData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? v,  String? alg,  int? uid)  $default,) {final _that = this;
switch (_that) {
case _CloudMusicTrackIdData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? v,  String? alg,  int? uid)?  $default,) {final _that = this;
switch (_that) {
case _CloudMusicTrackIdData() when $default != null:
return $default(_that.id,_that.v,_that.alg,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicTrackIdData extends CloudMusicTrackIdData {
  const _CloudMusicTrackIdData({required this.id, this.v, this.alg, this.uid}): super._();
  factory _CloudMusicTrackIdData.fromJson(Map<String, dynamic> json) => _$CloudMusicTrackIdDataFromJson(json);

@override final  int id;
@override final  int? v;
@override final  String? alg;
@override final  int? uid;

/// Create a copy of CloudMusicTrackIdData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicTrackIdDataCopyWith<_CloudMusicTrackIdData> get copyWith => __$CloudMusicTrackIdDataCopyWithImpl<_CloudMusicTrackIdData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicTrackIdDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicTrackIdData&&(identical(other.id, id) || other.id == id)&&(identical(other.v, v) || other.v == v)&&(identical(other.alg, alg) || other.alg == alg)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,v,alg,uid);

@override
String toString() {
  return 'CloudMusicTrackIdData(id: $id, v: $v, alg: $alg, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicTrackIdDataCopyWith<$Res> implements $CloudMusicTrackIdDataCopyWith<$Res> {
  factory _$CloudMusicTrackIdDataCopyWith(_CloudMusicTrackIdData value, $Res Function(_CloudMusicTrackIdData) _then) = __$CloudMusicTrackIdDataCopyWithImpl;
@override @useResult
$Res call({
 int id, int? v, String? alg, int? uid
});




}
/// @nodoc
class __$CloudMusicTrackIdDataCopyWithImpl<$Res>
    implements _$CloudMusicTrackIdDataCopyWith<$Res> {
  __$CloudMusicTrackIdDataCopyWithImpl(this._self, this._then);

  final _CloudMusicTrackIdData _self;
  final $Res Function(_CloudMusicTrackIdData) _then;

/// Create a copy of CloudMusicTrackIdData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? v = freezed,Object? alg = freezed,Object? uid = freezed,}) {
  return _then(_CloudMusicTrackIdData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,v: freezed == v ? _self.v : v // ignore: cast_nullable_to_non_nullable
as int?,alg: freezed == alg ? _self.alg : alg // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CloudMusicPrivilegeData {

 int get id; int? get fee; int? get payed; int? get st; int? get pl; int? get dl; int? get sp; int? get cp; int? get subp; bool? get cs; int? get maxbr; int? get fl; bool? get toast; int? get flag;
/// Create a copy of CloudMusicPrivilegeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicPrivilegeDataCopyWith<CloudMusicPrivilegeData> get copyWith => _$CloudMusicPrivilegeDataCopyWithImpl<CloudMusicPrivilegeData>(this as CloudMusicPrivilegeData, _$identity);

  /// Serializes this CloudMusicPrivilegeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicPrivilegeData&&(identical(other.id, id) || other.id == id)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.payed, payed) || other.payed == payed)&&(identical(other.st, st) || other.st == st)&&(identical(other.pl, pl) || other.pl == pl)&&(identical(other.dl, dl) || other.dl == dl)&&(identical(other.sp, sp) || other.sp == sp)&&(identical(other.cp, cp) || other.cp == cp)&&(identical(other.subp, subp) || other.subp == subp)&&(identical(other.cs, cs) || other.cs == cs)&&(identical(other.maxbr, maxbr) || other.maxbr == maxbr)&&(identical(other.fl, fl) || other.fl == fl)&&(identical(other.toast, toast) || other.toast == toast)&&(identical(other.flag, flag) || other.flag == flag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fee,payed,st,pl,dl,sp,cp,subp,cs,maxbr,fl,toast,flag);

@override
String toString() {
  return 'CloudMusicPrivilegeData(id: $id, fee: $fee, payed: $payed, st: $st, pl: $pl, dl: $dl, sp: $sp, cp: $cp, subp: $subp, cs: $cs, maxbr: $maxbr, fl: $fl, toast: $toast, flag: $flag)';
}


}

/// @nodoc
abstract mixin class $CloudMusicPrivilegeDataCopyWith<$Res>  {
  factory $CloudMusicPrivilegeDataCopyWith(CloudMusicPrivilegeData value, $Res Function(CloudMusicPrivilegeData) _then) = _$CloudMusicPrivilegeDataCopyWithImpl;
@useResult
$Res call({
 int id, int? fee, int? payed, int? st, int? pl, int? dl, int? sp, int? cp, int? subp, bool? cs, int? maxbr, int? fl, bool? toast, int? flag
});




}
/// @nodoc
class _$CloudMusicPrivilegeDataCopyWithImpl<$Res>
    implements $CloudMusicPrivilegeDataCopyWith<$Res> {
  _$CloudMusicPrivilegeDataCopyWithImpl(this._self, this._then);

  final CloudMusicPrivilegeData _self;
  final $Res Function(CloudMusicPrivilegeData) _then;

/// Create a copy of CloudMusicPrivilegeData
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


/// Adds pattern-matching-related methods to [CloudMusicPrivilegeData].
extension CloudMusicPrivilegeDataPatterns on CloudMusicPrivilegeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicPrivilegeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicPrivilegeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicPrivilegeData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPrivilegeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicPrivilegeData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicPrivilegeData() when $default != null:
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
case _CloudMusicPrivilegeData() when $default != null:
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
case _CloudMusicPrivilegeData():
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
case _CloudMusicPrivilegeData() when $default != null:
return $default(_that.id,_that.fee,_that.payed,_that.st,_that.pl,_that.dl,_that.sp,_that.cp,_that.subp,_that.cs,_that.maxbr,_that.fl,_that.toast,_that.flag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicPrivilegeData extends CloudMusicPrivilegeData {
  const _CloudMusicPrivilegeData({required this.id, this.fee, this.payed, this.st, this.pl, this.dl, this.sp, this.cp, this.subp, this.cs, this.maxbr, this.fl, this.toast, this.flag}): super._();
  factory _CloudMusicPrivilegeData.fromJson(Map<String, dynamic> json) => _$CloudMusicPrivilegeDataFromJson(json);

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

/// Create a copy of CloudMusicPrivilegeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicPrivilegeDataCopyWith<_CloudMusicPrivilegeData> get copyWith => __$CloudMusicPrivilegeDataCopyWithImpl<_CloudMusicPrivilegeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicPrivilegeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicPrivilegeData&&(identical(other.id, id) || other.id == id)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.payed, payed) || other.payed == payed)&&(identical(other.st, st) || other.st == st)&&(identical(other.pl, pl) || other.pl == pl)&&(identical(other.dl, dl) || other.dl == dl)&&(identical(other.sp, sp) || other.sp == sp)&&(identical(other.cp, cp) || other.cp == cp)&&(identical(other.subp, subp) || other.subp == subp)&&(identical(other.cs, cs) || other.cs == cs)&&(identical(other.maxbr, maxbr) || other.maxbr == maxbr)&&(identical(other.fl, fl) || other.fl == fl)&&(identical(other.toast, toast) || other.toast == toast)&&(identical(other.flag, flag) || other.flag == flag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fee,payed,st,pl,dl,sp,cp,subp,cs,maxbr,fl,toast,flag);

@override
String toString() {
  return 'CloudMusicPrivilegeData(id: $id, fee: $fee, payed: $payed, st: $st, pl: $pl, dl: $dl, sp: $sp, cp: $cp, subp: $subp, cs: $cs, maxbr: $maxbr, fl: $fl, toast: $toast, flag: $flag)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicPrivilegeDataCopyWith<$Res> implements $CloudMusicPrivilegeDataCopyWith<$Res> {
  factory _$CloudMusicPrivilegeDataCopyWith(_CloudMusicPrivilegeData value, $Res Function(_CloudMusicPrivilegeData) _then) = __$CloudMusicPrivilegeDataCopyWithImpl;
@override @useResult
$Res call({
 int id, int? fee, int? payed, int? st, int? pl, int? dl, int? sp, int? cp, int? subp, bool? cs, int? maxbr, int? fl, bool? toast, int? flag
});




}
/// @nodoc
class __$CloudMusicPrivilegeDataCopyWithImpl<$Res>
    implements _$CloudMusicPrivilegeDataCopyWith<$Res> {
  __$CloudMusicPrivilegeDataCopyWithImpl(this._self, this._then);

  final _CloudMusicPrivilegeData _self;
  final $Res Function(_CloudMusicPrivilegeData) _then;

/// Create a copy of CloudMusicPrivilegeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fee = freezed,Object? payed = freezed,Object? st = freezed,Object? pl = freezed,Object? dl = freezed,Object? sp = freezed,Object? cp = freezed,Object? subp = freezed,Object? cs = freezed,Object? maxbr = freezed,Object? fl = freezed,Object? toast = freezed,Object? flag = freezed,}) {
  return _then(_CloudMusicPrivilegeData(
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
mixin _$CloudMusicUserData {

 int get userId; String get nickname; String? get avatarUrl; int? get vipType; int? get createTime; String? get signature; String? get userName;
/// Create a copy of CloudMusicUserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudMusicUserDataCopyWith<CloudMusicUserData> get copyWith => _$CloudMusicUserDataCopyWithImpl<CloudMusicUserData>(this as CloudMusicUserData, _$identity);

  /// Serializes this CloudMusicUserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudMusicUserData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.vipType, vipType) || other.vipType == vipType)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,avatarUrl,vipType,createTime,signature,userName);

@override
String toString() {
  return 'CloudMusicUserData(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, vipType: $vipType, createTime: $createTime, signature: $signature, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $CloudMusicUserDataCopyWith<$Res>  {
  factory $CloudMusicUserDataCopyWith(CloudMusicUserData value, $Res Function(CloudMusicUserData) _then) = _$CloudMusicUserDataCopyWithImpl;
@useResult
$Res call({
 int userId, String nickname, String? avatarUrl, int? vipType, int? createTime, String? signature, String? userName
});




}
/// @nodoc
class _$CloudMusicUserDataCopyWithImpl<$Res>
    implements $CloudMusicUserDataCopyWith<$Res> {
  _$CloudMusicUserDataCopyWithImpl(this._self, this._then);

  final CloudMusicUserData _self;
  final $Res Function(CloudMusicUserData) _then;

/// Create a copy of CloudMusicUserData
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


/// Adds pattern-matching-related methods to [CloudMusicUserData].
extension CloudMusicUserDataPatterns on CloudMusicUserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudMusicUserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudMusicUserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudMusicUserData value)  $default,){
final _that = this;
switch (_that) {
case _CloudMusicUserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudMusicUserData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudMusicUserData() when $default != null:
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
case _CloudMusicUserData() when $default != null:
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
case _CloudMusicUserData():
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
case _CloudMusicUserData() when $default != null:
return $default(_that.userId,_that.nickname,_that.avatarUrl,_that.vipType,_that.createTime,_that.signature,_that.userName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudMusicUserData implements CloudMusicUserData {
  const _CloudMusicUserData({required this.userId, required this.nickname, this.avatarUrl, this.vipType, this.createTime, this.signature, this.userName});
  factory _CloudMusicUserData.fromJson(Map<String, dynamic> json) => _$CloudMusicUserDataFromJson(json);

@override final  int userId;
@override final  String nickname;
@override final  String? avatarUrl;
@override final  int? vipType;
@override final  int? createTime;
@override final  String? signature;
@override final  String? userName;

/// Create a copy of CloudMusicUserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudMusicUserDataCopyWith<_CloudMusicUserData> get copyWith => __$CloudMusicUserDataCopyWithImpl<_CloudMusicUserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudMusicUserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudMusicUserData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.vipType, vipType) || other.vipType == vipType)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,nickname,avatarUrl,vipType,createTime,signature,userName);

@override
String toString() {
  return 'CloudMusicUserData(userId: $userId, nickname: $nickname, avatarUrl: $avatarUrl, vipType: $vipType, createTime: $createTime, signature: $signature, userName: $userName)';
}


}

/// @nodoc
abstract mixin class _$CloudMusicUserDataCopyWith<$Res> implements $CloudMusicUserDataCopyWith<$Res> {
  factory _$CloudMusicUserDataCopyWith(_CloudMusicUserData value, $Res Function(_CloudMusicUserData) _then) = __$CloudMusicUserDataCopyWithImpl;
@override @useResult
$Res call({
 int userId, String nickname, String? avatarUrl, int? vipType, int? createTime, String? signature, String? userName
});




}
/// @nodoc
class __$CloudMusicUserDataCopyWithImpl<$Res>
    implements _$CloudMusicUserDataCopyWith<$Res> {
  __$CloudMusicUserDataCopyWithImpl(this._self, this._then);

  final _CloudMusicUserData _self;
  final $Res Function(_CloudMusicUserData) _then;

/// Create a copy of CloudMusicUserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? nickname = null,Object? avatarUrl = freezed,Object? vipType = freezed,Object? createTime = freezed,Object? signature = freezed,Object? userName = freezed,}) {
  return _then(_CloudMusicUserData(
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
