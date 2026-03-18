// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sorted_playlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SortedPlaylistState _$SortedPlaylistStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'data':
          return SortedPlaylistStateData.fromJson(
            json
          );
                case 'loading':
          return SortedPlaylistStateLoading.fromJson(
            json
          );
                case 'error':
          return SortedPlaylistStateError.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'SortedPlaylistState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SortedPlaylistState {



  /// Serializes this SortedPlaylistState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortedPlaylistState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SortedPlaylistState()';
}


}

/// @nodoc
class $SortedPlaylistStateCopyWith<$Res>  {
$SortedPlaylistStateCopyWith(SortedPlaylistState _, $Res Function(SortedPlaylistState) __);
}


/// Adds pattern-matching-related methods to [SortedPlaylistState].
extension SortedPlaylistStatePatterns on SortedPlaylistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SortedPlaylistStateData value)?  data,TResult Function( SortedPlaylistStateLoading value)?  loading,TResult Function( SortedPlaylistStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SortedPlaylistStateData() when data != null:
return data(_that);case SortedPlaylistStateLoading() when loading != null:
return loading(_that);case SortedPlaylistStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SortedPlaylistStateData value)  data,required TResult Function( SortedPlaylistStateLoading value)  loading,required TResult Function( SortedPlaylistStateError value)  error,}){
final _that = this;
switch (_that) {
case SortedPlaylistStateData():
return data(_that);case SortedPlaylistStateLoading():
return loading(_that);case SortedPlaylistStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SortedPlaylistStateData value)?  data,TResult? Function( SortedPlaylistStateLoading value)?  loading,TResult? Function( SortedPlaylistStateError value)?  error,}){
final _that = this;
switch (_that) {
case SortedPlaylistStateData() when data != null:
return data(_that);case SortedPlaylistStateLoading() when loading != null:
return loading(_that);case SortedPlaylistStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<PlaylistInfo> playlists,  int total,  int favoriteCount)?  data,TResult Function()?  loading,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SortedPlaylistStateData() when data != null:
return data(_that.playlists,_that.total,_that.favoriteCount);case SortedPlaylistStateLoading() when loading != null:
return loading();case SortedPlaylistStateError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<PlaylistInfo> playlists,  int total,  int favoriteCount)  data,required TResult Function()  loading,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case SortedPlaylistStateData():
return data(_that.playlists,_that.total,_that.favoriteCount);case SortedPlaylistStateLoading():
return loading();case SortedPlaylistStateError():
return error();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<PlaylistInfo> playlists,  int total,  int favoriteCount)?  data,TResult? Function()?  loading,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case SortedPlaylistStateData() when data != null:
return data(_that.playlists,_that.total,_that.favoriteCount);case SortedPlaylistStateLoading() when loading != null:
return loading();case SortedPlaylistStateError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SortedPlaylistStateData extends SortedPlaylistState {
   SortedPlaylistStateData({final  List<PlaylistInfo> playlists = const [], this.total = 0, this.favoriteCount = 0, final  String? $type}): _playlists = playlists,$type = $type ?? 'data',super._();
  factory SortedPlaylistStateData.fromJson(Map<String, dynamic> json) => _$SortedPlaylistStateDataFromJson(json);

 final  List<PlaylistInfo> _playlists;
@JsonKey() List<PlaylistInfo> get playlists {
  if (_playlists is EqualUnmodifiableListView) return _playlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlists);
}

@JsonKey() final  int total;
@JsonKey() final  int favoriteCount;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SortedPlaylistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortedPlaylistStateDataCopyWith<SortedPlaylistStateData> get copyWith => _$SortedPlaylistStateDataCopyWithImpl<SortedPlaylistStateData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SortedPlaylistStateDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortedPlaylistStateData&&const DeepCollectionEquality().equals(other._playlists, _playlists)&&(identical(other.total, total) || other.total == total)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playlists),total,favoriteCount);

@override
String toString() {
  return 'SortedPlaylistState.data(playlists: $playlists, total: $total, favoriteCount: $favoriteCount)';
}


}

/// @nodoc
abstract mixin class $SortedPlaylistStateDataCopyWith<$Res> implements $SortedPlaylistStateCopyWith<$Res> {
  factory $SortedPlaylistStateDataCopyWith(SortedPlaylistStateData value, $Res Function(SortedPlaylistStateData) _then) = _$SortedPlaylistStateDataCopyWithImpl;
@useResult
$Res call({
 List<PlaylistInfo> playlists, int total, int favoriteCount
});




}
/// @nodoc
class _$SortedPlaylistStateDataCopyWithImpl<$Res>
    implements $SortedPlaylistStateDataCopyWith<$Res> {
  _$SortedPlaylistStateDataCopyWithImpl(this._self, this._then);

  final SortedPlaylistStateData _self;
  final $Res Function(SortedPlaylistStateData) _then;

/// Create a copy of SortedPlaylistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? playlists = null,Object? total = null,Object? favoriteCount = null,}) {
  return _then(SortedPlaylistStateData(
playlists: null == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<PlaylistInfo>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SortedPlaylistStateLoading extends SortedPlaylistState {
  const SortedPlaylistStateLoading({final  String? $type}): $type = $type ?? 'loading',super._();
  factory SortedPlaylistStateLoading.fromJson(Map<String, dynamic> json) => _$SortedPlaylistStateLoadingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$SortedPlaylistStateLoadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortedPlaylistStateLoading);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SortedPlaylistState.loading()';
}


}




/// @nodoc
@JsonSerializable()

class SortedPlaylistStateError extends SortedPlaylistState {
  const SortedPlaylistStateError({final  String? $type}): $type = $type ?? 'error',super._();
  factory SortedPlaylistStateError.fromJson(Map<String, dynamic> json) => _$SortedPlaylistStateErrorFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$SortedPlaylistStateErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortedPlaylistStateError);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SortedPlaylistState.error()';
}


}




// dart format on
