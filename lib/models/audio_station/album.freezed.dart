// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvgRating {

 int? get rating;
/// Create a copy of AvgRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvgRatingCopyWith<AvgRating> get copyWith => _$AvgRatingCopyWithImpl<AvgRating>(this as AvgRating, _$identity);

  /// Serializes this AvgRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvgRating&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating);

@override
String toString() {
  return 'AvgRating(rating: $rating)';
}


}

/// @nodoc
abstract mixin class $AvgRatingCopyWith<$Res>  {
  factory $AvgRatingCopyWith(AvgRating value, $Res Function(AvgRating) _then) = _$AvgRatingCopyWithImpl;
@useResult
$Res call({
 int? rating
});




}
/// @nodoc
class _$AvgRatingCopyWithImpl<$Res>
    implements $AvgRatingCopyWith<$Res> {
  _$AvgRatingCopyWithImpl(this._self, this._then);

  final AvgRating _self;
  final $Res Function(AvgRating) _then;

/// Create a copy of AvgRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rating = freezed,}) {
  return _then(_self.copyWith(
rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvgRating].
extension AvgRatingPatterns on AvgRating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvgRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvgRating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvgRating value)  $default,){
final _that = this;
switch (_that) {
case _AvgRating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvgRating value)?  $default,){
final _that = this;
switch (_that) {
case _AvgRating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvgRating() when $default != null:
return $default(_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? rating)  $default,) {final _that = this;
switch (_that) {
case _AvgRating():
return $default(_that.rating);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? rating)?  $default,) {final _that = this;
switch (_that) {
case _AvgRating() when $default != null:
return $default(_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvgRating extends AvgRating {
  const _AvgRating({this.rating}): super._();
  factory _AvgRating.fromJson(Map<String, dynamic> json) => _$AvgRatingFromJson(json);

@override final  int? rating;

/// Create a copy of AvgRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvgRatingCopyWith<_AvgRating> get copyWith => __$AvgRatingCopyWithImpl<_AvgRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvgRatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvgRating&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rating);

@override
String toString() {
  return 'AvgRating(rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$AvgRatingCopyWith<$Res> implements $AvgRatingCopyWith<$Res> {
  factory _$AvgRatingCopyWith(_AvgRating value, $Res Function(_AvgRating) _then) = __$AvgRatingCopyWithImpl;
@override @useResult
$Res call({
 int? rating
});




}
/// @nodoc
class __$AvgRatingCopyWithImpl<$Res>
    implements _$AvgRatingCopyWith<$Res> {
  __$AvgRatingCopyWithImpl(this._self, this._then);

  final _AvgRating _self;
  final $Res Function(_AvgRating) _then;

/// Create a copy of AvgRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rating = freezed,}) {
  return _then(_AvgRating(
rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AlbumAdditional {

@JsonKey(name: 'avg_rating') AvgRating? get avgRating;
/// Create a copy of AlbumAdditional
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumAdditionalCopyWith<AlbumAdditional> get copyWith => _$AlbumAdditionalCopyWithImpl<AlbumAdditional>(this as AlbumAdditional, _$identity);

  /// Serializes this AlbumAdditional to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumAdditional&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avgRating);

@override
String toString() {
  return 'AlbumAdditional(avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class $AlbumAdditionalCopyWith<$Res>  {
  factory $AlbumAdditionalCopyWith(AlbumAdditional value, $Res Function(AlbumAdditional) _then) = _$AlbumAdditionalCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'avg_rating') AvgRating? avgRating
});


$AvgRatingCopyWith<$Res>? get avgRating;

}
/// @nodoc
class _$AlbumAdditionalCopyWithImpl<$Res>
    implements $AlbumAdditionalCopyWith<$Res> {
  _$AlbumAdditionalCopyWithImpl(this._self, this._then);

  final AlbumAdditional _self;
  final $Res Function(AlbumAdditional) _then;

/// Create a copy of AlbumAdditional
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avgRating = freezed,}) {
  return _then(_self.copyWith(
avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as AvgRating?,
  ));
}
/// Create a copy of AlbumAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AvgRatingCopyWith<$Res>? get avgRating {
    if (_self.avgRating == null) {
    return null;
  }

  return $AvgRatingCopyWith<$Res>(_self.avgRating!, (value) {
    return _then(_self.copyWith(avgRating: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlbumAdditional].
extension AlbumAdditionalPatterns on AlbumAdditional {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumAdditional value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumAdditional() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumAdditional value)  $default,){
final _that = this;
switch (_that) {
case _AlbumAdditional():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumAdditional value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumAdditional() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'avg_rating')  AvgRating? avgRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumAdditional() when $default != null:
return $default(_that.avgRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'avg_rating')  AvgRating? avgRating)  $default,) {final _that = this;
switch (_that) {
case _AlbumAdditional():
return $default(_that.avgRating);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'avg_rating')  AvgRating? avgRating)?  $default,) {final _that = this;
switch (_that) {
case _AlbumAdditional() when $default != null:
return $default(_that.avgRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlbumAdditional extends AlbumAdditional {
  const _AlbumAdditional({@JsonKey(name: 'avg_rating') this.avgRating}): super._();
  factory _AlbumAdditional.fromJson(Map<String, dynamic> json) => _$AlbumAdditionalFromJson(json);

@override@JsonKey(name: 'avg_rating') final  AvgRating? avgRating;

/// Create a copy of AlbumAdditional
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumAdditionalCopyWith<_AlbumAdditional> get copyWith => __$AlbumAdditionalCopyWithImpl<_AlbumAdditional>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumAdditionalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumAdditional&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avgRating);

@override
String toString() {
  return 'AlbumAdditional(avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class _$AlbumAdditionalCopyWith<$Res> implements $AlbumAdditionalCopyWith<$Res> {
  factory _$AlbumAdditionalCopyWith(_AlbumAdditional value, $Res Function(_AlbumAdditional) _then) = __$AlbumAdditionalCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'avg_rating') AvgRating? avgRating
});


@override $AvgRatingCopyWith<$Res>? get avgRating;

}
/// @nodoc
class __$AlbumAdditionalCopyWithImpl<$Res>
    implements _$AlbumAdditionalCopyWith<$Res> {
  __$AlbumAdditionalCopyWithImpl(this._self, this._then);

  final _AlbumAdditional _self;
  final $Res Function(_AlbumAdditional) _then;

/// Create a copy of AlbumAdditional
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avgRating = freezed,}) {
  return _then(_AlbumAdditional(
avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as AvgRating?,
  ));
}

/// Create a copy of AlbumAdditional
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AvgRatingCopyWith<$Res>? get avgRating {
    if (_self.avgRating == null) {
    return null;
  }

  return $AvgRatingCopyWith<$Res>(_self.avgRating!, (value) {
    return _then(_self.copyWith(avgRating: value));
  });
}
}


/// @nodoc
mixin _$AlbumItem {

 AlbumAdditional? get additional;@JsonKey(name: 'album_artist') String? get albumArtist; String? get artist;@JsonKey(name: 'display_artist') String? get displayArtist; String? get name; int? get year;
/// Create a copy of AlbumItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumItemCopyWith<AlbumItem> get copyWith => _$AlbumItemCopyWithImpl<AlbumItem>(this as AlbumItem, _$identity);

  /// Serializes this AlbumItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumItem&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.displayArtist, displayArtist) || other.displayArtist == displayArtist)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,additional,albumArtist,artist,displayArtist,name,year);

@override
String toString() {
  return 'AlbumItem(additional: $additional, albumArtist: $albumArtist, artist: $artist, displayArtist: $displayArtist, name: $name, year: $year)';
}


}

/// @nodoc
abstract mixin class $AlbumItemCopyWith<$Res>  {
  factory $AlbumItemCopyWith(AlbumItem value, $Res Function(AlbumItem) _then) = _$AlbumItemCopyWithImpl;
@useResult
$Res call({
 AlbumAdditional? additional,@JsonKey(name: 'album_artist') String? albumArtist, String? artist,@JsonKey(name: 'display_artist') String? displayArtist, String? name, int? year
});


$AlbumAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class _$AlbumItemCopyWithImpl<$Res>
    implements $AlbumItemCopyWith<$Res> {
  _$AlbumItemCopyWithImpl(this._self, this._then);

  final AlbumItem _self;
  final $Res Function(AlbumItem) _then;

/// Create a copy of AlbumItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? additional = freezed,Object? albumArtist = freezed,Object? artist = freezed,Object? displayArtist = freezed,Object? name = freezed,Object? year = freezed,}) {
  return _then(_self.copyWith(
additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as AlbumAdditional?,albumArtist: freezed == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,displayArtist: freezed == displayArtist ? _self.displayArtist : displayArtist // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AlbumItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $AlbumAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlbumItem].
extension AlbumItemPatterns on AlbumItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumItem value)  $default,){
final _that = this;
switch (_that) {
case _AlbumItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumItem value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AlbumAdditional? additional, @JsonKey(name: 'album_artist')  String? albumArtist,  String? artist, @JsonKey(name: 'display_artist')  String? displayArtist,  String? name,  int? year)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumItem() when $default != null:
return $default(_that.additional,_that.albumArtist,_that.artist,_that.displayArtist,_that.name,_that.year);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AlbumAdditional? additional, @JsonKey(name: 'album_artist')  String? albumArtist,  String? artist, @JsonKey(name: 'display_artist')  String? displayArtist,  String? name,  int? year)  $default,) {final _that = this;
switch (_that) {
case _AlbumItem():
return $default(_that.additional,_that.albumArtist,_that.artist,_that.displayArtist,_that.name,_that.year);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AlbumAdditional? additional, @JsonKey(name: 'album_artist')  String? albumArtist,  String? artist, @JsonKey(name: 'display_artist')  String? displayArtist,  String? name,  int? year)?  $default,) {final _that = this;
switch (_that) {
case _AlbumItem() when $default != null:
return $default(_that.additional,_that.albumArtist,_that.artist,_that.displayArtist,_that.name,_that.year);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlbumItem extends AlbumItem {
  const _AlbumItem({this.additional, @JsonKey(name: 'album_artist') this.albumArtist, this.artist, @JsonKey(name: 'display_artist') this.displayArtist, this.name, this.year}): super._();
  factory _AlbumItem.fromJson(Map<String, dynamic> json) => _$AlbumItemFromJson(json);

@override final  AlbumAdditional? additional;
@override@JsonKey(name: 'album_artist') final  String? albumArtist;
@override final  String? artist;
@override@JsonKey(name: 'display_artist') final  String? displayArtist;
@override final  String? name;
@override final  int? year;

/// Create a copy of AlbumItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumItemCopyWith<_AlbumItem> get copyWith => __$AlbumItemCopyWithImpl<_AlbumItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumItem&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.albumArtist, albumArtist) || other.albumArtist == albumArtist)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.displayArtist, displayArtist) || other.displayArtist == displayArtist)&&(identical(other.name, name) || other.name == name)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,additional,albumArtist,artist,displayArtist,name,year);

@override
String toString() {
  return 'AlbumItem(additional: $additional, albumArtist: $albumArtist, artist: $artist, displayArtist: $displayArtist, name: $name, year: $year)';
}


}

/// @nodoc
abstract mixin class _$AlbumItemCopyWith<$Res> implements $AlbumItemCopyWith<$Res> {
  factory _$AlbumItemCopyWith(_AlbumItem value, $Res Function(_AlbumItem) _then) = __$AlbumItemCopyWithImpl;
@override @useResult
$Res call({
 AlbumAdditional? additional,@JsonKey(name: 'album_artist') String? albumArtist, String? artist,@JsonKey(name: 'display_artist') String? displayArtist, String? name, int? year
});


@override $AlbumAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class __$AlbumItemCopyWithImpl<$Res>
    implements _$AlbumItemCopyWith<$Res> {
  __$AlbumItemCopyWithImpl(this._self, this._then);

  final _AlbumItem _self;
  final $Res Function(_AlbumItem) _then;

/// Create a copy of AlbumItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? additional = freezed,Object? albumArtist = freezed,Object? artist = freezed,Object? displayArtist = freezed,Object? name = freezed,Object? year = freezed,}) {
  return _then(_AlbumItem(
additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as AlbumAdditional?,albumArtist: freezed == albumArtist ? _self.albumArtist : albumArtist // ignore: cast_nullable_to_non_nullable
as String?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,displayArtist: freezed == displayArtist ? _self.displayArtist : displayArtist // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AlbumItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $AlbumAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// @nodoc
mixin _$AlbumRequest {

 String get api; String get method; int get limit; String get library; String get additional;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection; int get offset; int get version; String? get artist;
/// Create a copy of AlbumRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumRequestCopyWith<AlbumRequest> get copyWith => _$AlbumRequestCopyWithImpl<AlbumRequest>(this as AlbumRequest, _$identity);

  /// Serializes this AlbumRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.version, version) || other.version == version)&&(identical(other.artist, artist) || other.artist == artist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,additional,sortBy,sortDirection,offset,version,artist);

@override
String toString() {
  return 'AlbumRequest(api: $api, method: $method, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, version: $version, artist: $artist)';
}


}

/// @nodoc
abstract mixin class $AlbumRequestCopyWith<$Res>  {
  factory $AlbumRequestCopyWith(AlbumRequest value, $Res Function(AlbumRequest) _then) = _$AlbumRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, int version, String? artist
});




}
/// @nodoc
class _$AlbumRequestCopyWithImpl<$Res>
    implements $AlbumRequestCopyWith<$Res> {
  _$AlbumRequestCopyWithImpl(this._self, this._then);

  final AlbumRequest _self;
  final $Res Function(AlbumRequest) _then;

/// Create a copy of AlbumRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? version = null,Object? artist = freezed,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlbumRequest].
extension AlbumRequestPatterns on AlbumRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumRequest value)  $default,){
final _that = this;
switch (_that) {
case _AlbumRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version,  String? artist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version,_that.artist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version,  String? artist)  $default,) {final _that = this;
switch (_that) {
case _AlbumRequest():
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version,_that.artist);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version,  String? artist)?  $default,) {final _that = this;
switch (_that) {
case _AlbumRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version,_that.artist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlbumRequest extends AlbumRequest {
  const _AlbumRequest({required this.api, required this.method, required this.limit, required this.library, required this.additional, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection, required this.offset, required this.version, this.artist}): super._();
  factory _AlbumRequest.fromJson(Map<String, dynamic> json) => _$AlbumRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  int limit;
@override final  String library;
@override final  String additional;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;
@override final  int offset;
@override final  int version;
@override final  String? artist;

/// Create a copy of AlbumRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumRequestCopyWith<_AlbumRequest> get copyWith => __$AlbumRequestCopyWithImpl<_AlbumRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.version, version) || other.version == version)&&(identical(other.artist, artist) || other.artist == artist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,additional,sortBy,sortDirection,offset,version,artist);

@override
String toString() {
  return 'AlbumRequest(api: $api, method: $method, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, version: $version, artist: $artist)';
}


}

/// @nodoc
abstract mixin class _$AlbumRequestCopyWith<$Res> implements $AlbumRequestCopyWith<$Res> {
  factory _$AlbumRequestCopyWith(_AlbumRequest value, $Res Function(_AlbumRequest) _then) = __$AlbumRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, int version, String? artist
});




}
/// @nodoc
class __$AlbumRequestCopyWithImpl<$Res>
    implements _$AlbumRequestCopyWith<$Res> {
  __$AlbumRequestCopyWithImpl(this._self, this._then);

  final _AlbumRequest _self;
  final $Res Function(_AlbumRequest) _then;

/// Create a copy of AlbumRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? version = null,Object? artist = freezed,}) {
  return _then(_AlbumRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SearchAlbumRequest {

 String get api; String get method; int get version; String get filter; String get library; int get limit; int get offset;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection;
/// Create a copy of SearchAlbumRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAlbumRequestCopyWith<SearchAlbumRequest> get copyWith => _$SearchAlbumRequestCopyWithImpl<SearchAlbumRequest>(this as SearchAlbumRequest, _$identity);

  /// Serializes this SearchAlbumRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAlbumRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.library, library) || other.library == library)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,filter,library,limit,offset,sortBy,sortDirection);

@override
String toString() {
  return 'SearchAlbumRequest(api: $api, method: $method, version: $version, filter: $filter, library: $library, limit: $limit, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class $SearchAlbumRequestCopyWith<$Res>  {
  factory $SearchAlbumRequestCopyWith(SearchAlbumRequest value, $Res Function(SearchAlbumRequest) _then) = _$SearchAlbumRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, int version, String filter, String library, int limit, int offset,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection
});




}
/// @nodoc
class _$SearchAlbumRequestCopyWithImpl<$Res>
    implements $SearchAlbumRequestCopyWith<$Res> {
  _$SearchAlbumRequestCopyWithImpl(this._self, this._then);

  final SearchAlbumRequest _self;
  final $Res Function(SearchAlbumRequest) _then;

/// Create a copy of SearchAlbumRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? filter = null,Object? library = null,Object? limit = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchAlbumRequest].
extension SearchAlbumRequestPatterns on SearchAlbumRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchAlbumRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchAlbumRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchAlbumRequest value)  $default,){
final _that = this;
switch (_that) {
case _SearchAlbumRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchAlbumRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SearchAlbumRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  int version,  String filter,  String library,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAlbumRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.filter,_that.library,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  int version,  String filter,  String library,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumRequest():
return $default(_that.api,_that.method,_that.version,_that.filter,_that.library,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  int version,  String filter,  String library,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)?  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.filter,_that.library,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchAlbumRequest extends SearchAlbumRequest {
  const _SearchAlbumRequest({required this.api, required this.method, required this.version, required this.filter, required this.library, required this.limit, required this.offset, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection}): super._();
  factory _SearchAlbumRequest.fromJson(Map<String, dynamic> json) => _$SearchAlbumRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  int version;
@override final  String filter;
@override final  String library;
@override final  int limit;
@override final  int offset;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;

/// Create a copy of SearchAlbumRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchAlbumRequestCopyWith<_SearchAlbumRequest> get copyWith => __$SearchAlbumRequestCopyWithImpl<_SearchAlbumRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchAlbumRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAlbumRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.library, library) || other.library == library)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,filter,library,limit,offset,sortBy,sortDirection);

@override
String toString() {
  return 'SearchAlbumRequest(api: $api, method: $method, version: $version, filter: $filter, library: $library, limit: $limit, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class _$SearchAlbumRequestCopyWith<$Res> implements $SearchAlbumRequestCopyWith<$Res> {
  factory _$SearchAlbumRequestCopyWith(_SearchAlbumRequest value, $Res Function(_SearchAlbumRequest) _then) = __$SearchAlbumRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, int version, String filter, String library, int limit, int offset,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection
});




}
/// @nodoc
class __$SearchAlbumRequestCopyWithImpl<$Res>
    implements _$SearchAlbumRequestCopyWith<$Res> {
  __$SearchAlbumRequestCopyWithImpl(this._self, this._then);

  final _SearchAlbumRequest _self;
  final $Res Function(_SearchAlbumRequest) _then;

/// Create a copy of SearchAlbumRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? filter = null,Object? library = null,Object? limit = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_SearchAlbumRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AlbumData {

 List<AlbumItem>? get albums; int get offset; int get total;
/// Create a copy of AlbumData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumDataCopyWith<AlbumData> get copyWith => _$AlbumDataCopyWithImpl<AlbumData>(this as AlbumData, _$identity);

  /// Serializes this AlbumData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumData&&const DeepCollectionEquality().equals(other.albums, albums)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(albums),offset,total);

@override
String toString() {
  return 'AlbumData(albums: $albums, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $AlbumDataCopyWith<$Res>  {
  factory $AlbumDataCopyWith(AlbumData value, $Res Function(AlbumData) _then) = _$AlbumDataCopyWithImpl;
@useResult
$Res call({
 List<AlbumItem>? albums, int offset, int total
});




}
/// @nodoc
class _$AlbumDataCopyWithImpl<$Res>
    implements $AlbumDataCopyWith<$Res> {
  _$AlbumDataCopyWithImpl(this._self, this._then);

  final AlbumData _self;
  final $Res Function(AlbumData) _then;

/// Create a copy of AlbumData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? albums = freezed,Object? offset = null,Object? total = null,}) {
  return _then(_self.copyWith(
albums: freezed == albums ? _self.albums : albums // ignore: cast_nullable_to_non_nullable
as List<AlbumItem>?,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AlbumData].
extension AlbumDataPatterns on AlbumData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumData value)  $default,){
final _that = this;
switch (_that) {
case _AlbumData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumData value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AlbumItem>? albums,  int offset,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumData() when $default != null:
return $default(_that.albums,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AlbumItem>? albums,  int offset,  int total)  $default,) {final _that = this;
switch (_that) {
case _AlbumData():
return $default(_that.albums,_that.offset,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AlbumItem>? albums,  int offset,  int total)?  $default,) {final _that = this;
switch (_that) {
case _AlbumData() when $default != null:
return $default(_that.albums,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlbumData extends AlbumData {
  const _AlbumData({final  List<AlbumItem>? albums, required this.offset, required this.total}): _albums = albums,super._();
  factory _AlbumData.fromJson(Map<String, dynamic> json) => _$AlbumDataFromJson(json);

 final  List<AlbumItem>? _albums;
@override List<AlbumItem>? get albums {
  final value = _albums;
  if (value == null) return null;
  if (_albums is EqualUnmodifiableListView) return _albums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int offset;
@override final  int total;

/// Create a copy of AlbumData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumDataCopyWith<_AlbumData> get copyWith => __$AlbumDataCopyWithImpl<_AlbumData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumData&&const DeepCollectionEquality().equals(other._albums, _albums)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_albums),offset,total);

@override
String toString() {
  return 'AlbumData(albums: $albums, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$AlbumDataCopyWith<$Res> implements $AlbumDataCopyWith<$Res> {
  factory _$AlbumDataCopyWith(_AlbumData value, $Res Function(_AlbumData) _then) = __$AlbumDataCopyWithImpl;
@override @useResult
$Res call({
 List<AlbumItem>? albums, int offset, int total
});




}
/// @nodoc
class __$AlbumDataCopyWithImpl<$Res>
    implements _$AlbumDataCopyWith<$Res> {
  __$AlbumDataCopyWithImpl(this._self, this._then);

  final _AlbumData _self;
  final $Res Function(_AlbumData) _then;

/// Create a copy of AlbumData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? albums = freezed,Object? offset = null,Object? total = null,}) {
  return _then(_AlbumData(
albums: freezed == albums ? _self._albums : albums // ignore: cast_nullable_to_non_nullable
as List<AlbumItem>?,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AlbumResponse {

 bool get success; AlbumData? get data; Map<String, dynamic>? get error;
/// Create a copy of AlbumResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumResponseCopyWith<AlbumResponse> get copyWith => _$AlbumResponseCopyWithImpl<AlbumResponse>(this as AlbumResponse, _$identity);

  /// Serializes this AlbumResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'AlbumResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $AlbumResponseCopyWith<$Res>  {
  factory $AlbumResponseCopyWith(AlbumResponse value, $Res Function(AlbumResponse) _then) = _$AlbumResponseCopyWithImpl;
@useResult
$Res call({
 bool success, AlbumData? data, Map<String, dynamic>? error
});


$AlbumDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AlbumResponseCopyWithImpl<$Res>
    implements $AlbumResponseCopyWith<$Res> {
  _$AlbumResponseCopyWithImpl(this._self, this._then);

  final AlbumResponse _self;
  final $Res Function(AlbumResponse) _then;

/// Create a copy of AlbumResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AlbumData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of AlbumResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AlbumDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlbumResponse].
extension AlbumResponsePatterns on AlbumResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlbumResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlbumResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlbumResponse value)  $default,){
final _that = this;
switch (_that) {
case _AlbumResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlbumResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AlbumResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  AlbumData? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlbumResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  AlbumData? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _AlbumResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  AlbumData? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _AlbumResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlbumResponse extends AlbumResponse {
  const _AlbumResponse({required this.success, this.data, final  Map<String, dynamic>? error}): _error = error,super._();
  factory _AlbumResponse.fromJson(Map<String, dynamic> json) => _$AlbumResponseFromJson(json);

@override final  bool success;
@override final  AlbumData? data;
 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AlbumResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlbumResponseCopyWith<_AlbumResponse> get copyWith => __$AlbumResponseCopyWithImpl<_AlbumResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlbumResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlbumResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'AlbumResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AlbumResponseCopyWith<$Res> implements $AlbumResponseCopyWith<$Res> {
  factory _$AlbumResponseCopyWith(_AlbumResponse value, $Res Function(_AlbumResponse) _then) = __$AlbumResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, AlbumData? data, Map<String, dynamic>? error
});


@override $AlbumDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AlbumResponseCopyWithImpl<$Res>
    implements _$AlbumResponseCopyWith<$Res> {
  __$AlbumResponseCopyWithImpl(this._self, this._then);

  final _AlbumResponse _self;
  final $Res Function(_AlbumResponse) _then;

/// Create a copy of AlbumResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_AlbumResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AlbumData?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of AlbumResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlbumDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AlbumDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
