// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tone_harbor_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ToneHarborTrackObject _$ToneHarborTrackObjectFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'full':
          return _$ToneHarborTrackObjectFull.fromJson(
            json
          );
                case 'local':
          return ToneHarborTrackObjectLocal.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ToneHarborTrackObject',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ToneHarborTrackObject {

 String get id; String get title; String get artist; String get album; String get externalUri; Duration get duration; int get rating;
/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectCopyWith<ToneHarborTrackObject> get copyWith => _$ToneHarborTrackObjectCopyWithImpl<ToneHarborTrackObject>(this as ToneHarborTrackObject, _$identity);

  /// Serializes this ToneHarborTrackObject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObject&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.externalUri, externalUri) || other.externalUri == externalUri)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,album,externalUri,duration,rating);

@override
String toString() {
  return 'ToneHarborTrackObject(id: $id, title: $title, artist: $artist, album: $album, externalUri: $externalUri, duration: $duration, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectCopyWith<$Res>  {
  factory $ToneHarborTrackObjectCopyWith(ToneHarborTrackObject value, $Res Function(ToneHarborTrackObject) _then) = _$ToneHarborTrackObjectCopyWithImpl;
@useResult
$Res call({
 String id, String title, String artist, String album, String externalUri, Duration duration, int rating
});




}
/// @nodoc
class _$ToneHarborTrackObjectCopyWithImpl<$Res>
    implements $ToneHarborTrackObjectCopyWith<$Res> {
  _$ToneHarborTrackObjectCopyWithImpl(this._self, this._then);

  final ToneHarborTrackObject _self;
  final $Res Function(ToneHarborTrackObject) _then;

/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? externalUri = null,Object? duration = null,Object? rating = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,externalUri: null == externalUri ? _self.externalUri : externalUri // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ToneHarborTrackObject].
extension ToneHarborTrackObjectPatterns on ToneHarborTrackObject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _$ToneHarborTrackObjectFull value)?  full,TResult Function( ToneHarborTrackObjectLocal value)?  local,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$ToneHarborTrackObjectFull() when full != null:
return full(_that);case ToneHarborTrackObjectLocal() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _$ToneHarborTrackObjectFull value)  full,required TResult Function( ToneHarborTrackObjectLocal value)  local,}){
final _that = this;
switch (_that) {
case _$ToneHarborTrackObjectFull():
return full(_that);case ToneHarborTrackObjectLocal():
return local(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _$ToneHarborTrackObjectFull value)?  full,TResult? Function( ToneHarborTrackObjectLocal value)?  local,}){
final _that = this;
switch (_that) {
case _$ToneHarborTrackObjectFull() when full != null:
return full(_that);case ToneHarborTrackObjectLocal() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int rating,  ToneHarborTrackPlatform platform)?  full,TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  int rating,  Duration duration,  String path)?  local,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$ToneHarborTrackObjectFull() when full != null:
return full(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.rating,_that.platform);case ToneHarborTrackObjectLocal() when local != null:
return local(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.rating,_that.duration,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int rating,  ToneHarborTrackPlatform platform)  full,required TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  int rating,  Duration duration,  String path)  local,}) {final _that = this;
switch (_that) {
case _$ToneHarborTrackObjectFull():
return full(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.rating,_that.platform);case ToneHarborTrackObjectLocal():
return local(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.rating,_that.duration,_that.path);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int rating,  ToneHarborTrackPlatform platform)?  full,TResult? Function( String id,  String title,  String artist,  String album,  String externalUri,  int rating,  Duration duration,  String path)?  local,}) {final _that = this;
switch (_that) {
case _$ToneHarborTrackObjectFull() when full != null:
return full(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.rating,_that.platform);case ToneHarborTrackObjectLocal() when local != null:
return local(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.rating,_that.duration,_that.path);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$ToneHarborTrackObjectFull extends ToneHarborTrackObject {
   _$ToneHarborTrackObjectFull({required this.id, required this.title, required this.artist, required this.album, required this.externalUri, required this.duration, required this.rating, required this.platform, final  String? $type}): $type = $type ?? 'full',super._();
  factory _$ToneHarborTrackObjectFull.fromJson(Map<String, dynamic> json) => _$$ToneHarborTrackObjectFullFromJson(json);

@override final  String id;
@override final  String title;
@override final  String artist;
@override final  String album;
@override final  String externalUri;
@override final  Duration duration;
@override final  int rating;
 final  ToneHarborTrackPlatform platform;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$ToneHarborTrackObjectFullCopyWith<_$ToneHarborTrackObjectFull> get copyWith => __$$ToneHarborTrackObjectFullCopyWithImpl<_$ToneHarborTrackObjectFull>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$ToneHarborTrackObjectFullToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ToneHarborTrackObjectFull&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.externalUri, externalUri) || other.externalUri == externalUri)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,album,externalUri,duration,rating,platform);

@override
String toString() {
  return 'ToneHarborTrackObject.full(id: $id, title: $title, artist: $artist, album: $album, externalUri: $externalUri, duration: $duration, rating: $rating, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$$ToneHarborTrackObjectFullCopyWith<$Res> implements $ToneHarborTrackObjectCopyWith<$Res> {
  factory _$$ToneHarborTrackObjectFullCopyWith(_$ToneHarborTrackObjectFull value, $Res Function(_$ToneHarborTrackObjectFull) _then) = __$$ToneHarborTrackObjectFullCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String artist, String album, String externalUri, Duration duration, int rating, ToneHarborTrackPlatform platform
});




}
/// @nodoc
class __$$ToneHarborTrackObjectFullCopyWithImpl<$Res>
    implements _$$ToneHarborTrackObjectFullCopyWith<$Res> {
  __$$ToneHarborTrackObjectFullCopyWithImpl(this._self, this._then);

  final _$ToneHarborTrackObjectFull _self;
  final $Res Function(_$ToneHarborTrackObjectFull) _then;

/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? externalUri = null,Object? duration = null,Object? rating = null,Object? platform = null,}) {
  return _then(_$ToneHarborTrackObjectFull(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,externalUri: null == externalUri ? _self.externalUri : externalUri // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as ToneHarborTrackPlatform,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToneHarborTrackObjectLocal extends ToneHarborTrackObject {
   ToneHarborTrackObjectLocal({required this.id, required this.title, required this.artist, required this.album, required this.externalUri, required this.rating, required this.duration, required this.path, final  String? $type}): $type = $type ?? 'local',super._();
  factory ToneHarborTrackObjectLocal.fromJson(Map<String, dynamic> json) => _$ToneHarborTrackObjectLocalFromJson(json);

@override final  String id;
@override final  String title;
@override final  String artist;
@override final  String album;
@override final  String externalUri;
@override final  int rating;
@override final  Duration duration;
 final  String path;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectLocalCopyWith<ToneHarborTrackObjectLocal> get copyWith => _$ToneHarborTrackObjectLocalCopyWithImpl<ToneHarborTrackObjectLocal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToneHarborTrackObjectLocalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectLocal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.externalUri, externalUri) || other.externalUri == externalUri)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,album,externalUri,rating,duration,path);

@override
String toString() {
  return 'ToneHarborTrackObject.local(id: $id, title: $title, artist: $artist, album: $album, externalUri: $externalUri, rating: $rating, duration: $duration, path: $path)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectLocalCopyWith<$Res> implements $ToneHarborTrackObjectCopyWith<$Res> {
  factory $ToneHarborTrackObjectLocalCopyWith(ToneHarborTrackObjectLocal value, $Res Function(ToneHarborTrackObjectLocal) _then) = _$ToneHarborTrackObjectLocalCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String artist, String album, String externalUri, int rating, Duration duration, String path
});




}
/// @nodoc
class _$ToneHarborTrackObjectLocalCopyWithImpl<$Res>
    implements $ToneHarborTrackObjectLocalCopyWith<$Res> {
  _$ToneHarborTrackObjectLocalCopyWithImpl(this._self, this._then);

  final ToneHarborTrackObjectLocal _self;
  final $Res Function(ToneHarborTrackObjectLocal) _then;

/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? externalUri = null,Object? rating = null,Object? duration = null,Object? path = null,}) {
  return _then(ToneHarborTrackObjectLocal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,externalUri: null == externalUri ? _self.externalUri : externalUri // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
