// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syno_api_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SynoAPIInfo {

 int get maxVersion; int get minVersion; String get path; String? get requestFormat;
/// Create a copy of SynoAPIInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynoAPIInfoCopyWith<SynoAPIInfo> get copyWith => _$SynoAPIInfoCopyWithImpl<SynoAPIInfo>(this as SynoAPIInfo, _$identity);

  /// Serializes this SynoAPIInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynoAPIInfo&&(identical(other.maxVersion, maxVersion) || other.maxVersion == maxVersion)&&(identical(other.minVersion, minVersion) || other.minVersion == minVersion)&&(identical(other.path, path) || other.path == path)&&(identical(other.requestFormat, requestFormat) || other.requestFormat == requestFormat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxVersion,minVersion,path,requestFormat);

@override
String toString() {
  return 'SynoAPIInfo(maxVersion: $maxVersion, minVersion: $minVersion, path: $path, requestFormat: $requestFormat)';
}


}

/// @nodoc
abstract mixin class $SynoAPIInfoCopyWith<$Res>  {
  factory $SynoAPIInfoCopyWith(SynoAPIInfo value, $Res Function(SynoAPIInfo) _then) = _$SynoAPIInfoCopyWithImpl;
@useResult
$Res call({
 int maxVersion, int minVersion, String path, String? requestFormat
});




}
/// @nodoc
class _$SynoAPIInfoCopyWithImpl<$Res>
    implements $SynoAPIInfoCopyWith<$Res> {
  _$SynoAPIInfoCopyWithImpl(this._self, this._then);

  final SynoAPIInfo _self;
  final $Res Function(SynoAPIInfo) _then;

/// Create a copy of SynoAPIInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxVersion = null,Object? minVersion = null,Object? path = null,Object? requestFormat = freezed,}) {
  return _then(_self.copyWith(
maxVersion: null == maxVersion ? _self.maxVersion : maxVersion // ignore: cast_nullable_to_non_nullable
as int,minVersion: null == minVersion ? _self.minVersion : minVersion // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,requestFormat: freezed == requestFormat ? _self.requestFormat : requestFormat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SynoAPIInfo].
extension SynoAPIInfoPatterns on SynoAPIInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SynoAPIInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SynoAPIInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SynoAPIInfo value)  $default,){
final _that = this;
switch (_that) {
case _SynoAPIInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SynoAPIInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SynoAPIInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxVersion,  int minVersion,  String path,  String? requestFormat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SynoAPIInfo() when $default != null:
return $default(_that.maxVersion,_that.minVersion,_that.path,_that.requestFormat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxVersion,  int minVersion,  String path,  String? requestFormat)  $default,) {final _that = this;
switch (_that) {
case _SynoAPIInfo():
return $default(_that.maxVersion,_that.minVersion,_that.path,_that.requestFormat);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxVersion,  int minVersion,  String path,  String? requestFormat)?  $default,) {final _that = this;
switch (_that) {
case _SynoAPIInfo() when $default != null:
return $default(_that.maxVersion,_that.minVersion,_that.path,_that.requestFormat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SynoAPIInfo extends SynoAPIInfo {
  const _SynoAPIInfo({required this.maxVersion, required this.minVersion, required this.path, this.requestFormat}): super._();
  factory _SynoAPIInfo.fromJson(Map<String, dynamic> json) => _$SynoAPIInfoFromJson(json);

@override final  int maxVersion;
@override final  int minVersion;
@override final  String path;
@override final  String? requestFormat;

/// Create a copy of SynoAPIInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SynoAPIInfoCopyWith<_SynoAPIInfo> get copyWith => __$SynoAPIInfoCopyWithImpl<_SynoAPIInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SynoAPIInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SynoAPIInfo&&(identical(other.maxVersion, maxVersion) || other.maxVersion == maxVersion)&&(identical(other.minVersion, minVersion) || other.minVersion == minVersion)&&(identical(other.path, path) || other.path == path)&&(identical(other.requestFormat, requestFormat) || other.requestFormat == requestFormat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxVersion,minVersion,path,requestFormat);

@override
String toString() {
  return 'SynoAPIInfo(maxVersion: $maxVersion, minVersion: $minVersion, path: $path, requestFormat: $requestFormat)';
}


}

/// @nodoc
abstract mixin class _$SynoAPIInfoCopyWith<$Res> implements $SynoAPIInfoCopyWith<$Res> {
  factory _$SynoAPIInfoCopyWith(_SynoAPIInfo value, $Res Function(_SynoAPIInfo) _then) = __$SynoAPIInfoCopyWithImpl;
@override @useResult
$Res call({
 int maxVersion, int minVersion, String path, String? requestFormat
});




}
/// @nodoc
class __$SynoAPIInfoCopyWithImpl<$Res>
    implements _$SynoAPIInfoCopyWith<$Res> {
  __$SynoAPIInfoCopyWithImpl(this._self, this._then);

  final _SynoAPIInfo _self;
  final $Res Function(_SynoAPIInfo) _then;

/// Create a copy of SynoAPIInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxVersion = null,Object? minVersion = null,Object? path = null,Object? requestFormat = freezed,}) {
  return _then(_SynoAPIInfo(
maxVersion: null == maxVersion ? _self.maxVersion : maxVersion // ignore: cast_nullable_to_non_nullable
as int,minVersion: null == minVersion ? _self.minVersion : minVersion // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,requestFormat: freezed == requestFormat ? _self.requestFormat : requestFormat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SynoAPIInfoResponse {

 bool get success; Map<String, SynoAPIInfo>? get data;
/// Create a copy of SynoAPIInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynoAPIInfoResponseCopyWith<SynoAPIInfoResponse> get copyWith => _$SynoAPIInfoResponseCopyWithImpl<SynoAPIInfoResponse>(this as SynoAPIInfoResponse, _$identity);

  /// Serializes this SynoAPIInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynoAPIInfoResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SynoAPIInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SynoAPIInfoResponseCopyWith<$Res>  {
  factory $SynoAPIInfoResponseCopyWith(SynoAPIInfoResponse value, $Res Function(SynoAPIInfoResponse) _then) = _$SynoAPIInfoResponseCopyWithImpl;
@useResult
$Res call({
 bool success, Map<String, SynoAPIInfo>? data
});




}
/// @nodoc
class _$SynoAPIInfoResponseCopyWithImpl<$Res>
    implements $SynoAPIInfoResponseCopyWith<$Res> {
  _$SynoAPIInfoResponseCopyWithImpl(this._self, this._then);

  final SynoAPIInfoResponse _self;
  final $Res Function(SynoAPIInfoResponse) _then;

/// Create a copy of SynoAPIInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, SynoAPIInfo>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SynoAPIInfoResponse].
extension SynoAPIInfoResponsePatterns on SynoAPIInfoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SynoAPIInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SynoAPIInfoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SynoAPIInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _SynoAPIInfoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SynoAPIInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SynoAPIInfoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  Map<String, SynoAPIInfo>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SynoAPIInfoResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  Map<String, SynoAPIInfo>? data)  $default,) {final _that = this;
switch (_that) {
case _SynoAPIInfoResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  Map<String, SynoAPIInfo>? data)?  $default,) {final _that = this;
switch (_that) {
case _SynoAPIInfoResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SynoAPIInfoResponse extends SynoAPIInfoResponse {
  const _SynoAPIInfoResponse({required this.success, final  Map<String, SynoAPIInfo>? data}): _data = data,super._();
  factory _SynoAPIInfoResponse.fromJson(Map<String, dynamic> json) => _$SynoAPIInfoResponseFromJson(json);

@override final  bool success;
 final  Map<String, SynoAPIInfo>? _data;
@override Map<String, SynoAPIInfo>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SynoAPIInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SynoAPIInfoResponseCopyWith<_SynoAPIInfoResponse> get copyWith => __$SynoAPIInfoResponseCopyWithImpl<_SynoAPIInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SynoAPIInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SynoAPIInfoResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SynoAPIInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SynoAPIInfoResponseCopyWith<$Res> implements $SynoAPIInfoResponseCopyWith<$Res> {
  factory _$SynoAPIInfoResponseCopyWith(_SynoAPIInfoResponse value, $Res Function(_SynoAPIInfoResponse) _then) = __$SynoAPIInfoResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, Map<String, SynoAPIInfo>? data
});




}
/// @nodoc
class __$SynoAPIInfoResponseCopyWithImpl<$Res>
    implements _$SynoAPIInfoResponseCopyWith<$Res> {
  __$SynoAPIInfoResponseCopyWithImpl(this._self, this._then);

  final _SynoAPIInfoResponse _self;
  final $Res Function(_SynoAPIInfoResponse) _then;

/// Create a copy of SynoAPIInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_SynoAPIInfoResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, SynoAPIInfo>?,
  ));
}


}


/// @nodoc
mixin _$AmeStatus {

@JsonKey(name: 'ame_major_version') int get ameMajorVersion;@JsonKey(name: 'has_aac') bool get hasAac;@JsonKey(name: 'has_license') bool get hasLicense;@JsonKey(name: 'is_aac_activated') bool get isAacActivated;@JsonKey(name: 'is_ame_broken') bool get isAmeBroken;@JsonKey(name: 'is_ame_install') bool get isAmeInstall;@JsonKey(name: 'need_aac_transcoding') bool get needAacTranscoding;
/// Create a copy of AmeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmeStatusCopyWith<AmeStatus> get copyWith => _$AmeStatusCopyWithImpl<AmeStatus>(this as AmeStatus, _$identity);

  /// Serializes this AmeStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmeStatus&&(identical(other.ameMajorVersion, ameMajorVersion) || other.ameMajorVersion == ameMajorVersion)&&(identical(other.hasAac, hasAac) || other.hasAac == hasAac)&&(identical(other.hasLicense, hasLicense) || other.hasLicense == hasLicense)&&(identical(other.isAacActivated, isAacActivated) || other.isAacActivated == isAacActivated)&&(identical(other.isAmeBroken, isAmeBroken) || other.isAmeBroken == isAmeBroken)&&(identical(other.isAmeInstall, isAmeInstall) || other.isAmeInstall == isAmeInstall)&&(identical(other.needAacTranscoding, needAacTranscoding) || other.needAacTranscoding == needAacTranscoding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ameMajorVersion,hasAac,hasLicense,isAacActivated,isAmeBroken,isAmeInstall,needAacTranscoding);

@override
String toString() {
  return 'AmeStatus(ameMajorVersion: $ameMajorVersion, hasAac: $hasAac, hasLicense: $hasLicense, isAacActivated: $isAacActivated, isAmeBroken: $isAmeBroken, isAmeInstall: $isAmeInstall, needAacTranscoding: $needAacTranscoding)';
}


}

/// @nodoc
abstract mixin class $AmeStatusCopyWith<$Res>  {
  factory $AmeStatusCopyWith(AmeStatus value, $Res Function(AmeStatus) _then) = _$AmeStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ame_major_version') int ameMajorVersion,@JsonKey(name: 'has_aac') bool hasAac,@JsonKey(name: 'has_license') bool hasLicense,@JsonKey(name: 'is_aac_activated') bool isAacActivated,@JsonKey(name: 'is_ame_broken') bool isAmeBroken,@JsonKey(name: 'is_ame_install') bool isAmeInstall,@JsonKey(name: 'need_aac_transcoding') bool needAacTranscoding
});




}
/// @nodoc
class _$AmeStatusCopyWithImpl<$Res>
    implements $AmeStatusCopyWith<$Res> {
  _$AmeStatusCopyWithImpl(this._self, this._then);

  final AmeStatus _self;
  final $Res Function(AmeStatus) _then;

/// Create a copy of AmeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ameMajorVersion = null,Object? hasAac = null,Object? hasLicense = null,Object? isAacActivated = null,Object? isAmeBroken = null,Object? isAmeInstall = null,Object? needAacTranscoding = null,}) {
  return _then(_self.copyWith(
ameMajorVersion: null == ameMajorVersion ? _self.ameMajorVersion : ameMajorVersion // ignore: cast_nullable_to_non_nullable
as int,hasAac: null == hasAac ? _self.hasAac : hasAac // ignore: cast_nullable_to_non_nullable
as bool,hasLicense: null == hasLicense ? _self.hasLicense : hasLicense // ignore: cast_nullable_to_non_nullable
as bool,isAacActivated: null == isAacActivated ? _self.isAacActivated : isAacActivated // ignore: cast_nullable_to_non_nullable
as bool,isAmeBroken: null == isAmeBroken ? _self.isAmeBroken : isAmeBroken // ignore: cast_nullable_to_non_nullable
as bool,isAmeInstall: null == isAmeInstall ? _self.isAmeInstall : isAmeInstall // ignore: cast_nullable_to_non_nullable
as bool,needAacTranscoding: null == needAacTranscoding ? _self.needAacTranscoding : needAacTranscoding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AmeStatus].
extension AmeStatusPatterns on AmeStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmeStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmeStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmeStatus value)  $default,){
final _that = this;
switch (_that) {
case _AmeStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmeStatus value)?  $default,){
final _that = this;
switch (_that) {
case _AmeStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ame_major_version')  int ameMajorVersion, @JsonKey(name: 'has_aac')  bool hasAac, @JsonKey(name: 'has_license')  bool hasLicense, @JsonKey(name: 'is_aac_activated')  bool isAacActivated, @JsonKey(name: 'is_ame_broken')  bool isAmeBroken, @JsonKey(name: 'is_ame_install')  bool isAmeInstall, @JsonKey(name: 'need_aac_transcoding')  bool needAacTranscoding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmeStatus() when $default != null:
return $default(_that.ameMajorVersion,_that.hasAac,_that.hasLicense,_that.isAacActivated,_that.isAmeBroken,_that.isAmeInstall,_that.needAacTranscoding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ame_major_version')  int ameMajorVersion, @JsonKey(name: 'has_aac')  bool hasAac, @JsonKey(name: 'has_license')  bool hasLicense, @JsonKey(name: 'is_aac_activated')  bool isAacActivated, @JsonKey(name: 'is_ame_broken')  bool isAmeBroken, @JsonKey(name: 'is_ame_install')  bool isAmeInstall, @JsonKey(name: 'need_aac_transcoding')  bool needAacTranscoding)  $default,) {final _that = this;
switch (_that) {
case _AmeStatus():
return $default(_that.ameMajorVersion,_that.hasAac,_that.hasLicense,_that.isAacActivated,_that.isAmeBroken,_that.isAmeInstall,_that.needAacTranscoding);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ame_major_version')  int ameMajorVersion, @JsonKey(name: 'has_aac')  bool hasAac, @JsonKey(name: 'has_license')  bool hasLicense, @JsonKey(name: 'is_aac_activated')  bool isAacActivated, @JsonKey(name: 'is_ame_broken')  bool isAmeBroken, @JsonKey(name: 'is_ame_install')  bool isAmeInstall, @JsonKey(name: 'need_aac_transcoding')  bool needAacTranscoding)?  $default,) {final _that = this;
switch (_that) {
case _AmeStatus() when $default != null:
return $default(_that.ameMajorVersion,_that.hasAac,_that.hasLicense,_that.isAacActivated,_that.isAmeBroken,_that.isAmeInstall,_that.needAacTranscoding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmeStatus extends AmeStatus {
  const _AmeStatus({@JsonKey(name: 'ame_major_version') required this.ameMajorVersion, @JsonKey(name: 'has_aac') required this.hasAac, @JsonKey(name: 'has_license') required this.hasLicense, @JsonKey(name: 'is_aac_activated') required this.isAacActivated, @JsonKey(name: 'is_ame_broken') required this.isAmeBroken, @JsonKey(name: 'is_ame_install') required this.isAmeInstall, @JsonKey(name: 'need_aac_transcoding') required this.needAacTranscoding}): super._();
  factory _AmeStatus.fromJson(Map<String, dynamic> json) => _$AmeStatusFromJson(json);

@override@JsonKey(name: 'ame_major_version') final  int ameMajorVersion;
@override@JsonKey(name: 'has_aac') final  bool hasAac;
@override@JsonKey(name: 'has_license') final  bool hasLicense;
@override@JsonKey(name: 'is_aac_activated') final  bool isAacActivated;
@override@JsonKey(name: 'is_ame_broken') final  bool isAmeBroken;
@override@JsonKey(name: 'is_ame_install') final  bool isAmeInstall;
@override@JsonKey(name: 'need_aac_transcoding') final  bool needAacTranscoding;

/// Create a copy of AmeStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmeStatusCopyWith<_AmeStatus> get copyWith => __$AmeStatusCopyWithImpl<_AmeStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmeStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmeStatus&&(identical(other.ameMajorVersion, ameMajorVersion) || other.ameMajorVersion == ameMajorVersion)&&(identical(other.hasAac, hasAac) || other.hasAac == hasAac)&&(identical(other.hasLicense, hasLicense) || other.hasLicense == hasLicense)&&(identical(other.isAacActivated, isAacActivated) || other.isAacActivated == isAacActivated)&&(identical(other.isAmeBroken, isAmeBroken) || other.isAmeBroken == isAmeBroken)&&(identical(other.isAmeInstall, isAmeInstall) || other.isAmeInstall == isAmeInstall)&&(identical(other.needAacTranscoding, needAacTranscoding) || other.needAacTranscoding == needAacTranscoding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ameMajorVersion,hasAac,hasLicense,isAacActivated,isAmeBroken,isAmeInstall,needAacTranscoding);

@override
String toString() {
  return 'AmeStatus(ameMajorVersion: $ameMajorVersion, hasAac: $hasAac, hasLicense: $hasLicense, isAacActivated: $isAacActivated, isAmeBroken: $isAmeBroken, isAmeInstall: $isAmeInstall, needAacTranscoding: $needAacTranscoding)';
}


}

/// @nodoc
abstract mixin class _$AmeStatusCopyWith<$Res> implements $AmeStatusCopyWith<$Res> {
  factory _$AmeStatusCopyWith(_AmeStatus value, $Res Function(_AmeStatus) _then) = __$AmeStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ame_major_version') int ameMajorVersion,@JsonKey(name: 'has_aac') bool hasAac,@JsonKey(name: 'has_license') bool hasLicense,@JsonKey(name: 'is_aac_activated') bool isAacActivated,@JsonKey(name: 'is_ame_broken') bool isAmeBroken,@JsonKey(name: 'is_ame_install') bool isAmeInstall,@JsonKey(name: 'need_aac_transcoding') bool needAacTranscoding
});




}
/// @nodoc
class __$AmeStatusCopyWithImpl<$Res>
    implements _$AmeStatusCopyWith<$Res> {
  __$AmeStatusCopyWithImpl(this._self, this._then);

  final _AmeStatus _self;
  final $Res Function(_AmeStatus) _then;

/// Create a copy of AmeStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ameMajorVersion = null,Object? hasAac = null,Object? hasLicense = null,Object? isAacActivated = null,Object? isAmeBroken = null,Object? isAmeInstall = null,Object? needAacTranscoding = null,}) {
  return _then(_AmeStatus(
ameMajorVersion: null == ameMajorVersion ? _self.ameMajorVersion : ameMajorVersion // ignore: cast_nullable_to_non_nullable
as int,hasAac: null == hasAac ? _self.hasAac : hasAac // ignore: cast_nullable_to_non_nullable
as bool,hasLicense: null == hasLicense ? _self.hasLicense : hasLicense // ignore: cast_nullable_to_non_nullable
as bool,isAacActivated: null == isAacActivated ? _self.isAacActivated : isAacActivated // ignore: cast_nullable_to_non_nullable
as bool,isAmeBroken: null == isAmeBroken ? _self.isAmeBroken : isAmeBroken // ignore: cast_nullable_to_non_nullable
as bool,isAmeInstall: null == isAmeInstall ? _self.isAmeInstall : isAmeInstall // ignore: cast_nullable_to_non_nullable
as bool,needAacTranscoding: null == needAacTranscoding ? _self.needAacTranscoding : needAacTranscoding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Privilege {

@JsonKey(name: 'playlist_edit') bool get playlistEdit;@JsonKey(name: 'remote_player') bool get remotePlayer; bool get sharing;@JsonKey(name: 'tag_edit') bool get tagEdit;@JsonKey(name: 'upnp_browse') bool get upnpBrowse;
/// Create a copy of Privilege
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivilegeCopyWith<Privilege> get copyWith => _$PrivilegeCopyWithImpl<Privilege>(this as Privilege, _$identity);

  /// Serializes this Privilege to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Privilege&&(identical(other.playlistEdit, playlistEdit) || other.playlistEdit == playlistEdit)&&(identical(other.remotePlayer, remotePlayer) || other.remotePlayer == remotePlayer)&&(identical(other.sharing, sharing) || other.sharing == sharing)&&(identical(other.tagEdit, tagEdit) || other.tagEdit == tagEdit)&&(identical(other.upnpBrowse, upnpBrowse) || other.upnpBrowse == upnpBrowse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playlistEdit,remotePlayer,sharing,tagEdit,upnpBrowse);

@override
String toString() {
  return 'Privilege(playlistEdit: $playlistEdit, remotePlayer: $remotePlayer, sharing: $sharing, tagEdit: $tagEdit, upnpBrowse: $upnpBrowse)';
}


}

/// @nodoc
abstract mixin class $PrivilegeCopyWith<$Res>  {
  factory $PrivilegeCopyWith(Privilege value, $Res Function(Privilege) _then) = _$PrivilegeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'playlist_edit') bool playlistEdit,@JsonKey(name: 'remote_player') bool remotePlayer, bool sharing,@JsonKey(name: 'tag_edit') bool tagEdit,@JsonKey(name: 'upnp_browse') bool upnpBrowse
});




}
/// @nodoc
class _$PrivilegeCopyWithImpl<$Res>
    implements $PrivilegeCopyWith<$Res> {
  _$PrivilegeCopyWithImpl(this._self, this._then);

  final Privilege _self;
  final $Res Function(Privilege) _then;

/// Create a copy of Privilege
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlistEdit = null,Object? remotePlayer = null,Object? sharing = null,Object? tagEdit = null,Object? upnpBrowse = null,}) {
  return _then(_self.copyWith(
playlistEdit: null == playlistEdit ? _self.playlistEdit : playlistEdit // ignore: cast_nullable_to_non_nullable
as bool,remotePlayer: null == remotePlayer ? _self.remotePlayer : remotePlayer // ignore: cast_nullable_to_non_nullable
as bool,sharing: null == sharing ? _self.sharing : sharing // ignore: cast_nullable_to_non_nullable
as bool,tagEdit: null == tagEdit ? _self.tagEdit : tagEdit // ignore: cast_nullable_to_non_nullable
as bool,upnpBrowse: null == upnpBrowse ? _self.upnpBrowse : upnpBrowse // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Privilege].
extension PrivilegePatterns on Privilege {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Privilege value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Privilege() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Privilege value)  $default,){
final _that = this;
switch (_that) {
case _Privilege():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Privilege value)?  $default,){
final _that = this;
switch (_that) {
case _Privilege() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'playlist_edit')  bool playlistEdit, @JsonKey(name: 'remote_player')  bool remotePlayer,  bool sharing, @JsonKey(name: 'tag_edit')  bool tagEdit, @JsonKey(name: 'upnp_browse')  bool upnpBrowse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Privilege() when $default != null:
return $default(_that.playlistEdit,_that.remotePlayer,_that.sharing,_that.tagEdit,_that.upnpBrowse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'playlist_edit')  bool playlistEdit, @JsonKey(name: 'remote_player')  bool remotePlayer,  bool sharing, @JsonKey(name: 'tag_edit')  bool tagEdit, @JsonKey(name: 'upnp_browse')  bool upnpBrowse)  $default,) {final _that = this;
switch (_that) {
case _Privilege():
return $default(_that.playlistEdit,_that.remotePlayer,_that.sharing,_that.tagEdit,_that.upnpBrowse);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'playlist_edit')  bool playlistEdit, @JsonKey(name: 'remote_player')  bool remotePlayer,  bool sharing, @JsonKey(name: 'tag_edit')  bool tagEdit, @JsonKey(name: 'upnp_browse')  bool upnpBrowse)?  $default,) {final _that = this;
switch (_that) {
case _Privilege() when $default != null:
return $default(_that.playlistEdit,_that.remotePlayer,_that.sharing,_that.tagEdit,_that.upnpBrowse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Privilege extends Privilege {
  const _Privilege({@JsonKey(name: 'playlist_edit') required this.playlistEdit, @JsonKey(name: 'remote_player') required this.remotePlayer, required this.sharing, @JsonKey(name: 'tag_edit') required this.tagEdit, @JsonKey(name: 'upnp_browse') required this.upnpBrowse}): super._();
  factory _Privilege.fromJson(Map<String, dynamic> json) => _$PrivilegeFromJson(json);

@override@JsonKey(name: 'playlist_edit') final  bool playlistEdit;
@override@JsonKey(name: 'remote_player') final  bool remotePlayer;
@override final  bool sharing;
@override@JsonKey(name: 'tag_edit') final  bool tagEdit;
@override@JsonKey(name: 'upnp_browse') final  bool upnpBrowse;

/// Create a copy of Privilege
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivilegeCopyWith<_Privilege> get copyWith => __$PrivilegeCopyWithImpl<_Privilege>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivilegeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Privilege&&(identical(other.playlistEdit, playlistEdit) || other.playlistEdit == playlistEdit)&&(identical(other.remotePlayer, remotePlayer) || other.remotePlayer == remotePlayer)&&(identical(other.sharing, sharing) || other.sharing == sharing)&&(identical(other.tagEdit, tagEdit) || other.tagEdit == tagEdit)&&(identical(other.upnpBrowse, upnpBrowse) || other.upnpBrowse == upnpBrowse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playlistEdit,remotePlayer,sharing,tagEdit,upnpBrowse);

@override
String toString() {
  return 'Privilege(playlistEdit: $playlistEdit, remotePlayer: $remotePlayer, sharing: $sharing, tagEdit: $tagEdit, upnpBrowse: $upnpBrowse)';
}


}

/// @nodoc
abstract mixin class _$PrivilegeCopyWith<$Res> implements $PrivilegeCopyWith<$Res> {
  factory _$PrivilegeCopyWith(_Privilege value, $Res Function(_Privilege) _then) = __$PrivilegeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'playlist_edit') bool playlistEdit,@JsonKey(name: 'remote_player') bool remotePlayer, bool sharing,@JsonKey(name: 'tag_edit') bool tagEdit,@JsonKey(name: 'upnp_browse') bool upnpBrowse
});




}
/// @nodoc
class __$PrivilegeCopyWithImpl<$Res>
    implements _$PrivilegeCopyWith<$Res> {
  __$PrivilegeCopyWithImpl(this._self, this._then);

  final _Privilege _self;
  final $Res Function(_Privilege) _then;

/// Create a copy of Privilege
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlistEdit = null,Object? remotePlayer = null,Object? sharing = null,Object? tagEdit = null,Object? upnpBrowse = null,}) {
  return _then(_Privilege(
playlistEdit: null == playlistEdit ? _self.playlistEdit : playlistEdit // ignore: cast_nullable_to_non_nullable
as bool,remotePlayer: null == remotePlayer ? _self.remotePlayer : remotePlayer // ignore: cast_nullable_to_non_nullable
as bool,sharing: null == sharing ? _self.sharing : sharing // ignore: cast_nullable_to_non_nullable
as bool,tagEdit: null == tagEdit ? _self.tagEdit : tagEdit // ignore: cast_nullable_to_non_nullable
as bool,upnpBrowse: null == upnpBrowse ? _self.upnpBrowse : upnpBrowse // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Settings {

@JsonKey(name: 'audio_show_virtual_library') bool get audioShowVirtualLibrary;@JsonKey(name: 'disable_upnp') bool get disableUpnp;@JsonKey(name: 'enable_download') bool get enableDownload;@JsonKey(name: 'prefer_using_html5') bool get preferUsingHtml5;@JsonKey(name: 'transcode_to_mp3') bool get transcodeToMp3;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);

  /// Serializes this Settings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.audioShowVirtualLibrary, audioShowVirtualLibrary) || other.audioShowVirtualLibrary == audioShowVirtualLibrary)&&(identical(other.disableUpnp, disableUpnp) || other.disableUpnp == disableUpnp)&&(identical(other.enableDownload, enableDownload) || other.enableDownload == enableDownload)&&(identical(other.preferUsingHtml5, preferUsingHtml5) || other.preferUsingHtml5 == preferUsingHtml5)&&(identical(other.transcodeToMp3, transcodeToMp3) || other.transcodeToMp3 == transcodeToMp3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,audioShowVirtualLibrary,disableUpnp,enableDownload,preferUsingHtml5,transcodeToMp3);

@override
String toString() {
  return 'Settings(audioShowVirtualLibrary: $audioShowVirtualLibrary, disableUpnp: $disableUpnp, enableDownload: $enableDownload, preferUsingHtml5: $preferUsingHtml5, transcodeToMp3: $transcodeToMp3)';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'audio_show_virtual_library') bool audioShowVirtualLibrary,@JsonKey(name: 'disable_upnp') bool disableUpnp,@JsonKey(name: 'enable_download') bool enableDownload,@JsonKey(name: 'prefer_using_html5') bool preferUsingHtml5,@JsonKey(name: 'transcode_to_mp3') bool transcodeToMp3
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? audioShowVirtualLibrary = null,Object? disableUpnp = null,Object? enableDownload = null,Object? preferUsingHtml5 = null,Object? transcodeToMp3 = null,}) {
  return _then(_self.copyWith(
audioShowVirtualLibrary: null == audioShowVirtualLibrary ? _self.audioShowVirtualLibrary : audioShowVirtualLibrary // ignore: cast_nullable_to_non_nullable
as bool,disableUpnp: null == disableUpnp ? _self.disableUpnp : disableUpnp // ignore: cast_nullable_to_non_nullable
as bool,enableDownload: null == enableDownload ? _self.enableDownload : enableDownload // ignore: cast_nullable_to_non_nullable
as bool,preferUsingHtml5: null == preferUsingHtml5 ? _self.preferUsingHtml5 : preferUsingHtml5 // ignore: cast_nullable_to_non_nullable
as bool,transcodeToMp3: null == transcodeToMp3 ? _self.transcodeToMp3 : transcodeToMp3 // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Settings].
extension SettingsPatterns on Settings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Settings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Settings value)  $default,){
final _that = this;
switch (_that) {
case _Settings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Settings value)?  $default,){
final _that = this;
switch (_that) {
case _Settings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'audio_show_virtual_library')  bool audioShowVirtualLibrary, @JsonKey(name: 'disable_upnp')  bool disableUpnp, @JsonKey(name: 'enable_download')  bool enableDownload, @JsonKey(name: 'prefer_using_html5')  bool preferUsingHtml5, @JsonKey(name: 'transcode_to_mp3')  bool transcodeToMp3)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.audioShowVirtualLibrary,_that.disableUpnp,_that.enableDownload,_that.preferUsingHtml5,_that.transcodeToMp3);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'audio_show_virtual_library')  bool audioShowVirtualLibrary, @JsonKey(name: 'disable_upnp')  bool disableUpnp, @JsonKey(name: 'enable_download')  bool enableDownload, @JsonKey(name: 'prefer_using_html5')  bool preferUsingHtml5, @JsonKey(name: 'transcode_to_mp3')  bool transcodeToMp3)  $default,) {final _that = this;
switch (_that) {
case _Settings():
return $default(_that.audioShowVirtualLibrary,_that.disableUpnp,_that.enableDownload,_that.preferUsingHtml5,_that.transcodeToMp3);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'audio_show_virtual_library')  bool audioShowVirtualLibrary, @JsonKey(name: 'disable_upnp')  bool disableUpnp, @JsonKey(name: 'enable_download')  bool enableDownload, @JsonKey(name: 'prefer_using_html5')  bool preferUsingHtml5, @JsonKey(name: 'transcode_to_mp3')  bool transcodeToMp3)?  $default,) {final _that = this;
switch (_that) {
case _Settings() when $default != null:
return $default(_that.audioShowVirtualLibrary,_that.disableUpnp,_that.enableDownload,_that.preferUsingHtml5,_that.transcodeToMp3);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Settings extends Settings {
  const _Settings({@JsonKey(name: 'audio_show_virtual_library') required this.audioShowVirtualLibrary, @JsonKey(name: 'disable_upnp') required this.disableUpnp, @JsonKey(name: 'enable_download') required this.enableDownload, @JsonKey(name: 'prefer_using_html5') required this.preferUsingHtml5, @JsonKey(name: 'transcode_to_mp3') required this.transcodeToMp3}): super._();
  factory _Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

@override@JsonKey(name: 'audio_show_virtual_library') final  bool audioShowVirtualLibrary;
@override@JsonKey(name: 'disable_upnp') final  bool disableUpnp;
@override@JsonKey(name: 'enable_download') final  bool enableDownload;
@override@JsonKey(name: 'prefer_using_html5') final  bool preferUsingHtml5;
@override@JsonKey(name: 'transcode_to_mp3') final  bool transcodeToMp3;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.audioShowVirtualLibrary, audioShowVirtualLibrary) || other.audioShowVirtualLibrary == audioShowVirtualLibrary)&&(identical(other.disableUpnp, disableUpnp) || other.disableUpnp == disableUpnp)&&(identical(other.enableDownload, enableDownload) || other.enableDownload == enableDownload)&&(identical(other.preferUsingHtml5, preferUsingHtml5) || other.preferUsingHtml5 == preferUsingHtml5)&&(identical(other.transcodeToMp3, transcodeToMp3) || other.transcodeToMp3 == transcodeToMp3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,audioShowVirtualLibrary,disableUpnp,enableDownload,preferUsingHtml5,transcodeToMp3);

@override
String toString() {
  return 'Settings(audioShowVirtualLibrary: $audioShowVirtualLibrary, disableUpnp: $disableUpnp, enableDownload: $enableDownload, preferUsingHtml5: $preferUsingHtml5, transcodeToMp3: $transcodeToMp3)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'audio_show_virtual_library') bool audioShowVirtualLibrary,@JsonKey(name: 'disable_upnp') bool disableUpnp,@JsonKey(name: 'enable_download') bool enableDownload,@JsonKey(name: 'prefer_using_html5') bool preferUsingHtml5,@JsonKey(name: 'transcode_to_mp3') bool transcodeToMp3
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? audioShowVirtualLibrary = null,Object? disableUpnp = null,Object? enableDownload = null,Object? preferUsingHtml5 = null,Object? transcodeToMp3 = null,}) {
  return _then(_Settings(
audioShowVirtualLibrary: null == audioShowVirtualLibrary ? _self.audioShowVirtualLibrary : audioShowVirtualLibrary // ignore: cast_nullable_to_non_nullable
as bool,disableUpnp: null == disableUpnp ? _self.disableUpnp : disableUpnp // ignore: cast_nullable_to_non_nullable
as bool,enableDownload: null == enableDownload ? _self.enableDownload : enableDownload // ignore: cast_nullable_to_non_nullable
as bool,preferUsingHtml5: null == preferUsingHtml5 ? _self.preferUsingHtml5 : preferUsingHtml5 // ignore: cast_nullable_to_non_nullable
as bool,transcodeToMp3: null == transcodeToMp3 ? _self.transcodeToMp3 : transcodeToMp3 // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AudioStationInfoData {

@JsonKey(name: 'ame_status') AmeStatus get ameStatus;@JsonKey(name: 'browse_personal_library') String get browsePersonalLibrary;@JsonKey(name: 'dsd_decode_capability') bool get dsdDecodeCapability;@JsonKey(name: 'enable_equalizer') bool get enableEqualizer;@JsonKey(name: 'enable_personal_library') bool get enablePersonalLibrary;@JsonKey(name: 'enable_user_home') bool get enableUserHome;@JsonKey(name: 'has_music_share') bool get hasMusicShare;@JsonKey(name: 'is_manager') bool get isManager;@JsonKey(name: 'playing_queue_max') int get playingQueueMax; Privilege get privilege;@JsonKey(name: 'remote_controller') bool get remoteController;@JsonKey(name: 'same_subnet') bool get sameSubnet;@JsonKey(name: 'serial_number') String get serialNumber; Settings get settings;@JsonKey(name: 'support_bluetooth') bool get supportBluetooth;@JsonKey(name: 'support_usb') bool get supportUsb;@JsonKey(name: 'support_virtual_library') bool get supportVirtualLibrary;@JsonKey(name: 'transcode_capability') List<String> get transcodeCapability; int get version;@JsonKey(name: 'version_string') String get versionString; String get sid;
/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioStationInfoDataCopyWith<AudioStationInfoData> get copyWith => _$AudioStationInfoDataCopyWithImpl<AudioStationInfoData>(this as AudioStationInfoData, _$identity);

  /// Serializes this AudioStationInfoData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioStationInfoData&&(identical(other.ameStatus, ameStatus) || other.ameStatus == ameStatus)&&(identical(other.browsePersonalLibrary, browsePersonalLibrary) || other.browsePersonalLibrary == browsePersonalLibrary)&&(identical(other.dsdDecodeCapability, dsdDecodeCapability) || other.dsdDecodeCapability == dsdDecodeCapability)&&(identical(other.enableEqualizer, enableEqualizer) || other.enableEqualizer == enableEqualizer)&&(identical(other.enablePersonalLibrary, enablePersonalLibrary) || other.enablePersonalLibrary == enablePersonalLibrary)&&(identical(other.enableUserHome, enableUserHome) || other.enableUserHome == enableUserHome)&&(identical(other.hasMusicShare, hasMusicShare) || other.hasMusicShare == hasMusicShare)&&(identical(other.isManager, isManager) || other.isManager == isManager)&&(identical(other.playingQueueMax, playingQueueMax) || other.playingQueueMax == playingQueueMax)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.remoteController, remoteController) || other.remoteController == remoteController)&&(identical(other.sameSubnet, sameSubnet) || other.sameSubnet == sameSubnet)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.supportBluetooth, supportBluetooth) || other.supportBluetooth == supportBluetooth)&&(identical(other.supportUsb, supportUsb) || other.supportUsb == supportUsb)&&(identical(other.supportVirtualLibrary, supportVirtualLibrary) || other.supportVirtualLibrary == supportVirtualLibrary)&&const DeepCollectionEquality().equals(other.transcodeCapability, transcodeCapability)&&(identical(other.version, version) || other.version == version)&&(identical(other.versionString, versionString) || other.versionString == versionString)&&(identical(other.sid, sid) || other.sid == sid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,ameStatus,browsePersonalLibrary,dsdDecodeCapability,enableEqualizer,enablePersonalLibrary,enableUserHome,hasMusicShare,isManager,playingQueueMax,privilege,remoteController,sameSubnet,serialNumber,settings,supportBluetooth,supportUsb,supportVirtualLibrary,const DeepCollectionEquality().hash(transcodeCapability),version,versionString,sid]);

@override
String toString() {
  return 'AudioStationInfoData(ameStatus: $ameStatus, browsePersonalLibrary: $browsePersonalLibrary, dsdDecodeCapability: $dsdDecodeCapability, enableEqualizer: $enableEqualizer, enablePersonalLibrary: $enablePersonalLibrary, enableUserHome: $enableUserHome, hasMusicShare: $hasMusicShare, isManager: $isManager, playingQueueMax: $playingQueueMax, privilege: $privilege, remoteController: $remoteController, sameSubnet: $sameSubnet, serialNumber: $serialNumber, settings: $settings, supportBluetooth: $supportBluetooth, supportUsb: $supportUsb, supportVirtualLibrary: $supportVirtualLibrary, transcodeCapability: $transcodeCapability, version: $version, versionString: $versionString, sid: $sid)';
}


}

/// @nodoc
abstract mixin class $AudioStationInfoDataCopyWith<$Res>  {
  factory $AudioStationInfoDataCopyWith(AudioStationInfoData value, $Res Function(AudioStationInfoData) _then) = _$AudioStationInfoDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ame_status') AmeStatus ameStatus,@JsonKey(name: 'browse_personal_library') String browsePersonalLibrary,@JsonKey(name: 'dsd_decode_capability') bool dsdDecodeCapability,@JsonKey(name: 'enable_equalizer') bool enableEqualizer,@JsonKey(name: 'enable_personal_library') bool enablePersonalLibrary,@JsonKey(name: 'enable_user_home') bool enableUserHome,@JsonKey(name: 'has_music_share') bool hasMusicShare,@JsonKey(name: 'is_manager') bool isManager,@JsonKey(name: 'playing_queue_max') int playingQueueMax, Privilege privilege,@JsonKey(name: 'remote_controller') bool remoteController,@JsonKey(name: 'same_subnet') bool sameSubnet,@JsonKey(name: 'serial_number') String serialNumber, Settings settings,@JsonKey(name: 'support_bluetooth') bool supportBluetooth,@JsonKey(name: 'support_usb') bool supportUsb,@JsonKey(name: 'support_virtual_library') bool supportVirtualLibrary,@JsonKey(name: 'transcode_capability') List<String> transcodeCapability, int version,@JsonKey(name: 'version_string') String versionString, String sid
});


$AmeStatusCopyWith<$Res> get ameStatus;$PrivilegeCopyWith<$Res> get privilege;$SettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$AudioStationInfoDataCopyWithImpl<$Res>
    implements $AudioStationInfoDataCopyWith<$Res> {
  _$AudioStationInfoDataCopyWithImpl(this._self, this._then);

  final AudioStationInfoData _self;
  final $Res Function(AudioStationInfoData) _then;

/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ameStatus = null,Object? browsePersonalLibrary = null,Object? dsdDecodeCapability = null,Object? enableEqualizer = null,Object? enablePersonalLibrary = null,Object? enableUserHome = null,Object? hasMusicShare = null,Object? isManager = null,Object? playingQueueMax = null,Object? privilege = null,Object? remoteController = null,Object? sameSubnet = null,Object? serialNumber = null,Object? settings = null,Object? supportBluetooth = null,Object? supportUsb = null,Object? supportVirtualLibrary = null,Object? transcodeCapability = null,Object? version = null,Object? versionString = null,Object? sid = null,}) {
  return _then(_self.copyWith(
ameStatus: null == ameStatus ? _self.ameStatus : ameStatus // ignore: cast_nullable_to_non_nullable
as AmeStatus,browsePersonalLibrary: null == browsePersonalLibrary ? _self.browsePersonalLibrary : browsePersonalLibrary // ignore: cast_nullable_to_non_nullable
as String,dsdDecodeCapability: null == dsdDecodeCapability ? _self.dsdDecodeCapability : dsdDecodeCapability // ignore: cast_nullable_to_non_nullable
as bool,enableEqualizer: null == enableEqualizer ? _self.enableEqualizer : enableEqualizer // ignore: cast_nullable_to_non_nullable
as bool,enablePersonalLibrary: null == enablePersonalLibrary ? _self.enablePersonalLibrary : enablePersonalLibrary // ignore: cast_nullable_to_non_nullable
as bool,enableUserHome: null == enableUserHome ? _self.enableUserHome : enableUserHome // ignore: cast_nullable_to_non_nullable
as bool,hasMusicShare: null == hasMusicShare ? _self.hasMusicShare : hasMusicShare // ignore: cast_nullable_to_non_nullable
as bool,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,playingQueueMax: null == playingQueueMax ? _self.playingQueueMax : playingQueueMax // ignore: cast_nullable_to_non_nullable
as int,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as Privilege,remoteController: null == remoteController ? _self.remoteController : remoteController // ignore: cast_nullable_to_non_nullable
as bool,sameSubnet: null == sameSubnet ? _self.sameSubnet : sameSubnet // ignore: cast_nullable_to_non_nullable
as bool,serialNumber: null == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Settings,supportBluetooth: null == supportBluetooth ? _self.supportBluetooth : supportBluetooth // ignore: cast_nullable_to_non_nullable
as bool,supportUsb: null == supportUsb ? _self.supportUsb : supportUsb // ignore: cast_nullable_to_non_nullable
as bool,supportVirtualLibrary: null == supportVirtualLibrary ? _self.supportVirtualLibrary : supportVirtualLibrary // ignore: cast_nullable_to_non_nullable
as bool,transcodeCapability: null == transcodeCapability ? _self.transcodeCapability : transcodeCapability // ignore: cast_nullable_to_non_nullable
as List<String>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,versionString: null == versionString ? _self.versionString : versionString // ignore: cast_nullable_to_non_nullable
as String,sid: null == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmeStatusCopyWith<$Res> get ameStatus {
  
  return $AmeStatusCopyWith<$Res>(_self.ameStatus, (value) {
    return _then(_self.copyWith(ameStatus: value));
  });
}/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivilegeCopyWith<$Res> get privilege {
  
  return $PrivilegeCopyWith<$Res>(_self.privilege, (value) {
    return _then(_self.copyWith(privilege: value));
  });
}/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsCopyWith<$Res> get settings {
  
  return $SettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [AudioStationInfoData].
extension AudioStationInfoDataPatterns on AudioStationInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioStationInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioStationInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioStationInfoData value)  $default,){
final _that = this;
switch (_that) {
case _AudioStationInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioStationInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _AudioStationInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ame_status')  AmeStatus ameStatus, @JsonKey(name: 'browse_personal_library')  String browsePersonalLibrary, @JsonKey(name: 'dsd_decode_capability')  bool dsdDecodeCapability, @JsonKey(name: 'enable_equalizer')  bool enableEqualizer, @JsonKey(name: 'enable_personal_library')  bool enablePersonalLibrary, @JsonKey(name: 'enable_user_home')  bool enableUserHome, @JsonKey(name: 'has_music_share')  bool hasMusicShare, @JsonKey(name: 'is_manager')  bool isManager, @JsonKey(name: 'playing_queue_max')  int playingQueueMax,  Privilege privilege, @JsonKey(name: 'remote_controller')  bool remoteController, @JsonKey(name: 'same_subnet')  bool sameSubnet, @JsonKey(name: 'serial_number')  String serialNumber,  Settings settings, @JsonKey(name: 'support_bluetooth')  bool supportBluetooth, @JsonKey(name: 'support_usb')  bool supportUsb, @JsonKey(name: 'support_virtual_library')  bool supportVirtualLibrary, @JsonKey(name: 'transcode_capability')  List<String> transcodeCapability,  int version, @JsonKey(name: 'version_string')  String versionString,  String sid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioStationInfoData() when $default != null:
return $default(_that.ameStatus,_that.browsePersonalLibrary,_that.dsdDecodeCapability,_that.enableEqualizer,_that.enablePersonalLibrary,_that.enableUserHome,_that.hasMusicShare,_that.isManager,_that.playingQueueMax,_that.privilege,_that.remoteController,_that.sameSubnet,_that.serialNumber,_that.settings,_that.supportBluetooth,_that.supportUsb,_that.supportVirtualLibrary,_that.transcodeCapability,_that.version,_that.versionString,_that.sid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ame_status')  AmeStatus ameStatus, @JsonKey(name: 'browse_personal_library')  String browsePersonalLibrary, @JsonKey(name: 'dsd_decode_capability')  bool dsdDecodeCapability, @JsonKey(name: 'enable_equalizer')  bool enableEqualizer, @JsonKey(name: 'enable_personal_library')  bool enablePersonalLibrary, @JsonKey(name: 'enable_user_home')  bool enableUserHome, @JsonKey(name: 'has_music_share')  bool hasMusicShare, @JsonKey(name: 'is_manager')  bool isManager, @JsonKey(name: 'playing_queue_max')  int playingQueueMax,  Privilege privilege, @JsonKey(name: 'remote_controller')  bool remoteController, @JsonKey(name: 'same_subnet')  bool sameSubnet, @JsonKey(name: 'serial_number')  String serialNumber,  Settings settings, @JsonKey(name: 'support_bluetooth')  bool supportBluetooth, @JsonKey(name: 'support_usb')  bool supportUsb, @JsonKey(name: 'support_virtual_library')  bool supportVirtualLibrary, @JsonKey(name: 'transcode_capability')  List<String> transcodeCapability,  int version, @JsonKey(name: 'version_string')  String versionString,  String sid)  $default,) {final _that = this;
switch (_that) {
case _AudioStationInfoData():
return $default(_that.ameStatus,_that.browsePersonalLibrary,_that.dsdDecodeCapability,_that.enableEqualizer,_that.enablePersonalLibrary,_that.enableUserHome,_that.hasMusicShare,_that.isManager,_that.playingQueueMax,_that.privilege,_that.remoteController,_that.sameSubnet,_that.serialNumber,_that.settings,_that.supportBluetooth,_that.supportUsb,_that.supportVirtualLibrary,_that.transcodeCapability,_that.version,_that.versionString,_that.sid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ame_status')  AmeStatus ameStatus, @JsonKey(name: 'browse_personal_library')  String browsePersonalLibrary, @JsonKey(name: 'dsd_decode_capability')  bool dsdDecodeCapability, @JsonKey(name: 'enable_equalizer')  bool enableEqualizer, @JsonKey(name: 'enable_personal_library')  bool enablePersonalLibrary, @JsonKey(name: 'enable_user_home')  bool enableUserHome, @JsonKey(name: 'has_music_share')  bool hasMusicShare, @JsonKey(name: 'is_manager')  bool isManager, @JsonKey(name: 'playing_queue_max')  int playingQueueMax,  Privilege privilege, @JsonKey(name: 'remote_controller')  bool remoteController, @JsonKey(name: 'same_subnet')  bool sameSubnet, @JsonKey(name: 'serial_number')  String serialNumber,  Settings settings, @JsonKey(name: 'support_bluetooth')  bool supportBluetooth, @JsonKey(name: 'support_usb')  bool supportUsb, @JsonKey(name: 'support_virtual_library')  bool supportVirtualLibrary, @JsonKey(name: 'transcode_capability')  List<String> transcodeCapability,  int version, @JsonKey(name: 'version_string')  String versionString,  String sid)?  $default,) {final _that = this;
switch (_that) {
case _AudioStationInfoData() when $default != null:
return $default(_that.ameStatus,_that.browsePersonalLibrary,_that.dsdDecodeCapability,_that.enableEqualizer,_that.enablePersonalLibrary,_that.enableUserHome,_that.hasMusicShare,_that.isManager,_that.playingQueueMax,_that.privilege,_that.remoteController,_that.sameSubnet,_that.serialNumber,_that.settings,_that.supportBluetooth,_that.supportUsb,_that.supportVirtualLibrary,_that.transcodeCapability,_that.version,_that.versionString,_that.sid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioStationInfoData extends AudioStationInfoData {
  const _AudioStationInfoData({@JsonKey(name: 'ame_status') required this.ameStatus, @JsonKey(name: 'browse_personal_library') required this.browsePersonalLibrary, @JsonKey(name: 'dsd_decode_capability') required this.dsdDecodeCapability, @JsonKey(name: 'enable_equalizer') required this.enableEqualizer, @JsonKey(name: 'enable_personal_library') required this.enablePersonalLibrary, @JsonKey(name: 'enable_user_home') required this.enableUserHome, @JsonKey(name: 'has_music_share') required this.hasMusicShare, @JsonKey(name: 'is_manager') required this.isManager, @JsonKey(name: 'playing_queue_max') required this.playingQueueMax, required this.privilege, @JsonKey(name: 'remote_controller') required this.remoteController, @JsonKey(name: 'same_subnet') required this.sameSubnet, @JsonKey(name: 'serial_number') required this.serialNumber, required this.settings, @JsonKey(name: 'support_bluetooth') required this.supportBluetooth, @JsonKey(name: 'support_usb') required this.supportUsb, @JsonKey(name: 'support_virtual_library') required this.supportVirtualLibrary, @JsonKey(name: 'transcode_capability') required final  List<String> transcodeCapability, required this.version, @JsonKey(name: 'version_string') required this.versionString, required this.sid}): _transcodeCapability = transcodeCapability,super._();
  factory _AudioStationInfoData.fromJson(Map<String, dynamic> json) => _$AudioStationInfoDataFromJson(json);

@override@JsonKey(name: 'ame_status') final  AmeStatus ameStatus;
@override@JsonKey(name: 'browse_personal_library') final  String browsePersonalLibrary;
@override@JsonKey(name: 'dsd_decode_capability') final  bool dsdDecodeCapability;
@override@JsonKey(name: 'enable_equalizer') final  bool enableEqualizer;
@override@JsonKey(name: 'enable_personal_library') final  bool enablePersonalLibrary;
@override@JsonKey(name: 'enable_user_home') final  bool enableUserHome;
@override@JsonKey(name: 'has_music_share') final  bool hasMusicShare;
@override@JsonKey(name: 'is_manager') final  bool isManager;
@override@JsonKey(name: 'playing_queue_max') final  int playingQueueMax;
@override final  Privilege privilege;
@override@JsonKey(name: 'remote_controller') final  bool remoteController;
@override@JsonKey(name: 'same_subnet') final  bool sameSubnet;
@override@JsonKey(name: 'serial_number') final  String serialNumber;
@override final  Settings settings;
@override@JsonKey(name: 'support_bluetooth') final  bool supportBluetooth;
@override@JsonKey(name: 'support_usb') final  bool supportUsb;
@override@JsonKey(name: 'support_virtual_library') final  bool supportVirtualLibrary;
 final  List<String> _transcodeCapability;
@override@JsonKey(name: 'transcode_capability') List<String> get transcodeCapability {
  if (_transcodeCapability is EqualUnmodifiableListView) return _transcodeCapability;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transcodeCapability);
}

@override final  int version;
@override@JsonKey(name: 'version_string') final  String versionString;
@override final  String sid;

/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioStationInfoDataCopyWith<_AudioStationInfoData> get copyWith => __$AudioStationInfoDataCopyWithImpl<_AudioStationInfoData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioStationInfoDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioStationInfoData&&(identical(other.ameStatus, ameStatus) || other.ameStatus == ameStatus)&&(identical(other.browsePersonalLibrary, browsePersonalLibrary) || other.browsePersonalLibrary == browsePersonalLibrary)&&(identical(other.dsdDecodeCapability, dsdDecodeCapability) || other.dsdDecodeCapability == dsdDecodeCapability)&&(identical(other.enableEqualizer, enableEqualizer) || other.enableEqualizer == enableEqualizer)&&(identical(other.enablePersonalLibrary, enablePersonalLibrary) || other.enablePersonalLibrary == enablePersonalLibrary)&&(identical(other.enableUserHome, enableUserHome) || other.enableUserHome == enableUserHome)&&(identical(other.hasMusicShare, hasMusicShare) || other.hasMusicShare == hasMusicShare)&&(identical(other.isManager, isManager) || other.isManager == isManager)&&(identical(other.playingQueueMax, playingQueueMax) || other.playingQueueMax == playingQueueMax)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.remoteController, remoteController) || other.remoteController == remoteController)&&(identical(other.sameSubnet, sameSubnet) || other.sameSubnet == sameSubnet)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.supportBluetooth, supportBluetooth) || other.supportBluetooth == supportBluetooth)&&(identical(other.supportUsb, supportUsb) || other.supportUsb == supportUsb)&&(identical(other.supportVirtualLibrary, supportVirtualLibrary) || other.supportVirtualLibrary == supportVirtualLibrary)&&const DeepCollectionEquality().equals(other._transcodeCapability, _transcodeCapability)&&(identical(other.version, version) || other.version == version)&&(identical(other.versionString, versionString) || other.versionString == versionString)&&(identical(other.sid, sid) || other.sid == sid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,ameStatus,browsePersonalLibrary,dsdDecodeCapability,enableEqualizer,enablePersonalLibrary,enableUserHome,hasMusicShare,isManager,playingQueueMax,privilege,remoteController,sameSubnet,serialNumber,settings,supportBluetooth,supportUsb,supportVirtualLibrary,const DeepCollectionEquality().hash(_transcodeCapability),version,versionString,sid]);

@override
String toString() {
  return 'AudioStationInfoData(ameStatus: $ameStatus, browsePersonalLibrary: $browsePersonalLibrary, dsdDecodeCapability: $dsdDecodeCapability, enableEqualizer: $enableEqualizer, enablePersonalLibrary: $enablePersonalLibrary, enableUserHome: $enableUserHome, hasMusicShare: $hasMusicShare, isManager: $isManager, playingQueueMax: $playingQueueMax, privilege: $privilege, remoteController: $remoteController, sameSubnet: $sameSubnet, serialNumber: $serialNumber, settings: $settings, supportBluetooth: $supportBluetooth, supportUsb: $supportUsb, supportVirtualLibrary: $supportVirtualLibrary, transcodeCapability: $transcodeCapability, version: $version, versionString: $versionString, sid: $sid)';
}


}

/// @nodoc
abstract mixin class _$AudioStationInfoDataCopyWith<$Res> implements $AudioStationInfoDataCopyWith<$Res> {
  factory _$AudioStationInfoDataCopyWith(_AudioStationInfoData value, $Res Function(_AudioStationInfoData) _then) = __$AudioStationInfoDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ame_status') AmeStatus ameStatus,@JsonKey(name: 'browse_personal_library') String browsePersonalLibrary,@JsonKey(name: 'dsd_decode_capability') bool dsdDecodeCapability,@JsonKey(name: 'enable_equalizer') bool enableEqualizer,@JsonKey(name: 'enable_personal_library') bool enablePersonalLibrary,@JsonKey(name: 'enable_user_home') bool enableUserHome,@JsonKey(name: 'has_music_share') bool hasMusicShare,@JsonKey(name: 'is_manager') bool isManager,@JsonKey(name: 'playing_queue_max') int playingQueueMax, Privilege privilege,@JsonKey(name: 'remote_controller') bool remoteController,@JsonKey(name: 'same_subnet') bool sameSubnet,@JsonKey(name: 'serial_number') String serialNumber, Settings settings,@JsonKey(name: 'support_bluetooth') bool supportBluetooth,@JsonKey(name: 'support_usb') bool supportUsb,@JsonKey(name: 'support_virtual_library') bool supportVirtualLibrary,@JsonKey(name: 'transcode_capability') List<String> transcodeCapability, int version,@JsonKey(name: 'version_string') String versionString, String sid
});


@override $AmeStatusCopyWith<$Res> get ameStatus;@override $PrivilegeCopyWith<$Res> get privilege;@override $SettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$AudioStationInfoDataCopyWithImpl<$Res>
    implements _$AudioStationInfoDataCopyWith<$Res> {
  __$AudioStationInfoDataCopyWithImpl(this._self, this._then);

  final _AudioStationInfoData _self;
  final $Res Function(_AudioStationInfoData) _then;

/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ameStatus = null,Object? browsePersonalLibrary = null,Object? dsdDecodeCapability = null,Object? enableEqualizer = null,Object? enablePersonalLibrary = null,Object? enableUserHome = null,Object? hasMusicShare = null,Object? isManager = null,Object? playingQueueMax = null,Object? privilege = null,Object? remoteController = null,Object? sameSubnet = null,Object? serialNumber = null,Object? settings = null,Object? supportBluetooth = null,Object? supportUsb = null,Object? supportVirtualLibrary = null,Object? transcodeCapability = null,Object? version = null,Object? versionString = null,Object? sid = null,}) {
  return _then(_AudioStationInfoData(
ameStatus: null == ameStatus ? _self.ameStatus : ameStatus // ignore: cast_nullable_to_non_nullable
as AmeStatus,browsePersonalLibrary: null == browsePersonalLibrary ? _self.browsePersonalLibrary : browsePersonalLibrary // ignore: cast_nullable_to_non_nullable
as String,dsdDecodeCapability: null == dsdDecodeCapability ? _self.dsdDecodeCapability : dsdDecodeCapability // ignore: cast_nullable_to_non_nullable
as bool,enableEqualizer: null == enableEqualizer ? _self.enableEqualizer : enableEqualizer // ignore: cast_nullable_to_non_nullable
as bool,enablePersonalLibrary: null == enablePersonalLibrary ? _self.enablePersonalLibrary : enablePersonalLibrary // ignore: cast_nullable_to_non_nullable
as bool,enableUserHome: null == enableUserHome ? _self.enableUserHome : enableUserHome // ignore: cast_nullable_to_non_nullable
as bool,hasMusicShare: null == hasMusicShare ? _self.hasMusicShare : hasMusicShare // ignore: cast_nullable_to_non_nullable
as bool,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,playingQueueMax: null == playingQueueMax ? _self.playingQueueMax : playingQueueMax // ignore: cast_nullable_to_non_nullable
as int,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as Privilege,remoteController: null == remoteController ? _self.remoteController : remoteController // ignore: cast_nullable_to_non_nullable
as bool,sameSubnet: null == sameSubnet ? _self.sameSubnet : sameSubnet // ignore: cast_nullable_to_non_nullable
as bool,serialNumber: null == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Settings,supportBluetooth: null == supportBluetooth ? _self.supportBluetooth : supportBluetooth // ignore: cast_nullable_to_non_nullable
as bool,supportUsb: null == supportUsb ? _self.supportUsb : supportUsb // ignore: cast_nullable_to_non_nullable
as bool,supportVirtualLibrary: null == supportVirtualLibrary ? _self.supportVirtualLibrary : supportVirtualLibrary // ignore: cast_nullable_to_non_nullable
as bool,transcodeCapability: null == transcodeCapability ? _self._transcodeCapability : transcodeCapability // ignore: cast_nullable_to_non_nullable
as List<String>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,versionString: null == versionString ? _self.versionString : versionString // ignore: cast_nullable_to_non_nullable
as String,sid: null == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmeStatusCopyWith<$Res> get ameStatus {
  
  return $AmeStatusCopyWith<$Res>(_self.ameStatus, (value) {
    return _then(_self.copyWith(ameStatus: value));
  });
}/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivilegeCopyWith<$Res> get privilege {
  
  return $PrivilegeCopyWith<$Res>(_self.privilege, (value) {
    return _then(_self.copyWith(privilege: value));
  });
}/// Create a copy of AudioStationInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsCopyWith<$Res> get settings {
  
  return $SettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// @nodoc
mixin _$AudioStationInfoRequest {

 String get api; String get method; String get version;
/// Create a copy of AudioStationInfoRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioStationInfoRequestCopyWith<AudioStationInfoRequest> get copyWith => _$AudioStationInfoRequestCopyWithImpl<AudioStationInfoRequest>(this as AudioStationInfoRequest, _$identity);

  /// Serializes this AudioStationInfoRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioStationInfoRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version);

@override
String toString() {
  return 'AudioStationInfoRequest(api: $api, method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class $AudioStationInfoRequestCopyWith<$Res>  {
  factory $AudioStationInfoRequestCopyWith(AudioStationInfoRequest value, $Res Function(AudioStationInfoRequest) _then) = _$AudioStationInfoRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version
});




}
/// @nodoc
class _$AudioStationInfoRequestCopyWithImpl<$Res>
    implements $AudioStationInfoRequestCopyWith<$Res> {
  _$AudioStationInfoRequestCopyWithImpl(this._self, this._then);

  final AudioStationInfoRequest _self;
  final $Res Function(AudioStationInfoRequest) _then;

/// Create a copy of AudioStationInfoRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioStationInfoRequest].
extension AudioStationInfoRequestPatterns on AudioStationInfoRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioStationInfoRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioStationInfoRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioStationInfoRequest value)  $default,){
final _that = this;
switch (_that) {
case _AudioStationInfoRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioStationInfoRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AudioStationInfoRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioStationInfoRequest() when $default != null:
return $default(_that.api,_that.method,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version)  $default,) {final _that = this;
switch (_that) {
case _AudioStationInfoRequest():
return $default(_that.api,_that.method,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version)?  $default,) {final _that = this;
switch (_that) {
case _AudioStationInfoRequest() when $default != null:
return $default(_that.api,_that.method,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioStationInfoRequest extends AudioStationInfoRequest {
  const _AudioStationInfoRequest({required this.api, required this.method, required this.version}): super._();
  factory _AudioStationInfoRequest.fromJson(Map<String, dynamic> json) => _$AudioStationInfoRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;

/// Create a copy of AudioStationInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioStationInfoRequestCopyWith<_AudioStationInfoRequest> get copyWith => __$AudioStationInfoRequestCopyWithImpl<_AudioStationInfoRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioStationInfoRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioStationInfoRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version);

@override
String toString() {
  return 'AudioStationInfoRequest(api: $api, method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class _$AudioStationInfoRequestCopyWith<$Res> implements $AudioStationInfoRequestCopyWith<$Res> {
  factory _$AudioStationInfoRequestCopyWith(_AudioStationInfoRequest value, $Res Function(_AudioStationInfoRequest) _then) = __$AudioStationInfoRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version
});




}
/// @nodoc
class __$AudioStationInfoRequestCopyWithImpl<$Res>
    implements _$AudioStationInfoRequestCopyWith<$Res> {
  __$AudioStationInfoRequestCopyWithImpl(this._self, this._then);

  final _AudioStationInfoRequest _self;
  final $Res Function(_AudioStationInfoRequest) _then;

/// Create a copy of AudioStationInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,}) {
  return _then(_AudioStationInfoRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AudioStationInfoResponse {

 bool get success; AudioStationInfoData? get data;
/// Create a copy of AudioStationInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioStationInfoResponseCopyWith<AudioStationInfoResponse> get copyWith => _$AudioStationInfoResponseCopyWithImpl<AudioStationInfoResponse>(this as AudioStationInfoResponse, _$identity);

  /// Serializes this AudioStationInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioStationInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'AudioStationInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $AudioStationInfoResponseCopyWith<$Res>  {
  factory $AudioStationInfoResponseCopyWith(AudioStationInfoResponse value, $Res Function(AudioStationInfoResponse) _then) = _$AudioStationInfoResponseCopyWithImpl;
@useResult
$Res call({
 bool success, AudioStationInfoData? data
});


$AudioStationInfoDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AudioStationInfoResponseCopyWithImpl<$Res>
    implements $AudioStationInfoResponseCopyWith<$Res> {
  _$AudioStationInfoResponseCopyWithImpl(this._self, this._then);

  final AudioStationInfoResponse _self;
  final $Res Function(AudioStationInfoResponse) _then;

/// Create a copy of AudioStationInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AudioStationInfoData?,
  ));
}
/// Create a copy of AudioStationInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioStationInfoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AudioStationInfoDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AudioStationInfoResponse].
extension AudioStationInfoResponsePatterns on AudioStationInfoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioStationInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioStationInfoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioStationInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _AudioStationInfoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioStationInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AudioStationInfoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  AudioStationInfoData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioStationInfoResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  AudioStationInfoData? data)  $default,) {final _that = this;
switch (_that) {
case _AudioStationInfoResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  AudioStationInfoData? data)?  $default,) {final _that = this;
switch (_that) {
case _AudioStationInfoResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioStationInfoResponse extends AudioStationInfoResponse {
  const _AudioStationInfoResponse({required this.success, this.data}): super._();
  factory _AudioStationInfoResponse.fromJson(Map<String, dynamic> json) => _$AudioStationInfoResponseFromJson(json);

@override final  bool success;
@override final  AudioStationInfoData? data;

/// Create a copy of AudioStationInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioStationInfoResponseCopyWith<_AudioStationInfoResponse> get copyWith => __$AudioStationInfoResponseCopyWithImpl<_AudioStationInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioStationInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioStationInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'AudioStationInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AudioStationInfoResponseCopyWith<$Res> implements $AudioStationInfoResponseCopyWith<$Res> {
  factory _$AudioStationInfoResponseCopyWith(_AudioStationInfoResponse value, $Res Function(_AudioStationInfoResponse) _then) = __$AudioStationInfoResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, AudioStationInfoData? data
});


@override $AudioStationInfoDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AudioStationInfoResponseCopyWithImpl<$Res>
    implements _$AudioStationInfoResponseCopyWith<$Res> {
  __$AudioStationInfoResponseCopyWithImpl(this._self, this._then);

  final _AudioStationInfoResponse _self;
  final $Res Function(_AudioStationInfoResponse) _then;

/// Create a copy of AudioStationInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_AudioStationInfoResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AudioStationInfoData?,
  ));
}

/// Create a copy of AudioStationInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioStationInfoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AudioStationInfoDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DSMInfoData {

 String get codepage; String get model; int get ram; String get serial; int get temperature;@JsonKey(name: 'temperature_warn') bool get temperatureWarn; String get time; int get uptime; String get version;@JsonKey(name: 'version_string') String get versionString;
/// Create a copy of DSMInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DSMInfoDataCopyWith<DSMInfoData> get copyWith => _$DSMInfoDataCopyWithImpl<DSMInfoData>(this as DSMInfoData, _$identity);

  /// Serializes this DSMInfoData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DSMInfoData&&(identical(other.codepage, codepage) || other.codepage == codepage)&&(identical(other.model, model) || other.model == model)&&(identical(other.ram, ram) || other.ram == ram)&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.temperatureWarn, temperatureWarn) || other.temperatureWarn == temperatureWarn)&&(identical(other.time, time) || other.time == time)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.version, version) || other.version == version)&&(identical(other.versionString, versionString) || other.versionString == versionString));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codepage,model,ram,serial,temperature,temperatureWarn,time,uptime,version,versionString);

@override
String toString() {
  return 'DSMInfoData(codepage: $codepage, model: $model, ram: $ram, serial: $serial, temperature: $temperature, temperatureWarn: $temperatureWarn, time: $time, uptime: $uptime, version: $version, versionString: $versionString)';
}


}

/// @nodoc
abstract mixin class $DSMInfoDataCopyWith<$Res>  {
  factory $DSMInfoDataCopyWith(DSMInfoData value, $Res Function(DSMInfoData) _then) = _$DSMInfoDataCopyWithImpl;
@useResult
$Res call({
 String codepage, String model, int ram, String serial, int temperature,@JsonKey(name: 'temperature_warn') bool temperatureWarn, String time, int uptime, String version,@JsonKey(name: 'version_string') String versionString
});




}
/// @nodoc
class _$DSMInfoDataCopyWithImpl<$Res>
    implements $DSMInfoDataCopyWith<$Res> {
  _$DSMInfoDataCopyWithImpl(this._self, this._then);

  final DSMInfoData _self;
  final $Res Function(DSMInfoData) _then;

/// Create a copy of DSMInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codepage = null,Object? model = null,Object? ram = null,Object? serial = null,Object? temperature = null,Object? temperatureWarn = null,Object? time = null,Object? uptime = null,Object? version = null,Object? versionString = null,}) {
  return _then(_self.copyWith(
codepage: null == codepage ? _self.codepage : codepage // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,ram: null == ram ? _self.ram : ram // ignore: cast_nullable_to_non_nullable
as int,serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as int,temperatureWarn: null == temperatureWarn ? _self.temperatureWarn : temperatureWarn // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,versionString: null == versionString ? _self.versionString : versionString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DSMInfoData].
extension DSMInfoDataPatterns on DSMInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DSMInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DSMInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DSMInfoData value)  $default,){
final _that = this;
switch (_that) {
case _DSMInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DSMInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _DSMInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String codepage,  String model,  int ram,  String serial,  int temperature, @JsonKey(name: 'temperature_warn')  bool temperatureWarn,  String time,  int uptime,  String version, @JsonKey(name: 'version_string')  String versionString)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DSMInfoData() when $default != null:
return $default(_that.codepage,_that.model,_that.ram,_that.serial,_that.temperature,_that.temperatureWarn,_that.time,_that.uptime,_that.version,_that.versionString);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String codepage,  String model,  int ram,  String serial,  int temperature, @JsonKey(name: 'temperature_warn')  bool temperatureWarn,  String time,  int uptime,  String version, @JsonKey(name: 'version_string')  String versionString)  $default,) {final _that = this;
switch (_that) {
case _DSMInfoData():
return $default(_that.codepage,_that.model,_that.ram,_that.serial,_that.temperature,_that.temperatureWarn,_that.time,_that.uptime,_that.version,_that.versionString);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String codepage,  String model,  int ram,  String serial,  int temperature, @JsonKey(name: 'temperature_warn')  bool temperatureWarn,  String time,  int uptime,  String version, @JsonKey(name: 'version_string')  String versionString)?  $default,) {final _that = this;
switch (_that) {
case _DSMInfoData() when $default != null:
return $default(_that.codepage,_that.model,_that.ram,_that.serial,_that.temperature,_that.temperatureWarn,_that.time,_that.uptime,_that.version,_that.versionString);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DSMInfoData extends DSMInfoData {
  const _DSMInfoData({required this.codepage, required this.model, required this.ram, required this.serial, required this.temperature, @JsonKey(name: 'temperature_warn') required this.temperatureWarn, required this.time, required this.uptime, required this.version, @JsonKey(name: 'version_string') required this.versionString}): super._();
  factory _DSMInfoData.fromJson(Map<String, dynamic> json) => _$DSMInfoDataFromJson(json);

@override final  String codepage;
@override final  String model;
@override final  int ram;
@override final  String serial;
@override final  int temperature;
@override@JsonKey(name: 'temperature_warn') final  bool temperatureWarn;
@override final  String time;
@override final  int uptime;
@override final  String version;
@override@JsonKey(name: 'version_string') final  String versionString;

/// Create a copy of DSMInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DSMInfoDataCopyWith<_DSMInfoData> get copyWith => __$DSMInfoDataCopyWithImpl<_DSMInfoData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DSMInfoDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DSMInfoData&&(identical(other.codepage, codepage) || other.codepage == codepage)&&(identical(other.model, model) || other.model == model)&&(identical(other.ram, ram) || other.ram == ram)&&(identical(other.serial, serial) || other.serial == serial)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.temperatureWarn, temperatureWarn) || other.temperatureWarn == temperatureWarn)&&(identical(other.time, time) || other.time == time)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.version, version) || other.version == version)&&(identical(other.versionString, versionString) || other.versionString == versionString));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,codepage,model,ram,serial,temperature,temperatureWarn,time,uptime,version,versionString);

@override
String toString() {
  return 'DSMInfoData(codepage: $codepage, model: $model, ram: $ram, serial: $serial, temperature: $temperature, temperatureWarn: $temperatureWarn, time: $time, uptime: $uptime, version: $version, versionString: $versionString)';
}


}

/// @nodoc
abstract mixin class _$DSMInfoDataCopyWith<$Res> implements $DSMInfoDataCopyWith<$Res> {
  factory _$DSMInfoDataCopyWith(_DSMInfoData value, $Res Function(_DSMInfoData) _then) = __$DSMInfoDataCopyWithImpl;
@override @useResult
$Res call({
 String codepage, String model, int ram, String serial, int temperature,@JsonKey(name: 'temperature_warn') bool temperatureWarn, String time, int uptime, String version,@JsonKey(name: 'version_string') String versionString
});




}
/// @nodoc
class __$DSMInfoDataCopyWithImpl<$Res>
    implements _$DSMInfoDataCopyWith<$Res> {
  __$DSMInfoDataCopyWithImpl(this._self, this._then);

  final _DSMInfoData _self;
  final $Res Function(_DSMInfoData) _then;

/// Create a copy of DSMInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codepage = null,Object? model = null,Object? ram = null,Object? serial = null,Object? temperature = null,Object? temperatureWarn = null,Object? time = null,Object? uptime = null,Object? version = null,Object? versionString = null,}) {
  return _then(_DSMInfoData(
codepage: null == codepage ? _self.codepage : codepage // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,ram: null == ram ? _self.ram : ram // ignore: cast_nullable_to_non_nullable
as int,serial: null == serial ? _self.serial : serial // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as int,temperatureWarn: null == temperatureWarn ? _self.temperatureWarn : temperatureWarn // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,versionString: null == versionString ? _self.versionString : versionString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DSMInfoRequest {

 String get api; String get method; String get version;
/// Create a copy of DSMInfoRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DSMInfoRequestCopyWith<DSMInfoRequest> get copyWith => _$DSMInfoRequestCopyWithImpl<DSMInfoRequest>(this as DSMInfoRequest, _$identity);

  /// Serializes this DSMInfoRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DSMInfoRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version);

@override
String toString() {
  return 'DSMInfoRequest(api: $api, method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class $DSMInfoRequestCopyWith<$Res>  {
  factory $DSMInfoRequestCopyWith(DSMInfoRequest value, $Res Function(DSMInfoRequest) _then) = _$DSMInfoRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version
});




}
/// @nodoc
class _$DSMInfoRequestCopyWithImpl<$Res>
    implements $DSMInfoRequestCopyWith<$Res> {
  _$DSMInfoRequestCopyWithImpl(this._self, this._then);

  final DSMInfoRequest _self;
  final $Res Function(DSMInfoRequest) _then;

/// Create a copy of DSMInfoRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DSMInfoRequest].
extension DSMInfoRequestPatterns on DSMInfoRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DSMInfoRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DSMInfoRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DSMInfoRequest value)  $default,){
final _that = this;
switch (_that) {
case _DSMInfoRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DSMInfoRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DSMInfoRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DSMInfoRequest() when $default != null:
return $default(_that.api,_that.method,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version)  $default,) {final _that = this;
switch (_that) {
case _DSMInfoRequest():
return $default(_that.api,_that.method,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version)?  $default,) {final _that = this;
switch (_that) {
case _DSMInfoRequest() when $default != null:
return $default(_that.api,_that.method,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DSMInfoRequest extends DSMInfoRequest {
  const _DSMInfoRequest({required this.api, required this.method, required this.version}): super._();
  factory _DSMInfoRequest.fromJson(Map<String, dynamic> json) => _$DSMInfoRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;

/// Create a copy of DSMInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DSMInfoRequestCopyWith<_DSMInfoRequest> get copyWith => __$DSMInfoRequestCopyWithImpl<_DSMInfoRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DSMInfoRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DSMInfoRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version);

@override
String toString() {
  return 'DSMInfoRequest(api: $api, method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DSMInfoRequestCopyWith<$Res> implements $DSMInfoRequestCopyWith<$Res> {
  factory _$DSMInfoRequestCopyWith(_DSMInfoRequest value, $Res Function(_DSMInfoRequest) _then) = __$DSMInfoRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version
});




}
/// @nodoc
class __$DSMInfoRequestCopyWithImpl<$Res>
    implements _$DSMInfoRequestCopyWith<$Res> {
  __$DSMInfoRequestCopyWithImpl(this._self, this._then);

  final _DSMInfoRequest _self;
  final $Res Function(_DSMInfoRequest) _then;

/// Create a copy of DSMInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,}) {
  return _then(_DSMInfoRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DSMInfoResponse {

 bool get success; DSMInfoData? get data;
/// Create a copy of DSMInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DSMInfoResponseCopyWith<DSMInfoResponse> get copyWith => _$DSMInfoResponseCopyWithImpl<DSMInfoResponse>(this as DSMInfoResponse, _$identity);

  /// Serializes this DSMInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DSMInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'DSMInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $DSMInfoResponseCopyWith<$Res>  {
  factory $DSMInfoResponseCopyWith(DSMInfoResponse value, $Res Function(DSMInfoResponse) _then) = _$DSMInfoResponseCopyWithImpl;
@useResult
$Res call({
 bool success, DSMInfoData? data
});


$DSMInfoDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$DSMInfoResponseCopyWithImpl<$Res>
    implements $DSMInfoResponseCopyWith<$Res> {
  _$DSMInfoResponseCopyWithImpl(this._self, this._then);

  final DSMInfoResponse _self;
  final $Res Function(DSMInfoResponse) _then;

/// Create a copy of DSMInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DSMInfoData?,
  ));
}
/// Create a copy of DSMInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DSMInfoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DSMInfoDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DSMInfoResponse].
extension DSMInfoResponsePatterns on DSMInfoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DSMInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DSMInfoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DSMInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _DSMInfoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DSMInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DSMInfoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  DSMInfoData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DSMInfoResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  DSMInfoData? data)  $default,) {final _that = this;
switch (_that) {
case _DSMInfoResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  DSMInfoData? data)?  $default,) {final _that = this;
switch (_that) {
case _DSMInfoResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DSMInfoResponse extends DSMInfoResponse {
  const _DSMInfoResponse({required this.success, this.data}): super._();
  factory _DSMInfoResponse.fromJson(Map<String, dynamic> json) => _$DSMInfoResponseFromJson(json);

@override final  bool success;
@override final  DSMInfoData? data;

/// Create a copy of DSMInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DSMInfoResponseCopyWith<_DSMInfoResponse> get copyWith => __$DSMInfoResponseCopyWithImpl<_DSMInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DSMInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DSMInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'DSMInfoResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DSMInfoResponseCopyWith<$Res> implements $DSMInfoResponseCopyWith<$Res> {
  factory _$DSMInfoResponseCopyWith(_DSMInfoResponse value, $Res Function(_DSMInfoResponse) _then) = __$DSMInfoResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, DSMInfoData? data
});


@override $DSMInfoDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$DSMInfoResponseCopyWithImpl<$Res>
    implements _$DSMInfoResponseCopyWith<$Res> {
  __$DSMInfoResponseCopyWithImpl(this._self, this._then);

  final _DSMInfoResponse _self;
  final $Res Function(_DSMInfoResponse) _then;

/// Create a copy of DSMInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_DSMInfoResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DSMInfoData?,
  ));
}

/// Create a copy of DSMInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DSMInfoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DSMInfoDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
