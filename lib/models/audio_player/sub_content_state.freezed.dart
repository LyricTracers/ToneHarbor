// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubContentData {

 SubContentType get type; String? get extra;
/// Create a copy of SubContentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubContentDataCopyWith<SubContentData> get copyWith => _$SubContentDataCopyWithImpl<SubContentData>(this as SubContentData, _$identity);

  /// Serializes this SubContentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubContentData&&(identical(other.type, type) || other.type == type)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,extra);

@override
String toString() {
  return 'SubContentData(type: $type, extra: $extra)';
}


}

/// @nodoc
abstract mixin class $SubContentDataCopyWith<$Res>  {
  factory $SubContentDataCopyWith(SubContentData value, $Res Function(SubContentData) _then) = _$SubContentDataCopyWithImpl;
@useResult
$Res call({
 SubContentType type, String? extra
});




}
/// @nodoc
class _$SubContentDataCopyWithImpl<$Res>
    implements $SubContentDataCopyWith<$Res> {
  _$SubContentDataCopyWithImpl(this._self, this._then);

  final SubContentData _self;
  final $Res Function(SubContentData) _then;

/// Create a copy of SubContentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? extra = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SubContentType,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubContentData].
extension SubContentDataPatterns on SubContentData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubContentData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubContentData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubContentData value)  $default,){
final _that = this;
switch (_that) {
case _SubContentData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubContentData value)?  $default,){
final _that = this;
switch (_that) {
case _SubContentData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubContentType type,  String? extra)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubContentData() when $default != null:
return $default(_that.type,_that.extra);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubContentType type,  String? extra)  $default,) {final _that = this;
switch (_that) {
case _SubContentData():
return $default(_that.type,_that.extra);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubContentType type,  String? extra)?  $default,) {final _that = this;
switch (_that) {
case _SubContentData() when $default != null:
return $default(_that.type,_that.extra);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubContentData extends SubContentData {
  const _SubContentData({required this.type, this.extra}): super._();
  factory _SubContentData.fromJson(Map<String, dynamic> json) => _$SubContentDataFromJson(json);

@override final  SubContentType type;
@override final  String? extra;

/// Create a copy of SubContentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubContentDataCopyWith<_SubContentData> get copyWith => __$SubContentDataCopyWithImpl<_SubContentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubContentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubContentData&&(identical(other.type, type) || other.type == type)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,extra);

@override
String toString() {
  return 'SubContentData(type: $type, extra: $extra)';
}


}

/// @nodoc
abstract mixin class _$SubContentDataCopyWith<$Res> implements $SubContentDataCopyWith<$Res> {
  factory _$SubContentDataCopyWith(_SubContentData value, $Res Function(_SubContentData) _then) = __$SubContentDataCopyWithImpl;
@override @useResult
$Res call({
 SubContentType type, String? extra
});




}
/// @nodoc
class __$SubContentDataCopyWithImpl<$Res>
    implements _$SubContentDataCopyWith<$Res> {
  __$SubContentDataCopyWithImpl(this._self, this._then);

  final _SubContentData _self;
  final $Res Function(_SubContentData) _then;

/// Create a copy of SubContentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? extra = freezed,}) {
  return _then(_SubContentData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SubContentType,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
