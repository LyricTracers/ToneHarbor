// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongSelectionState {

 bool get selectionType; Set<String> get ids;
/// Create a copy of SongSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongSelectionStateCopyWith<SongSelectionState> get copyWith => _$SongSelectionStateCopyWithImpl<SongSelectionState>(this as SongSelectionState, _$identity);

  /// Serializes this SongSelectionState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongSelectionState&&(identical(other.selectionType, selectionType) || other.selectionType == selectionType)&&const DeepCollectionEquality().equals(other.ids, ids));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selectionType,const DeepCollectionEquality().hash(ids));

@override
String toString() {
  return 'SongSelectionState(selectionType: $selectionType, ids: $ids)';
}


}

/// @nodoc
abstract mixin class $SongSelectionStateCopyWith<$Res>  {
  factory $SongSelectionStateCopyWith(SongSelectionState value, $Res Function(SongSelectionState) _then) = _$SongSelectionStateCopyWithImpl;
@useResult
$Res call({
 bool selectionType, Set<String> ids
});




}
/// @nodoc
class _$SongSelectionStateCopyWithImpl<$Res>
    implements $SongSelectionStateCopyWith<$Res> {
  _$SongSelectionStateCopyWithImpl(this._self, this._then);

  final SongSelectionState _self;
  final $Res Function(SongSelectionState) _then;

/// Create a copy of SongSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectionType = null,Object? ids = null,}) {
  return _then(_self.copyWith(
selectionType: null == selectionType ? _self.selectionType : selectionType // ignore: cast_nullable_to_non_nullable
as bool,ids: null == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SongSelectionState].
extension SongSelectionStatePatterns on SongSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SongSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SongSelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SongSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _SongSelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SongSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _SongSelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool selectionType,  Set<String> ids)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SongSelectionState() when $default != null:
return $default(_that.selectionType,_that.ids);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool selectionType,  Set<String> ids)  $default,) {final _that = this;
switch (_that) {
case _SongSelectionState():
return $default(_that.selectionType,_that.ids);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool selectionType,  Set<String> ids)?  $default,) {final _that = this;
switch (_that) {
case _SongSelectionState() when $default != null:
return $default(_that.selectionType,_that.ids);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SongSelectionState extends SongSelectionState {
  const _SongSelectionState({required this.selectionType, required final  Set<String> ids}): _ids = ids,super._();
  factory _SongSelectionState.fromJson(Map<String, dynamic> json) => _$SongSelectionStateFromJson(json);

@override final  bool selectionType;
 final  Set<String> _ids;
@override Set<String> get ids {
  if (_ids is EqualUnmodifiableSetView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_ids);
}


/// Create a copy of SongSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongSelectionStateCopyWith<_SongSelectionState> get copyWith => __$SongSelectionStateCopyWithImpl<_SongSelectionState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongSelectionStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SongSelectionState&&(identical(other.selectionType, selectionType) || other.selectionType == selectionType)&&const DeepCollectionEquality().equals(other._ids, _ids));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selectionType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'SongSelectionState(selectionType: $selectionType, ids: $ids)';
}


}

/// @nodoc
abstract mixin class _$SongSelectionStateCopyWith<$Res> implements $SongSelectionStateCopyWith<$Res> {
  factory _$SongSelectionStateCopyWith(_SongSelectionState value, $Res Function(_SongSelectionState) _then) = __$SongSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool selectionType, Set<String> ids
});




}
/// @nodoc
class __$SongSelectionStateCopyWithImpl<$Res>
    implements _$SongSelectionStateCopyWith<$Res> {
  __$SongSelectionStateCopyWithImpl(this._self, this._then);

  final _SongSelectionState _self;
  final $Res Function(_SongSelectionState) _then;

/// Create a copy of SongSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectionType = null,Object? ids = null,}) {
  return _then(_SongSelectionState(
selectionType: null == selectionType ? _self.selectionType : selectionType // ignore: cast_nullable_to_non_nullable
as bool,ids: null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
