// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioPlayerState {

 bool get playing; PlaylistMode get loopMode; bool get shuffled; int get currentIndex; List<ToneHarborTrackObject> get tracks;
/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioPlayerStateCopyWith<AudioPlayerState> get copyWith => _$AudioPlayerStateCopyWithImpl<AudioPlayerState>(this as AudioPlayerState, _$identity);

  /// Serializes this AudioPlayerState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioPlayerState&&(identical(other.playing, playing) || other.playing == playing)&&(identical(other.loopMode, loopMode) || other.loopMode == loopMode)&&(identical(other.shuffled, shuffled) || other.shuffled == shuffled)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other.tracks, tracks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playing,loopMode,shuffled,currentIndex,const DeepCollectionEquality().hash(tracks));

@override
String toString() {
  return 'AudioPlayerState(playing: $playing, loopMode: $loopMode, shuffled: $shuffled, currentIndex: $currentIndex, tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class $AudioPlayerStateCopyWith<$Res>  {
  factory $AudioPlayerStateCopyWith(AudioPlayerState value, $Res Function(AudioPlayerState) _then) = _$AudioPlayerStateCopyWithImpl;
@useResult
$Res call({
 bool playing, PlaylistMode loopMode, bool shuffled, int currentIndex, List<ToneHarborTrackObject> tracks
});




}
/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final AudioPlayerState _self;
  final $Res Function(AudioPlayerState) _then;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playing = null,Object? loopMode = null,Object? shuffled = null,Object? currentIndex = null,Object? tracks = null,}) {
  return _then(_self.copyWith(
playing: null == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as bool,loopMode: null == loopMode ? _self.loopMode : loopMode // ignore: cast_nullable_to_non_nullable
as PlaylistMode,shuffled: null == shuffled ? _self.shuffled : shuffled // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<ToneHarborTrackObject>,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioPlayerState].
extension AudioPlayerStatePatterns on AudioPlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AudioPlayerState value)?  inner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioPlayerState() when inner != null:
return inner(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AudioPlayerState value)  inner,}){
final _that = this;
switch (_that) {
case _AudioPlayerState():
return inner(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AudioPlayerState value)?  inner,}){
final _that = this;
switch (_that) {
case _AudioPlayerState() when inner != null:
return inner(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool playing,  PlaylistMode loopMode,  bool shuffled,  int currentIndex,  List<ToneHarborTrackObject> tracks)?  inner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioPlayerState() when inner != null:
return inner(_that.playing,_that.loopMode,_that.shuffled,_that.currentIndex,_that.tracks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool playing,  PlaylistMode loopMode,  bool shuffled,  int currentIndex,  List<ToneHarborTrackObject> tracks)  inner,}) {final _that = this;
switch (_that) {
case _AudioPlayerState():
return inner(_that.playing,_that.loopMode,_that.shuffled,_that.currentIndex,_that.tracks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool playing,  PlaylistMode loopMode,  bool shuffled,  int currentIndex,  List<ToneHarborTrackObject> tracks)?  inner,}) {final _that = this;
switch (_that) {
case _AudioPlayerState() when inner != null:
return inner(_that.playing,_that.loopMode,_that.shuffled,_that.currentIndex,_that.tracks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioPlayerState extends AudioPlayerState {
   _AudioPlayerState({required this.playing, required this.loopMode, required this.shuffled, this.currentIndex = 0, final  List<ToneHarborTrackObject> tracks = const []}): _tracks = tracks,super._();
  factory _AudioPlayerState.fromJson(Map<String, dynamic> json) => _$AudioPlayerStateFromJson(json);

@override final  bool playing;
@override final  PlaylistMode loopMode;
@override final  bool shuffled;
@override@JsonKey() final  int currentIndex;
 final  List<ToneHarborTrackObject> _tracks;
@override@JsonKey() List<ToneHarborTrackObject> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}


/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioPlayerStateCopyWith<_AudioPlayerState> get copyWith => __$AudioPlayerStateCopyWithImpl<_AudioPlayerState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioPlayerStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioPlayerState&&(identical(other.playing, playing) || other.playing == playing)&&(identical(other.loopMode, loopMode) || other.loopMode == loopMode)&&(identical(other.shuffled, shuffled) || other.shuffled == shuffled)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other._tracks, _tracks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playing,loopMode,shuffled,currentIndex,const DeepCollectionEquality().hash(_tracks));

@override
String toString() {
  return 'AudioPlayerState.inner(playing: $playing, loopMode: $loopMode, shuffled: $shuffled, currentIndex: $currentIndex, tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class _$AudioPlayerStateCopyWith<$Res> implements $AudioPlayerStateCopyWith<$Res> {
  factory _$AudioPlayerStateCopyWith(_AudioPlayerState value, $Res Function(_AudioPlayerState) _then) = __$AudioPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 bool playing, PlaylistMode loopMode, bool shuffled, int currentIndex, List<ToneHarborTrackObject> tracks
});




}
/// @nodoc
class __$AudioPlayerStateCopyWithImpl<$Res>
    implements _$AudioPlayerStateCopyWith<$Res> {
  __$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final _AudioPlayerState _self;
  final $Res Function(_AudioPlayerState) _then;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playing = null,Object? loopMode = null,Object? shuffled = null,Object? currentIndex = null,Object? tracks = null,}) {
  return _then(_AudioPlayerState(
playing: null == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as bool,loopMode: null == loopMode ? _self.loopMode : loopMode // ignore: cast_nullable_to_non_nullable
as PlaylistMode,shuffled: null == shuffled ? _self.shuffled : shuffled // ignore: cast_nullable_to_non_nullable
as bool,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<ToneHarborTrackObject>,
  ));
}


}

// dart format on
