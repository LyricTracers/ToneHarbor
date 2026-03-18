// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_playlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoritePlaylistState {

 List<FavoritePlaylistItem> get playlists;
/// Create a copy of FavoritePlaylistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritePlaylistStateCopyWith<FavoritePlaylistState> get copyWith => _$FavoritePlaylistStateCopyWithImpl<FavoritePlaylistState>(this as FavoritePlaylistState, _$identity);

  /// Serializes this FavoritePlaylistState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritePlaylistState&&const DeepCollectionEquality().equals(other.playlists, playlists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(playlists));

@override
String toString() {
  return 'FavoritePlaylistState(playlists: $playlists)';
}


}

/// @nodoc
abstract mixin class $FavoritePlaylistStateCopyWith<$Res>  {
  factory $FavoritePlaylistStateCopyWith(FavoritePlaylistState value, $Res Function(FavoritePlaylistState) _then) = _$FavoritePlaylistStateCopyWithImpl;
@useResult
$Res call({
 List<FavoritePlaylistItem> playlists
});




}
/// @nodoc
class _$FavoritePlaylistStateCopyWithImpl<$Res>
    implements $FavoritePlaylistStateCopyWith<$Res> {
  _$FavoritePlaylistStateCopyWithImpl(this._self, this._then);

  final FavoritePlaylistState _self;
  final $Res Function(FavoritePlaylistState) _then;

/// Create a copy of FavoritePlaylistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlists = null,}) {
  return _then(_self.copyWith(
playlists: null == playlists ? _self.playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<FavoritePlaylistItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoritePlaylistState].
extension FavoritePlaylistStatePatterns on FavoritePlaylistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritePlaylistState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritePlaylistState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritePlaylistState value)  $default,){
final _that = this;
switch (_that) {
case _FavoritePlaylistState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritePlaylistState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritePlaylistState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FavoritePlaylistItem> playlists)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritePlaylistState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FavoritePlaylistItem> playlists)  $default,) {final _that = this;
switch (_that) {
case _FavoritePlaylistState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FavoritePlaylistItem> playlists)?  $default,) {final _that = this;
switch (_that) {
case _FavoritePlaylistState() when $default != null:
return $default(_that.playlists);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoritePlaylistState extends FavoritePlaylistState {
  const _FavoritePlaylistState({required final  List<FavoritePlaylistItem> playlists}): _playlists = playlists,super._();
  factory _FavoritePlaylistState.fromJson(Map<String, dynamic> json) => _$FavoritePlaylistStateFromJson(json);

 final  List<FavoritePlaylistItem> _playlists;
@override List<FavoritePlaylistItem> get playlists {
  if (_playlists is EqualUnmodifiableListView) return _playlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlists);
}


/// Create a copy of FavoritePlaylistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritePlaylistStateCopyWith<_FavoritePlaylistState> get copyWith => __$FavoritePlaylistStateCopyWithImpl<_FavoritePlaylistState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoritePlaylistStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritePlaylistState&&const DeepCollectionEquality().equals(other._playlists, _playlists));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_playlists));

@override
String toString() {
  return 'FavoritePlaylistState(playlists: $playlists)';
}


}

/// @nodoc
abstract mixin class _$FavoritePlaylistStateCopyWith<$Res> implements $FavoritePlaylistStateCopyWith<$Res> {
  factory _$FavoritePlaylistStateCopyWith(_FavoritePlaylistState value, $Res Function(_FavoritePlaylistState) _then) = __$FavoritePlaylistStateCopyWithImpl;
@override @useResult
$Res call({
 List<FavoritePlaylistItem> playlists
});




}
/// @nodoc
class __$FavoritePlaylistStateCopyWithImpl<$Res>
    implements _$FavoritePlaylistStateCopyWith<$Res> {
  __$FavoritePlaylistStateCopyWithImpl(this._self, this._then);

  final _FavoritePlaylistState _self;
  final $Res Function(_FavoritePlaylistState) _then;

/// Create a copy of FavoritePlaylistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlists = null,}) {
  return _then(_FavoritePlaylistState(
playlists: null == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<FavoritePlaylistItem>,
  ));
}


}


/// @nodoc
mixin _$FavoritePlaylistItem {

 String get playlistId; String get title;
/// Create a copy of FavoritePlaylistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritePlaylistItemCopyWith<FavoritePlaylistItem> get copyWith => _$FavoritePlaylistItemCopyWithImpl<FavoritePlaylistItem>(this as FavoritePlaylistItem, _$identity);

  /// Serializes this FavoritePlaylistItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritePlaylistItem&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playlistId,title);

@override
String toString() {
  return 'FavoritePlaylistItem(playlistId: $playlistId, title: $title)';
}


}

/// @nodoc
abstract mixin class $FavoritePlaylistItemCopyWith<$Res>  {
  factory $FavoritePlaylistItemCopyWith(FavoritePlaylistItem value, $Res Function(FavoritePlaylistItem) _then) = _$FavoritePlaylistItemCopyWithImpl;
@useResult
$Res call({
 String playlistId, String title
});




}
/// @nodoc
class _$FavoritePlaylistItemCopyWithImpl<$Res>
    implements $FavoritePlaylistItemCopyWith<$Res> {
  _$FavoritePlaylistItemCopyWithImpl(this._self, this._then);

  final FavoritePlaylistItem _self;
  final $Res Function(FavoritePlaylistItem) _then;

/// Create a copy of FavoritePlaylistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playlistId = null,Object? title = null,}) {
  return _then(_self.copyWith(
playlistId: null == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoritePlaylistItem].
extension FavoritePlaylistItemPatterns on FavoritePlaylistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritePlaylistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritePlaylistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritePlaylistItem value)  $default,){
final _that = this;
switch (_that) {
case _FavoritePlaylistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritePlaylistItem value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritePlaylistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playlistId,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritePlaylistItem() when $default != null:
return $default(_that.playlistId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playlistId,  String title)  $default,) {final _that = this;
switch (_that) {
case _FavoritePlaylistItem():
return $default(_that.playlistId,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playlistId,  String title)?  $default,) {final _that = this;
switch (_that) {
case _FavoritePlaylistItem() when $default != null:
return $default(_that.playlistId,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoritePlaylistItem implements FavoritePlaylistItem {
  const _FavoritePlaylistItem({required this.playlistId, required this.title});
  factory _FavoritePlaylistItem.fromJson(Map<String, dynamic> json) => _$FavoritePlaylistItemFromJson(json);

@override final  String playlistId;
@override final  String title;

/// Create a copy of FavoritePlaylistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritePlaylistItemCopyWith<_FavoritePlaylistItem> get copyWith => __$FavoritePlaylistItemCopyWithImpl<_FavoritePlaylistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoritePlaylistItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritePlaylistItem&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playlistId,title);

@override
String toString() {
  return 'FavoritePlaylistItem(playlistId: $playlistId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$FavoritePlaylistItemCopyWith<$Res> implements $FavoritePlaylistItemCopyWith<$Res> {
  factory _$FavoritePlaylistItemCopyWith(_FavoritePlaylistItem value, $Res Function(_FavoritePlaylistItem) _then) = __$FavoritePlaylistItemCopyWithImpl;
@override @useResult
$Res call({
 String playlistId, String title
});




}
/// @nodoc
class __$FavoritePlaylistItemCopyWithImpl<$Res>
    implements _$FavoritePlaylistItemCopyWith<$Res> {
  __$FavoritePlaylistItemCopyWithImpl(this._self, this._then);

  final _FavoritePlaylistItem _self;
  final $Res Function(_FavoritePlaylistItem) _then;

/// Create a copy of FavoritePlaylistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playlistId = null,Object? title = null,}) {
  return _then(_FavoritePlaylistItem(
playlistId: null == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
