// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MixSearchData {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MixSearchData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MixSearchData()';
}


}

/// @nodoc
class $MixSearchDataCopyWith<$Res>  {
$MixSearchDataCopyWith(MixSearchData _, $Res Function(MixSearchData) __);
}


/// Adds pattern-matching-related methods to [MixSearchData].
extension MixSearchDataPatterns on MixSearchData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MixSearchDataLoading value)?  loading,TResult Function( _MixSearchDataLoaded value)?  loaded,TResult Function( _MixSearchDataError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MixSearchDataLoading() when loading != null:
return loading(_that);case _MixSearchDataLoaded() when loaded != null:
return loaded(_that);case _MixSearchDataError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MixSearchDataLoading value)  loading,required TResult Function( _MixSearchDataLoaded value)  loaded,required TResult Function( _MixSearchDataError value)  error,}){
final _that = this;
switch (_that) {
case _MixSearchDataLoading():
return loading(_that);case _MixSearchDataLoaded():
return loaded(_that);case _MixSearchDataError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MixSearchDataLoading value)?  loading,TResult? Function( _MixSearchDataLoaded value)?  loaded,TResult? Function( _MixSearchDataError value)?  error,}){
final _that = this;
switch (_that) {
case _MixSearchDataLoading() when loading != null:
return loading(_that);case _MixSearchDataLoaded() when loaded != null:
return loaded(_that);case _MixSearchDataError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( SongListResponse? songs,  ArtistResponse? artists,  AlbumResponse? albums)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MixSearchDataLoading() when loading != null:
return loading();case _MixSearchDataLoaded() when loaded != null:
return loaded(_that.songs,_that.artists,_that.albums);case _MixSearchDataError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( SongListResponse? songs,  ArtistResponse? artists,  AlbumResponse? albums)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _MixSearchDataLoading():
return loading();case _MixSearchDataLoaded():
return loaded(_that.songs,_that.artists,_that.albums);case _MixSearchDataError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( SongListResponse? songs,  ArtistResponse? artists,  AlbumResponse? albums)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _MixSearchDataLoading() when loading != null:
return loading();case _MixSearchDataLoaded() when loaded != null:
return loaded(_that.songs,_that.artists,_that.albums);case _MixSearchDataError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _MixSearchDataLoading implements MixSearchData {
  const _MixSearchDataLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MixSearchDataLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MixSearchData.loading()';
}


}




/// @nodoc


class _MixSearchDataLoaded implements MixSearchData {
  const _MixSearchDataLoaded({this.songs, this.artists, this.albums});
  

 final  SongListResponse? songs;
 final  ArtistResponse? artists;
 final  AlbumResponse? albums;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MixSearchDataLoadedCopyWith<_MixSearchDataLoaded> get copyWith => __$MixSearchDataLoadedCopyWithImpl<_MixSearchDataLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MixSearchDataLoaded&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.artists, artists) || other.artists == artists)&&(identical(other.albums, albums) || other.albums == albums));
}


@override
int get hashCode => Object.hash(runtimeType,songs,artists,albums);

@override
String toString() {
  return 'MixSearchData.loaded(songs: $songs, artists: $artists, albums: $albums)';
}


}

/// @nodoc
abstract mixin class _$MixSearchDataLoadedCopyWith<$Res> implements $MixSearchDataCopyWith<$Res> {
  factory _$MixSearchDataLoadedCopyWith(_MixSearchDataLoaded value, $Res Function(_MixSearchDataLoaded) _then) = __$MixSearchDataLoadedCopyWithImpl;
@useResult
$Res call({
 SongListResponse? songs, ArtistResponse? artists, AlbumResponse? albums
});


$SongListResponseCopyWith<$Res>? get songs;$ArtistResponseCopyWith<$Res>? get artists;$AlbumResponseCopyWith<$Res>? get albums;

}
/// @nodoc
class __$MixSearchDataLoadedCopyWithImpl<$Res>
    implements _$MixSearchDataLoadedCopyWith<$Res> {
  __$MixSearchDataLoadedCopyWithImpl(this._self, this._then);

  final _MixSearchDataLoaded _self;
  final $Res Function(_MixSearchDataLoaded) _then;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? songs = freezed,Object? artists = freezed,Object? albums = freezed,}) {
  return _then(_MixSearchDataLoaded(
songs: freezed == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as SongListResponse?,artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as ArtistResponse?,albums: freezed == albums ? _self.albums : albums // ignore: cast_nullable_to_non_nullable
as AlbumResponse?,
  ));
}

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongListResponseCopyWith<$Res>? get songs {
    if (_self.songs == null) {
    return null;
  }

  return $SongListResponseCopyWith<$Res>(_self.songs!, (value) {
    return _then(_self.copyWith(songs: value));
  });
}/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtistResponseCopyWith<$Res>? get artists {
    if (_self.artists == null) {
    return null;
  }

  return $ArtistResponseCopyWith<$Res>(_self.artists!, (value) {
    return _then(_self.copyWith(artists: value));
  });
}/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumResponseCopyWith<$Res>? get albums {
    if (_self.albums == null) {
    return null;
  }

  return $AlbumResponseCopyWith<$Res>(_self.albums!, (value) {
    return _then(_self.copyWith(albums: value));
  });
}
}

/// @nodoc


class _MixSearchDataError implements MixSearchData {
  const _MixSearchDataError(this.message);
  

 final  String message;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MixSearchDataErrorCopyWith<_MixSearchDataError> get copyWith => __$MixSearchDataErrorCopyWithImpl<_MixSearchDataError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MixSearchDataError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MixSearchData.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$MixSearchDataErrorCopyWith<$Res> implements $MixSearchDataCopyWith<$Res> {
  factory _$MixSearchDataErrorCopyWith(_MixSearchDataError value, $Res Function(_MixSearchDataError) _then) = __$MixSearchDataErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$MixSearchDataErrorCopyWithImpl<$Res>
    implements _$MixSearchDataErrorCopyWith<$Res> {
  __$MixSearchDataErrorCopyWithImpl(this._self, this._then);

  final _MixSearchDataError _self;
  final $Res Function(_MixSearchDataError) _then;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_MixSearchDataError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
