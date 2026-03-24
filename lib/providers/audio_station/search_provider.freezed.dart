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

 SongListResponse? get songs; ArtistResponse? get artists; AlbumResponse? get albums;
/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MixSearchDataCopyWith<MixSearchData> get copyWith => _$MixSearchDataCopyWithImpl<MixSearchData>(this as MixSearchData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MixSearchData&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.artists, artists) || other.artists == artists)&&(identical(other.albums, albums) || other.albums == albums));
}


@override
int get hashCode => Object.hash(runtimeType,songs,artists,albums);

@override
String toString() {
  return 'MixSearchData(songs: $songs, artists: $artists, albums: $albums)';
}


}

/// @nodoc
abstract mixin class $MixSearchDataCopyWith<$Res>  {
  factory $MixSearchDataCopyWith(MixSearchData value, $Res Function(MixSearchData) _then) = _$MixSearchDataCopyWithImpl;
@useResult
$Res call({
 SongListResponse? songs, ArtistResponse? artists, AlbumResponse? albums
});


$SongListResponseCopyWith<$Res>? get songs;$ArtistResponseCopyWith<$Res>? get artists;$AlbumResponseCopyWith<$Res>? get albums;

}
/// @nodoc
class _$MixSearchDataCopyWithImpl<$Res>
    implements $MixSearchDataCopyWith<$Res> {
  _$MixSearchDataCopyWithImpl(this._self, this._then);

  final MixSearchData _self;
  final $Res Function(MixSearchData) _then;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? songs = freezed,Object? artists = freezed,Object? albums = freezed,}) {
  return _then(_self.copyWith(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MixSearchData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MixSearchData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MixSearchData value)  $default,){
final _that = this;
switch (_that) {
case _MixSearchData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MixSearchData value)?  $default,){
final _that = this;
switch (_that) {
case _MixSearchData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SongListResponse? songs,  ArtistResponse? artists,  AlbumResponse? albums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MixSearchData() when $default != null:
return $default(_that.songs,_that.artists,_that.albums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SongListResponse? songs,  ArtistResponse? artists,  AlbumResponse? albums)  $default,) {final _that = this;
switch (_that) {
case _MixSearchData():
return $default(_that.songs,_that.artists,_that.albums);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SongListResponse? songs,  ArtistResponse? artists,  AlbumResponse? albums)?  $default,) {final _that = this;
switch (_that) {
case _MixSearchData() when $default != null:
return $default(_that.songs,_that.artists,_that.albums);case _:
  return null;

}
}

}

/// @nodoc


class _MixSearchData implements MixSearchData {
  const _MixSearchData({this.songs, this.artists, this.albums});
  

@override final  SongListResponse? songs;
@override final  ArtistResponse? artists;
@override final  AlbumResponse? albums;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MixSearchDataCopyWith<_MixSearchData> get copyWith => __$MixSearchDataCopyWithImpl<_MixSearchData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MixSearchData&&(identical(other.songs, songs) || other.songs == songs)&&(identical(other.artists, artists) || other.artists == artists)&&(identical(other.albums, albums) || other.albums == albums));
}


@override
int get hashCode => Object.hash(runtimeType,songs,artists,albums);

@override
String toString() {
  return 'MixSearchData(songs: $songs, artists: $artists, albums: $albums)';
}


}

/// @nodoc
abstract mixin class _$MixSearchDataCopyWith<$Res> implements $MixSearchDataCopyWith<$Res> {
  factory _$MixSearchDataCopyWith(_MixSearchData value, $Res Function(_MixSearchData) _then) = __$MixSearchDataCopyWithImpl;
@override @useResult
$Res call({
 SongListResponse? songs, ArtistResponse? artists, AlbumResponse? albums
});


@override $SongListResponseCopyWith<$Res>? get songs;@override $ArtistResponseCopyWith<$Res>? get artists;@override $AlbumResponseCopyWith<$Res>? get albums;

}
/// @nodoc
class __$MixSearchDataCopyWithImpl<$Res>
    implements _$MixSearchDataCopyWith<$Res> {
  __$MixSearchDataCopyWithImpl(this._self, this._then);

  final _MixSearchData _self;
  final $Res Function(_MixSearchData) _then;

/// Create a copy of MixSearchData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? songs = freezed,Object? artists = freezed,Object? albums = freezed,}) {
  return _then(_MixSearchData(
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

// dart format on
