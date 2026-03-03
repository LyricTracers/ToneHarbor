// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongRequest {

 String get api; String get method; String get version; int get limit; String get library; String get additional;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection; int get offset; String? get artist;@JsonKey(name: 'song_rating_meq') int? get songRatingMeq;
/// Create a copy of SongRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongRequestCopyWith<SongRequest> get copyWith => _$SongRequestCopyWithImpl<SongRequest>(this as SongRequest, _$identity);

  /// Serializes this SongRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.songRatingMeq, songRatingMeq) || other.songRatingMeq == songRatingMeq));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,limit,library,additional,sortBy,sortDirection,offset,artist,songRatingMeq);

@override
String toString() {
  return 'SongRequest(api: $api, method: $method, version: $version, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, artist: $artist, songRatingMeq: $songRatingMeq)';
}


}

/// @nodoc
abstract mixin class $SongRequestCopyWith<$Res>  {
  factory $SongRequestCopyWith(SongRequest value, $Res Function(SongRequest) _then) = _$SongRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, String? artist,@JsonKey(name: 'song_rating_meq') int? songRatingMeq
});




}
/// @nodoc
class _$SongRequestCopyWithImpl<$Res>
    implements $SongRequestCopyWith<$Res> {
  _$SongRequestCopyWithImpl(this._self, this._then);

  final SongRequest _self;
  final $Res Function(SongRequest) _then;

/// Create a copy of SongRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? artist = freezed,Object? songRatingMeq = freezed,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,songRatingMeq: freezed == songRatingMeq ? _self.songRatingMeq : songRatingMeq // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SongRequest].
extension SongRequestPatterns on SongRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongRequest value)  $default,){
final _that = this;
switch (_that) {
case _SongRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SongRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  String? artist, @JsonKey(name: 'song_rating_meq')  int? songRatingMeq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.artist,_that.songRatingMeq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  String? artist, @JsonKey(name: 'song_rating_meq')  int? songRatingMeq)  $default,) {final _that = this;
switch (_that) {
case _SongRequest():
return $default(_that.api,_that.method,_that.version,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.artist,_that.songRatingMeq);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  String? artist, @JsonKey(name: 'song_rating_meq')  int? songRatingMeq)?  $default,) {final _that = this;
switch (_that) {
case _SongRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.artist,_that.songRatingMeq);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongRequest extends SongRequest {
  const _SongRequest({required this.api, required this.method, required this.version, required this.limit, required this.library, required this.additional, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection, required this.offset, this.artist, @JsonKey(name: 'song_rating_meq') this.songRatingMeq}): super._();
  factory _SongRequest.fromJson(Map<String, dynamic> json) => _$SongRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  int limit;
@override final  String library;
@override final  String additional;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;
@override final  int offset;
@override final  String? artist;
@override@JsonKey(name: 'song_rating_meq') final  int? songRatingMeq;

/// Create a copy of SongRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongRequestCopyWith<_SongRequest> get copyWith => __$SongRequestCopyWithImpl<_SongRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.songRatingMeq, songRatingMeq) || other.songRatingMeq == songRatingMeq));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,limit,library,additional,sortBy,sortDirection,offset,artist,songRatingMeq);

@override
String toString() {
  return 'SongRequest(api: $api, method: $method, version: $version, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, artist: $artist, songRatingMeq: $songRatingMeq)';
}


}

/// @nodoc
abstract mixin class _$SongRequestCopyWith<$Res> implements $SongRequestCopyWith<$Res> {
  factory _$SongRequestCopyWith(_SongRequest value, $Res Function(_SongRequest) _then) = __$SongRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, String? artist,@JsonKey(name: 'song_rating_meq') int? songRatingMeq
});




}
/// @nodoc
class __$SongRequestCopyWithImpl<$Res>
    implements _$SongRequestCopyWith<$Res> {
  __$SongRequestCopyWithImpl(this._self, this._then);

  final _SongRequest _self;
  final $Res Function(_SongRequest) _then;

/// Create a copy of SongRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? artist = freezed,Object? songRatingMeq = freezed,}) {
  return _then(_SongRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,songRatingMeq: freezed == songRatingMeq ? _self.songRatingMeq : songRatingMeq // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SongAudio {

 int get bitrate; int get channel; String get codec; String get container; int get duration; int get filesize; int get frequency;
/// Create a copy of SongAudio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongAudioCopyWith<SongAudio> get copyWith => _$SongAudioCopyWithImpl<SongAudio>(this as SongAudio, _$identity);

  /// Serializes this SongAudio to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongAudio&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.container, container) || other.container == container)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.filesize, filesize) || other.filesize == filesize)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bitrate,channel,codec,container,duration,filesize,frequency);

@override
String toString() {
  return 'SongAudio(bitrate: $bitrate, channel: $channel, codec: $codec, container: $container, duration: $duration, filesize: $filesize, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class $SongAudioCopyWith<$Res>  {
  factory $SongAudioCopyWith(SongAudio value, $Res Function(SongAudio) _then) = _$SongAudioCopyWithImpl;
@useResult
$Res call({
 int bitrate, int channel, String codec, String container, int duration, int filesize, int frequency
});




}
/// @nodoc
class _$SongAudioCopyWithImpl<$Res>
    implements $SongAudioCopyWith<$Res> {
  _$SongAudioCopyWithImpl(this._self, this._then);

  final SongAudio _self;
  final $Res Function(SongAudio) _then;

/// Create a copy of SongAudio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bitrate = null,Object? channel = null,Object? codec = null,Object? container = null,Object? duration = null,Object? filesize = null,Object? frequency = null,}) {
  return _then(_self.copyWith(
bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,filesize: null == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SongAudio].
extension SongAudioPatterns on SongAudio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongAudio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongAudio() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongAudio value)  $default,){
final _that = this;
switch (_that) {
case _SongAudio():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongAudio value)?  $default,){
final _that = this;
switch (_that) {
case _SongAudio() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int bitrate,  int channel,  String codec,  String container,  int duration,  int filesize,  int frequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongAudio() when $default != null:
return $default(_that.bitrate,_that.channel,_that.codec,_that.container,_that.duration,_that.filesize,_that.frequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int bitrate,  int channel,  String codec,  String container,  int duration,  int filesize,  int frequency)  $default,) {final _that = this;
switch (_that) {
case _SongAudio():
return $default(_that.bitrate,_that.channel,_that.codec,_that.container,_that.duration,_that.filesize,_that.frequency);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int bitrate,  int channel,  String codec,  String container,  int duration,  int filesize,  int frequency)?  $default,) {final _that = this;
switch (_that) {
case _SongAudio() when $default != null:
return $default(_that.bitrate,_that.channel,_that.codec,_that.container,_that.duration,_that.filesize,_that.frequency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongAudio extends SongAudio {
  const _SongAudio({required this.bitrate, required this.channel, required this.codec, required this.container, required this.duration, required this.filesize, required this.frequency}): super._();
  factory _SongAudio.fromJson(Map<String, dynamic> json) => _$SongAudioFromJson(json);

@override final  int bitrate;
@override final  int channel;
@override final  String codec;
@override final  String container;
@override final  int duration;
@override final  int filesize;
@override final  int frequency;

/// Create a copy of SongAudio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongAudioCopyWith<_SongAudio> get copyWith => __$SongAudioCopyWithImpl<_SongAudio>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongAudioToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongAudio&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.container, container) || other.container == container)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.filesize, filesize) || other.filesize == filesize)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bitrate,channel,codec,container,duration,filesize,frequency);

@override
String toString() {
  return 'SongAudio(bitrate: $bitrate, channel: $channel, codec: $codec, container: $container, duration: $duration, filesize: $filesize, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class _$SongAudioCopyWith<$Res> implements $SongAudioCopyWith<$Res> {
  factory _$SongAudioCopyWith(_SongAudio value, $Res Function(_SongAudio) _then) = __$SongAudioCopyWithImpl;
@override @useResult
$Res call({
 int bitrate, int channel, String codec, String container, int duration, int filesize, int frequency
});




}
/// @nodoc
class __$SongAudioCopyWithImpl<$Res>
    implements _$SongAudioCopyWith<$Res> {
  __$SongAudioCopyWithImpl(this._self, this._then);

  final _SongAudio _self;
  final $Res Function(_SongAudio) _then;

/// Create a copy of SongAudio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bitrate = null,Object? channel = null,Object? codec = null,Object? container = null,Object? duration = null,Object? filesize = null,Object? frequency = null,}) {
  return _then(_SongAudio(
bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,filesize: null == filesize ? _self.filesize : filesize // ignore: cast_nullable_to_non_nullable
as int,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SongRating {

 int get rating;
/// Create a copy of SongRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongRatingCopyWith<SongRating> get copyWith => _$SongRatingCopyWithImpl<SongRating>(this as SongRating, _$identity);

  /// Serializes this SongRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongRating&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating);

@override
String toString() {
  return 'SongRating(rating: $rating)';
}


}

/// @nodoc
abstract mixin class $SongRatingCopyWith<$Res>  {
  factory $SongRatingCopyWith(SongRating value, $Res Function(SongRating) _then) = _$SongRatingCopyWithImpl;
@useResult
$Res call({
 int rating
});




}
/// @nodoc
class _$SongRatingCopyWithImpl<$Res>
    implements $SongRatingCopyWith<$Res> {
  _$SongRatingCopyWithImpl(this._self, this._then);

  final SongRating _self;
  final $Res Function(SongRating) _then;

/// Create a copy of SongRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rating = null,}) {
  return _then(_self.copyWith(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SongRating].
extension SongRatingPatterns on SongRating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongRating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongRating value)  $default,){
final _that = this;
switch (_that) {
case _SongRating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongRating value)?  $default,){
final _that = this;
switch (_that) {
case _SongRating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongRating() when $default != null:
return $default(_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rating)  $default,) {final _that = this;
switch (_that) {
case _SongRating():
return $default(_that.rating);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rating)?  $default,) {final _that = this;
switch (_that) {
case _SongRating() when $default != null:
return $default(_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongRating extends SongRating {
  const _SongRating({required this.rating}): super._();
  factory _SongRating.fromJson(Map<String, dynamic> json) => _$SongRatingFromJson(json);

@override final  int rating;

/// Create a copy of SongRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongRatingCopyWith<_SongRating> get copyWith => __$SongRatingCopyWithImpl<_SongRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongRatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongRating&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating);

@override
String toString() {
  return 'SongRating(rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$SongRatingCopyWith<$Res> implements $SongRatingCopyWith<$Res> {
  factory _$SongRatingCopyWith(_SongRating value, $Res Function(_SongRating) _then) = __$SongRatingCopyWithImpl;
@override @useResult
$Res call({
 int rating
});




}
/// @nodoc
class __$SongRatingCopyWithImpl<$Res>
    implements _$SongRatingCopyWith<$Res> {
  __$SongRatingCopyWithImpl(this._self, this._then);

  final _SongRating _self;
  final $Res Function(_SongRating) _then;

/// Create a copy of SongRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rating = null,}) {
  return _then(_SongRating(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SongTag {

 String? get album;@JsonKey(name: 'album_artist') String? get albumArtist; String? get artist; String? get comment; String? get composer; int get disc; String? get genre; int get track; int get year;
/// Create a copy of SongTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongTagCopyWith<SongTag> get copyWith => _$SongTagCopyWithImpl<SongTag>(this as SongTag, _$identity);

  /// Serializes this SongTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongTag&&(identical(other.album, album) || other.album == album)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.composer, composer) || other.composer == composer)&&(identical(other.disc, disc) || other.disc == disc)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.track, track) || other.track == track)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,album,albumArtist,artist,comment,composer,disc,genre,track,year);

@override
String toString() {
  return 'SongTag(album: $album, albumArtist: $albumArtist, artist: $artist, comment: $comment, composer: $composer, disc: $disc, genre: $genre, track: $track, year: $year)';
}


}

/// @nodoc
abstract mixin class $SongTagCopyWith<$Res>  {
  factory $SongTagCopyWith(SongTag value, $Res Function(SongTag) _then) = _$SongTagCopyWithImpl;
@useResult
$Res call({
 String? album,@JsonKey(name: 'album_artist') String? albumArtist, String? artist, String? comment, String? composer, int disc, String? genre, int track, int year
});




}
/// @nodoc
class _$SongTagCopyWithImpl<$Res>
    implements $SongTagCopyWith<$Res> {
  _$SongTagCopyWithImpl(this._self, this._then);

  final SongTag _self;
  final $Res Function(SongTag) _then;

/// Create a copy of SongTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? album = freezed,Object? albumArtist = freezed,Object? artist = freezed,Object? comment = freezed,Object? composer = freezed,Object? disc = null,Object? genre = freezed,Object? track = null,Object? year = null,}) {
  return _then(_self.copyWith(
album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,albumArtist: freezed == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,composer: freezed == composer ? _self.composer : composer // ignore: cast_nullable_to_non_nullable
as String?,disc: null == disc ? _self.disc : disc // ignore: cast_nullable_to_non_nullable
as int,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SongTag].
extension SongTagPatterns on SongTag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongTag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongTag value)  $default,){
final _that = this;
switch (_that) {
case _SongTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongTag value)?  $default,){
final _that = this;
switch (_that) {
case _SongTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? album, @JsonKey(name: 'album_artist')  String? albumArtist,  String? artist,  String? comment,  String? composer,  int disc,  String? genre,  int track,  int year)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongTag() when $default != null:
return $default(_that.album,_that.albumArtist,_that.artist,_that.comment,_that.composer,_that.disc,_that.genre,_that.track,_that.year);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? album, @JsonKey(name: 'album_artist')  String? albumArtist,  String? artist,  String? comment,  String? composer,  int disc,  String? genre,  int track,  int year)  $default,) {final _that = this;
switch (_that) {
case _SongTag():
return $default(_that.album,_that.albumArtist,_that.artist,_that.comment,_that.composer,_that.disc,_that.genre,_that.track,_that.year);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? album, @JsonKey(name: 'album_artist')  String? albumArtist,  String? artist,  String? comment,  String? composer,  int disc,  String? genre,  int track,  int year)?  $default,) {final _that = this;
switch (_that) {
case _SongTag() when $default != null:
return $default(_that.album,_that.albumArtist,_that.artist,_that.comment,_that.composer,_that.disc,_that.genre,_that.track,_that.year);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongTag extends SongTag {
  const _SongTag({this.album, @JsonKey(name: 'album_artist') this.albumArtist, this.artist, this.comment, this.composer, required this.disc, this.genre, required this.track, required this.year}): super._();
  factory _SongTag.fromJson(Map<String, dynamic> json) => _$SongTagFromJson(json);

@override final  String? album;
@override@JsonKey(name: 'album_artist') final  String? albumArtist;
@override final  String? artist;
@override final  String? comment;
@override final  String? composer;
@override final  int disc;
@override final  String? genre;
@override final  int track;
@override final  int year;

/// Create a copy of SongTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongTagCopyWith<_SongTag> get copyWith => __$SongTagCopyWithImpl<_SongTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongTag&&(identical(other.album, album) || other.album == album)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.composer, composer) || other.composer == composer)&&(identical(other.disc, disc) || other.disc == disc)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.track, track) || other.track == track)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,album,albumArtist,artist,comment,composer,disc,genre,track,year);

@override
String toString() {
  return 'SongTag(album: $album, albumArtist: $albumArtist, artist: $artist, comment: $comment, composer: $composer, disc: $disc, genre: $genre, track: $track, year: $year)';
}


}

/// @nodoc
abstract mixin class _$SongTagCopyWith<$Res> implements $SongTagCopyWith<$Res> {
  factory _$SongTagCopyWith(_SongTag value, $Res Function(_SongTag) _then) = __$SongTagCopyWithImpl;
@override @useResult
$Res call({
 String? album,@JsonKey(name: 'album_artist') String? albumArtist, String? artist, String? comment, String? composer, int disc, String? genre, int track, int year
});




}
/// @nodoc
class __$SongTagCopyWithImpl<$Res>
    implements _$SongTagCopyWith<$Res> {
  __$SongTagCopyWithImpl(this._self, this._then);

  final _SongTag _self;
  final $Res Function(_SongTag) _then;

/// Create a copy of SongTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? album = freezed,Object? albumArtist = freezed,Object? artist = freezed,Object? comment = freezed,Object? composer = freezed,Object? disc = null,Object? genre = freezed,Object? track = null,Object? year = null,}) {
  return _then(_SongTag(
album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,albumArtist: freezed == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,composer: freezed == composer ? _self.composer : composer // ignore: cast_nullable_to_non_nullable
as String?,disc: null == disc ? _self.disc : disc // ignore: cast_nullable_to_non_nullable
as int,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SongAdditional {

@JsonKey(name: 'song_audio') SongAudio? get songAudio;@JsonKey(name: 'song_rating') SongRating? get songRating;@JsonKey(name: 'song_tag') SongTag? get songTag;
/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongAdditionalCopyWith<SongAdditional> get copyWith => _$SongAdditionalCopyWithImpl<SongAdditional>(this as SongAdditional, _$identity);

  /// Serializes this SongAdditional to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongAdditional&&(identical(other.songAudio, songAudio) || other.songAudio == songAudio)&&(identical(other.songRating, songRating) || other.songRating == songRating)&&(identical(other.songTag, songTag) || other.songTag == songTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,songAudio,songRating,songTag);

@override
String toString() {
  return 'SongAdditional(songAudio: $songAudio, songRating: $songRating, songTag: $songTag)';
}


}

/// @nodoc
abstract mixin class $SongAdditionalCopyWith<$Res>  {
  factory $SongAdditionalCopyWith(SongAdditional value, $Res Function(SongAdditional) _then) = _$SongAdditionalCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'song_audio') SongAudio? songAudio,@JsonKey(name: 'song_rating') SongRating? songRating,@JsonKey(name: 'song_tag') SongTag? songTag
});


$SongAudioCopyWith<$Res>? get songAudio;$SongRatingCopyWith<$Res>? get songRating;$SongTagCopyWith<$Res>? get songTag;

}
/// @nodoc
class _$SongAdditionalCopyWithImpl<$Res>
    implements $SongAdditionalCopyWith<$Res> {
  _$SongAdditionalCopyWithImpl(this._self, this._then);

  final SongAdditional _self;
  final $Res Function(SongAdditional) _then;

/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? songAudio = freezed,Object? songRating = freezed,Object? songTag = freezed,}) {
  return _then(_self.copyWith(
songAudio: freezed == songAudio ? _self.songAudio : songAudio // ignore: cast_nullable_to_non_nullable
as SongAudio?,songRating: freezed == songRating ? _self.songRating : songRating // ignore: cast_nullable_to_non_nullable
as SongRating?,songTag: freezed == songTag ? _self.songTag : songTag // ignore: cast_nullable_to_non_nullable
as SongTag?,
  ));
}
/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongAudioCopyWith<$Res>? get songAudio {
    if (_self.songAudio == null) {
    return null;
  }

  return $SongAudioCopyWith<$Res>(_self.songAudio!, (value) {
    return _then(_self.copyWith(songAudio: value));
  });
}/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongRatingCopyWith<$Res>? get songRating {
    if (_self.songRating == null) {
    return null;
  }

  return $SongRatingCopyWith<$Res>(_self.songRating!, (value) {
    return _then(_self.copyWith(songRating: value));
  });
}/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongTagCopyWith<$Res>? get songTag {
    if (_self.songTag == null) {
    return null;
  }

  return $SongTagCopyWith<$Res>(_self.songTag!, (value) {
    return _then(_self.copyWith(songTag: value));
  });
}
}


/// Adds pattern-matching-related methods to [SongAdditional].
extension SongAdditionalPatterns on SongAdditional {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongAdditional value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongAdditional() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongAdditional value)  $default,){
final _that = this;
switch (_that) {
case _SongAdditional():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongAdditional value)?  $default,){
final _that = this;
switch (_that) {
case _SongAdditional() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'song_audio')  SongAudio? songAudio, @JsonKey(name: 'song_rating')  SongRating? songRating, @JsonKey(name: 'song_tag')  SongTag? songTag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongAdditional() when $default != null:
return $default(_that.songAudio,_that.songRating,_that.songTag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'song_audio')  SongAudio? songAudio, @JsonKey(name: 'song_rating')  SongRating? songRating, @JsonKey(name: 'song_tag')  SongTag? songTag)  $default,) {final _that = this;
switch (_that) {
case _SongAdditional():
return $default(_that.songAudio,_that.songRating,_that.songTag);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'song_audio')  SongAudio? songAudio, @JsonKey(name: 'song_rating')  SongRating? songRating, @JsonKey(name: 'song_tag')  SongTag? songTag)?  $default,) {final _that = this;
switch (_that) {
case _SongAdditional() when $default != null:
return $default(_that.songAudio,_that.songRating,_that.songTag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongAdditional extends SongAdditional {
  const _SongAdditional({@JsonKey(name: 'song_audio') this.songAudio, @JsonKey(name: 'song_rating') this.songRating, @JsonKey(name: 'song_tag') this.songTag}): super._();
  factory _SongAdditional.fromJson(Map<String, dynamic> json) => _$SongAdditionalFromJson(json);

@override@JsonKey(name: 'song_audio') final  SongAudio? songAudio;
@override@JsonKey(name: 'song_rating') final  SongRating? songRating;
@override@JsonKey(name: 'song_tag') final  SongTag? songTag;

/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongAdditionalCopyWith<_SongAdditional> get copyWith => __$SongAdditionalCopyWithImpl<_SongAdditional>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongAdditionalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongAdditional&&(identical(other.songAudio, songAudio) || other.songAudio == songAudio)&&(identical(other.songRating, songRating) || other.songRating == songRating)&&(identical(other.songTag, songTag) || other.songTag == songTag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,songAudio,songRating,songTag);

@override
String toString() {
  return 'SongAdditional(songAudio: $songAudio, songRating: $songRating, songTag: $songTag)';
}


}

/// @nodoc
abstract mixin class _$SongAdditionalCopyWith<$Res> implements $SongAdditionalCopyWith<$Res> {
  factory _$SongAdditionalCopyWith(_SongAdditional value, $Res Function(_SongAdditional) _then) = __$SongAdditionalCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'song_audio') SongAudio? songAudio,@JsonKey(name: 'song_rating') SongRating? songRating,@JsonKey(name: 'song_tag') SongTag? songTag
});


@override $SongAudioCopyWith<$Res>? get songAudio;@override $SongRatingCopyWith<$Res>? get songRating;@override $SongTagCopyWith<$Res>? get songTag;

}
/// @nodoc
class __$SongAdditionalCopyWithImpl<$Res>
    implements _$SongAdditionalCopyWith<$Res> {
  __$SongAdditionalCopyWithImpl(this._self, this._then);

  final _SongAdditional _self;
  final $Res Function(_SongAdditional) _then;

/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? songAudio = freezed,Object? songRating = freezed,Object? songTag = freezed,}) {
  return _then(_SongAdditional(
songAudio: freezed == songAudio ? _self.songAudio : songAudio // ignore: cast_nullable_to_non_nullable
as SongAudio?,songRating: freezed == songRating ? _self.songRating : songRating // ignore: cast_nullable_to_non_nullable
as SongRating?,songTag: freezed == songTag ? _self.songTag : songTag // ignore: cast_nullable_to_non_nullable
as SongTag?,
  ));
}

/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongAudioCopyWith<$Res>? get songAudio {
    if (_self.songAudio == null) {
    return null;
  }

  return $SongAudioCopyWith<$Res>(_self.songAudio!, (value) {
    return _then(_self.copyWith(songAudio: value));
  });
}/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongRatingCopyWith<$Res>? get songRating {
    if (_self.songRating == null) {
    return null;
  }

  return $SongRatingCopyWith<$Res>(_self.songRating!, (value) {
    return _then(_self.copyWith(songRating: value));
  });
}/// Create a copy of SongAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongTagCopyWith<$Res>? get songTag {
    if (_self.songTag == null) {
    return null;
  }

  return $SongTagCopyWith<$Res>(_self.songTag!, (value) {
    return _then(_self.copyWith(songTag: value));
  });
}
}


/// @nodoc
mixin _$Song {

 String get id; String get path; String get title; String get type; SongAdditional? get additional;
/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongCopyWith<Song> get copyWith => _$SongCopyWithImpl<Song>(this as Song, _$identity);

  /// Serializes this Song to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Song&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,path,title,type,additional);

@override
String toString() {
  return 'Song(id: $id, path: $path, title: $title, type: $type, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $SongCopyWith<$Res>  {
  factory $SongCopyWith(Song value, $Res Function(Song) _then) = _$SongCopyWithImpl;
@useResult
$Res call({
 String id, String path, String title, String type, SongAdditional? additional
});


$SongAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class _$SongCopyWithImpl<$Res>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._self, this._then);

  final Song _self;
  final $Res Function(Song) _then;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? path = null,Object? title = null,Object? type = null,Object? additional = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as SongAdditional?,
  ));
}
/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $SongAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// Adds pattern-matching-related methods to [Song].
extension SongPatterns on Song {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Song value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Song() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Song value)  $default,){
final _that = this;
switch (_that) {
case _Song():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Song value)?  $default,){
final _that = this;
switch (_that) {
case _Song() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String path,  String title,  String type,  SongAdditional? additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Song() when $default != null:
return $default(_that.id,_that.path,_that.title,_that.type,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String path,  String title,  String type,  SongAdditional? additional)  $default,) {final _that = this;
switch (_that) {
case _Song():
return $default(_that.id,_that.path,_that.title,_that.type,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String path,  String title,  String type,  SongAdditional? additional)?  $default,) {final _that = this;
switch (_that) {
case _Song() when $default != null:
return $default(_that.id,_that.path,_that.title,_that.type,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Song extends Song {
  const _Song({required this.id, required this.path, required this.title, required this.type, this.additional}): super._();
  factory _Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

@override final  String id;
@override final  String path;
@override final  String title;
@override final  String type;
@override final  SongAdditional? additional;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongCopyWith<_Song> get copyWith => __$SongCopyWithImpl<_Song>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Song&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,path,title,type,additional);

@override
String toString() {
  return 'Song(id: $id, path: $path, title: $title, type: $type, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$SongCopyWith(_Song value, $Res Function(_Song) _then) = __$SongCopyWithImpl;
@override @useResult
$Res call({
 String id, String path, String title, String type, SongAdditional? additional
});


@override $SongAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class __$SongCopyWithImpl<$Res>
    implements _$SongCopyWith<$Res> {
  __$SongCopyWithImpl(this._self, this._then);

  final _Song _self;
  final $Res Function(_Song) _then;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? path = null,Object? title = null,Object? type = null,Object? additional = freezed,}) {
  return _then(_Song(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as SongAdditional?,
  ));
}

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $SongAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// @nodoc
mixin _$SongData {

 List<Song> get songs; int? get offset; int? get total;
/// Create a copy of SongData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongDataCopyWith<SongData> get copyWith => _$SongDataCopyWithImpl<SongData>(this as SongData, _$identity);

  /// Serializes this SongData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongData&&const DeepCollectionEquality().equals(other.songs, songs)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(songs),offset,total);

@override
String toString() {
  return 'SongData(songs: $songs, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $SongDataCopyWith<$Res>  {
  factory $SongDataCopyWith(SongData value, $Res Function(SongData) _then) = _$SongDataCopyWithImpl;
@useResult
$Res call({
 List<Song> songs, int? offset, int? total
});




}
/// @nodoc
class _$SongDataCopyWithImpl<$Res>
    implements $SongDataCopyWith<$Res> {
  _$SongDataCopyWithImpl(this._self, this._then);

  final SongData _self;
  final $Res Function(SongData) _then;

/// Create a copy of SongData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? songs = null,Object? offset = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<Song>,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SongData].
extension SongDataPatterns on SongData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongData value)  $default,){
final _that = this;
switch (_that) {
case _SongData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongData value)?  $default,){
final _that = this;
switch (_that) {
case _SongData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Song> songs,  int? offset,  int? total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongData() when $default != null:
return $default(_that.songs,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Song> songs,  int? offset,  int? total)  $default,) {final _that = this;
switch (_that) {
case _SongData():
return $default(_that.songs,_that.offset,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Song> songs,  int? offset,  int? total)?  $default,) {final _that = this;
switch (_that) {
case _SongData() when $default != null:
return $default(_that.songs,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongData extends SongData {
  const _SongData({required final  List<Song> songs, this.offset, this.total}): _songs = songs,super._();
  factory _SongData.fromJson(Map<String, dynamic> json) => _$SongDataFromJson(json);

 final  List<Song> _songs;
@override List<Song> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

@override final  int? offset;
@override final  int? total;

/// Create a copy of SongData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongDataCopyWith<_SongData> get copyWith => __$SongDataCopyWithImpl<_SongData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongData&&const DeepCollectionEquality().equals(other._songs, _songs)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs),offset,total);

@override
String toString() {
  return 'SongData(songs: $songs, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SongDataCopyWith<$Res> implements $SongDataCopyWith<$Res> {
  factory _$SongDataCopyWith(_SongData value, $Res Function(_SongData) _then) = __$SongDataCopyWithImpl;
@override @useResult
$Res call({
 List<Song> songs, int? offset, int? total
});




}
/// @nodoc
class __$SongDataCopyWithImpl<$Res>
    implements _$SongDataCopyWith<$Res> {
  __$SongDataCopyWithImpl(this._self, this._then);

  final _SongData _self;
  final $Res Function(_SongData) _then;

/// Create a copy of SongData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? songs = null,Object? offset = freezed,Object? total = freezed,}) {
  return _then(_SongData(
songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<Song>,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SongListResponse {

 bool get success; SongData? get data;
/// Create a copy of SongListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongListResponseCopyWith<SongListResponse> get copyWith => _$SongListResponseCopyWithImpl<SongListResponse>(this as SongListResponse, _$identity);

  /// Serializes this SongListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SongListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SongListResponseCopyWith<$Res>  {
  factory $SongListResponseCopyWith(SongListResponse value, $Res Function(SongListResponse) _then) = _$SongListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, SongData? data
});


$SongDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$SongListResponseCopyWithImpl<$Res>
    implements $SongListResponseCopyWith<$Res> {
  _$SongListResponseCopyWithImpl(this._self, this._then);

  final SongListResponse _self;
  final $Res Function(SongListResponse) _then;

/// Create a copy of SongListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SongData?,
  ));
}
/// Create a copy of SongListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SongDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SongListResponse].
extension SongListResponsePatterns on SongListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongListResponse value)  $default,){
final _that = this;
switch (_that) {
case _SongListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SongListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  SongData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  SongData? data)  $default,) {final _that = this;
switch (_that) {
case _SongListResponse():
return $default(_that.success,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  SongData? data)?  $default,) {final _that = this;
switch (_that) {
case _SongListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongListResponse extends SongListResponse {
  const _SongListResponse({required this.success, this.data}): super._();
  factory _SongListResponse.fromJson(Map<String, dynamic> json) => _$SongListResponseFromJson(json);

@override final  bool success;
@override final  SongData? data;

/// Create a copy of SongListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongListResponseCopyWith<_SongListResponse> get copyWith => __$SongListResponseCopyWithImpl<_SongListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SongListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SongListResponseCopyWith<$Res> implements $SongListResponseCopyWith<$Res> {
  factory _$SongListResponseCopyWith(_SongListResponse value, $Res Function(_SongListResponse) _then) = __$SongListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, SongData? data
});


@override $SongDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$SongListResponseCopyWithImpl<$Res>
    implements _$SongListResponseCopyWith<$Res> {
  __$SongListResponseCopyWithImpl(this._self, this._then);

  final _SongListResponse _self;
  final $Res Function(_SongListResponse) _then;

/// Create a copy of SongListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_SongListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SongData?,
  ));
}

/// Create a copy of SongListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SongDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SetRatingRequest {

 String get api; String get method; String get id; int get rating; int get version;
/// Create a copy of SetRatingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetRatingRequestCopyWith<SetRatingRequest> get copyWith => _$SetRatingRequestCopyWithImpl<SetRatingRequest>(this as SetRatingRequest, _$identity);

  /// Serializes this SetRatingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetRatingRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,rating,version);

@override
String toString() {
  return 'SetRatingRequest(api: $api, method: $method, id: $id, rating: $rating, version: $version)';
}


}

/// @nodoc
abstract mixin class $SetRatingRequestCopyWith<$Res>  {
  factory $SetRatingRequestCopyWith(SetRatingRequest value, $Res Function(SetRatingRequest) _then) = _$SetRatingRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String id, int rating, int version
});




}
/// @nodoc
class _$SetRatingRequestCopyWithImpl<$Res>
    implements $SetRatingRequestCopyWith<$Res> {
  _$SetRatingRequestCopyWithImpl(this._self, this._then);

  final SetRatingRequest _self;
  final $Res Function(SetRatingRequest) _then;

/// Create a copy of SetRatingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? id = null,Object? rating = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SetRatingRequest].
extension SetRatingRequestPatterns on SetRatingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetRatingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetRatingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetRatingRequest value)  $default,){
final _that = this;
switch (_that) {
case _SetRatingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetRatingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SetRatingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String id,  int rating,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetRatingRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.rating,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String id,  int rating,  int version)  $default,) {final _that = this;
switch (_that) {
case _SetRatingRequest():
return $default(_that.api,_that.method,_that.id,_that.rating,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String id,  int rating,  int version)?  $default,) {final _that = this;
switch (_that) {
case _SetRatingRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.rating,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetRatingRequest extends SetRatingRequest {
  const _SetRatingRequest({required this.api, required this.method, required this.id, required this.rating, required this.version}): super._();
  factory _SetRatingRequest.fromJson(Map<String, dynamic> json) => _$SetRatingRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String id;
@override final  int rating;
@override final  int version;

/// Create a copy of SetRatingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetRatingRequestCopyWith<_SetRatingRequest> get copyWith => __$SetRatingRequestCopyWithImpl<_SetRatingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetRatingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetRatingRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,rating,version);

@override
String toString() {
  return 'SetRatingRequest(api: $api, method: $method, id: $id, rating: $rating, version: $version)';
}


}

/// @nodoc
abstract mixin class _$SetRatingRequestCopyWith<$Res> implements $SetRatingRequestCopyWith<$Res> {
  factory _$SetRatingRequestCopyWith(_SetRatingRequest value, $Res Function(_SetRatingRequest) _then) = __$SetRatingRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String id, int rating, int version
});




}
/// @nodoc
class __$SetRatingRequestCopyWithImpl<$Res>
    implements _$SetRatingRequestCopyWith<$Res> {
  __$SetRatingRequestCopyWithImpl(this._self, this._then);

  final _SetRatingRequest _self;
  final $Res Function(_SetRatingRequest) _then;

/// Create a copy of SetRatingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? id = null,Object? rating = null,Object? version = null,}) {
  return _then(_SetRatingRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SetRatingResponse {

 bool get success;
/// Create a copy of SetRatingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetRatingResponseCopyWith<SetRatingResponse> get copyWith => _$SetRatingResponseCopyWithImpl<SetRatingResponse>(this as SetRatingResponse, _$identity);

  /// Serializes this SetRatingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetRatingResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'SetRatingResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $SetRatingResponseCopyWith<$Res>  {
  factory $SetRatingResponseCopyWith(SetRatingResponse value, $Res Function(SetRatingResponse) _then) = _$SetRatingResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$SetRatingResponseCopyWithImpl<$Res>
    implements $SetRatingResponseCopyWith<$Res> {
  _$SetRatingResponseCopyWithImpl(this._self, this._then);

  final SetRatingResponse _self;
  final $Res Function(SetRatingResponse) _then;

/// Create a copy of SetRatingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SetRatingResponse].
extension SetRatingResponsePatterns on SetRatingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetRatingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetRatingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetRatingResponse value)  $default,){
final _that = this;
switch (_that) {
case _SetRatingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetRatingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SetRatingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetRatingResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _SetRatingResponse():
return $default(_that.success);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _SetRatingResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetRatingResponse extends SetRatingResponse {
  const _SetRatingResponse({required this.success}): super._();
  factory _SetRatingResponse.fromJson(Map<String, dynamic> json) => _$SetRatingResponseFromJson(json);

@override final  bool success;

/// Create a copy of SetRatingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetRatingResponseCopyWith<_SetRatingResponse> get copyWith => __$SetRatingResponseCopyWithImpl<_SetRatingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetRatingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetRatingResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'SetRatingResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$SetRatingResponseCopyWith<$Res> implements $SetRatingResponseCopyWith<$Res> {
  factory _$SetRatingResponseCopyWith(_SetRatingResponse value, $Res Function(_SetRatingResponse) _then) = __$SetRatingResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$SetRatingResponseCopyWithImpl<$Res>
    implements _$SetRatingResponseCopyWith<$Res> {
  __$SetRatingResponseCopyWithImpl(this._self, this._then);

  final _SetRatingResponse _self;
  final $Res Function(_SetRatingResponse) _then;

/// Create a copy of SetRatingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_SetRatingResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AlbumSongsRequest {

 String get api; String get method; String get version; int get limit; String get library; String get additional;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection; int get offset; String get album;@JsonKey(name: 'album_artist') String get albumArtist; String? get artist;
/// Create a copy of AlbumSongsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumSongsRequestCopyWith<AlbumSongsRequest> get copyWith => _$AlbumSongsRequestCopyWithImpl<AlbumSongsRequest>(this as AlbumSongsRequest, _$identity);

  /// Serializes this AlbumSongsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumSongsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.album, album) || other.album == album)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.artist, artist) || other.artist == artist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,limit,library,additional,sortBy,sortDirection,offset,album,albumArtist,artist);

@override
String toString() {
  return 'AlbumSongsRequest(api: $api, method: $method, version: $version, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, album: $album, albumArtist: $albumArtist, artist: $artist)';
}


}

/// @nodoc
abstract mixin class $AlbumSongsRequestCopyWith<$Res>  {
  factory $AlbumSongsRequestCopyWith(AlbumSongsRequest value, $Res Function(AlbumSongsRequest) _then) = _$AlbumSongsRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, String album,@JsonKey(name: 'album_artist') String albumArtist, String? artist
});




}
/// @nodoc
class _$AlbumSongsRequestCopyWithImpl<$Res>
    implements $AlbumSongsRequestCopyWith<$Res> {
  _$AlbumSongsRequestCopyWithImpl(this._self, this._then);

  final AlbumSongsRequest _self;
  final $Res Function(AlbumSongsRequest) _then;

/// Create a copy of AlbumSongsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? album = null,Object? albumArtist = null,Object? artist = freezed,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,albumArtist: null == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlbumSongsRequest].
extension AlbumSongsRequestPatterns on AlbumSongsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumSongsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumSongsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumSongsRequest value)  $default,){
final _that = this;
switch (_that) {
case _AlbumSongsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumSongsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumSongsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  String album, @JsonKey(name: 'album_artist')  String albumArtist,  String? artist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumSongsRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.album,_that.albumArtist,_that.artist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  String album, @JsonKey(name: 'album_artist')  String albumArtist,  String? artist)  $default,) {final _that = this;
switch (_that) {
case _AlbumSongsRequest():
return $default(_that.api,_that.method,_that.version,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.album,_that.albumArtist,_that.artist);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  String album, @JsonKey(name: 'album_artist')  String albumArtist,  String? artist)?  $default,) {final _that = this;
switch (_that) {
case _AlbumSongsRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.album,_that.albumArtist,_that.artist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlbumSongsRequest extends AlbumSongsRequest {
  const _AlbumSongsRequest({required this.api, required this.method, required this.version, required this.limit, required this.library, required this.additional, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection, required this.offset, required this.album, @JsonKey(name: 'album_artist') required this.albumArtist, this.artist}): super._();
  factory _AlbumSongsRequest.fromJson(Map<String, dynamic> json) => _$AlbumSongsRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  int limit;
@override final  String library;
@override final  String additional;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;
@override final  int offset;
@override final  String album;
@override@JsonKey(name: 'album_artist') final  String albumArtist;
@override final  String? artist;

/// Create a copy of AlbumSongsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumSongsRequestCopyWith<_AlbumSongsRequest> get copyWith => __$AlbumSongsRequestCopyWithImpl<_AlbumSongsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumSongsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumSongsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.album, album) || other.album == album)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.artist, artist) || other.artist == artist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,limit,library,additional,sortBy,sortDirection,offset,album,albumArtist,artist);

@override
String toString() {
  return 'AlbumSongsRequest(api: $api, method: $method, version: $version, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, album: $album, albumArtist: $albumArtist, artist: $artist)';
}


}

/// @nodoc
abstract mixin class _$AlbumSongsRequestCopyWith<$Res> implements $AlbumSongsRequestCopyWith<$Res> {
  factory _$AlbumSongsRequestCopyWith(_AlbumSongsRequest value, $Res Function(_AlbumSongsRequest) _then) = __$AlbumSongsRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, String album,@JsonKey(name: 'album_artist') String albumArtist, String? artist
});




}
/// @nodoc
class __$AlbumSongsRequestCopyWithImpl<$Res>
    implements _$AlbumSongsRequestCopyWith<$Res> {
  __$AlbumSongsRequestCopyWithImpl(this._self, this._then);

  final _AlbumSongsRequest _self;
  final $Res Function(_AlbumSongsRequest) _then;

/// Create a copy of AlbumSongsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? album = null,Object? albumArtist = null,Object? artist = freezed,}) {
  return _then(_AlbumSongsRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,albumArtist: null == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BatchDownloadRequest {

 String get api; String get method; String get version; String get songs; String get library; String? get filename;
/// Create a copy of BatchDownloadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchDownloadRequestCopyWith<BatchDownloadRequest> get copyWith => _$BatchDownloadRequestCopyWithImpl<BatchDownloadRequest>(this as BatchDownloadRequest, _$identity);

  /// Serializes this BatchDownloadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchDownloadRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.library, library) || other.library == library)&&(identical(other.filename, filename) || other.filename == filename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,songs,library,filename);

@override
String toString() {
  return 'BatchDownloadRequest(api: $api, method: $method, version: $version, songs: $songs, library: $library, filename: $filename)';
}


}

/// @nodoc
abstract mixin class $BatchDownloadRequestCopyWith<$Res>  {
  factory $BatchDownloadRequestCopyWith(BatchDownloadRequest value, $Res Function(BatchDownloadRequest) _then) = _$BatchDownloadRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, String songs, String library, String? filename
});




}
/// @nodoc
class _$BatchDownloadRequestCopyWithImpl<$Res>
    implements $BatchDownloadRequestCopyWith<$Res> {
  _$BatchDownloadRequestCopyWithImpl(this._self, this._then);

  final BatchDownloadRequest _self;
  final $Res Function(BatchDownloadRequest) _then;

/// Create a copy of BatchDownloadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? songs = null,Object? library = null,Object? filename = freezed,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchDownloadRequest].
extension BatchDownloadRequestPatterns on BatchDownloadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchDownloadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchDownloadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchDownloadRequest value)  $default,){
final _that = this;
switch (_that) {
case _BatchDownloadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchDownloadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BatchDownloadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String songs,  String library,  String? filename)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchDownloadRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.songs,_that.library,_that.filename);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String songs,  String library,  String? filename)  $default,) {final _that = this;
switch (_that) {
case _BatchDownloadRequest():
return $default(_that.api,_that.method,_that.version,_that.songs,_that.library,_that.filename);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  String songs,  String library,  String? filename)?  $default,) {final _that = this;
switch (_that) {
case _BatchDownloadRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.songs,_that.library,_that.filename);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchDownloadRequest extends BatchDownloadRequest {
  const _BatchDownloadRequest({required this.api, required this.method, required this.version, required this.songs, required this.library, this.filename}): super._();
  factory _BatchDownloadRequest.fromJson(Map<String, dynamic> json) => _$BatchDownloadRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  String songs;
@override final  String library;
@override final  String? filename;

/// Create a copy of BatchDownloadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchDownloadRequestCopyWith<_BatchDownloadRequest> get copyWith => __$BatchDownloadRequestCopyWithImpl<_BatchDownloadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchDownloadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchDownloadRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.library, library) || other.library == library)&&(identical(other.filename, filename) || other.filename == filename));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,songs,library,filename);

@override
String toString() {
  return 'BatchDownloadRequest(api: $api, method: $method, version: $version, songs: $songs, library: $library, filename: $filename)';
}


}

/// @nodoc
abstract mixin class _$BatchDownloadRequestCopyWith<$Res> implements $BatchDownloadRequestCopyWith<$Res> {
  factory _$BatchDownloadRequestCopyWith(_BatchDownloadRequest value, $Res Function(_BatchDownloadRequest) _then) = __$BatchDownloadRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, String songs, String library, String? filename
});




}
/// @nodoc
class __$BatchDownloadRequestCopyWithImpl<$Res>
    implements _$BatchDownloadRequestCopyWith<$Res> {
  __$BatchDownloadRequestCopyWithImpl(this._self, this._then);

  final _BatchDownloadRequest _self;
  final $Res Function(_BatchDownloadRequest) _then;

/// Create a copy of BatchDownloadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? songs = null,Object? library = null,Object? filename = freezed,}) {
  return _then(_BatchDownloadRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LyricsRequest {

 String get api; String get method; String get id; int get version;
/// Create a copy of LyricsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsRequestCopyWith<LyricsRequest> get copyWith => _$LyricsRequestCopyWithImpl<LyricsRequest>(this as LyricsRequest, _$identity);

  /// Serializes this LyricsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,version);

@override
String toString() {
  return 'LyricsRequest(api: $api, method: $method, id: $id, version: $version)';
}


}

/// @nodoc
abstract mixin class $LyricsRequestCopyWith<$Res>  {
  factory $LyricsRequestCopyWith(LyricsRequest value, $Res Function(LyricsRequest) _then) = _$LyricsRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String id, int version
});




}
/// @nodoc
class _$LyricsRequestCopyWithImpl<$Res>
    implements $LyricsRequestCopyWith<$Res> {
  _$LyricsRequestCopyWithImpl(this._self, this._then);

  final LyricsRequest _self;
  final $Res Function(LyricsRequest) _then;

/// Create a copy of LyricsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? id = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricsRequest].
extension LyricsRequestPatterns on LyricsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsRequest value)  $default,){
final _that = this;
switch (_that) {
case _LyricsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String id,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String id,  int version)  $default,) {final _that = this;
switch (_that) {
case _LyricsRequest():
return $default(_that.api,_that.method,_that.id,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String id,  int version)?  $default,) {final _that = this;
switch (_that) {
case _LyricsRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsRequest extends LyricsRequest {
  const _LyricsRequest({required this.api, required this.method, required this.id, required this.version}): super._();
  factory _LyricsRequest.fromJson(Map<String, dynamic> json) => _$LyricsRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String id;
@override final  int version;

/// Create a copy of LyricsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsRequestCopyWith<_LyricsRequest> get copyWith => __$LyricsRequestCopyWithImpl<_LyricsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,version);

@override
String toString() {
  return 'LyricsRequest(api: $api, method: $method, id: $id, version: $version)';
}


}

/// @nodoc
abstract mixin class _$LyricsRequestCopyWith<$Res> implements $LyricsRequestCopyWith<$Res> {
  factory _$LyricsRequestCopyWith(_LyricsRequest value, $Res Function(_LyricsRequest) _then) = __$LyricsRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String id, int version
});




}
/// @nodoc
class __$LyricsRequestCopyWithImpl<$Res>
    implements _$LyricsRequestCopyWith<$Res> {
  __$LyricsRequestCopyWithImpl(this._self, this._then);

  final _LyricsRequest _self;
  final $Res Function(_LyricsRequest) _then;

/// Create a copy of LyricsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? id = null,Object? version = null,}) {
  return _then(_LyricsRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LyricsData {

 String get lyrics;
/// Create a copy of LyricsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsDataCopyWith<LyricsData> get copyWith => _$LyricsDataCopyWithImpl<LyricsData>(this as LyricsData, _$identity);

  /// Serializes this LyricsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsData&&(identical(other.lyrics, lyrics) || other.lyrics == lyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lyrics);

@override
String toString() {
  return 'LyricsData(lyrics: $lyrics)';
}


}

/// @nodoc
abstract mixin class $LyricsDataCopyWith<$Res>  {
  factory $LyricsDataCopyWith(LyricsData value, $Res Function(LyricsData) _then) = _$LyricsDataCopyWithImpl;
@useResult
$Res call({
 String lyrics
});




}
/// @nodoc
class _$LyricsDataCopyWithImpl<$Res>
    implements $LyricsDataCopyWith<$Res> {
  _$LyricsDataCopyWithImpl(this._self, this._then);

  final LyricsData _self;
  final $Res Function(LyricsData) _then;

/// Create a copy of LyricsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lyrics = null,}) {
  return _then(_self.copyWith(
lyrics: null == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricsData].
extension LyricsDataPatterns on LyricsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsData value)  $default,){
final _that = this;
switch (_that) {
case _LyricsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsData value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lyrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsData() when $default != null:
return $default(_that.lyrics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lyrics)  $default,) {final _that = this;
switch (_that) {
case _LyricsData():
return $default(_that.lyrics);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lyrics)?  $default,) {final _that = this;
switch (_that) {
case _LyricsData() when $default != null:
return $default(_that.lyrics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsData extends LyricsData {
  const _LyricsData({required this.lyrics}): super._();
  factory _LyricsData.fromJson(Map<String, dynamic> json) => _$LyricsDataFromJson(json);

@override final  String lyrics;

/// Create a copy of LyricsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsDataCopyWith<_LyricsData> get copyWith => __$LyricsDataCopyWithImpl<_LyricsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsData&&(identical(other.lyrics, lyrics) || other.lyrics == lyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lyrics);

@override
String toString() {
  return 'LyricsData(lyrics: $lyrics)';
}


}

/// @nodoc
abstract mixin class _$LyricsDataCopyWith<$Res> implements $LyricsDataCopyWith<$Res> {
  factory _$LyricsDataCopyWith(_LyricsData value, $Res Function(_LyricsData) _then) = __$LyricsDataCopyWithImpl;
@override @useResult
$Res call({
 String lyrics
});




}
/// @nodoc
class __$LyricsDataCopyWithImpl<$Res>
    implements _$LyricsDataCopyWith<$Res> {
  __$LyricsDataCopyWithImpl(this._self, this._then);

  final _LyricsData _self;
  final $Res Function(_LyricsData) _then;

/// Create a copy of LyricsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lyrics = null,}) {
  return _then(_LyricsData(
lyrics: null == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LyricsResponse {

 bool get success; LyricsData? get data;
/// Create a copy of LyricsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsResponseCopyWith<LyricsResponse> get copyWith => _$LyricsResponseCopyWithImpl<LyricsResponse>(this as LyricsResponse, _$identity);

  /// Serializes this LyricsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'LyricsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $LyricsResponseCopyWith<$Res>  {
  factory $LyricsResponseCopyWith(LyricsResponse value, $Res Function(LyricsResponse) _then) = _$LyricsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, LyricsData? data
});


$LyricsDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$LyricsResponseCopyWithImpl<$Res>
    implements $LyricsResponseCopyWith<$Res> {
  _$LyricsResponseCopyWithImpl(this._self, this._then);

  final LyricsResponse _self;
  final $Res Function(LyricsResponse) _then;

/// Create a copy of LyricsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LyricsData?,
  ));
}
/// Create a copy of LyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LyricsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LyricsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LyricsResponse].
extension LyricsResponsePatterns on LyricsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsResponse value)  $default,){
final _that = this;
switch (_that) {
case _LyricsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  LyricsData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  LyricsData? data)  $default,) {final _that = this;
switch (_that) {
case _LyricsResponse():
return $default(_that.success,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  LyricsData? data)?  $default,) {final _that = this;
switch (_that) {
case _LyricsResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsResponse extends LyricsResponse {
  const _LyricsResponse({required this.success, this.data}): super._();
  factory _LyricsResponse.fromJson(Map<String, dynamic> json) => _$LyricsResponseFromJson(json);

@override final  bool success;
@override final  LyricsData? data;

/// Create a copy of LyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsResponseCopyWith<_LyricsResponse> get copyWith => __$LyricsResponseCopyWithImpl<_LyricsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'LyricsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LyricsResponseCopyWith<$Res> implements $LyricsResponseCopyWith<$Res> {
  factory _$LyricsResponseCopyWith(_LyricsResponse value, $Res Function(_LyricsResponse) _then) = __$LyricsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, LyricsData? data
});


@override $LyricsDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$LyricsResponseCopyWithImpl<$Res>
    implements _$LyricsResponseCopyWith<$Res> {
  __$LyricsResponseCopyWithImpl(this._self, this._then);

  final _LyricsResponse _self;
  final $Res Function(_LyricsResponse) _then;

/// Create a copy of LyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_LyricsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LyricsData?,
  ));
}

/// Create a copy of LyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LyricsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LyricsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SearchLyricsRequest {

 String get api; String get method; String get version; String get title; String? get artist; int get limit; String get additional;
/// Create a copy of SearchLyricsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLyricsRequestCopyWith<SearchLyricsRequest> get copyWith => _$SearchLyricsRequestCopyWithImpl<SearchLyricsRequest>(this as SearchLyricsRequest, _$identity);

  /// Serializes this SearchLyricsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLyricsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,title,artist,limit,additional);

@override
String toString() {
  return 'SearchLyricsRequest(api: $api, method: $method, version: $version, title: $title, artist: $artist, limit: $limit, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $SearchLyricsRequestCopyWith<$Res>  {
  factory $SearchLyricsRequestCopyWith(SearchLyricsRequest value, $Res Function(SearchLyricsRequest) _then) = _$SearchLyricsRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, String title, String? artist, int limit, String additional
});




}
/// @nodoc
class _$SearchLyricsRequestCopyWithImpl<$Res>
    implements $SearchLyricsRequestCopyWith<$Res> {
  _$SearchLyricsRequestCopyWithImpl(this._self, this._then);

  final SearchLyricsRequest _self;
  final $Res Function(SearchLyricsRequest) _then;

/// Create a copy of SearchLyricsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? title = null,Object? artist = freezed,Object? limit = null,Object? additional = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchLyricsRequest].
extension SearchLyricsRequestPatterns on SearchLyricsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchLyricsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchLyricsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchLyricsRequest value)  $default,){
final _that = this;
switch (_that) {
case _SearchLyricsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchLyricsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SearchLyricsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String title,  String? artist,  int limit,  String additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchLyricsRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.title,_that.artist,_that.limit,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String title,  String? artist,  int limit,  String additional)  $default,) {final _that = this;
switch (_that) {
case _SearchLyricsRequest():
return $default(_that.api,_that.method,_that.version,_that.title,_that.artist,_that.limit,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  String title,  String? artist,  int limit,  String additional)?  $default,) {final _that = this;
switch (_that) {
case _SearchLyricsRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.title,_that.artist,_that.limit,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchLyricsRequest extends SearchLyricsRequest {
  const _SearchLyricsRequest({required this.api, required this.method, required this.version, required this.title, this.artist, this.limit = 10, this.additional = 'full_lyrics'}): super._();
  factory _SearchLyricsRequest.fromJson(Map<String, dynamic> json) => _$SearchLyricsRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  String title;
@override final  String? artist;
@override@JsonKey() final  int limit;
@override@JsonKey() final  String additional;

/// Create a copy of SearchLyricsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchLyricsRequestCopyWith<_SearchLyricsRequest> get copyWith => __$SearchLyricsRequestCopyWithImpl<_SearchLyricsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchLyricsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchLyricsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,title,artist,limit,additional);

@override
String toString() {
  return 'SearchLyricsRequest(api: $api, method: $method, version: $version, title: $title, artist: $artist, limit: $limit, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$SearchLyricsRequestCopyWith<$Res> implements $SearchLyricsRequestCopyWith<$Res> {
  factory _$SearchLyricsRequestCopyWith(_SearchLyricsRequest value, $Res Function(_SearchLyricsRequest) _then) = __$SearchLyricsRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, String title, String? artist, int limit, String additional
});




}
/// @nodoc
class __$SearchLyricsRequestCopyWithImpl<$Res>
    implements _$SearchLyricsRequestCopyWith<$Res> {
  __$SearchLyricsRequestCopyWithImpl(this._self, this._then);

  final _SearchLyricsRequest _self;
  final $Res Function(_SearchLyricsRequest) _then;

/// Create a copy of SearchLyricsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? title = null,Object? artist = freezed,Object? limit = null,Object? additional = null,}) {
  return _then(_SearchLyricsRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LyricsSearchAdditional {

 String get full_lyrics;
/// Create a copy of LyricsSearchAdditional
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsSearchAdditionalCopyWith<LyricsSearchAdditional> get copyWith => _$LyricsSearchAdditionalCopyWithImpl<LyricsSearchAdditional>(this as LyricsSearchAdditional, _$identity);

  /// Serializes this LyricsSearchAdditional to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsSearchAdditional&&(identical(other.full_lyrics, full_lyrics) || other.full_lyrics == full_lyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,full_lyrics);

@override
String toString() {
  return 'LyricsSearchAdditional(full_lyrics: $full_lyrics)';
}


}

/// @nodoc
abstract mixin class $LyricsSearchAdditionalCopyWith<$Res>  {
  factory $LyricsSearchAdditionalCopyWith(LyricsSearchAdditional value, $Res Function(LyricsSearchAdditional) _then) = _$LyricsSearchAdditionalCopyWithImpl;
@useResult
$Res call({
 String full_lyrics
});




}
/// @nodoc
class _$LyricsSearchAdditionalCopyWithImpl<$Res>
    implements $LyricsSearchAdditionalCopyWith<$Res> {
  _$LyricsSearchAdditionalCopyWithImpl(this._self, this._then);

  final LyricsSearchAdditional _self;
  final $Res Function(LyricsSearchAdditional) _then;

/// Create a copy of LyricsSearchAdditional
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? full_lyrics = null,}) {
  return _then(_self.copyWith(
full_lyrics: null == full_lyrics ? _self.full_lyrics : full_lyrics // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricsSearchAdditional].
extension LyricsSearchAdditionalPatterns on LyricsSearchAdditional {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsSearchAdditional value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsSearchAdditional() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsSearchAdditional value)  $default,){
final _that = this;
switch (_that) {
case _LyricsSearchAdditional():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsSearchAdditional value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsSearchAdditional() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String full_lyrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsSearchAdditional() when $default != null:
return $default(_that.full_lyrics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String full_lyrics)  $default,) {final _that = this;
switch (_that) {
case _LyricsSearchAdditional():
return $default(_that.full_lyrics);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String full_lyrics)?  $default,) {final _that = this;
switch (_that) {
case _LyricsSearchAdditional() when $default != null:
return $default(_that.full_lyrics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsSearchAdditional extends LyricsSearchAdditional {
  const _LyricsSearchAdditional({required this.full_lyrics}): super._();
  factory _LyricsSearchAdditional.fromJson(Map<String, dynamic> json) => _$LyricsSearchAdditionalFromJson(json);

@override final  String full_lyrics;

/// Create a copy of LyricsSearchAdditional
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsSearchAdditionalCopyWith<_LyricsSearchAdditional> get copyWith => __$LyricsSearchAdditionalCopyWithImpl<_LyricsSearchAdditional>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsSearchAdditionalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsSearchAdditional&&(identical(other.full_lyrics, full_lyrics) || other.full_lyrics == full_lyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,full_lyrics);

@override
String toString() {
  return 'LyricsSearchAdditional(full_lyrics: $full_lyrics)';
}


}

/// @nodoc
abstract mixin class _$LyricsSearchAdditionalCopyWith<$Res> implements $LyricsSearchAdditionalCopyWith<$Res> {
  factory _$LyricsSearchAdditionalCopyWith(_LyricsSearchAdditional value, $Res Function(_LyricsSearchAdditional) _then) = __$LyricsSearchAdditionalCopyWithImpl;
@override @useResult
$Res call({
 String full_lyrics
});




}
/// @nodoc
class __$LyricsSearchAdditionalCopyWithImpl<$Res>
    implements _$LyricsSearchAdditionalCopyWith<$Res> {
  __$LyricsSearchAdditionalCopyWithImpl(this._self, this._then);

  final _LyricsSearchAdditional _self;
  final $Res Function(_LyricsSearchAdditional) _then;

/// Create a copy of LyricsSearchAdditional
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? full_lyrics = null,}) {
  return _then(_LyricsSearchAdditional(
full_lyrics: null == full_lyrics ? _self.full_lyrics : full_lyrics // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LyricsSearchResult {

 String get id; String get title; String get artist; String get partial_lyrics; String get plugin; LyricsSearchAdditional? get additional;
/// Create a copy of LyricsSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsSearchResultCopyWith<LyricsSearchResult> get copyWith => _$LyricsSearchResultCopyWithImpl<LyricsSearchResult>(this as LyricsSearchResult, _$identity);

  /// Serializes this LyricsSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsSearchResult&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.partial_lyrics, partial_lyrics) || other.partial_lyrics == partial_lyrics)&&(identical(other.plugin, plugin) || other.plugin == plugin)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,partial_lyrics,plugin,additional);

@override
String toString() {
  return 'LyricsSearchResult(id: $id, title: $title, artist: $artist, partial_lyrics: $partial_lyrics, plugin: $plugin, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $LyricsSearchResultCopyWith<$Res>  {
  factory $LyricsSearchResultCopyWith(LyricsSearchResult value, $Res Function(LyricsSearchResult) _then) = _$LyricsSearchResultCopyWithImpl;
@useResult
$Res call({
 String id, String title, String artist, String partial_lyrics, String plugin, LyricsSearchAdditional? additional
});


$LyricsSearchAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class _$LyricsSearchResultCopyWithImpl<$Res>
    implements $LyricsSearchResultCopyWith<$Res> {
  _$LyricsSearchResultCopyWithImpl(this._self, this._then);

  final LyricsSearchResult _self;
  final $Res Function(LyricsSearchResult) _then;

/// Create a copy of LyricsSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? partial_lyrics = null,Object? plugin = null,Object? additional = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,partial_lyrics: null == partial_lyrics ? _self.partial_lyrics : partial_lyrics // ignore: cast_nullable_to_non_nullable
as String,plugin: null == plugin ? _self.plugin : plugin // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as LyricsSearchAdditional?,
  ));
}
/// Create a copy of LyricsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LyricsSearchAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $LyricsSearchAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// Adds pattern-matching-related methods to [LyricsSearchResult].
extension LyricsSearchResultPatterns on LyricsSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _LyricsSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String artist,  String partial_lyrics,  String plugin,  LyricsSearchAdditional? additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsSearchResult() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.partial_lyrics,_that.plugin,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String artist,  String partial_lyrics,  String plugin,  LyricsSearchAdditional? additional)  $default,) {final _that = this;
switch (_that) {
case _LyricsSearchResult():
return $default(_that.id,_that.title,_that.artist,_that.partial_lyrics,_that.plugin,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String artist,  String partial_lyrics,  String plugin,  LyricsSearchAdditional? additional)?  $default,) {final _that = this;
switch (_that) {
case _LyricsSearchResult() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.partial_lyrics,_that.plugin,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsSearchResult extends LyricsSearchResult {
  const _LyricsSearchResult({required this.id, required this.title, required this.artist, required this.partial_lyrics, required this.plugin, this.additional}): super._();
  factory _LyricsSearchResult.fromJson(Map<String, dynamic> json) => _$LyricsSearchResultFromJson(json);

@override final  String id;
@override final  String title;
@override final  String artist;
@override final  String partial_lyrics;
@override final  String plugin;
@override final  LyricsSearchAdditional? additional;

/// Create a copy of LyricsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsSearchResultCopyWith<_LyricsSearchResult> get copyWith => __$LyricsSearchResultCopyWithImpl<_LyricsSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsSearchResult&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.partial_lyrics, partial_lyrics) || other.partial_lyrics == partial_lyrics)&&(identical(other.plugin, plugin) || other.plugin == plugin)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,partial_lyrics,plugin,additional);

@override
String toString() {
  return 'LyricsSearchResult(id: $id, title: $title, artist: $artist, partial_lyrics: $partial_lyrics, plugin: $plugin, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$LyricsSearchResultCopyWith<$Res> implements $LyricsSearchResultCopyWith<$Res> {
  factory _$LyricsSearchResultCopyWith(_LyricsSearchResult value, $Res Function(_LyricsSearchResult) _then) = __$LyricsSearchResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String artist, String partial_lyrics, String plugin, LyricsSearchAdditional? additional
});


@override $LyricsSearchAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class __$LyricsSearchResultCopyWithImpl<$Res>
    implements _$LyricsSearchResultCopyWith<$Res> {
  __$LyricsSearchResultCopyWithImpl(this._self, this._then);

  final _LyricsSearchResult _self;
  final $Res Function(_LyricsSearchResult) _then;

/// Create a copy of LyricsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? partial_lyrics = null,Object? plugin = null,Object? additional = freezed,}) {
  return _then(_LyricsSearchResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,partial_lyrics: null == partial_lyrics ? _self.partial_lyrics : partial_lyrics // ignore: cast_nullable_to_non_nullable
as String,plugin: null == plugin ? _self.plugin : plugin // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as LyricsSearchAdditional?,
  ));
}

/// Create a copy of LyricsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LyricsSearchAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $LyricsSearchAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// @nodoc
mixin _$SearchLyricsData {

 List<LyricsSearchResult> get lyrics;
/// Create a copy of SearchLyricsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLyricsDataCopyWith<SearchLyricsData> get copyWith => _$SearchLyricsDataCopyWithImpl<SearchLyricsData>(this as SearchLyricsData, _$identity);

  /// Serializes this SearchLyricsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLyricsData&&const DeepCollectionEquality().equals(other.lyrics, lyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lyrics));

@override
String toString() {
  return 'SearchLyricsData(lyrics: $lyrics)';
}


}

/// @nodoc
abstract mixin class $SearchLyricsDataCopyWith<$Res>  {
  factory $SearchLyricsDataCopyWith(SearchLyricsData value, $Res Function(SearchLyricsData) _then) = _$SearchLyricsDataCopyWithImpl;
@useResult
$Res call({
 List<LyricsSearchResult> lyrics
});




}
/// @nodoc
class _$SearchLyricsDataCopyWithImpl<$Res>
    implements $SearchLyricsDataCopyWith<$Res> {
  _$SearchLyricsDataCopyWithImpl(this._self, this._then);

  final SearchLyricsData _self;
  final $Res Function(SearchLyricsData) _then;

/// Create a copy of SearchLyricsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lyrics = null,}) {
  return _then(_self.copyWith(
lyrics: null == lyrics ? _self.lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<LyricsSearchResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchLyricsData].
extension SearchLyricsDataPatterns on SearchLyricsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchLyricsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchLyricsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchLyricsData value)  $default,){
final _that = this;
switch (_that) {
case _SearchLyricsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchLyricsData value)?  $default,){
final _that = this;
switch (_that) {
case _SearchLyricsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LyricsSearchResult> lyrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchLyricsData() when $default != null:
return $default(_that.lyrics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LyricsSearchResult> lyrics)  $default,) {final _that = this;
switch (_that) {
case _SearchLyricsData():
return $default(_that.lyrics);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LyricsSearchResult> lyrics)?  $default,) {final _that = this;
switch (_that) {
case _SearchLyricsData() when $default != null:
return $default(_that.lyrics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchLyricsData extends SearchLyricsData {
  const _SearchLyricsData({required final  List<LyricsSearchResult> lyrics}): _lyrics = lyrics,super._();
  factory _SearchLyricsData.fromJson(Map<String, dynamic> json) => _$SearchLyricsDataFromJson(json);

 final  List<LyricsSearchResult> _lyrics;
@override List<LyricsSearchResult> get lyrics {
  if (_lyrics is EqualUnmodifiableListView) return _lyrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lyrics);
}


/// Create a copy of SearchLyricsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchLyricsDataCopyWith<_SearchLyricsData> get copyWith => __$SearchLyricsDataCopyWithImpl<_SearchLyricsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchLyricsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchLyricsData&&const DeepCollectionEquality().equals(other._lyrics, _lyrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lyrics));

@override
String toString() {
  return 'SearchLyricsData(lyrics: $lyrics)';
}


}

/// @nodoc
abstract mixin class _$SearchLyricsDataCopyWith<$Res> implements $SearchLyricsDataCopyWith<$Res> {
  factory _$SearchLyricsDataCopyWith(_SearchLyricsData value, $Res Function(_SearchLyricsData) _then) = __$SearchLyricsDataCopyWithImpl;
@override @useResult
$Res call({
 List<LyricsSearchResult> lyrics
});




}
/// @nodoc
class __$SearchLyricsDataCopyWithImpl<$Res>
    implements _$SearchLyricsDataCopyWith<$Res> {
  __$SearchLyricsDataCopyWithImpl(this._self, this._then);

  final _SearchLyricsData _self;
  final $Res Function(_SearchLyricsData) _then;

/// Create a copy of SearchLyricsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lyrics = null,}) {
  return _then(_SearchLyricsData(
lyrics: null == lyrics ? _self._lyrics : lyrics // ignore: cast_nullable_to_non_nullable
as List<LyricsSearchResult>,
  ));
}


}


/// @nodoc
mixin _$SearchLyricsResponse {

 bool get success; SearchLyricsData? get data;
/// Create a copy of SearchLyricsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLyricsResponseCopyWith<SearchLyricsResponse> get copyWith => _$SearchLyricsResponseCopyWithImpl<SearchLyricsResponse>(this as SearchLyricsResponse, _$identity);

  /// Serializes this SearchLyricsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLyricsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SearchLyricsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SearchLyricsResponseCopyWith<$Res>  {
  factory $SearchLyricsResponseCopyWith(SearchLyricsResponse value, $Res Function(SearchLyricsResponse) _then) = _$SearchLyricsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, SearchLyricsData? data
});


$SearchLyricsDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$SearchLyricsResponseCopyWithImpl<$Res>
    implements $SearchLyricsResponseCopyWith<$Res> {
  _$SearchLyricsResponseCopyWithImpl(this._self, this._then);

  final SearchLyricsResponse _self;
  final $Res Function(SearchLyricsResponse) _then;

/// Create a copy of SearchLyricsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SearchLyricsData?,
  ));
}
/// Create a copy of SearchLyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchLyricsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SearchLyricsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchLyricsResponse].
extension SearchLyricsResponsePatterns on SearchLyricsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchLyricsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchLyricsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchLyricsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchLyricsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchLyricsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchLyricsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  SearchLyricsData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchLyricsResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  SearchLyricsData? data)  $default,) {final _that = this;
switch (_that) {
case _SearchLyricsResponse():
return $default(_that.success,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  SearchLyricsData? data)?  $default,) {final _that = this;
switch (_that) {
case _SearchLyricsResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchLyricsResponse extends SearchLyricsResponse {
  const _SearchLyricsResponse({required this.success, this.data}): super._();
  factory _SearchLyricsResponse.fromJson(Map<String, dynamic> json) => _$SearchLyricsResponseFromJson(json);

@override final  bool success;
@override final  SearchLyricsData? data;

/// Create a copy of SearchLyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchLyricsResponseCopyWith<_SearchLyricsResponse> get copyWith => __$SearchLyricsResponseCopyWithImpl<_SearchLyricsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchLyricsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchLyricsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SearchLyricsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SearchLyricsResponseCopyWith<$Res> implements $SearchLyricsResponseCopyWith<$Res> {
  factory _$SearchLyricsResponseCopyWith(_SearchLyricsResponse value, $Res Function(_SearchLyricsResponse) _then) = __$SearchLyricsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, SearchLyricsData? data
});


@override $SearchLyricsDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$SearchLyricsResponseCopyWithImpl<$Res>
    implements _$SearchLyricsResponseCopyWith<$Res> {
  __$SearchLyricsResponseCopyWithImpl(this._self, this._then);

  final _SearchLyricsResponse _self;
  final $Res Function(_SearchLyricsResponse) _then;

/// Create a copy of SearchLyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_SearchLyricsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SearchLyricsData?,
  ));
}

/// Create a copy of SearchLyricsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchLyricsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SearchLyricsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$GetNumberOfPlugInsRequest {

 String get action;
/// Create a copy of GetNumberOfPlugInsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNumberOfPlugInsRequestCopyWith<GetNumberOfPlugInsRequest> get copyWith => _$GetNumberOfPlugInsRequestCopyWithImpl<GetNumberOfPlugInsRequest>(this as GetNumberOfPlugInsRequest, _$identity);

  /// Serializes this GetNumberOfPlugInsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNumberOfPlugInsRequest&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'GetNumberOfPlugInsRequest(action: $action)';
}


}

/// @nodoc
abstract mixin class $GetNumberOfPlugInsRequestCopyWith<$Res>  {
  factory $GetNumberOfPlugInsRequestCopyWith(GetNumberOfPlugInsRequest value, $Res Function(GetNumberOfPlugInsRequest) _then) = _$GetNumberOfPlugInsRequestCopyWithImpl;
@useResult
$Res call({
 String action
});




}
/// @nodoc
class _$GetNumberOfPlugInsRequestCopyWithImpl<$Res>
    implements $GetNumberOfPlugInsRequestCopyWith<$Res> {
  _$GetNumberOfPlugInsRequestCopyWithImpl(this._self, this._then);

  final GetNumberOfPlugInsRequest _self;
  final $Res Function(GetNumberOfPlugInsRequest) _then;

/// Create a copy of GetNumberOfPlugInsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetNumberOfPlugInsRequest].
extension GetNumberOfPlugInsRequestPatterns on GetNumberOfPlugInsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetNumberOfPlugInsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetNumberOfPlugInsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetNumberOfPlugInsRequest value)  $default,){
final _that = this;
switch (_that) {
case _GetNumberOfPlugInsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetNumberOfPlugInsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GetNumberOfPlugInsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetNumberOfPlugInsRequest() when $default != null:
return $default(_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String action)  $default,) {final _that = this;
switch (_that) {
case _GetNumberOfPlugInsRequest():
return $default(_that.action);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String action)?  $default,) {final _that = this;
switch (_that) {
case _GetNumberOfPlugInsRequest() when $default != null:
return $default(_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetNumberOfPlugInsRequest extends GetNumberOfPlugInsRequest {
  const _GetNumberOfPlugInsRequest({required this.action}): super._();
  factory _GetNumberOfPlugInsRequest.fromJson(Map<String, dynamic> json) => _$GetNumberOfPlugInsRequestFromJson(json);

@override final  String action;

/// Create a copy of GetNumberOfPlugInsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetNumberOfPlugInsRequestCopyWith<_GetNumberOfPlugInsRequest> get copyWith => __$GetNumberOfPlugInsRequestCopyWithImpl<_GetNumberOfPlugInsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetNumberOfPlugInsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNumberOfPlugInsRequest&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'GetNumberOfPlugInsRequest(action: $action)';
}


}

/// @nodoc
abstract mixin class _$GetNumberOfPlugInsRequestCopyWith<$Res> implements $GetNumberOfPlugInsRequestCopyWith<$Res> {
  factory _$GetNumberOfPlugInsRequestCopyWith(_GetNumberOfPlugInsRequest value, $Res Function(_GetNumberOfPlugInsRequest) _then) = __$GetNumberOfPlugInsRequestCopyWithImpl;
@override @useResult
$Res call({
 String action
});




}
/// @nodoc
class __$GetNumberOfPlugInsRequestCopyWithImpl<$Res>
    implements _$GetNumberOfPlugInsRequestCopyWith<$Res> {
  __$GetNumberOfPlugInsRequestCopyWithImpl(this._self, this._then);

  final _GetNumberOfPlugInsRequest _self;
  final $Res Function(_GetNumberOfPlugInsRequest) _then;

/// Create a copy of GetNumberOfPlugInsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(_GetNumberOfPlugInsRequest(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GetNumberOfPlugInsResponse {

 bool get success; int get hasPlugIn;
/// Create a copy of GetNumberOfPlugInsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNumberOfPlugInsResponseCopyWith<GetNumberOfPlugInsResponse> get copyWith => _$GetNumberOfPlugInsResponseCopyWithImpl<GetNumberOfPlugInsResponse>(this as GetNumberOfPlugInsResponse, _$identity);

  /// Serializes this GetNumberOfPlugInsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNumberOfPlugInsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.hasPlugIn, hasPlugIn) || other.hasPlugIn == hasPlugIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,hasPlugIn);

@override
String toString() {
  return 'GetNumberOfPlugInsResponse(success: $success, hasPlugIn: $hasPlugIn)';
}


}

/// @nodoc
abstract mixin class $GetNumberOfPlugInsResponseCopyWith<$Res>  {
  factory $GetNumberOfPlugInsResponseCopyWith(GetNumberOfPlugInsResponse value, $Res Function(GetNumberOfPlugInsResponse) _then) = _$GetNumberOfPlugInsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, int hasPlugIn
});




}
/// @nodoc
class _$GetNumberOfPlugInsResponseCopyWithImpl<$Res>
    implements $GetNumberOfPlugInsResponseCopyWith<$Res> {
  _$GetNumberOfPlugInsResponseCopyWithImpl(this._self, this._then);

  final GetNumberOfPlugInsResponse _self;
  final $Res Function(GetNumberOfPlugInsResponse) _then;

/// Create a copy of GetNumberOfPlugInsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? hasPlugIn = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,hasPlugIn: null == hasPlugIn ? _self.hasPlugIn : hasPlugIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetNumberOfPlugInsResponse].
extension GetNumberOfPlugInsResponsePatterns on GetNumberOfPlugInsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetNumberOfPlugInsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetNumberOfPlugInsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetNumberOfPlugInsResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetNumberOfPlugInsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetNumberOfPlugInsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetNumberOfPlugInsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int hasPlugIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetNumberOfPlugInsResponse() when $default != null:
return $default(_that.success,_that.hasPlugIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int hasPlugIn)  $default,) {final _that = this;
switch (_that) {
case _GetNumberOfPlugInsResponse():
return $default(_that.success,_that.hasPlugIn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int hasPlugIn)?  $default,) {final _that = this;
switch (_that) {
case _GetNumberOfPlugInsResponse() when $default != null:
return $default(_that.success,_that.hasPlugIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetNumberOfPlugInsResponse extends GetNumberOfPlugInsResponse {
  const _GetNumberOfPlugInsResponse({required this.success, required this.hasPlugIn}): super._();
  factory _GetNumberOfPlugInsResponse.fromJson(Map<String, dynamic> json) => _$GetNumberOfPlugInsResponseFromJson(json);

@override final  bool success;
@override final  int hasPlugIn;

/// Create a copy of GetNumberOfPlugInsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetNumberOfPlugInsResponseCopyWith<_GetNumberOfPlugInsResponse> get copyWith => __$GetNumberOfPlugInsResponseCopyWithImpl<_GetNumberOfPlugInsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetNumberOfPlugInsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNumberOfPlugInsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.hasPlugIn, hasPlugIn) || other.hasPlugIn == hasPlugIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,hasPlugIn);

@override
String toString() {
  return 'GetNumberOfPlugInsResponse(success: $success, hasPlugIn: $hasPlugIn)';
}


}

/// @nodoc
abstract mixin class _$GetNumberOfPlugInsResponseCopyWith<$Res> implements $GetNumberOfPlugInsResponseCopyWith<$Res> {
  factory _$GetNumberOfPlugInsResponseCopyWith(_GetNumberOfPlugInsResponse value, $Res Function(_GetNumberOfPlugInsResponse) _then) = __$GetNumberOfPlugInsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, int hasPlugIn
});




}
/// @nodoc
class __$GetNumberOfPlugInsResponseCopyWithImpl<$Res>
    implements _$GetNumberOfPlugInsResponseCopyWith<$Res> {
  __$GetNumberOfPlugInsResponseCopyWithImpl(this._self, this._then);

  final _GetNumberOfPlugInsResponse _self;
  final $Res Function(_GetNumberOfPlugInsResponse) _then;

/// Create a copy of GetNumberOfPlugInsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? hasPlugIn = null,}) {
  return _then(_GetNumberOfPlugInsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,hasPlugIn: null == hasPlugIn ? _self.hasPlugIn : hasPlugIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SongInfoRequest {

 String get api; String get method; String get version; String get id; String get additional;
/// Create a copy of SongInfoRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongInfoRequestCopyWith<SongInfoRequest> get copyWith => _$SongInfoRequestCopyWithImpl<SongInfoRequest>(this as SongInfoRequest, _$identity);

  /// Serializes this SongInfoRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongInfoRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.id, id) || other.id == id)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,id,additional);

@override
String toString() {
  return 'SongInfoRequest(api: $api, method: $method, version: $version, id: $id, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $SongInfoRequestCopyWith<$Res>  {
  factory $SongInfoRequestCopyWith(SongInfoRequest value, $Res Function(SongInfoRequest) _then) = _$SongInfoRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, String id, String additional
});




}
/// @nodoc
class _$SongInfoRequestCopyWithImpl<$Res>
    implements $SongInfoRequestCopyWith<$Res> {
  _$SongInfoRequestCopyWithImpl(this._self, this._then);

  final SongInfoRequest _self;
  final $Res Function(SongInfoRequest) _then;

/// Create a copy of SongInfoRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? id = null,Object? additional = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SongInfoRequest].
extension SongInfoRequestPatterns on SongInfoRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongInfoRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongInfoRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongInfoRequest value)  $default,){
final _that = this;
switch (_that) {
case _SongInfoRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongInfoRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SongInfoRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String id,  String additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongInfoRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.id,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String id,  String additional)  $default,) {final _that = this;
switch (_that) {
case _SongInfoRequest():
return $default(_that.api,_that.method,_that.version,_that.id,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  String id,  String additional)?  $default,) {final _that = this;
switch (_that) {
case _SongInfoRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.id,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongInfoRequest extends SongInfoRequest {
  const _SongInfoRequest({required this.api, required this.method, required this.version, required this.id, required this.additional}): super._();
  factory _SongInfoRequest.fromJson(Map<String, dynamic> json) => _$SongInfoRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  String id;
@override final  String additional;

/// Create a copy of SongInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongInfoRequestCopyWith<_SongInfoRequest> get copyWith => __$SongInfoRequestCopyWithImpl<_SongInfoRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongInfoRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongInfoRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.id, id) || other.id == id)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,id,additional);

@override
String toString() {
  return 'SongInfoRequest(api: $api, method: $method, version: $version, id: $id, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$SongInfoRequestCopyWith<$Res> implements $SongInfoRequestCopyWith<$Res> {
  factory _$SongInfoRequestCopyWith(_SongInfoRequest value, $Res Function(_SongInfoRequest) _then) = __$SongInfoRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, String id, String additional
});




}
/// @nodoc
class __$SongInfoRequestCopyWithImpl<$Res>
    implements _$SongInfoRequestCopyWith<$Res> {
  __$SongInfoRequestCopyWithImpl(this._self, this._then);

  final _SongInfoRequest _self;
  final $Res Function(_SongInfoRequest) _then;

/// Create a copy of SongInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? id = null,Object? additional = null,}) {
  return _then(_SongInfoRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SongInfoResponse {

 bool get success; SongData get data;
/// Create a copy of SongInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongInfoResponseCopyWith<SongInfoResponse> get copyWith => _$SongInfoResponseCopyWithImpl<SongInfoResponse>(this as SongInfoResponse, _$identity);

  /// Serializes this SongInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SongInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SongInfoResponseCopyWith<$Res>  {
  factory $SongInfoResponseCopyWith(SongInfoResponse value, $Res Function(SongInfoResponse) _then) = _$SongInfoResponseCopyWithImpl;
@useResult
$Res call({
 bool success, SongData data
});


$SongDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SongInfoResponseCopyWithImpl<$Res>
    implements $SongInfoResponseCopyWith<$Res> {
  _$SongInfoResponseCopyWithImpl(this._self, this._then);

  final SongInfoResponse _self;
  final $Res Function(SongInfoResponse) _then;

/// Create a copy of SongInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SongData,
  ));
}
/// Create a copy of SongInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongDataCopyWith<$Res> get data {
  
  return $SongDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SongInfoResponse].
extension SongInfoResponsePatterns on SongInfoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongInfoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _SongInfoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SongInfoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  SongData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongInfoResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  SongData data)  $default,) {final _that = this;
switch (_that) {
case _SongInfoResponse():
return $default(_that.success,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  SongData data)?  $default,) {final _that = this;
switch (_that) {
case _SongInfoResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongInfoResponse extends SongInfoResponse {
  const _SongInfoResponse({required this.success, required this.data}): super._();
  factory _SongInfoResponse.fromJson(Map<String, dynamic> json) => _$SongInfoResponseFromJson(json);

@override final  bool success;
@override final  SongData data;

/// Create a copy of SongInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongInfoResponseCopyWith<_SongInfoResponse> get copyWith => __$SongInfoResponseCopyWithImpl<_SongInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SongInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SongInfoResponseCopyWith<$Res> implements $SongInfoResponseCopyWith<$Res> {
  factory _$SongInfoResponseCopyWith(_SongInfoResponse value, $Res Function(_SongInfoResponse) _then) = __$SongInfoResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, SongData data
});


@override $SongDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SongInfoResponseCopyWithImpl<$Res>
    implements _$SongInfoResponseCopyWith<$Res> {
  __$SongInfoResponseCopyWithImpl(this._self, this._then);

  final _SongInfoResponse _self;
  final $Res Function(_SongInfoResponse) _then;

/// Create a copy of SongInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_SongInfoResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SongData,
  ));
}

/// Create a copy of SongInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongDataCopyWith<$Res> get data {
  
  return $SongDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SearchSongRequest {

 String get api; String get method; String get version; String get additional; String get library; int get limit; int get offset;@JsonKey(name: 'sort_direction') String get sortDirection; String get title;
/// Create a copy of SearchSongRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSongRequestCopyWith<SearchSongRequest> get copyWith => _$SearchSongRequestCopyWithImpl<SearchSongRequest>(this as SearchSongRequest, _$identity);

  /// Serializes this SearchSongRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSongRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.library, library) || other.library == library)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,additional,library,limit,offset,sortDirection,title);

@override
String toString() {
  return 'SearchSongRequest(api: $api, method: $method, version: $version, additional: $additional, library: $library, limit: $limit, offset: $offset, sortDirection: $sortDirection, title: $title)';
}


}

/// @nodoc
abstract mixin class $SearchSongRequestCopyWith<$Res>  {
  factory $SearchSongRequestCopyWith(SearchSongRequest value, $Res Function(SearchSongRequest) _then) = _$SearchSongRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, String additional, String library, int limit, int offset,@JsonKey(name: 'sort_direction') String sortDirection, String title
});




}
/// @nodoc
class _$SearchSongRequestCopyWithImpl<$Res>
    implements $SearchSongRequestCopyWith<$Res> {
  _$SearchSongRequestCopyWithImpl(this._self, this._then);

  final SearchSongRequest _self;
  final $Res Function(SearchSongRequest) _then;

/// Create a copy of SearchSongRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? additional = null,Object? library = null,Object? limit = null,Object? offset = null,Object? sortDirection = null,Object? title = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSongRequest].
extension SearchSongRequestPatterns on SearchSongRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSongRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSongRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSongRequest value)  $default,){
final _that = this;
switch (_that) {
case _SearchSongRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSongRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSongRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String additional,  String library,  int limit,  int offset, @JsonKey(name: 'sort_direction')  String sortDirection,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSongRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.additional,_that.library,_that.limit,_that.offset,_that.sortDirection,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String additional,  String library,  int limit,  int offset, @JsonKey(name: 'sort_direction')  String sortDirection,  String title)  $default,) {final _that = this;
switch (_that) {
case _SearchSongRequest():
return $default(_that.api,_that.method,_that.version,_that.additional,_that.library,_that.limit,_that.offset,_that.sortDirection,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  String additional,  String library,  int limit,  int offset, @JsonKey(name: 'sort_direction')  String sortDirection,  String title)?  $default,) {final _that = this;
switch (_that) {
case _SearchSongRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.additional,_that.library,_that.limit,_that.offset,_that.sortDirection,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSongRequest extends SearchSongRequest {
  const _SearchSongRequest({required this.api, required this.method, required this.version, required this.additional, required this.library, required this.limit, required this.offset, @JsonKey(name: 'sort_direction') required this.sortDirection, required this.title}): super._();
  factory _SearchSongRequest.fromJson(Map<String, dynamic> json) => _$SearchSongRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  String additional;
@override final  String library;
@override final  int limit;
@override final  int offset;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;
@override final  String title;

/// Create a copy of SearchSongRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSongRequestCopyWith<_SearchSongRequest> get copyWith => __$SearchSongRequestCopyWithImpl<_SearchSongRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSongRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSongRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.library, library) || other.library == library)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,additional,library,limit,offset,sortDirection,title);

@override
String toString() {
  return 'SearchSongRequest(api: $api, method: $method, version: $version, additional: $additional, library: $library, limit: $limit, offset: $offset, sortDirection: $sortDirection, title: $title)';
}


}

/// @nodoc
abstract mixin class _$SearchSongRequestCopyWith<$Res> implements $SearchSongRequestCopyWith<$Res> {
  factory _$SearchSongRequestCopyWith(_SearchSongRequest value, $Res Function(_SearchSongRequest) _then) = __$SearchSongRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, String additional, String library, int limit, int offset,@JsonKey(name: 'sort_direction') String sortDirection, String title
});




}
/// @nodoc
class __$SearchSongRequestCopyWithImpl<$Res>
    implements _$SearchSongRequestCopyWith<$Res> {
  __$SearchSongRequestCopyWithImpl(this._self, this._then);

  final _SearchSongRequest _self;
  final $Res Function(_SearchSongRequest) _then;

/// Create a copy of SearchSongRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? additional = null,Object? library = null,Object? limit = null,Object? offset = null,Object? sortDirection = null,Object? title = null,}) {
  return _then(_SearchSongRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
