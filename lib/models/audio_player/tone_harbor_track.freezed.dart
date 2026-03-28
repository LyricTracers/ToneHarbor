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
                  case 'folder':
          return ToneHarborTrackObjectFolder.fromJson(
            json
          );
                case 'full':
          return ToneHarborTrackObjectFull.fromJson(
            json
          );
                case 'multLocal':
          return ToneHarborTrackObjectMultLocal.fromJson(
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

 String get id; String get title;
/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectCopyWith<ToneHarborTrackObject> get copyWith => _$ToneHarborTrackObjectCopyWithImpl<ToneHarborTrackObject>(this as ToneHarborTrackObject, _$identity);

  /// Serializes this ToneHarborTrackObject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObject&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'ToneHarborTrackObject(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectCopyWith<$Res>  {
  factory $ToneHarborTrackObjectCopyWith(ToneHarborTrackObject value, $Res Function(ToneHarborTrackObject) _then) = _$ToneHarborTrackObjectCopyWithImpl;
@useResult
$Res call({
 String id, String title
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ToneHarborTrackObjectFolder value)?  folder,TResult Function( ToneHarborTrackObjectFull value)?  full,TResult Function( ToneHarborTrackObjectMultLocal value)?  multLocal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ToneHarborTrackObjectFolder() when folder != null:
return folder(_that);case ToneHarborTrackObjectFull() when full != null:
return full(_that);case ToneHarborTrackObjectMultLocal() when multLocal != null:
return multLocal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ToneHarborTrackObjectFolder value)  folder,required TResult Function( ToneHarborTrackObjectFull value)  full,required TResult Function( ToneHarborTrackObjectMultLocal value)  multLocal,}){
final _that = this;
switch (_that) {
case ToneHarborTrackObjectFolder():
return folder(_that);case ToneHarborTrackObjectFull():
return full(_that);case ToneHarborTrackObjectMultLocal():
return multLocal(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ToneHarborTrackObjectFolder value)?  folder,TResult? Function( ToneHarborTrackObjectFull value)?  full,TResult? Function( ToneHarborTrackObjectMultLocal value)?  multLocal,}){
final _that = this;
switch (_that) {
case ToneHarborTrackObjectFolder() when folder != null:
return folder(_that);case ToneHarborTrackObjectFull() when full != null:
return full(_that);case ToneHarborTrackObjectMultLocal() when multLocal != null:
return multLocal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String title)?  folder,TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int filesize,  int bitrate,  int channel,  String codec,  String container,  int frequency,  int rating,  ToneHarborTrackPlatform platform)?  full,TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int filesize,  int bitrate,  int channel,  String codec,  String container,  int frequency,  int rating,  List<AudioQuality> availableQualities)?  multLocal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ToneHarborTrackObjectFolder() when folder != null:
return folder(_that.id,_that.title);case ToneHarborTrackObjectFull() when full != null:
return full(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.filesize,_that.bitrate,_that.channel,_that.codec,_that.container,_that.frequency,_that.rating,_that.platform);case ToneHarborTrackObjectMultLocal() when multLocal != null:
return multLocal(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.filesize,_that.bitrate,_that.channel,_that.codec,_that.container,_that.frequency,_that.rating,_that.availableQualities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String title)  folder,required TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int filesize,  int bitrate,  int channel,  String codec,  String container,  int frequency,  int rating,  ToneHarborTrackPlatform platform)  full,required TResult Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int filesize,  int bitrate,  int channel,  String codec,  String container,  int frequency,  int rating,  List<AudioQuality> availableQualities)  multLocal,}) {final _that = this;
switch (_that) {
case ToneHarborTrackObjectFolder():
return folder(_that.id,_that.title);case ToneHarborTrackObjectFull():
return full(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.filesize,_that.bitrate,_that.channel,_that.codec,_that.container,_that.frequency,_that.rating,_that.platform);case ToneHarborTrackObjectMultLocal():
return multLocal(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.filesize,_that.bitrate,_that.channel,_that.codec,_that.container,_that.frequency,_that.rating,_that.availableQualities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String title)?  folder,TResult? Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int filesize,  int bitrate,  int channel,  String codec,  String container,  int frequency,  int rating,  ToneHarborTrackPlatform platform)?  full,TResult? Function( String id,  String title,  String artist,  String album,  String externalUri,  Duration duration,  int filesize,  int bitrate,  int channel,  String codec,  String container,  int frequency,  int rating,  List<AudioQuality> availableQualities)?  multLocal,}) {final _that = this;
switch (_that) {
case ToneHarborTrackObjectFolder() when folder != null:
return folder(_that.id,_that.title);case ToneHarborTrackObjectFull() when full != null:
return full(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.filesize,_that.bitrate,_that.channel,_that.codec,_that.container,_that.frequency,_that.rating,_that.platform);case ToneHarborTrackObjectMultLocal() when multLocal != null:
return multLocal(_that.id,_that.title,_that.artist,_that.album,_that.externalUri,_that.duration,_that.filesize,_that.bitrate,_that.channel,_that.codec,_that.container,_that.frequency,_that.rating,_that.availableQualities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ToneHarborTrackObjectFolder extends ToneHarborTrackObject {
   ToneHarborTrackObjectFolder({required this.id, required this.title, final  String? $type}): $type = $type ?? 'folder',super._();
  factory ToneHarborTrackObjectFolder.fromJson(Map<String, dynamic> json) => _$ToneHarborTrackObjectFolderFromJson(json);

@override final  String id;
@override final  String title;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectFolderCopyWith<ToneHarborTrackObjectFolder> get copyWith => _$ToneHarborTrackObjectFolderCopyWithImpl<ToneHarborTrackObjectFolder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToneHarborTrackObjectFolderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectFolder&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'ToneHarborTrackObject.folder(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectFolderCopyWith<$Res> implements $ToneHarborTrackObjectCopyWith<$Res> {
  factory $ToneHarborTrackObjectFolderCopyWith(ToneHarborTrackObjectFolder value, $Res Function(ToneHarborTrackObjectFolder) _then) = _$ToneHarborTrackObjectFolderCopyWithImpl;
@override @useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class _$ToneHarborTrackObjectFolderCopyWithImpl<$Res>
    implements $ToneHarborTrackObjectFolderCopyWith<$Res> {
  _$ToneHarborTrackObjectFolderCopyWithImpl(this._self, this._then);

  final ToneHarborTrackObjectFolder _self;
  final $Res Function(ToneHarborTrackObjectFolder) _then;

/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(ToneHarborTrackObjectFolder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToneHarborTrackObjectFull extends ToneHarborTrackObject {
   ToneHarborTrackObjectFull({required this.id, required this.title, required this.artist, required this.album, required this.externalUri, required this.duration, required this.filesize, required this.bitrate, required this.channel, required this.codec, required this.container, required this.frequency, required this.rating, required this.platform, final  String? $type}): $type = $type ?? 'full',super._();
  factory ToneHarborTrackObjectFull.fromJson(Map<String, dynamic> json) => _$ToneHarborTrackObjectFullFromJson(json);

@override final  String id;
@override final  String title;
 final  String artist;
 final  String album;
 final  String externalUri;
 final  Duration duration;
 final  int filesize;
 final  int bitrate;
 final  int channel;
 final  String codec;
 final  String container;
 final  int frequency;
 final  int rating;
 final  ToneHarborTrackPlatform platform;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectFullCopyWith<ToneHarborTrackObjectFull> get copyWith => _$ToneHarborTrackObjectFullCopyWithImpl<ToneHarborTrackObjectFull>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToneHarborTrackObjectFullToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectFull&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.externalUri, externalUri) || other.externalUri == externalUri)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.filesize, filesize) || other.filesize == filesize)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.container, container) || other.container == container)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,album,externalUri,duration,filesize,bitrate,channel,codec,container,frequency,rating,platform);

@override
String toString() {
  return 'ToneHarborTrackObject.full(id: $id, title: $title, artist: $artist, album: $album, externalUri: $externalUri, duration: $duration, filesize: $filesize, bitrate: $bitrate, channel: $channel, codec: $codec, container: $container, frequency: $frequency, rating: $rating, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectFullCopyWith<$Res> implements $ToneHarborTrackObjectCopyWith<$Res> {
  factory $ToneHarborTrackObjectFullCopyWith(ToneHarborTrackObjectFull value, $Res Function(ToneHarborTrackObjectFull) _then) = _$ToneHarborTrackObjectFullCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String artist, String album, String externalUri, Duration duration, int filesize, int bitrate, int channel, String codec, String container, int frequency, int rating, ToneHarborTrackPlatform platform
});




}
/// @nodoc
class _$ToneHarborTrackObjectFullCopyWithImpl<$Res>
    implements $ToneHarborTrackObjectFullCopyWith<$Res> {
  _$ToneHarborTrackObjectFullCopyWithImpl(this._self, this._then);

  final ToneHarborTrackObjectFull _self;
  final $Res Function(ToneHarborTrackObjectFull) _then;

/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? externalUri = null,Object? duration = null,Object? filesize = null,Object? bitrate = null,Object? channel = null,Object? codec = null,Object? container = null,Object? frequency = null,Object? rating = null,Object? platform = null,}) {
  return _then(ToneHarborTrackObjectFull(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,externalUri: null == externalUri ? _self.externalUri : externalUri // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,filesize: null == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as ToneHarborTrackPlatform,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ToneHarborTrackObjectMultLocal extends ToneHarborTrackObject {
   ToneHarborTrackObjectMultLocal({required this.id, required this.title, required this.artist, required this.album, required this.externalUri, required this.duration, required this.filesize, required this.bitrate, required this.channel, required this.codec, required this.container, required this.frequency, required this.rating, required final  List<AudioQuality> availableQualities, final  String? $type}): _availableQualities = availableQualities,$type = $type ?? 'multLocal',super._();
  factory ToneHarborTrackObjectMultLocal.fromJson(Map<String, dynamic> json) => _$ToneHarborTrackObjectMultLocalFromJson(json);

@override final  String id;
@override final  String title;
 final  String artist;
 final  String album;
 final  String externalUri;
 final  Duration duration;
 final  int filesize;
 final  int bitrate;
 final  int channel;
 final  String codec;
 final  String container;
 final  int frequency;
 final  int rating;
 final  List<AudioQuality> _availableQualities;
 List<AudioQuality> get availableQualities {
  if (_availableQualities is EqualUnmodifiableListView) return _availableQualities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableQualities);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectMultLocalCopyWith<ToneHarborTrackObjectMultLocal> get copyWith => _$ToneHarborTrackObjectMultLocalCopyWithImpl<ToneHarborTrackObjectMultLocal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToneHarborTrackObjectMultLocalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectMultLocal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.externalUri, externalUri) || other.externalUri == externalUri)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.filesize, filesize) || other.filesize == filesize)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.container, container) || other.container == container)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._availableQualities, _availableQualities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,album,externalUri,duration,filesize,bitrate,channel,codec,container,frequency,rating,const DeepCollectionEquality().hash(_availableQualities));

@override
String toString() {
  return 'ToneHarborTrackObject.multLocal(id: $id, title: $title, artist: $artist, album: $album, externalUri: $externalUri, duration: $duration, filesize: $filesize, bitrate: $bitrate, channel: $channel, codec: $codec, container: $container, frequency: $frequency, rating: $rating, availableQualities: $availableQualities)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectMultLocalCopyWith<$Res> implements $ToneHarborTrackObjectCopyWith<$Res> {
  factory $ToneHarborTrackObjectMultLocalCopyWith(ToneHarborTrackObjectMultLocal value, $Res Function(ToneHarborTrackObjectMultLocal) _then) = _$ToneHarborTrackObjectMultLocalCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String artist, String album, String externalUri, Duration duration, int filesize, int bitrate, int channel, String codec, String container, int frequency, int rating, List<AudioQuality> availableQualities
});




}
/// @nodoc
class _$ToneHarborTrackObjectMultLocalCopyWithImpl<$Res>
    implements $ToneHarborTrackObjectMultLocalCopyWith<$Res> {
  _$ToneHarborTrackObjectMultLocalCopyWithImpl(this._self, this._then);

  final ToneHarborTrackObjectMultLocal _self;
  final $Res Function(ToneHarborTrackObjectMultLocal) _then;

/// Create a copy of ToneHarborTrackObject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? externalUri = null,Object? duration = null,Object? filesize = null,Object? bitrate = null,Object? channel = null,Object? codec = null,Object? container = null,Object? frequency = null,Object? rating = null,Object? availableQualities = null,}) {
  return _then(ToneHarborTrackObjectMultLocal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,externalUri: null == externalUri ? _self.externalUri : externalUri // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,filesize: null == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,availableQualities: null == availableQualities ? _self._availableQualities : availableQualities // ignore: cast_nullable_to_non_nullable
as List<AudioQuality>,
  ));
}


}

ToneHarborTrackObjectList _$ToneHarborTrackObjectListFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'empty':
          return ToneHarborTrackObjectListEmpty.fromJson(
            json
          );
                case 'data':
          return ToneHarborTrackObjectListData.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ToneHarborTrackObjectList',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ToneHarborTrackObjectList {



  /// Serializes this ToneHarborTrackObjectList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectList);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneHarborTrackObjectList()';
}


}

/// @nodoc
class $ToneHarborTrackObjectListCopyWith<$Res>  {
$ToneHarborTrackObjectListCopyWith(ToneHarborTrackObjectList _, $Res Function(ToneHarborTrackObjectList) __);
}


/// Adds pattern-matching-related methods to [ToneHarborTrackObjectList].
extension ToneHarborTrackObjectListPatterns on ToneHarborTrackObjectList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ToneHarborTrackObjectListEmpty value)?  empty,TResult Function( ToneHarborTrackObjectListData value)?  data,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ToneHarborTrackObjectListEmpty() when empty != null:
return empty(_that);case ToneHarborTrackObjectListData() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ToneHarborTrackObjectListEmpty value)  empty,required TResult Function( ToneHarborTrackObjectListData value)  data,}){
final _that = this;
switch (_that) {
case ToneHarborTrackObjectListEmpty():
return empty(_that);case ToneHarborTrackObjectListData():
return data(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ToneHarborTrackObjectListEmpty value)?  empty,TResult? Function( ToneHarborTrackObjectListData value)?  data,}){
final _that = this;
switch (_that) {
case ToneHarborTrackObjectListEmpty() when empty != null:
return empty(_that);case ToneHarborTrackObjectListData() when data != null:
return data(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( List<ToneHarborTrackObject> songs,  int? offset,  int? total)?  data,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ToneHarborTrackObjectListEmpty() when empty != null:
return empty();case ToneHarborTrackObjectListData() when data != null:
return data(_that.songs,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( List<ToneHarborTrackObject> songs,  int? offset,  int? total)  data,}) {final _that = this;
switch (_that) {
case ToneHarborTrackObjectListEmpty():
return empty();case ToneHarborTrackObjectListData():
return data(_that.songs,_that.offset,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( List<ToneHarborTrackObject> songs,  int? offset,  int? total)?  data,}) {final _that = this;
switch (_that) {
case ToneHarborTrackObjectListEmpty() when empty != null:
return empty();case ToneHarborTrackObjectListData() when data != null:
return data(_that.songs,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ToneHarborTrackObjectListEmpty extends ToneHarborTrackObjectList {
  const ToneHarborTrackObjectListEmpty({final  String? $type}): $type = $type ?? 'empty',super._();
  factory ToneHarborTrackObjectListEmpty.fromJson(Map<String, dynamic> json) => _$ToneHarborTrackObjectListEmptyFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ToneHarborTrackObjectListEmptyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectListEmpty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToneHarborTrackObjectList.empty()';
}


}




/// @nodoc
@JsonSerializable()

class ToneHarborTrackObjectListData extends ToneHarborTrackObjectList {
  const ToneHarborTrackObjectListData({required final  List<ToneHarborTrackObject> songs, this.offset, this.total, final  String? $type}): _songs = songs,$type = $type ?? 'data',super._();
  factory ToneHarborTrackObjectListData.fromJson(Map<String, dynamic> json) => _$ToneHarborTrackObjectListDataFromJson(json);

 final  List<ToneHarborTrackObject> _songs;
 List<ToneHarborTrackObject> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

 final  int? offset;
 final  int? total;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ToneHarborTrackObjectList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToneHarborTrackObjectListDataCopyWith<ToneHarborTrackObjectListData> get copyWith => _$ToneHarborTrackObjectListDataCopyWithImpl<ToneHarborTrackObjectListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToneHarborTrackObjectListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToneHarborTrackObjectListData&&const DeepCollectionEquality().equals(other._songs, _songs)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs),offset,total);

@override
String toString() {
  return 'ToneHarborTrackObjectList.data(songs: $songs, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $ToneHarborTrackObjectListDataCopyWith<$Res> implements $ToneHarborTrackObjectListCopyWith<$Res> {
  factory $ToneHarborTrackObjectListDataCopyWith(ToneHarborTrackObjectListData value, $Res Function(ToneHarborTrackObjectListData) _then) = _$ToneHarborTrackObjectListDataCopyWithImpl;
@useResult
$Res call({
 List<ToneHarborTrackObject> songs, int? offset, int? total
});




}
/// @nodoc
class _$ToneHarborTrackObjectListDataCopyWithImpl<$Res>
    implements $ToneHarborTrackObjectListDataCopyWith<$Res> {
  _$ToneHarborTrackObjectListDataCopyWithImpl(this._self, this._then);

  final ToneHarborTrackObjectListData _self;
  final $Res Function(ToneHarborTrackObjectListData) _then;

/// Create a copy of ToneHarborTrackObjectList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? songs = null,Object? offset = freezed,Object? total = freezed,}) {
  return _then(ToneHarborTrackObjectListData(
songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<ToneHarborTrackObject>,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
