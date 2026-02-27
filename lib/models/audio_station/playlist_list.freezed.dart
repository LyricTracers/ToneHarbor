// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistInfo {

 String get id; String get library; String get name;@JsonKey(name: 'sharing_status') String get sharingStatus; String get type;
/// Create a copy of PlaylistInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistInfoCopyWith<PlaylistInfo> get copyWith => _$PlaylistInfoCopyWithImpl<PlaylistInfo>(this as PlaylistInfo, _$identity);

  /// Serializes this PlaylistInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.library, library) || other.library == library)&&(identical(other.name, name) || other.name == name)&&(identical(other.sharingStatus, sharingStatus) || other.sharingStatus == sharingStatus)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,library,name,sharingStatus,type);

@override
String toString() {
  return 'PlaylistInfo(id: $id, library: $library, name: $name, sharingStatus: $sharingStatus, type: $type)';
}


}

/// @nodoc
abstract mixin class $PlaylistInfoCopyWith<$Res>  {
  factory $PlaylistInfoCopyWith(PlaylistInfo value, $Res Function(PlaylistInfo) _then) = _$PlaylistInfoCopyWithImpl;
@useResult
$Res call({
 String id, String library, String name,@JsonKey(name: 'sharing_status') String sharingStatus, String type
});




}
/// @nodoc
class _$PlaylistInfoCopyWithImpl<$Res>
    implements $PlaylistInfoCopyWith<$Res> {
  _$PlaylistInfoCopyWithImpl(this._self, this._then);

  final PlaylistInfo _self;
  final $Res Function(PlaylistInfo) _then;

/// Create a copy of PlaylistInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? library = null,Object? name = null,Object? sharingStatus = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sharingStatus: null == sharingStatus ? _self.sharingStatus : sharingStatus // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistInfo].
extension PlaylistInfoPatterns on PlaylistInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistInfo value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String library,  String name, @JsonKey(name: 'sharing_status')  String sharingStatus,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistInfo() when $default != null:
return $default(_that.id,_that.library,_that.name,_that.sharingStatus,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String library,  String name, @JsonKey(name: 'sharing_status')  String sharingStatus,  String type)  $default,) {final _that = this;
switch (_that) {
case _PlaylistInfo():
return $default(_that.id,_that.library,_that.name,_that.sharingStatus,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String library,  String name, @JsonKey(name: 'sharing_status')  String sharingStatus,  String type)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistInfo() when $default != null:
return $default(_that.id,_that.library,_that.name,_that.sharingStatus,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistInfo extends PlaylistInfo {
  const _PlaylistInfo({required this.id, required this.library, required this.name, @JsonKey(name: 'sharing_status') required this.sharingStatus, required this.type}): super._();
  factory _PlaylistInfo.fromJson(Map<String, dynamic> json) => _$PlaylistInfoFromJson(json);

@override final  String id;
@override final  String library;
@override final  String name;
@override@JsonKey(name: 'sharing_status') final  String sharingStatus;
@override final  String type;

/// Create a copy of PlaylistInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistInfoCopyWith<_PlaylistInfo> get copyWith => __$PlaylistInfoCopyWithImpl<_PlaylistInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.library, library) || other.library == library)&&(identical(other.name, name) || other.name == name)&&(identical(other.sharingStatus, sharingStatus) || other.sharingStatus == sharingStatus)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,library,name,sharingStatus,type);

@override
String toString() {
  return 'PlaylistInfo(id: $id, library: $library, name: $name, sharingStatus: $sharingStatus, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PlaylistInfoCopyWith<$Res> implements $PlaylistInfoCopyWith<$Res> {
  factory _$PlaylistInfoCopyWith(_PlaylistInfo value, $Res Function(_PlaylistInfo) _then) = __$PlaylistInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String library, String name,@JsonKey(name: 'sharing_status') String sharingStatus, String type
});




}
/// @nodoc
class __$PlaylistInfoCopyWithImpl<$Res>
    implements _$PlaylistInfoCopyWith<$Res> {
  __$PlaylistInfoCopyWithImpl(this._self, this._then);

  final _PlaylistInfo _self;
  final $Res Function(_PlaylistInfo) _then;

/// Create a copy of PlaylistInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? library = null,Object? name = null,Object? sharingStatus = null,Object? type = null,}) {
  return _then(_PlaylistInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sharingStatus: null == sharingStatus ? _self.sharingStatus : sharingStatus // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PlaylistSharingInfo {

@JsonKey(name: 'date_available') String get dateAvailable;@JsonKey(name: 'date_expired') String get dateExpired; String get id; String get status; String get url;
/// Create a copy of PlaylistSharingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistSharingInfoCopyWith<PlaylistSharingInfo> get copyWith => _$PlaylistSharingInfoCopyWithImpl<PlaylistSharingInfo>(this as PlaylistSharingInfo, _$identity);

  /// Serializes this PlaylistSharingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistSharingInfo&&(identical(other.dateAvailable, dateAvailable) || other.dateAvailable == dateAvailable)&&(identical(other.dateExpired, dateExpired) || other.dateExpired == dateExpired)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateAvailable,dateExpired,id,status,url);

@override
String toString() {
  return 'PlaylistSharingInfo(dateAvailable: $dateAvailable, dateExpired: $dateExpired, id: $id, status: $status, url: $url)';
}


}

/// @nodoc
abstract mixin class $PlaylistSharingInfoCopyWith<$Res>  {
  factory $PlaylistSharingInfoCopyWith(PlaylistSharingInfo value, $Res Function(PlaylistSharingInfo) _then) = _$PlaylistSharingInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'date_available') String dateAvailable,@JsonKey(name: 'date_expired') String dateExpired, String id, String status, String url
});




}
/// @nodoc
class _$PlaylistSharingInfoCopyWithImpl<$Res>
    implements $PlaylistSharingInfoCopyWith<$Res> {
  _$PlaylistSharingInfoCopyWithImpl(this._self, this._then);

  final PlaylistSharingInfo _self;
  final $Res Function(PlaylistSharingInfo) _then;

/// Create a copy of PlaylistSharingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateAvailable = null,Object? dateExpired = null,Object? id = null,Object? status = null,Object? url = null,}) {
  return _then(_self.copyWith(
dateAvailable: null == dateAvailable ? _self.dateAvailable : dateAvailable // ignore: cast_nullable_to_non_nullable
as String,dateExpired: null == dateExpired ? _self.dateExpired : dateExpired // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistSharingInfo].
extension PlaylistSharingInfoPatterns on PlaylistSharingInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistSharingInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistSharingInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistSharingInfo value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistSharingInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistSharingInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistSharingInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'date_available')  String dateAvailable, @JsonKey(name: 'date_expired')  String dateExpired,  String id,  String status,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistSharingInfo() when $default != null:
return $default(_that.dateAvailable,_that.dateExpired,_that.id,_that.status,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'date_available')  String dateAvailable, @JsonKey(name: 'date_expired')  String dateExpired,  String id,  String status,  String url)  $default,) {final _that = this;
switch (_that) {
case _PlaylistSharingInfo():
return $default(_that.dateAvailable,_that.dateExpired,_that.id,_that.status,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'date_available')  String dateAvailable, @JsonKey(name: 'date_expired')  String dateExpired,  String id,  String status,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistSharingInfo() when $default != null:
return $default(_that.dateAvailable,_that.dateExpired,_that.id,_that.status,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistSharingInfo extends PlaylistSharingInfo {
  const _PlaylistSharingInfo({@JsonKey(name: 'date_available') required this.dateAvailable, @JsonKey(name: 'date_expired') required this.dateExpired, required this.id, required this.status, required this.url}): super._();
  factory _PlaylistSharingInfo.fromJson(Map<String, dynamic> json) => _$PlaylistSharingInfoFromJson(json);

@override@JsonKey(name: 'date_available') final  String dateAvailable;
@override@JsonKey(name: 'date_expired') final  String dateExpired;
@override final  String id;
@override final  String status;
@override final  String url;

/// Create a copy of PlaylistSharingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistSharingInfoCopyWith<_PlaylistSharingInfo> get copyWith => __$PlaylistSharingInfoCopyWithImpl<_PlaylistSharingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistSharingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistSharingInfo&&(identical(other.dateAvailable, dateAvailable) || other.dateAvailable == dateAvailable)&&(identical(other.dateExpired, dateExpired) || other.dateExpired == dateExpired)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateAvailable,dateExpired,id,status,url);

@override
String toString() {
  return 'PlaylistSharingInfo(dateAvailable: $dateAvailable, dateExpired: $dateExpired, id: $id, status: $status, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PlaylistSharingInfoCopyWith<$Res> implements $PlaylistSharingInfoCopyWith<$Res> {
  factory _$PlaylistSharingInfoCopyWith(_PlaylistSharingInfo value, $Res Function(_PlaylistSharingInfo) _then) = __$PlaylistSharingInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'date_available') String dateAvailable,@JsonKey(name: 'date_expired') String dateExpired, String id, String status, String url
});




}
/// @nodoc
class __$PlaylistSharingInfoCopyWithImpl<$Res>
    implements _$PlaylistSharingInfoCopyWith<$Res> {
  __$PlaylistSharingInfoCopyWithImpl(this._self, this._then);

  final _PlaylistSharingInfo _self;
  final $Res Function(_PlaylistSharingInfo) _then;

/// Create a copy of PlaylistSharingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateAvailable = null,Object? dateExpired = null,Object? id = null,Object? status = null,Object? url = null,}) {
  return _then(_PlaylistSharingInfo(
dateAvailable: null == dateAvailable ? _self.dateAvailable : dateAvailable // ignore: cast_nullable_to_non_nullable
as String,dateExpired: null == dateExpired ? _self.dateExpired : dateExpired // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PlaylistDetailAdditional {

@JsonKey(name: 'sharing_info') PlaylistSharingInfo? get sharingInfo; List<Song>? get songs;@JsonKey(name: 'songs_offset') int get songsOffset;@JsonKey(name: 'songs_total') int get songsTotal;
/// Create a copy of PlaylistDetailAdditional
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistDetailAdditionalCopyWith<PlaylistDetailAdditional> get copyWith => _$PlaylistDetailAdditionalCopyWithImpl<PlaylistDetailAdditional>(this as PlaylistDetailAdditional, _$identity);

  /// Serializes this PlaylistDetailAdditional to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistDetailAdditional&&(identical(other.sharingInfo, sharingInfo) || other.sharingInfo == sharingInfo)&&const DeepCollectionEquality().equals(other.songs, songs)&&(identical(other.songsOffset, songsOffset) || other.songsOffset == songsOffset)&&(identical(other.songsTotal, songsTotal) || other.songsTotal == songsTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sharingInfo,const DeepCollectionEquality().hash(songs),songsOffset,songsTotal);

@override
String toString() {
  return 'PlaylistDetailAdditional(sharingInfo: $sharingInfo, songs: $songs, songsOffset: $songsOffset, songsTotal: $songsTotal)';
}


}

/// @nodoc
abstract mixin class $PlaylistDetailAdditionalCopyWith<$Res>  {
  factory $PlaylistDetailAdditionalCopyWith(PlaylistDetailAdditional value, $Res Function(PlaylistDetailAdditional) _then) = _$PlaylistDetailAdditionalCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sharing_info') PlaylistSharingInfo? sharingInfo, List<Song>? songs,@JsonKey(name: 'songs_offset') int songsOffset,@JsonKey(name: 'songs_total') int songsTotal
});


$PlaylistSharingInfoCopyWith<$Res>? get sharingInfo;

}
/// @nodoc
class _$PlaylistDetailAdditionalCopyWithImpl<$Res>
    implements $PlaylistDetailAdditionalCopyWith<$Res> {
  _$PlaylistDetailAdditionalCopyWithImpl(this._self, this._then);

  final PlaylistDetailAdditional _self;
  final $Res Function(PlaylistDetailAdditional) _then;

/// Create a copy of PlaylistDetailAdditional
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sharingInfo = freezed,Object? songs = freezed,Object? songsOffset = null,Object? songsTotal = null,}) {
  return _then(_self.copyWith(
sharingInfo: freezed == sharingInfo ? _self.sharingInfo : sharingInfo // ignore: cast_nullable_to_non_nullable
as PlaylistSharingInfo?,songs: freezed == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<Song>?,songsOffset: null == songsOffset ? _self.songsOffset : songsOffset // ignore: cast_nullable_to_non_nullable
as int,songsTotal: null == songsTotal ? _self.songsTotal : songsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PlaylistDetailAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistSharingInfoCopyWith<$Res>? get sharingInfo {
    if (_self.sharingInfo == null) {
    return null;
  }

  return $PlaylistSharingInfoCopyWith<$Res>(_self.sharingInfo!, (value) {
    return _then(_self.copyWith(sharingInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaylistDetailAdditional].
extension PlaylistDetailAdditionalPatterns on PlaylistDetailAdditional {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistDetailAdditional value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistDetailAdditional() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistDetailAdditional value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailAdditional():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistDetailAdditional value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailAdditional() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sharing_info')  PlaylistSharingInfo? sharingInfo,  List<Song>? songs, @JsonKey(name: 'songs_offset')  int songsOffset, @JsonKey(name: 'songs_total')  int songsTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistDetailAdditional() when $default != null:
return $default(_that.sharingInfo,_that.songs,_that.songsOffset,_that.songsTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sharing_info')  PlaylistSharingInfo? sharingInfo,  List<Song>? songs, @JsonKey(name: 'songs_offset')  int songsOffset, @JsonKey(name: 'songs_total')  int songsTotal)  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailAdditional():
return $default(_that.sharingInfo,_that.songs,_that.songsOffset,_that.songsTotal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sharing_info')  PlaylistSharingInfo? sharingInfo,  List<Song>? songs, @JsonKey(name: 'songs_offset')  int songsOffset, @JsonKey(name: 'songs_total')  int songsTotal)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailAdditional() when $default != null:
return $default(_that.sharingInfo,_that.songs,_that.songsOffset,_that.songsTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistDetailAdditional extends PlaylistDetailAdditional {
  const _PlaylistDetailAdditional({@JsonKey(name: 'sharing_info') this.sharingInfo, final  List<Song>? songs, @JsonKey(name: 'songs_offset') required this.songsOffset, @JsonKey(name: 'songs_total') required this.songsTotal}): _songs = songs,super._();
  factory _PlaylistDetailAdditional.fromJson(Map<String, dynamic> json) => _$PlaylistDetailAdditionalFromJson(json);

@override@JsonKey(name: 'sharing_info') final  PlaylistSharingInfo? sharingInfo;
 final  List<Song>? _songs;
@override List<Song>? get songs {
  final value = _songs;
  if (value == null) return null;
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'songs_offset') final  int songsOffset;
@override@JsonKey(name: 'songs_total') final  int songsTotal;

/// Create a copy of PlaylistDetailAdditional
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistDetailAdditionalCopyWith<_PlaylistDetailAdditional> get copyWith => __$PlaylistDetailAdditionalCopyWithImpl<_PlaylistDetailAdditional>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistDetailAdditionalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistDetailAdditional&&(identical(other.sharingInfo, sharingInfo) || other.sharingInfo == sharingInfo)&&const DeepCollectionEquality().equals(other._songs, _songs)&&(identical(other.songsOffset, songsOffset) || other.songsOffset == songsOffset)&&(identical(other.songsTotal, songsTotal) || other.songsTotal == songsTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sharingInfo,const DeepCollectionEquality().hash(_songs),songsOffset,songsTotal);

@override
String toString() {
  return 'PlaylistDetailAdditional(sharingInfo: $sharingInfo, songs: $songs, songsOffset: $songsOffset, songsTotal: $songsTotal)';
}


}

/// @nodoc
abstract mixin class _$PlaylistDetailAdditionalCopyWith<$Res> implements $PlaylistDetailAdditionalCopyWith<$Res> {
  factory _$PlaylistDetailAdditionalCopyWith(_PlaylistDetailAdditional value, $Res Function(_PlaylistDetailAdditional) _then) = __$PlaylistDetailAdditionalCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sharing_info') PlaylistSharingInfo? sharingInfo, List<Song>? songs,@JsonKey(name: 'songs_offset') int songsOffset,@JsonKey(name: 'songs_total') int songsTotal
});


@override $PlaylistSharingInfoCopyWith<$Res>? get sharingInfo;

}
/// @nodoc
class __$PlaylistDetailAdditionalCopyWithImpl<$Res>
    implements _$PlaylistDetailAdditionalCopyWith<$Res> {
  __$PlaylistDetailAdditionalCopyWithImpl(this._self, this._then);

  final _PlaylistDetailAdditional _self;
  final $Res Function(_PlaylistDetailAdditional) _then;

/// Create a copy of PlaylistDetailAdditional
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sharingInfo = freezed,Object? songs = freezed,Object? songsOffset = null,Object? songsTotal = null,}) {
  return _then(_PlaylistDetailAdditional(
sharingInfo: freezed == sharingInfo ? _self.sharingInfo : sharingInfo // ignore: cast_nullable_to_non_nullable
as PlaylistSharingInfo?,songs: freezed == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<Song>?,songsOffset: null == songsOffset ? _self.songsOffset : songsOffset // ignore: cast_nullable_to_non_nullable
as int,songsTotal: null == songsTotal ? _self.songsTotal : songsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PlaylistDetailAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistSharingInfoCopyWith<$Res>? get sharingInfo {
    if (_self.sharingInfo == null) {
    return null;
  }

  return $PlaylistSharingInfoCopyWith<$Res>(_self.sharingInfo!, (value) {
    return _then(_self.copyWith(sharingInfo: value));
  });
}
}


/// @nodoc
mixin _$PlaylistDetailInfo {

 String get id; String get library; String get name;@JsonKey(name: 'sharing_status') String get sharingStatus; String get type; PlaylistDetailAdditional? get additional;
/// Create a copy of PlaylistDetailInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistDetailInfoCopyWith<PlaylistDetailInfo> get copyWith => _$PlaylistDetailInfoCopyWithImpl<PlaylistDetailInfo>(this as PlaylistDetailInfo, _$identity);

  /// Serializes this PlaylistDetailInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistDetailInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.library, library) || other.library == library)&&(identical(other.name, name) || other.name == name)&&(identical(other.sharingStatus, sharingStatus) || other.sharingStatus == sharingStatus)&&(identical(other.type, type) || other.type == type)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,library,name,sharingStatus,type,additional);

@override
String toString() {
  return 'PlaylistDetailInfo(id: $id, library: $library, name: $name, sharingStatus: $sharingStatus, type: $type, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $PlaylistDetailInfoCopyWith<$Res>  {
  factory $PlaylistDetailInfoCopyWith(PlaylistDetailInfo value, $Res Function(PlaylistDetailInfo) _then) = _$PlaylistDetailInfoCopyWithImpl;
@useResult
$Res call({
 String id, String library, String name,@JsonKey(name: 'sharing_status') String sharingStatus, String type, PlaylistDetailAdditional? additional
});


$PlaylistDetailAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class _$PlaylistDetailInfoCopyWithImpl<$Res>
    implements $PlaylistDetailInfoCopyWith<$Res> {
  _$PlaylistDetailInfoCopyWithImpl(this._self, this._then);

  final PlaylistDetailInfo _self;
  final $Res Function(PlaylistDetailInfo) _then;

/// Create a copy of PlaylistDetailInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? library = null,Object? name = null,Object? sharingStatus = null,Object? type = null,Object? additional = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sharingStatus: null == sharingStatus ? _self.sharingStatus : sharingStatus // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as PlaylistDetailAdditional?,
  ));
}
/// Create a copy of PlaylistDetailInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistDetailAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $PlaylistDetailAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaylistDetailInfo].
extension PlaylistDetailInfoPatterns on PlaylistDetailInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistDetailInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistDetailInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistDetailInfo value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistDetailInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String library,  String name, @JsonKey(name: 'sharing_status')  String sharingStatus,  String type,  PlaylistDetailAdditional? additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistDetailInfo() when $default != null:
return $default(_that.id,_that.library,_that.name,_that.sharingStatus,_that.type,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String library,  String name, @JsonKey(name: 'sharing_status')  String sharingStatus,  String type,  PlaylistDetailAdditional? additional)  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailInfo():
return $default(_that.id,_that.library,_that.name,_that.sharingStatus,_that.type,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String library,  String name, @JsonKey(name: 'sharing_status')  String sharingStatus,  String type,  PlaylistDetailAdditional? additional)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailInfo() when $default != null:
return $default(_that.id,_that.library,_that.name,_that.sharingStatus,_that.type,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistDetailInfo extends PlaylistDetailInfo {
  const _PlaylistDetailInfo({required this.id, required this.library, required this.name, @JsonKey(name: 'sharing_status') required this.sharingStatus, required this.type, this.additional}): super._();
  factory _PlaylistDetailInfo.fromJson(Map<String, dynamic> json) => _$PlaylistDetailInfoFromJson(json);

@override final  String id;
@override final  String library;
@override final  String name;
@override@JsonKey(name: 'sharing_status') final  String sharingStatus;
@override final  String type;
@override final  PlaylistDetailAdditional? additional;

/// Create a copy of PlaylistDetailInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistDetailInfoCopyWith<_PlaylistDetailInfo> get copyWith => __$PlaylistDetailInfoCopyWithImpl<_PlaylistDetailInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistDetailInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistDetailInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.library, library) || other.library == library)&&(identical(other.name, name) || other.name == name)&&(identical(other.sharingStatus, sharingStatus) || other.sharingStatus == sharingStatus)&&(identical(other.type, type) || other.type == type)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,library,name,sharingStatus,type,additional);

@override
String toString() {
  return 'PlaylistDetailInfo(id: $id, library: $library, name: $name, sharingStatus: $sharingStatus, type: $type, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$PlaylistDetailInfoCopyWith<$Res> implements $PlaylistDetailInfoCopyWith<$Res> {
  factory _$PlaylistDetailInfoCopyWith(_PlaylistDetailInfo value, $Res Function(_PlaylistDetailInfo) _then) = __$PlaylistDetailInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String library, String name,@JsonKey(name: 'sharing_status') String sharingStatus, String type, PlaylistDetailAdditional? additional
});


@override $PlaylistDetailAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class __$PlaylistDetailInfoCopyWithImpl<$Res>
    implements _$PlaylistDetailInfoCopyWith<$Res> {
  __$PlaylistDetailInfoCopyWithImpl(this._self, this._then);

  final _PlaylistDetailInfo _self;
  final $Res Function(_PlaylistDetailInfo) _then;

/// Create a copy of PlaylistDetailInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? library = null,Object? name = null,Object? sharingStatus = null,Object? type = null,Object? additional = freezed,}) {
  return _then(_PlaylistDetailInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sharingStatus: null == sharingStatus ? _self.sharingStatus : sharingStatus // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as PlaylistDetailAdditional?,
  ));
}

/// Create a copy of PlaylistDetailInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistDetailAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $PlaylistDetailAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// @nodoc
mixin _$PlaylistDetailData {

 List<PlaylistDetailInfo>? get playlists;
/// Create a copy of PlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistDetailDataCopyWith<PlaylistDetailData> get copyWith => _$PlaylistDetailDataCopyWithImpl<PlaylistDetailData>(this as PlaylistDetailData, _$identity);

  /// Serializes this PlaylistDetailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistDetailData&&const DeepCollectionEquality().equals(other.playlists, playlists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(playlists));

@override
String toString() {
  return 'PlaylistDetailData(playlists: $playlists)';
}


}

/// @nodoc
abstract mixin class $PlaylistDetailDataCopyWith<$Res>  {
  factory $PlaylistDetailDataCopyWith(PlaylistDetailData value, $Res Function(PlaylistDetailData) _then) = _$PlaylistDetailDataCopyWithImpl;
@useResult
$Res call({
 List<PlaylistDetailInfo>? playlists
});




}
/// @nodoc
class _$PlaylistDetailDataCopyWithImpl<$Res>
    implements $PlaylistDetailDataCopyWith<$Res> {
  _$PlaylistDetailDataCopyWithImpl(this._self, this._then);

  final PlaylistDetailData _self;
  final $Res Function(PlaylistDetailData) _then;

/// Create a copy of PlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlists = freezed,}) {
  return _then(_self.copyWith(
playlists: freezed == playlists ? _self.playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<PlaylistDetailInfo>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistDetailData].
extension PlaylistDetailDataPatterns on PlaylistDetailData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistDetailData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistDetailData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistDetailData value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistDetailData value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlaylistDetailInfo>? playlists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistDetailData() when $default != null:
return $default(_that.playlists);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlaylistDetailInfo>? playlists)  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailData():
return $default(_that.playlists);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlaylistDetailInfo>? playlists)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailData() when $default != null:
return $default(_that.playlists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistDetailData extends PlaylistDetailData {
  const _PlaylistDetailData({final  List<PlaylistDetailInfo>? playlists}): _playlists = playlists,super._();
  factory _PlaylistDetailData.fromJson(Map<String, dynamic> json) => _$PlaylistDetailDataFromJson(json);

 final  List<PlaylistDetailInfo>? _playlists;
@override List<PlaylistDetailInfo>? get playlists {
  final value = _playlists;
  if (value == null) return null;
  if (_playlists is EqualUnmodifiableListView) return _playlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistDetailDataCopyWith<_PlaylistDetailData> get copyWith => __$PlaylistDetailDataCopyWithImpl<_PlaylistDetailData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistDetailDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistDetailData&&const DeepCollectionEquality().equals(other._playlists, _playlists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playlists));

@override
String toString() {
  return 'PlaylistDetailData(playlists: $playlists)';
}


}

/// @nodoc
abstract mixin class _$PlaylistDetailDataCopyWith<$Res> implements $PlaylistDetailDataCopyWith<$Res> {
  factory _$PlaylistDetailDataCopyWith(_PlaylistDetailData value, $Res Function(_PlaylistDetailData) _then) = __$PlaylistDetailDataCopyWithImpl;
@override @useResult
$Res call({
 List<PlaylistDetailInfo>? playlists
});




}
/// @nodoc
class __$PlaylistDetailDataCopyWithImpl<$Res>
    implements _$PlaylistDetailDataCopyWith<$Res> {
  __$PlaylistDetailDataCopyWithImpl(this._self, this._then);

  final _PlaylistDetailData _self;
  final $Res Function(_PlaylistDetailData) _then;

/// Create a copy of PlaylistDetailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlists = freezed,}) {
  return _then(_PlaylistDetailData(
playlists: freezed == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<PlaylistDetailInfo>?,
  ));
}


}


/// @nodoc
mixin _$PlaylistDetailResponse {

 bool get success; PlaylistDetailData? get data; Map<String, dynamic>? get error;
/// Create a copy of PlaylistDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistDetailResponseCopyWith<PlaylistDetailResponse> get copyWith => _$PlaylistDetailResponseCopyWithImpl<PlaylistDetailResponse>(this as PlaylistDetailResponse, _$identity);

  /// Serializes this PlaylistDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'PlaylistDetailResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $PlaylistDetailResponseCopyWith<$Res>  {
  factory $PlaylistDetailResponseCopyWith(PlaylistDetailResponse value, $Res Function(PlaylistDetailResponse) _then) = _$PlaylistDetailResponseCopyWithImpl;
@useResult
$Res call({
 bool success, PlaylistDetailData? data, Map<String, dynamic>? error
});


$PlaylistDetailDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PlaylistDetailResponseCopyWithImpl<$Res>
    implements $PlaylistDetailResponseCopyWith<$Res> {
  _$PlaylistDetailResponseCopyWithImpl(this._self, this._then);

  final PlaylistDetailResponse _self;
  final $Res Function(PlaylistDetailResponse) _then;

/// Create a copy of PlaylistDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PlaylistDetailData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of PlaylistDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistDetailDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PlaylistDetailDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaylistDetailResponse].
extension PlaylistDetailResponsePatterns on PlaylistDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  PlaylistDetailData? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistDetailResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  PlaylistDetailData? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailResponse():
return $default(_that.success,_that.data,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  PlaylistDetailData? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistDetailResponse extends PlaylistDetailResponse {
  const _PlaylistDetailResponse({required this.success, this.data, final  Map<String, dynamic>? error}): _error = error,super._();
  factory _PlaylistDetailResponse.fromJson(Map<String, dynamic> json) => _$PlaylistDetailResponseFromJson(json);

@override final  bool success;
@override final  PlaylistDetailData? data;
 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PlaylistDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistDetailResponseCopyWith<_PlaylistDetailResponse> get copyWith => __$PlaylistDetailResponseCopyWithImpl<_PlaylistDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'PlaylistDetailResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PlaylistDetailResponseCopyWith<$Res> implements $PlaylistDetailResponseCopyWith<$Res> {
  factory _$PlaylistDetailResponseCopyWith(_PlaylistDetailResponse value, $Res Function(_PlaylistDetailResponse) _then) = __$PlaylistDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, PlaylistDetailData? data, Map<String, dynamic>? error
});


@override $PlaylistDetailDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PlaylistDetailResponseCopyWithImpl<$Res>
    implements _$PlaylistDetailResponseCopyWith<$Res> {
  __$PlaylistDetailResponseCopyWithImpl(this._self, this._then);

  final _PlaylistDetailResponse _self;
  final $Res Function(_PlaylistDetailResponse) _then;

/// Create a copy of PlaylistDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_PlaylistDetailResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PlaylistDetailData?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of PlaylistDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistDetailDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PlaylistDetailDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PlaylistDetailRequest {

 String get api; String get method; String get id; String get library; String get additional; int get version; int get limit; int get offset;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection;
/// Create a copy of PlaylistDetailRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistDetailRequestCopyWith<PlaylistDetailRequest> get copyWith => _$PlaylistDetailRequestCopyWithImpl<PlaylistDetailRequest>(this as PlaylistDetailRequest, _$identity);

  /// Serializes this PlaylistDetailRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistDetailRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.version, version) || other.version == version)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,library,additional,version,limit,offset,sortBy,sortDirection);

@override
String toString() {
  return 'PlaylistDetailRequest(api: $api, method: $method, id: $id, library: $library, additional: $additional, version: $version, limit: $limit, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class $PlaylistDetailRequestCopyWith<$Res>  {
  factory $PlaylistDetailRequestCopyWith(PlaylistDetailRequest value, $Res Function(PlaylistDetailRequest) _then) = _$PlaylistDetailRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String id, String library, String additional, int version, int limit, int offset,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection
});




}
/// @nodoc
class _$PlaylistDetailRequestCopyWithImpl<$Res>
    implements $PlaylistDetailRequestCopyWith<$Res> {
  _$PlaylistDetailRequestCopyWithImpl(this._self, this._then);

  final PlaylistDetailRequest _self;
  final $Res Function(PlaylistDetailRequest) _then;

/// Create a copy of PlaylistDetailRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? id = null,Object? library = null,Object? additional = null,Object? version = null,Object? limit = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistDetailRequest].
extension PlaylistDetailRequestPatterns on PlaylistDetailRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistDetailRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistDetailRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistDetailRequest value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistDetailRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistDetailRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String id,  String library,  String additional,  int version,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistDetailRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.library,_that.additional,_that.version,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String id,  String library,  String additional,  int version,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailRequest():
return $default(_that.api,_that.method,_that.id,_that.library,_that.additional,_that.version,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String id,  String library,  String additional,  int version,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistDetailRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.library,_that.additional,_that.version,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistDetailRequest extends PlaylistDetailRequest {
  const _PlaylistDetailRequest({required this.api, required this.method, required this.id, required this.library, required this.additional, required this.version, required this.limit, required this.offset, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection}): super._();
  factory _PlaylistDetailRequest.fromJson(Map<String, dynamic> json) => _$PlaylistDetailRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String id;
@override final  String library;
@override final  String additional;
@override final  int version;
@override final  int limit;
@override final  int offset;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;

/// Create a copy of PlaylistDetailRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistDetailRequestCopyWith<_PlaylistDetailRequest> get copyWith => __$PlaylistDetailRequestCopyWithImpl<_PlaylistDetailRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistDetailRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistDetailRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.version, version) || other.version == version)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,library,additional,version,limit,offset,sortBy,sortDirection);

@override
String toString() {
  return 'PlaylistDetailRequest(api: $api, method: $method, id: $id, library: $library, additional: $additional, version: $version, limit: $limit, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class _$PlaylistDetailRequestCopyWith<$Res> implements $PlaylistDetailRequestCopyWith<$Res> {
  factory _$PlaylistDetailRequestCopyWith(_PlaylistDetailRequest value, $Res Function(_PlaylistDetailRequest) _then) = __$PlaylistDetailRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String id, String library, String additional, int version, int limit, int offset,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection
});




}
/// @nodoc
class __$PlaylistDetailRequestCopyWithImpl<$Res>
    implements _$PlaylistDetailRequestCopyWith<$Res> {
  __$PlaylistDetailRequestCopyWithImpl(this._self, this._then);

  final _PlaylistDetailRequest _self;
  final $Res Function(_PlaylistDetailRequest) _then;

/// Create a copy of PlaylistDetailRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? id = null,Object? library = null,Object? additional = null,Object? version = null,Object? limit = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_PlaylistDetailRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PlaylistListRequest {

 String get api; String get method; int get limit; String get library; int get offset; String get sortBy; String get sortDirection; int get version;
/// Create a copy of PlaylistListRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistListRequestCopyWith<PlaylistListRequest> get copyWith => _$PlaylistListRequestCopyWithImpl<PlaylistListRequest>(this as PlaylistListRequest, _$identity);

  /// Serializes this PlaylistListRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistListRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,offset,sortBy,sortDirection,version);

@override
String toString() {
  return 'PlaylistListRequest(api: $api, method: $method, limit: $limit, library: $library, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection, version: $version)';
}


}

/// @nodoc
abstract mixin class $PlaylistListRequestCopyWith<$Res>  {
  factory $PlaylistListRequestCopyWith(PlaylistListRequest value, $Res Function(PlaylistListRequest) _then) = _$PlaylistListRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, int limit, String library, int offset, String sortBy, String sortDirection, int version
});




}
/// @nodoc
class _$PlaylistListRequestCopyWithImpl<$Res>
    implements $PlaylistListRequestCopyWith<$Res> {
  _$PlaylistListRequestCopyWithImpl(this._self, this._then);

  final PlaylistListRequest _self;
  final $Res Function(PlaylistListRequest) _then;

/// Create a copy of PlaylistListRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistListRequest].
extension PlaylistListRequestPatterns on PlaylistListRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistListRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistListRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistListRequest value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistListRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistListRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistListRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  int offset,  String sortBy,  String sortDirection,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistListRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.offset,_that.sortBy,_that.sortDirection,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  int offset,  String sortBy,  String sortDirection,  int version)  $default,) {final _that = this;
switch (_that) {
case _PlaylistListRequest():
return $default(_that.api,_that.method,_that.limit,_that.library,_that.offset,_that.sortBy,_that.sortDirection,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  int limit,  String library,  int offset,  String sortBy,  String sortDirection,  int version)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistListRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.offset,_that.sortBy,_that.sortDirection,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistListRequest extends PlaylistListRequest {
  const _PlaylistListRequest({required this.api, required this.method, required this.limit, required this.library, required this.offset, required this.sortBy, required this.sortDirection, required this.version}): super._();
  factory _PlaylistListRequest.fromJson(Map<String, dynamic> json) => _$PlaylistListRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  int limit;
@override final  String library;
@override final  int offset;
@override final  String sortBy;
@override final  String sortDirection;
@override final  int version;

/// Create a copy of PlaylistListRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistListRequestCopyWith<_PlaylistListRequest> get copyWith => __$PlaylistListRequestCopyWithImpl<_PlaylistListRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistListRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistListRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,offset,sortBy,sortDirection,version);

@override
String toString() {
  return 'PlaylistListRequest(api: $api, method: $method, limit: $limit, library: $library, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection, version: $version)';
}


}

/// @nodoc
abstract mixin class _$PlaylistListRequestCopyWith<$Res> implements $PlaylistListRequestCopyWith<$Res> {
  factory _$PlaylistListRequestCopyWith(_PlaylistListRequest value, $Res Function(_PlaylistListRequest) _then) = __$PlaylistListRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, int limit, String library, int offset, String sortBy, String sortDirection, int version
});




}
/// @nodoc
class __$PlaylistListRequestCopyWithImpl<$Res>
    implements _$PlaylistListRequestCopyWith<$Res> {
  __$PlaylistListRequestCopyWithImpl(this._self, this._then);

  final _PlaylistListRequest _self;
  final $Res Function(_PlaylistListRequest) _then;

/// Create a copy of PlaylistListRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,Object? version = null,}) {
  return _then(_PlaylistListRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PlaylistListData {

 int get offset; List<PlaylistInfo>? get playlists; int get total;
/// Create a copy of PlaylistListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistListDataCopyWith<PlaylistListData> get copyWith => _$PlaylistListDataCopyWithImpl<PlaylistListData>(this as PlaylistListData, _$identity);

  /// Serializes this PlaylistListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistListData&&(identical(other.offset, offset) || other.offset == offset)&&const DeepCollectionEquality().equals(other.playlists, playlists)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offset,const DeepCollectionEquality().hash(playlists),total);

@override
String toString() {
  return 'PlaylistListData(offset: $offset, playlists: $playlists, total: $total)';
}


}

/// @nodoc
abstract mixin class $PlaylistListDataCopyWith<$Res>  {
  factory $PlaylistListDataCopyWith(PlaylistListData value, $Res Function(PlaylistListData) _then) = _$PlaylistListDataCopyWithImpl;
@useResult
$Res call({
 int offset, List<PlaylistInfo>? playlists, int total
});




}
/// @nodoc
class _$PlaylistListDataCopyWithImpl<$Res>
    implements $PlaylistListDataCopyWith<$Res> {
  _$PlaylistListDataCopyWithImpl(this._self, this._then);

  final PlaylistListData _self;
  final $Res Function(PlaylistListData) _then;

/// Create a copy of PlaylistListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offset = null,Object? playlists = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,playlists: freezed == playlists ? _self.playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<PlaylistInfo>?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaylistListData].
extension PlaylistListDataPatterns on PlaylistListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistListData value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistListData value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int offset,  List<PlaylistInfo>? playlists,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistListData() when $default != null:
return $default(_that.offset,_that.playlists,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int offset,  List<PlaylistInfo>? playlists,  int total)  $default,) {final _that = this;
switch (_that) {
case _PlaylistListData():
return $default(_that.offset,_that.playlists,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int offset,  List<PlaylistInfo>? playlists,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistListData() when $default != null:
return $default(_that.offset,_that.playlists,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistListData extends PlaylistListData {
  const _PlaylistListData({required this.offset, final  List<PlaylistInfo>? playlists, required this.total}): _playlists = playlists,super._();
  factory _PlaylistListData.fromJson(Map<String, dynamic> json) => _$PlaylistListDataFromJson(json);

@override final  int offset;
 final  List<PlaylistInfo>? _playlists;
@override List<PlaylistInfo>? get playlists {
  final value = _playlists;
  if (value == null) return null;
  if (_playlists is EqualUnmodifiableListView) return _playlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int total;

/// Create a copy of PlaylistListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistListDataCopyWith<_PlaylistListData> get copyWith => __$PlaylistListDataCopyWithImpl<_PlaylistListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistListData&&(identical(other.offset, offset) || other.offset == offset)&&const DeepCollectionEquality().equals(other._playlists, _playlists)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offset,const DeepCollectionEquality().hash(_playlists),total);

@override
String toString() {
  return 'PlaylistListData(offset: $offset, playlists: $playlists, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PlaylistListDataCopyWith<$Res> implements $PlaylistListDataCopyWith<$Res> {
  factory _$PlaylistListDataCopyWith(_PlaylistListData value, $Res Function(_PlaylistListData) _then) = __$PlaylistListDataCopyWithImpl;
@override @useResult
$Res call({
 int offset, List<PlaylistInfo>? playlists, int total
});




}
/// @nodoc
class __$PlaylistListDataCopyWithImpl<$Res>
    implements _$PlaylistListDataCopyWith<$Res> {
  __$PlaylistListDataCopyWithImpl(this._self, this._then);

  final _PlaylistListData _self;
  final $Res Function(_PlaylistListData) _then;

/// Create a copy of PlaylistListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offset = null,Object? playlists = freezed,Object? total = null,}) {
  return _then(_PlaylistListData(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,playlists: freezed == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<PlaylistInfo>?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PlaylistListResponse {

 bool get success; PlaylistListData? get data; Map<String, dynamic>? get error;
/// Create a copy of PlaylistListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaylistListResponseCopyWith<PlaylistListResponse> get copyWith => _$PlaylistListResponseCopyWithImpl<PlaylistListResponse>(this as PlaylistListResponse, _$identity);

  /// Serializes this PlaylistListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaylistListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'PlaylistListResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $PlaylistListResponseCopyWith<$Res>  {
  factory $PlaylistListResponseCopyWith(PlaylistListResponse value, $Res Function(PlaylistListResponse) _then) = _$PlaylistListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, PlaylistListData? data, Map<String, dynamic>? error
});


$PlaylistListDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PlaylistListResponseCopyWithImpl<$Res>
    implements $PlaylistListResponseCopyWith<$Res> {
  _$PlaylistListResponseCopyWithImpl(this._self, this._then);

  final PlaylistListResponse _self;
  final $Res Function(PlaylistListResponse) _then;

/// Create a copy of PlaylistListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PlaylistListData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of PlaylistListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PlaylistListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaylistListResponse].
extension PlaylistListResponsePatterns on PlaylistListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaylistListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaylistListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaylistListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PlaylistListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaylistListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PlaylistListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  PlaylistListData? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaylistListResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  PlaylistListData? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _PlaylistListResponse():
return $default(_that.success,_that.data,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  PlaylistListData? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _PlaylistListResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaylistListResponse extends PlaylistListResponse {
  const _PlaylistListResponse({required this.success, this.data, final  Map<String, dynamic>? error}): _error = error,super._();
  factory _PlaylistListResponse.fromJson(Map<String, dynamic> json) => _$PlaylistListResponseFromJson(json);

@override final  bool success;
@override final  PlaylistListData? data;
 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PlaylistListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistListResponseCopyWith<_PlaylistListResponse> get copyWith => __$PlaylistListResponseCopyWithImpl<_PlaylistListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaylistListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'PlaylistListResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PlaylistListResponseCopyWith<$Res> implements $PlaylistListResponseCopyWith<$Res> {
  factory _$PlaylistListResponseCopyWith(_PlaylistListResponse value, $Res Function(_PlaylistListResponse) _then) = __$PlaylistListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, PlaylistListData? data, Map<String, dynamic>? error
});


@override $PlaylistListDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PlaylistListResponseCopyWithImpl<$Res>
    implements _$PlaylistListResponseCopyWith<$Res> {
  __$PlaylistListResponseCopyWithImpl(this._self, this._then);

  final _PlaylistListResponse _self;
  final $Res Function(_PlaylistListResponse) _then;

/// Create a copy of PlaylistListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_PlaylistListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PlaylistListData?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of PlaylistListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaylistListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PlaylistListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CreatePlaylistRequest {

 String get api; String get method; String get name; String get library; int get version;
/// Create a copy of CreatePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePlaylistRequestCopyWith<CreatePlaylistRequest> get copyWith => _$CreatePlaylistRequestCopyWithImpl<CreatePlaylistRequest>(this as CreatePlaylistRequest, _$identity);

  /// Serializes this CreatePlaylistRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePlaylistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.name, name) || other.name == name)&&(identical(other.library, library) || other.library == library)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,name,library,version);

@override
String toString() {
  return 'CreatePlaylistRequest(api: $api, method: $method, name: $name, library: $library, version: $version)';
}


}

/// @nodoc
abstract mixin class $CreatePlaylistRequestCopyWith<$Res>  {
  factory $CreatePlaylistRequestCopyWith(CreatePlaylistRequest value, $Res Function(CreatePlaylistRequest) _then) = _$CreatePlaylistRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String name, String library, int version
});




}
/// @nodoc
class _$CreatePlaylistRequestCopyWithImpl<$Res>
    implements $CreatePlaylistRequestCopyWith<$Res> {
  _$CreatePlaylistRequestCopyWithImpl(this._self, this._then);

  final CreatePlaylistRequest _self;
  final $Res Function(CreatePlaylistRequest) _then;

/// Create a copy of CreatePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? name = null,Object? library = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePlaylistRequest].
extension CreatePlaylistRequestPatterns on CreatePlaylistRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePlaylistRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePlaylistRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePlaylistRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreatePlaylistRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePlaylistRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePlaylistRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String name,  String library,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePlaylistRequest() when $default != null:
return $default(_that.api,_that.method,_that.name,_that.library,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String name,  String library,  int version)  $default,) {final _that = this;
switch (_that) {
case _CreatePlaylistRequest():
return $default(_that.api,_that.method,_that.name,_that.library,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String name,  String library,  int version)?  $default,) {final _that = this;
switch (_that) {
case _CreatePlaylistRequest() when $default != null:
return $default(_that.api,_that.method,_that.name,_that.library,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePlaylistRequest extends CreatePlaylistRequest {
  const _CreatePlaylistRequest({required this.api, required this.method, required this.name, required this.library, required this.version}): super._();
  factory _CreatePlaylistRequest.fromJson(Map<String, dynamic> json) => _$CreatePlaylistRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String name;
@override final  String library;
@override final  int version;

/// Create a copy of CreatePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePlaylistRequestCopyWith<_CreatePlaylistRequest> get copyWith => __$CreatePlaylistRequestCopyWithImpl<_CreatePlaylistRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePlaylistRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePlaylistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.name, name) || other.name == name)&&(identical(other.library, library) || other.library == library)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,name,library,version);

@override
String toString() {
  return 'CreatePlaylistRequest(api: $api, method: $method, name: $name, library: $library, version: $version)';
}


}

/// @nodoc
abstract mixin class _$CreatePlaylistRequestCopyWith<$Res> implements $CreatePlaylistRequestCopyWith<$Res> {
  factory _$CreatePlaylistRequestCopyWith(_CreatePlaylistRequest value, $Res Function(_CreatePlaylistRequest) _then) = __$CreatePlaylistRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String name, String library, int version
});




}
/// @nodoc
class __$CreatePlaylistRequestCopyWithImpl<$Res>
    implements _$CreatePlaylistRequestCopyWith<$Res> {
  __$CreatePlaylistRequestCopyWithImpl(this._self, this._then);

  final _CreatePlaylistRequest _self;
  final $Res Function(_CreatePlaylistRequest) _then;

/// Create a copy of CreatePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? name = null,Object? library = null,Object? version = null,}) {
  return _then(_CreatePlaylistRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreatePlaylistData {

 String get id;
/// Create a copy of CreatePlaylistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePlaylistDataCopyWith<CreatePlaylistData> get copyWith => _$CreatePlaylistDataCopyWithImpl<CreatePlaylistData>(this as CreatePlaylistData, _$identity);

  /// Serializes this CreatePlaylistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePlaylistData&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CreatePlaylistData(id: $id)';
}


}

/// @nodoc
abstract mixin class $CreatePlaylistDataCopyWith<$Res>  {
  factory $CreatePlaylistDataCopyWith(CreatePlaylistData value, $Res Function(CreatePlaylistData) _then) = _$CreatePlaylistDataCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$CreatePlaylistDataCopyWithImpl<$Res>
    implements $CreatePlaylistDataCopyWith<$Res> {
  _$CreatePlaylistDataCopyWithImpl(this._self, this._then);

  final CreatePlaylistData _self;
  final $Res Function(CreatePlaylistData) _then;

/// Create a copy of CreatePlaylistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePlaylistData].
extension CreatePlaylistDataPatterns on CreatePlaylistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePlaylistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePlaylistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePlaylistData value)  $default,){
final _that = this;
switch (_that) {
case _CreatePlaylistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePlaylistData value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePlaylistData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePlaylistData() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _CreatePlaylistData():
return $default(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _CreatePlaylistData() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePlaylistData extends CreatePlaylistData {
  const _CreatePlaylistData({required this.id}): super._();
  factory _CreatePlaylistData.fromJson(Map<String, dynamic> json) => _$CreatePlaylistDataFromJson(json);

@override final  String id;

/// Create a copy of CreatePlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePlaylistDataCopyWith<_CreatePlaylistData> get copyWith => __$CreatePlaylistDataCopyWithImpl<_CreatePlaylistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePlaylistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePlaylistData&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CreatePlaylistData(id: $id)';
}


}

/// @nodoc
abstract mixin class _$CreatePlaylistDataCopyWith<$Res> implements $CreatePlaylistDataCopyWith<$Res> {
  factory _$CreatePlaylistDataCopyWith(_CreatePlaylistData value, $Res Function(_CreatePlaylistData) _then) = __$CreatePlaylistDataCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$CreatePlaylistDataCopyWithImpl<$Res>
    implements _$CreatePlaylistDataCopyWith<$Res> {
  __$CreatePlaylistDataCopyWithImpl(this._self, this._then);

  final _CreatePlaylistData _self;
  final $Res Function(_CreatePlaylistData) _then;

/// Create a copy of CreatePlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_CreatePlaylistData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreatePlaylistResponse {

 bool get success; CreatePlaylistData? get data;
/// Create a copy of CreatePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePlaylistResponseCopyWith<CreatePlaylistResponse> get copyWith => _$CreatePlaylistResponseCopyWithImpl<CreatePlaylistResponse>(this as CreatePlaylistResponse, _$identity);

  /// Serializes this CreatePlaylistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePlaylistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'CreatePlaylistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $CreatePlaylistResponseCopyWith<$Res>  {
  factory $CreatePlaylistResponseCopyWith(CreatePlaylistResponse value, $Res Function(CreatePlaylistResponse) _then) = _$CreatePlaylistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, CreatePlaylistData? data
});


$CreatePlaylistDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$CreatePlaylistResponseCopyWithImpl<$Res>
    implements $CreatePlaylistResponseCopyWith<$Res> {
  _$CreatePlaylistResponseCopyWithImpl(this._self, this._then);

  final CreatePlaylistResponse _self;
  final $Res Function(CreatePlaylistResponse) _then;

/// Create a copy of CreatePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreatePlaylistData?,
  ));
}
/// Create a copy of CreatePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatePlaylistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CreatePlaylistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreatePlaylistResponse].
extension CreatePlaylistResponsePatterns on CreatePlaylistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePlaylistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePlaylistResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreatePlaylistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePlaylistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  CreatePlaylistData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  CreatePlaylistData? data)  $default,) {final _that = this;
switch (_that) {
case _CreatePlaylistResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  CreatePlaylistData? data)?  $default,) {final _that = this;
switch (_that) {
case _CreatePlaylistResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePlaylistResponse extends CreatePlaylistResponse {
  const _CreatePlaylistResponse({required this.success, this.data}): super._();
  factory _CreatePlaylistResponse.fromJson(Map<String, dynamic> json) => _$CreatePlaylistResponseFromJson(json);

@override final  bool success;
@override final  CreatePlaylistData? data;

/// Create a copy of CreatePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePlaylistResponseCopyWith<_CreatePlaylistResponse> get copyWith => __$CreatePlaylistResponseCopyWithImpl<_CreatePlaylistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePlaylistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePlaylistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'CreatePlaylistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreatePlaylistResponseCopyWith<$Res> implements $CreatePlaylistResponseCopyWith<$Res> {
  factory _$CreatePlaylistResponseCopyWith(_CreatePlaylistResponse value, $Res Function(_CreatePlaylistResponse) _then) = __$CreatePlaylistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, CreatePlaylistData? data
});


@override $CreatePlaylistDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$CreatePlaylistResponseCopyWithImpl<$Res>
    implements _$CreatePlaylistResponseCopyWith<$Res> {
  __$CreatePlaylistResponseCopyWithImpl(this._self, this._then);

  final _CreatePlaylistResponse _self;
  final $Res Function(_CreatePlaylistResponse) _then;

/// Create a copy of CreatePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_CreatePlaylistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreatePlaylistData?,
  ));
}

/// Create a copy of CreatePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatePlaylistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CreatePlaylistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RenamePlaylistRequest {

 String get api; String get method; String get id;@JsonKey(name: 'new_name') String get newName; int get version;
/// Create a copy of RenamePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenamePlaylistRequestCopyWith<RenamePlaylistRequest> get copyWith => _$RenamePlaylistRequestCopyWithImpl<RenamePlaylistRequest>(this as RenamePlaylistRequest, _$identity);

  /// Serializes this RenamePlaylistRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenamePlaylistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.newName, newName) || other.newName == newName)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,newName,version);

@override
String toString() {
  return 'RenamePlaylistRequest(api: $api, method: $method, id: $id, newName: $newName, version: $version)';
}


}

/// @nodoc
abstract mixin class $RenamePlaylistRequestCopyWith<$Res>  {
  factory $RenamePlaylistRequestCopyWith(RenamePlaylistRequest value, $Res Function(RenamePlaylistRequest) _then) = _$RenamePlaylistRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String id,@JsonKey(name: 'new_name') String newName, int version
});




}
/// @nodoc
class _$RenamePlaylistRequestCopyWithImpl<$Res>
    implements $RenamePlaylistRequestCopyWith<$Res> {
  _$RenamePlaylistRequestCopyWithImpl(this._self, this._then);

  final RenamePlaylistRequest _self;
  final $Res Function(RenamePlaylistRequest) _then;

/// Create a copy of RenamePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? id = null,Object? newName = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,newName: null == newName ? _self.newName : newName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RenamePlaylistRequest].
extension RenamePlaylistRequestPatterns on RenamePlaylistRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenamePlaylistRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenamePlaylistRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenamePlaylistRequest value)  $default,){
final _that = this;
switch (_that) {
case _RenamePlaylistRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenamePlaylistRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RenamePlaylistRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String id, @JsonKey(name: 'new_name')  String newName,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenamePlaylistRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.newName,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String id, @JsonKey(name: 'new_name')  String newName,  int version)  $default,) {final _that = this;
switch (_that) {
case _RenamePlaylistRequest():
return $default(_that.api,_that.method,_that.id,_that.newName,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String id, @JsonKey(name: 'new_name')  String newName,  int version)?  $default,) {final _that = this;
switch (_that) {
case _RenamePlaylistRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.newName,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenamePlaylistRequest extends RenamePlaylistRequest {
  const _RenamePlaylistRequest({required this.api, required this.method, required this.id, @JsonKey(name: 'new_name') required this.newName, required this.version}): super._();
  factory _RenamePlaylistRequest.fromJson(Map<String, dynamic> json) => _$RenamePlaylistRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String id;
@override@JsonKey(name: 'new_name') final  String newName;
@override final  int version;

/// Create a copy of RenamePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenamePlaylistRequestCopyWith<_RenamePlaylistRequest> get copyWith => __$RenamePlaylistRequestCopyWithImpl<_RenamePlaylistRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenamePlaylistRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenamePlaylistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.newName, newName) || other.newName == newName)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,newName,version);

@override
String toString() {
  return 'RenamePlaylistRequest(api: $api, method: $method, id: $id, newName: $newName, version: $version)';
}


}

/// @nodoc
abstract mixin class _$RenamePlaylistRequestCopyWith<$Res> implements $RenamePlaylistRequestCopyWith<$Res> {
  factory _$RenamePlaylistRequestCopyWith(_RenamePlaylistRequest value, $Res Function(_RenamePlaylistRequest) _then) = __$RenamePlaylistRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String id,@JsonKey(name: 'new_name') String newName, int version
});




}
/// @nodoc
class __$RenamePlaylistRequestCopyWithImpl<$Res>
    implements _$RenamePlaylistRequestCopyWith<$Res> {
  __$RenamePlaylistRequestCopyWithImpl(this._self, this._then);

  final _RenamePlaylistRequest _self;
  final $Res Function(_RenamePlaylistRequest) _then;

/// Create a copy of RenamePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? id = null,Object? newName = null,Object? version = null,}) {
  return _then(_RenamePlaylistRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,newName: null == newName ? _self.newName : newName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RenamePlaylistData {

 String get id;
/// Create a copy of RenamePlaylistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenamePlaylistDataCopyWith<RenamePlaylistData> get copyWith => _$RenamePlaylistDataCopyWithImpl<RenamePlaylistData>(this as RenamePlaylistData, _$identity);

  /// Serializes this RenamePlaylistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenamePlaylistData&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RenamePlaylistData(id: $id)';
}


}

/// @nodoc
abstract mixin class $RenamePlaylistDataCopyWith<$Res>  {
  factory $RenamePlaylistDataCopyWith(RenamePlaylistData value, $Res Function(RenamePlaylistData) _then) = _$RenamePlaylistDataCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$RenamePlaylistDataCopyWithImpl<$Res>
    implements $RenamePlaylistDataCopyWith<$Res> {
  _$RenamePlaylistDataCopyWithImpl(this._self, this._then);

  final RenamePlaylistData _self;
  final $Res Function(RenamePlaylistData) _then;

/// Create a copy of RenamePlaylistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RenamePlaylistData].
extension RenamePlaylistDataPatterns on RenamePlaylistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenamePlaylistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenamePlaylistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenamePlaylistData value)  $default,){
final _that = this;
switch (_that) {
case _RenamePlaylistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenamePlaylistData value)?  $default,){
final _that = this;
switch (_that) {
case _RenamePlaylistData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenamePlaylistData() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _RenamePlaylistData():
return $default(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _RenamePlaylistData() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenamePlaylistData extends RenamePlaylistData {
  const _RenamePlaylistData({required this.id}): super._();
  factory _RenamePlaylistData.fromJson(Map<String, dynamic> json) => _$RenamePlaylistDataFromJson(json);

@override final  String id;

/// Create a copy of RenamePlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenamePlaylistDataCopyWith<_RenamePlaylistData> get copyWith => __$RenamePlaylistDataCopyWithImpl<_RenamePlaylistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenamePlaylistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenamePlaylistData&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'RenamePlaylistData(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RenamePlaylistDataCopyWith<$Res> implements $RenamePlaylistDataCopyWith<$Res> {
  factory _$RenamePlaylistDataCopyWith(_RenamePlaylistData value, $Res Function(_RenamePlaylistData) _then) = __$RenamePlaylistDataCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$RenamePlaylistDataCopyWithImpl<$Res>
    implements _$RenamePlaylistDataCopyWith<$Res> {
  __$RenamePlaylistDataCopyWithImpl(this._self, this._then);

  final _RenamePlaylistData _self;
  final $Res Function(_RenamePlaylistData) _then;

/// Create a copy of RenamePlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RenamePlaylistData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RenamePlaylistResponse {

 bool get success; RenamePlaylistData? get data;
/// Create a copy of RenamePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenamePlaylistResponseCopyWith<RenamePlaylistResponse> get copyWith => _$RenamePlaylistResponseCopyWithImpl<RenamePlaylistResponse>(this as RenamePlaylistResponse, _$identity);

  /// Serializes this RenamePlaylistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenamePlaylistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'RenamePlaylistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $RenamePlaylistResponseCopyWith<$Res>  {
  factory $RenamePlaylistResponseCopyWith(RenamePlaylistResponse value, $Res Function(RenamePlaylistResponse) _then) = _$RenamePlaylistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, RenamePlaylistData? data
});


$RenamePlaylistDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$RenamePlaylistResponseCopyWithImpl<$Res>
    implements $RenamePlaylistResponseCopyWith<$Res> {
  _$RenamePlaylistResponseCopyWithImpl(this._self, this._then);

  final RenamePlaylistResponse _self;
  final $Res Function(RenamePlaylistResponse) _then;

/// Create a copy of RenamePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RenamePlaylistData?,
  ));
}
/// Create a copy of RenamePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenamePlaylistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RenamePlaylistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenamePlaylistResponse].
extension RenamePlaylistResponsePatterns on RenamePlaylistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenamePlaylistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenamePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenamePlaylistResponse value)  $default,){
final _that = this;
switch (_that) {
case _RenamePlaylistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenamePlaylistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RenamePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  RenamePlaylistData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenamePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  RenamePlaylistData? data)  $default,) {final _that = this;
switch (_that) {
case _RenamePlaylistResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  RenamePlaylistData? data)?  $default,) {final _that = this;
switch (_that) {
case _RenamePlaylistResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenamePlaylistResponse extends RenamePlaylistResponse {
  const _RenamePlaylistResponse({required this.success, this.data}): super._();
  factory _RenamePlaylistResponse.fromJson(Map<String, dynamic> json) => _$RenamePlaylistResponseFromJson(json);

@override final  bool success;
@override final  RenamePlaylistData? data;

/// Create a copy of RenamePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenamePlaylistResponseCopyWith<_RenamePlaylistResponse> get copyWith => __$RenamePlaylistResponseCopyWithImpl<_RenamePlaylistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenamePlaylistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenamePlaylistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'RenamePlaylistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RenamePlaylistResponseCopyWith<$Res> implements $RenamePlaylistResponseCopyWith<$Res> {
  factory _$RenamePlaylistResponseCopyWith(_RenamePlaylistResponse value, $Res Function(_RenamePlaylistResponse) _then) = __$RenamePlaylistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, RenamePlaylistData? data
});


@override $RenamePlaylistDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$RenamePlaylistResponseCopyWithImpl<$Res>
    implements _$RenamePlaylistResponseCopyWith<$Res> {
  __$RenamePlaylistResponseCopyWithImpl(this._self, this._then);

  final _RenamePlaylistResponse _self;
  final $Res Function(_RenamePlaylistResponse) _then;

/// Create a copy of RenamePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_RenamePlaylistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RenamePlaylistData?,
  ));
}

/// Create a copy of RenamePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RenamePlaylistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RenamePlaylistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DeletePlaylistRequest {

 String get api; String get method; String get id; int get version;
/// Create a copy of DeletePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePlaylistRequestCopyWith<DeletePlaylistRequest> get copyWith => _$DeletePlaylistRequestCopyWithImpl<DeletePlaylistRequest>(this as DeletePlaylistRequest, _$identity);

  /// Serializes this DeletePlaylistRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePlaylistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,version);

@override
String toString() {
  return 'DeletePlaylistRequest(api: $api, method: $method, id: $id, version: $version)';
}


}

/// @nodoc
abstract mixin class $DeletePlaylistRequestCopyWith<$Res>  {
  factory $DeletePlaylistRequestCopyWith(DeletePlaylistRequest value, $Res Function(DeletePlaylistRequest) _then) = _$DeletePlaylistRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String id, int version
});




}
/// @nodoc
class _$DeletePlaylistRequestCopyWithImpl<$Res>
    implements $DeletePlaylistRequestCopyWith<$Res> {
  _$DeletePlaylistRequestCopyWithImpl(this._self, this._then);

  final DeletePlaylistRequest _self;
  final $Res Function(DeletePlaylistRequest) _then;

/// Create a copy of DeletePlaylistRequest
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


/// Adds pattern-matching-related methods to [DeletePlaylistRequest].
extension DeletePlaylistRequestPatterns on DeletePlaylistRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletePlaylistRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletePlaylistRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletePlaylistRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeletePlaylistRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletePlaylistRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeletePlaylistRequest() when $default != null:
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
case _DeletePlaylistRequest() when $default != null:
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
case _DeletePlaylistRequest():
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
case _DeletePlaylistRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletePlaylistRequest extends DeletePlaylistRequest {
  const _DeletePlaylistRequest({required this.api, required this.method, required this.id, required this.version}): super._();
  factory _DeletePlaylistRequest.fromJson(Map<String, dynamic> json) => _$DeletePlaylistRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String id;
@override final  int version;

/// Create a copy of DeletePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePlaylistRequestCopyWith<_DeletePlaylistRequest> get copyWith => __$DeletePlaylistRequestCopyWithImpl<_DeletePlaylistRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletePlaylistRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePlaylistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,version);

@override
String toString() {
  return 'DeletePlaylistRequest(api: $api, method: $method, id: $id, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DeletePlaylistRequestCopyWith<$Res> implements $DeletePlaylistRequestCopyWith<$Res> {
  factory _$DeletePlaylistRequestCopyWith(_DeletePlaylistRequest value, $Res Function(_DeletePlaylistRequest) _then) = __$DeletePlaylistRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String id, int version
});




}
/// @nodoc
class __$DeletePlaylistRequestCopyWithImpl<$Res>
    implements _$DeletePlaylistRequestCopyWith<$Res> {
  __$DeletePlaylistRequestCopyWithImpl(this._self, this._then);

  final _DeletePlaylistRequest _self;
  final $Res Function(_DeletePlaylistRequest) _then;

/// Create a copy of DeletePlaylistRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? id = null,Object? version = null,}) {
  return _then(_DeletePlaylistRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DeletePlaylistData {

 List<dynamic>? get errors;
/// Create a copy of DeletePlaylistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePlaylistDataCopyWith<DeletePlaylistData> get copyWith => _$DeletePlaylistDataCopyWithImpl<DeletePlaylistData>(this as DeletePlaylistData, _$identity);

  /// Serializes this DeletePlaylistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePlaylistData&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'DeletePlaylistData(errors: $errors)';
}


}

/// @nodoc
abstract mixin class $DeletePlaylistDataCopyWith<$Res>  {
  factory $DeletePlaylistDataCopyWith(DeletePlaylistData value, $Res Function(DeletePlaylistData) _then) = _$DeletePlaylistDataCopyWithImpl;
@useResult
$Res call({
 List<dynamic>? errors
});




}
/// @nodoc
class _$DeletePlaylistDataCopyWithImpl<$Res>
    implements $DeletePlaylistDataCopyWith<$Res> {
  _$DeletePlaylistDataCopyWithImpl(this._self, this._then);

  final DeletePlaylistData _self;
  final $Res Function(DeletePlaylistData) _then;

/// Create a copy of DeletePlaylistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errors = freezed,}) {
  return _then(_self.copyWith(
errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeletePlaylistData].
extension DeletePlaylistDataPatterns on DeletePlaylistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletePlaylistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletePlaylistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletePlaylistData value)  $default,){
final _that = this;
switch (_that) {
case _DeletePlaylistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletePlaylistData value)?  $default,){
final _that = this;
switch (_that) {
case _DeletePlaylistData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<dynamic>? errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletePlaylistData() when $default != null:
return $default(_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<dynamic>? errors)  $default,) {final _that = this;
switch (_that) {
case _DeletePlaylistData():
return $default(_that.errors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<dynamic>? errors)?  $default,) {final _that = this;
switch (_that) {
case _DeletePlaylistData() when $default != null:
return $default(_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletePlaylistData extends DeletePlaylistData {
  const _DeletePlaylistData({final  List<dynamic>? errors}): _errors = errors,super._();
  factory _DeletePlaylistData.fromJson(Map<String, dynamic> json) => _$DeletePlaylistDataFromJson(json);

 final  List<dynamic>? _errors;
@override List<dynamic>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DeletePlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePlaylistDataCopyWith<_DeletePlaylistData> get copyWith => __$DeletePlaylistDataCopyWithImpl<_DeletePlaylistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletePlaylistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePlaylistData&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'DeletePlaylistData(errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$DeletePlaylistDataCopyWith<$Res> implements $DeletePlaylistDataCopyWith<$Res> {
  factory _$DeletePlaylistDataCopyWith(_DeletePlaylistData value, $Res Function(_DeletePlaylistData) _then) = __$DeletePlaylistDataCopyWithImpl;
@override @useResult
$Res call({
 List<dynamic>? errors
});




}
/// @nodoc
class __$DeletePlaylistDataCopyWithImpl<$Res>
    implements _$DeletePlaylistDataCopyWith<$Res> {
  __$DeletePlaylistDataCopyWithImpl(this._self, this._then);

  final _DeletePlaylistData _self;
  final $Res Function(_DeletePlaylistData) _then;

/// Create a copy of DeletePlaylistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errors = freezed,}) {
  return _then(_DeletePlaylistData(
errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}


/// @nodoc
mixin _$DeletePlaylistResponse {

 bool get success; DeletePlaylistData? get data;
/// Create a copy of DeletePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePlaylistResponseCopyWith<DeletePlaylistResponse> get copyWith => _$DeletePlaylistResponseCopyWithImpl<DeletePlaylistResponse>(this as DeletePlaylistResponse, _$identity);

  /// Serializes this DeletePlaylistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePlaylistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'DeletePlaylistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $DeletePlaylistResponseCopyWith<$Res>  {
  factory $DeletePlaylistResponseCopyWith(DeletePlaylistResponse value, $Res Function(DeletePlaylistResponse) _then) = _$DeletePlaylistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, DeletePlaylistData? data
});


$DeletePlaylistDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$DeletePlaylistResponseCopyWithImpl<$Res>
    implements $DeletePlaylistResponseCopyWith<$Res> {
  _$DeletePlaylistResponseCopyWithImpl(this._self, this._then);

  final DeletePlaylistResponse _self;
  final $Res Function(DeletePlaylistResponse) _then;

/// Create a copy of DeletePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DeletePlaylistData?,
  ));
}
/// Create a copy of DeletePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeletePlaylistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DeletePlaylistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeletePlaylistResponse].
extension DeletePlaylistResponsePatterns on DeletePlaylistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeletePlaylistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeletePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeletePlaylistResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeletePlaylistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeletePlaylistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeletePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  DeletePlaylistData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeletePlaylistResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  DeletePlaylistData? data)  $default,) {final _that = this;
switch (_that) {
case _DeletePlaylistResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  DeletePlaylistData? data)?  $default,) {final _that = this;
switch (_that) {
case _DeletePlaylistResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeletePlaylistResponse extends DeletePlaylistResponse {
  const _DeletePlaylistResponse({required this.success, this.data}): super._();
  factory _DeletePlaylistResponse.fromJson(Map<String, dynamic> json) => _$DeletePlaylistResponseFromJson(json);

@override final  bool success;
@override final  DeletePlaylistData? data;

/// Create a copy of DeletePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePlaylistResponseCopyWith<_DeletePlaylistResponse> get copyWith => __$DeletePlaylistResponseCopyWithImpl<_DeletePlaylistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeletePlaylistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePlaylistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'DeletePlaylistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DeletePlaylistResponseCopyWith<$Res> implements $DeletePlaylistResponseCopyWith<$Res> {
  factory _$DeletePlaylistResponseCopyWith(_DeletePlaylistResponse value, $Res Function(_DeletePlaylistResponse) _then) = __$DeletePlaylistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, DeletePlaylistData? data
});


@override $DeletePlaylistDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$DeletePlaylistResponseCopyWithImpl<$Res>
    implements _$DeletePlaylistResponseCopyWith<$Res> {
  __$DeletePlaylistResponseCopyWithImpl(this._self, this._then);

  final _DeletePlaylistResponse _self;
  final $Res Function(_DeletePlaylistResponse) _then;

/// Create a copy of DeletePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_DeletePlaylistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DeletePlaylistData?,
  ));
}

/// Create a copy of DeletePlaylistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeletePlaylistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DeletePlaylistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AddPlaylistSongsRequest {

 String get api; String get method; int get offset; int get limit; String get id; String get songs; int get version;@JsonKey(name: 'skip_duplicate') bool? get skipDuplicate;
/// Create a copy of AddPlaylistSongsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPlaylistSongsRequestCopyWith<AddPlaylistSongsRequest> get copyWith => _$AddPlaylistSongsRequestCopyWithImpl<AddPlaylistSongsRequest>(this as AddPlaylistSongsRequest, _$identity);

  /// Serializes this AddPlaylistSongsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPlaylistSongsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.id, id) || other.id == id)&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.version, version) || other.version == version)&&(identical(other.skipDuplicate, skipDuplicate) || other.skipDuplicate == skipDuplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,offset,limit,id,songs,version,skipDuplicate);

@override
String toString() {
  return 'AddPlaylistSongsRequest(api: $api, method: $method, offset: $offset, limit: $limit, id: $id, songs: $songs, version: $version, skipDuplicate: $skipDuplicate)';
}


}

/// @nodoc
abstract mixin class $AddPlaylistSongsRequestCopyWith<$Res>  {
  factory $AddPlaylistSongsRequestCopyWith(AddPlaylistSongsRequest value, $Res Function(AddPlaylistSongsRequest) _then) = _$AddPlaylistSongsRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, int offset, int limit, String id, String songs, int version,@JsonKey(name: 'skip_duplicate') bool? skipDuplicate
});




}
/// @nodoc
class _$AddPlaylistSongsRequestCopyWithImpl<$Res>
    implements $AddPlaylistSongsRequestCopyWith<$Res> {
  _$AddPlaylistSongsRequestCopyWithImpl(this._self, this._then);

  final AddPlaylistSongsRequest _self;
  final $Res Function(AddPlaylistSongsRequest) _then;

/// Create a copy of AddPlaylistSongsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? offset = null,Object? limit = null,Object? id = null,Object? songs = null,Object? version = null,Object? skipDuplicate = freezed,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,skipDuplicate: freezed == skipDuplicate ? _self.skipDuplicate : skipDuplicate // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddPlaylistSongsRequest].
extension AddPlaylistSongsRequestPatterns on AddPlaylistSongsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddPlaylistSongsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddPlaylistSongsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddPlaylistSongsRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddPlaylistSongsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddPlaylistSongsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddPlaylistSongsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  int offset,  int limit,  String id,  String songs,  int version, @JsonKey(name: 'skip_duplicate')  bool? skipDuplicate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddPlaylistSongsRequest() when $default != null:
return $default(_that.api,_that.method,_that.offset,_that.limit,_that.id,_that.songs,_that.version,_that.skipDuplicate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  int offset,  int limit,  String id,  String songs,  int version, @JsonKey(name: 'skip_duplicate')  bool? skipDuplicate)  $default,) {final _that = this;
switch (_that) {
case _AddPlaylistSongsRequest():
return $default(_that.api,_that.method,_that.offset,_that.limit,_that.id,_that.songs,_that.version,_that.skipDuplicate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  int offset,  int limit,  String id,  String songs,  int version, @JsonKey(name: 'skip_duplicate')  bool? skipDuplicate)?  $default,) {final _that = this;
switch (_that) {
case _AddPlaylistSongsRequest() when $default != null:
return $default(_that.api,_that.method,_that.offset,_that.limit,_that.id,_that.songs,_that.version,_that.skipDuplicate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddPlaylistSongsRequest extends AddPlaylistSongsRequest {
  const _AddPlaylistSongsRequest({required this.api, required this.method, required this.offset, required this.limit, required this.id, required this.songs, required this.version, @JsonKey(name: 'skip_duplicate') this.skipDuplicate}): super._();
  factory _AddPlaylistSongsRequest.fromJson(Map<String, dynamic> json) => _$AddPlaylistSongsRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  int offset;
@override final  int limit;
@override final  String id;
@override final  String songs;
@override final  int version;
@override@JsonKey(name: 'skip_duplicate') final  bool? skipDuplicate;

/// Create a copy of AddPlaylistSongsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPlaylistSongsRequestCopyWith<_AddPlaylistSongsRequest> get copyWith => __$AddPlaylistSongsRequestCopyWithImpl<_AddPlaylistSongsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddPlaylistSongsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPlaylistSongsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.id, id) || other.id == id)&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.version, version) || other.version == version)&&(identical(other.skipDuplicate, skipDuplicate) || other.skipDuplicate == skipDuplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,offset,limit,id,songs,version,skipDuplicate);

@override
String toString() {
  return 'AddPlaylistSongsRequest(api: $api, method: $method, offset: $offset, limit: $limit, id: $id, songs: $songs, version: $version, skipDuplicate: $skipDuplicate)';
}


}

/// @nodoc
abstract mixin class _$AddPlaylistSongsRequestCopyWith<$Res> implements $AddPlaylistSongsRequestCopyWith<$Res> {
  factory _$AddPlaylistSongsRequestCopyWith(_AddPlaylistSongsRequest value, $Res Function(_AddPlaylistSongsRequest) _then) = __$AddPlaylistSongsRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, int offset, int limit, String id, String songs, int version,@JsonKey(name: 'skip_duplicate') bool? skipDuplicate
});




}
/// @nodoc
class __$AddPlaylistSongsRequestCopyWithImpl<$Res>
    implements _$AddPlaylistSongsRequestCopyWith<$Res> {
  __$AddPlaylistSongsRequestCopyWithImpl(this._self, this._then);

  final _AddPlaylistSongsRequest _self;
  final $Res Function(_AddPlaylistSongsRequest) _then;

/// Create a copy of AddPlaylistSongsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? offset = null,Object? limit = null,Object? id = null,Object? songs = null,Object? version = null,Object? skipDuplicate = freezed,}) {
  return _then(_AddPlaylistSongsRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,skipDuplicate: freezed == skipDuplicate ? _self.skipDuplicate : skipDuplicate // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$AddPlaylistSongsResponse {

 bool get success;
/// Create a copy of AddPlaylistSongsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPlaylistSongsResponseCopyWith<AddPlaylistSongsResponse> get copyWith => _$AddPlaylistSongsResponseCopyWithImpl<AddPlaylistSongsResponse>(this as AddPlaylistSongsResponse, _$identity);

  /// Serializes this AddPlaylistSongsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPlaylistSongsResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'AddPlaylistSongsResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $AddPlaylistSongsResponseCopyWith<$Res>  {
  factory $AddPlaylistSongsResponseCopyWith(AddPlaylistSongsResponse value, $Res Function(AddPlaylistSongsResponse) _then) = _$AddPlaylistSongsResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$AddPlaylistSongsResponseCopyWithImpl<$Res>
    implements $AddPlaylistSongsResponseCopyWith<$Res> {
  _$AddPlaylistSongsResponseCopyWithImpl(this._self, this._then);

  final AddPlaylistSongsResponse _self;
  final $Res Function(AddPlaylistSongsResponse) _then;

/// Create a copy of AddPlaylistSongsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddPlaylistSongsResponse].
extension AddPlaylistSongsResponsePatterns on AddPlaylistSongsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddPlaylistSongsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddPlaylistSongsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddPlaylistSongsResponse value)  $default,){
final _that = this;
switch (_that) {
case _AddPlaylistSongsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddPlaylistSongsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AddPlaylistSongsResponse() when $default != null:
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
case _AddPlaylistSongsResponse() when $default != null:
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
case _AddPlaylistSongsResponse():
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
case _AddPlaylistSongsResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddPlaylistSongsResponse extends AddPlaylistSongsResponse {
  const _AddPlaylistSongsResponse({required this.success}): super._();
  factory _AddPlaylistSongsResponse.fromJson(Map<String, dynamic> json) => _$AddPlaylistSongsResponseFromJson(json);

@override final  bool success;

/// Create a copy of AddPlaylistSongsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPlaylistSongsResponseCopyWith<_AddPlaylistSongsResponse> get copyWith => __$AddPlaylistSongsResponseCopyWithImpl<_AddPlaylistSongsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddPlaylistSongsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPlaylistSongsResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'AddPlaylistSongsResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$AddPlaylistSongsResponseCopyWith<$Res> implements $AddPlaylistSongsResponseCopyWith<$Res> {
  factory _$AddPlaylistSongsResponseCopyWith(_AddPlaylistSongsResponse value, $Res Function(_AddPlaylistSongsResponse) _then) = __$AddPlaylistSongsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$AddPlaylistSongsResponseCopyWithImpl<$Res>
    implements _$AddPlaylistSongsResponseCopyWith<$Res> {
  __$AddPlaylistSongsResponseCopyWithImpl(this._self, this._then);

  final _AddPlaylistSongsResponse _self;
  final $Res Function(_AddPlaylistSongsResponse) _then;

/// Create a copy of AddPlaylistSongsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_AddPlaylistSongsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RemoveMissingSongsRequest {

 String get api; String get method; String get id; int get version;
/// Create a copy of RemoveMissingSongsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveMissingSongsRequestCopyWith<RemoveMissingSongsRequest> get copyWith => _$RemoveMissingSongsRequestCopyWithImpl<RemoveMissingSongsRequest>(this as RemoveMissingSongsRequest, _$identity);

  /// Serializes this RemoveMissingSongsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveMissingSongsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,version);

@override
String toString() {
  return 'RemoveMissingSongsRequest(api: $api, method: $method, id: $id, version: $version)';
}


}

/// @nodoc
abstract mixin class $RemoveMissingSongsRequestCopyWith<$Res>  {
  factory $RemoveMissingSongsRequestCopyWith(RemoveMissingSongsRequest value, $Res Function(RemoveMissingSongsRequest) _then) = _$RemoveMissingSongsRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String id, int version
});




}
/// @nodoc
class _$RemoveMissingSongsRequestCopyWithImpl<$Res>
    implements $RemoveMissingSongsRequestCopyWith<$Res> {
  _$RemoveMissingSongsRequestCopyWithImpl(this._self, this._then);

  final RemoveMissingSongsRequest _self;
  final $Res Function(RemoveMissingSongsRequest) _then;

/// Create a copy of RemoveMissingSongsRequest
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


/// Adds pattern-matching-related methods to [RemoveMissingSongsRequest].
extension RemoveMissingSongsRequestPatterns on RemoveMissingSongsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoveMissingSongsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoveMissingSongsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoveMissingSongsRequest value)  $default,){
final _that = this;
switch (_that) {
case _RemoveMissingSongsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoveMissingSongsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RemoveMissingSongsRequest() when $default != null:
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
case _RemoveMissingSongsRequest() when $default != null:
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
case _RemoveMissingSongsRequest():
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
case _RemoveMissingSongsRequest() when $default != null:
return $default(_that.api,_that.method,_that.id,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoveMissingSongsRequest extends RemoveMissingSongsRequest {
  const _RemoveMissingSongsRequest({required this.api, required this.method, required this.id, required this.version}): super._();
  factory _RemoveMissingSongsRequest.fromJson(Map<String, dynamic> json) => _$RemoveMissingSongsRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String id;
@override final  int version;

/// Create a copy of RemoveMissingSongsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveMissingSongsRequestCopyWith<_RemoveMissingSongsRequest> get copyWith => __$RemoveMissingSongsRequestCopyWithImpl<_RemoveMissingSongsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoveMissingSongsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveMissingSongsRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,id,version);

@override
String toString() {
  return 'RemoveMissingSongsRequest(api: $api, method: $method, id: $id, version: $version)';
}


}

/// @nodoc
abstract mixin class _$RemoveMissingSongsRequestCopyWith<$Res> implements $RemoveMissingSongsRequestCopyWith<$Res> {
  factory _$RemoveMissingSongsRequestCopyWith(_RemoveMissingSongsRequest value, $Res Function(_RemoveMissingSongsRequest) _then) = __$RemoveMissingSongsRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String id, int version
});




}
/// @nodoc
class __$RemoveMissingSongsRequestCopyWithImpl<$Res>
    implements _$RemoveMissingSongsRequestCopyWith<$Res> {
  __$RemoveMissingSongsRequestCopyWithImpl(this._self, this._then);

  final _RemoveMissingSongsRequest _self;
  final $Res Function(_RemoveMissingSongsRequest) _then;

/// Create a copy of RemoveMissingSongsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? id = null,Object? version = null,}) {
  return _then(_RemoveMissingSongsRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RemoveMissingSongsResponse {

 bool get success;
/// Create a copy of RemoveMissingSongsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveMissingSongsResponseCopyWith<RemoveMissingSongsResponse> get copyWith => _$RemoveMissingSongsResponseCopyWithImpl<RemoveMissingSongsResponse>(this as RemoveMissingSongsResponse, _$identity);

  /// Serializes this RemoveMissingSongsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveMissingSongsResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'RemoveMissingSongsResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $RemoveMissingSongsResponseCopyWith<$Res>  {
  factory $RemoveMissingSongsResponseCopyWith(RemoveMissingSongsResponse value, $Res Function(RemoveMissingSongsResponse) _then) = _$RemoveMissingSongsResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$RemoveMissingSongsResponseCopyWithImpl<$Res>
    implements $RemoveMissingSongsResponseCopyWith<$Res> {
  _$RemoveMissingSongsResponseCopyWithImpl(this._self, this._then);

  final RemoveMissingSongsResponse _self;
  final $Res Function(RemoveMissingSongsResponse) _then;

/// Create a copy of RemoveMissingSongsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoveMissingSongsResponse].
extension RemoveMissingSongsResponsePatterns on RemoveMissingSongsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoveMissingSongsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoveMissingSongsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoveMissingSongsResponse value)  $default,){
final _that = this;
switch (_that) {
case _RemoveMissingSongsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoveMissingSongsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RemoveMissingSongsResponse() when $default != null:
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
case _RemoveMissingSongsResponse() when $default != null:
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
case _RemoveMissingSongsResponse():
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
case _RemoveMissingSongsResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoveMissingSongsResponse extends RemoveMissingSongsResponse {
  const _RemoveMissingSongsResponse({required this.success}): super._();
  factory _RemoveMissingSongsResponse.fromJson(Map<String, dynamic> json) => _$RemoveMissingSongsResponseFromJson(json);

@override final  bool success;

/// Create a copy of RemoveMissingSongsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveMissingSongsResponseCopyWith<_RemoveMissingSongsResponse> get copyWith => __$RemoveMissingSongsResponseCopyWithImpl<_RemoveMissingSongsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoveMissingSongsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveMissingSongsResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'RemoveMissingSongsResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$RemoveMissingSongsResponseCopyWith<$Res> implements $RemoveMissingSongsResponseCopyWith<$Res> {
  factory _$RemoveMissingSongsResponseCopyWith(_RemoveMissingSongsResponse value, $Res Function(_RemoveMissingSongsResponse) _then) = __$RemoveMissingSongsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$RemoveMissingSongsResponseCopyWithImpl<$Res>
    implements _$RemoveMissingSongsResponseCopyWith<$Res> {
  __$RemoveMissingSongsResponseCopyWithImpl(this._self, this._then);

  final _RemoveMissingSongsResponse _self;
  final $Res Function(_RemoveMissingSongsResponse) _then;

/// Create a copy of RemoveMissingSongsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_RemoveMissingSongsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
