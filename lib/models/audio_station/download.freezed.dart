// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchDownloadRequest {

 String get api; String get method; String get version; String get songs; String get library; String get filename;
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
 String api, String method, String version, String songs, String library, String filename
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
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? songs = null,Object? library = null,Object? filename = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String songs,  String library,  String filename)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String songs,  String library,  String filename)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  String songs,  String library,  String filename)?  $default,) {final _that = this;
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
  const _BatchDownloadRequest({required this.api, required this.method, required this.version, required this.songs, required this.library, required this.filename}): super._();
  factory _BatchDownloadRequest.fromJson(Map<String, dynamic> json) => _$BatchDownloadRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  String songs;
@override final  String library;
@override final  String filename;

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
 String api, String method, String version, String songs, String library, String filename
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
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? songs = null,Object? library = null,Object? filename = null,}) {
  return _then(_BatchDownloadRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
