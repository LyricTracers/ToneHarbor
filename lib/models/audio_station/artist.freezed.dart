// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist.dart';

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
mixin _$Additional {

 AvgRating? get avgRating;
/// Create a copy of Additional
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdditionalCopyWith<Additional> get copyWith => _$AdditionalCopyWithImpl<Additional>(this as Additional, _$identity);

  /// Serializes this Additional to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Additional&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avgRating);

@override
String toString() {
  return 'Additional(avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class $AdditionalCopyWith<$Res>  {
  factory $AdditionalCopyWith(Additional value, $Res Function(Additional) _then) = _$AdditionalCopyWithImpl;
@useResult
$Res call({
 AvgRating? avgRating
});


$AvgRatingCopyWith<$Res>? get avgRating;

}
/// @nodoc
class _$AdditionalCopyWithImpl<$Res>
    implements $AdditionalCopyWith<$Res> {
  _$AdditionalCopyWithImpl(this._self, this._then);

  final Additional _self;
  final $Res Function(Additional) _then;

/// Create a copy of Additional
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avgRating = freezed,}) {
  return _then(_self.copyWith(
avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as AvgRating?,
  ));
}
/// Create a copy of Additional
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


/// Adds pattern-matching-related methods to [Additional].
extension AdditionalPatterns on Additional {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Additional value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Additional() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Additional value)  $default,){
final _that = this;
switch (_that) {
case _Additional():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Additional value)?  $default,){
final _that = this;
switch (_that) {
case _Additional() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AvgRating? avgRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Additional() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AvgRating? avgRating)  $default,) {final _that = this;
switch (_that) {
case _Additional():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AvgRating? avgRating)?  $default,) {final _that = this;
switch (_that) {
case _Additional() when $default != null:
return $default(_that.avgRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Additional extends Additional {
  const _Additional({this.avgRating}): super._();
  factory _Additional.fromJson(Map<String, dynamic> json) => _$AdditionalFromJson(json);

@override final  AvgRating? avgRating;

/// Create a copy of Additional
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdditionalCopyWith<_Additional> get copyWith => __$AdditionalCopyWithImpl<_Additional>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdditionalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Additional&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avgRating);

@override
String toString() {
  return 'Additional(avgRating: $avgRating)';
}


}

/// @nodoc
abstract mixin class _$AdditionalCopyWith<$Res> implements $AdditionalCopyWith<$Res> {
  factory _$AdditionalCopyWith(_Additional value, $Res Function(_Additional) _then) = __$AdditionalCopyWithImpl;
@override @useResult
$Res call({
 AvgRating? avgRating
});


@override $AvgRatingCopyWith<$Res>? get avgRating;

}
/// @nodoc
class __$AdditionalCopyWithImpl<$Res>
    implements _$AdditionalCopyWith<$Res> {
  __$AdditionalCopyWithImpl(this._self, this._then);

  final _Additional _self;
  final $Res Function(_Additional) _then;

/// Create a copy of Additional
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avgRating = freezed,}) {
  return _then(_Additional(
avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as AvgRating?,
  ));
}

/// Create a copy of Additional
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
mixin _$Artist {

 String? get name; Additional? get additional;
/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistCopyWith<Artist> get copyWith => _$ArtistCopyWithImpl<Artist>(this as Artist, _$identity);

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Artist&&(identical(other.name, name) || other.name == name)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,additional);

@override
String toString() {
  return 'Artist(name: $name, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $ArtistCopyWith<$Res>  {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) _then) = _$ArtistCopyWithImpl;
@useResult
$Res call({
 String? name, Additional? additional
});


$AdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class _$ArtistCopyWithImpl<$Res>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._self, this._then);

  final Artist _self;
  final $Res Function(Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? additional = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as Additional?,
  ));
}
/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $AdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// Adds pattern-matching-related methods to [Artist].
extension ArtistPatterns on Artist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Artist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Artist value)  $default,){
final _that = this;
switch (_that) {
case _Artist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Artist value)?  $default,){
final _that = this;
switch (_that) {
case _Artist() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  Additional? additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.name,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  Additional? additional)  $default,) {final _that = this;
switch (_that) {
case _Artist():
return $default(_that.name,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  Additional? additional)?  $default,) {final _that = this;
switch (_that) {
case _Artist() when $default != null:
return $default(_that.name,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Artist extends Artist {
  const _Artist({this.name, this.additional}): super._();
  factory _Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

@override final  String? name;
@override final  Additional? additional;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistCopyWith<_Artist> get copyWith => __$ArtistCopyWithImpl<_Artist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Artist&&(identical(other.name, name) || other.name == name)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,additional);

@override
String toString() {
  return 'Artist(name: $name, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$ArtistCopyWith(_Artist value, $Res Function(_Artist) _then) = __$ArtistCopyWithImpl;
@override @useResult
$Res call({
 String? name, Additional? additional
});


@override $AdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class __$ArtistCopyWithImpl<$Res>
    implements _$ArtistCopyWith<$Res> {
  __$ArtistCopyWithImpl(this._self, this._then);

  final _Artist _self;
  final $Res Function(_Artist) _then;

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? additional = freezed,}) {
  return _then(_Artist(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as Additional?,
  ));
}

/// Create a copy of Artist
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $AdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// @nodoc
mixin _$ArtistRequest {

 String get api; String get method; int get limit; String get library; String get additional;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection; int get offset; int get version;
/// Create a copy of ArtistRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistRequestCopyWith<ArtistRequest> get copyWith => _$ArtistRequestCopyWithImpl<ArtistRequest>(this as ArtistRequest, _$identity);

  /// Serializes this ArtistRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,additional,sortBy,sortDirection,offset,version);

@override
String toString() {
  return 'ArtistRequest(api: $api, method: $method, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, version: $version)';
}


}

/// @nodoc
abstract mixin class $ArtistRequestCopyWith<$Res>  {
  factory $ArtistRequestCopyWith(ArtistRequest value, $Res Function(ArtistRequest) _then) = _$ArtistRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, int version
});




}
/// @nodoc
class _$ArtistRequestCopyWithImpl<$Res>
    implements $ArtistRequestCopyWith<$Res> {
  _$ArtistRequestCopyWithImpl(this._self, this._then);

  final ArtistRequest _self;
  final $Res Function(ArtistRequest) _then;

/// Create a copy of ArtistRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? version = null,}) {
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
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ArtistRequest].
extension ArtistRequestPatterns on ArtistRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtistRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtistRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtistRequest value)  $default,){
final _that = this;
switch (_that) {
case _ArtistRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtistRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ArtistRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version)  $default,) {final _that = this;
switch (_that) {
case _ArtistRequest():
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version)?  $default,) {final _that = this;
switch (_that) {
case _ArtistRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArtistRequest extends ArtistRequest {
  const _ArtistRequest({required this.api, required this.method, required this.limit, required this.library, required this.additional, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection, required this.offset, required this.version}): super._();
  factory _ArtistRequest.fromJson(Map<String, dynamic> json) => _$ArtistRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  int limit;
@override final  String library;
@override final  String additional;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;
@override final  int offset;
@override final  int version;

/// Create a copy of ArtistRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistRequestCopyWith<_ArtistRequest> get copyWith => __$ArtistRequestCopyWithImpl<_ArtistRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,additional,sortBy,sortDirection,offset,version);

@override
String toString() {
  return 'ArtistRequest(api: $api, method: $method, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ArtistRequestCopyWith<$Res> implements $ArtistRequestCopyWith<$Res> {
  factory _$ArtistRequestCopyWith(_ArtistRequest value, $Res Function(_ArtistRequest) _then) = __$ArtistRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, int version
});




}
/// @nodoc
class __$ArtistRequestCopyWithImpl<$Res>
    implements _$ArtistRequestCopyWith<$Res> {
  __$ArtistRequestCopyWithImpl(this._self, this._then);

  final _ArtistRequest _self;
  final $Res Function(_ArtistRequest) _then;

/// Create a copy of ArtistRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? version = null,}) {
  return _then(_ArtistRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SearchArtistRequest {

 String get api; String get method; String get version; String get filter; String get library; int get limit; int get offset;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection;
/// Create a copy of SearchArtistRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchArtistRequestCopyWith<SearchArtistRequest> get copyWith => _$SearchArtistRequestCopyWithImpl<SearchArtistRequest>(this as SearchArtistRequest, _$identity);

  /// Serializes this SearchArtistRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchArtistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.library, library) || other.library == library)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,filter,library,limit,offset,sortBy,sortDirection);

@override
String toString() {
  return 'SearchArtistRequest(api: $api, method: $method, version: $version, filter: $filter, library: $library, limit: $limit, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class $SearchArtistRequestCopyWith<$Res>  {
  factory $SearchArtistRequestCopyWith(SearchArtistRequest value, $Res Function(SearchArtistRequest) _then) = _$SearchArtistRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version, String filter, String library, int limit, int offset,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection
});




}
/// @nodoc
class _$SearchArtistRequestCopyWithImpl<$Res>
    implements $SearchArtistRequestCopyWith<$Res> {
  _$SearchArtistRequestCopyWithImpl(this._self, this._then);

  final SearchArtistRequest _self;
  final $Res Function(SearchArtistRequest) _then;

/// Create a copy of SearchArtistRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,Object? filter = null,Object? library = null,Object? limit = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchArtistRequest].
extension SearchArtistRequestPatterns on SearchArtistRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchArtistRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchArtistRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchArtistRequest value)  $default,){
final _that = this;
switch (_that) {
case _SearchArtistRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchArtistRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SearchArtistRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String filter,  String library,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchArtistRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version,  String filter,  String library,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)  $default,) {final _that = this;
switch (_that) {
case _SearchArtistRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version,  String filter,  String library,  int limit,  int offset, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection)?  $default,) {final _that = this;
switch (_that) {
case _SearchArtistRequest() when $default != null:
return $default(_that.api,_that.method,_that.version,_that.filter,_that.library,_that.limit,_that.offset,_that.sortBy,_that.sortDirection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchArtistRequest extends SearchArtistRequest {
  const _SearchArtistRequest({required this.api, required this.method, required this.version, required this.filter, required this.library, required this.limit, required this.offset, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection}): super._();
  factory _SearchArtistRequest.fromJson(Map<String, dynamic> json) => _$SearchArtistRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;
@override final  String filter;
@override final  String library;
@override final  int limit;
@override final  int offset;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;

/// Create a copy of SearchArtistRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchArtistRequestCopyWith<_SearchArtistRequest> get copyWith => __$SearchArtistRequestCopyWithImpl<_SearchArtistRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchArtistRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchArtistRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.library, library) || other.library == library)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version,filter,library,limit,offset,sortBy,sortDirection);

@override
String toString() {
  return 'SearchArtistRequest(api: $api, method: $method, version: $version, filter: $filter, library: $library, limit: $limit, offset: $offset, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class _$SearchArtistRequestCopyWith<$Res> implements $SearchArtistRequestCopyWith<$Res> {
  factory _$SearchArtistRequestCopyWith(_SearchArtistRequest value, $Res Function(_SearchArtistRequest) _then) = __$SearchArtistRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version, String filter, String library, int limit, int offset,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection
});




}
/// @nodoc
class __$SearchArtistRequestCopyWithImpl<$Res>
    implements _$SearchArtistRequestCopyWith<$Res> {
  __$SearchArtistRequestCopyWithImpl(this._self, this._then);

  final _SearchArtistRequest _self;
  final $Res Function(_SearchArtistRequest) _then;

/// Create a copy of SearchArtistRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,Object? filter = null,Object? library = null,Object? limit = null,Object? offset = null,Object? sortBy = null,Object? sortDirection = null,}) {
  return _then(_SearchArtistRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
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
mixin _$ArtistData {

 List<Artist>? get artists; int get offset; int get total;
/// Create a copy of ArtistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistDataCopyWith<ArtistData> get copyWith => _$ArtistDataCopyWithImpl<ArtistData>(this as ArtistData, _$identity);

  /// Serializes this ArtistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistData&&const DeepCollectionEquality().equals(other.artists, artists)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(artists),offset,total);

@override
String toString() {
  return 'ArtistData(artists: $artists, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $ArtistDataCopyWith<$Res>  {
  factory $ArtistDataCopyWith(ArtistData value, $Res Function(ArtistData) _then) = _$ArtistDataCopyWithImpl;
@useResult
$Res call({
 List<Artist>? artists, int offset, int total
});




}
/// @nodoc
class _$ArtistDataCopyWithImpl<$Res>
    implements $ArtistDataCopyWith<$Res> {
  _$ArtistDataCopyWithImpl(this._self, this._then);

  final ArtistData _self;
  final $Res Function(ArtistData) _then;

/// Create a copy of ArtistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? artists = freezed,Object? offset = null,Object? total = null,}) {
  return _then(_self.copyWith(
artists: freezed == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<Artist>?,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ArtistData].
extension ArtistDataPatterns on ArtistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtistData value)  $default,){
final _that = this;
switch (_that) {
case _ArtistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtistData value)?  $default,){
final _that = this;
switch (_that) {
case _ArtistData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Artist>? artists,  int offset,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistData() when $default != null:
return $default(_that.artists,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Artist>? artists,  int offset,  int total)  $default,) {final _that = this;
switch (_that) {
case _ArtistData():
return $default(_that.artists,_that.offset,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Artist>? artists,  int offset,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ArtistData() when $default != null:
return $default(_that.artists,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArtistData extends ArtistData {
  const _ArtistData({final  List<Artist>? artists, required this.offset, required this.total}): _artists = artists,super._();
  factory _ArtistData.fromJson(Map<String, dynamic> json) => _$ArtistDataFromJson(json);

 final  List<Artist>? _artists;
@override List<Artist>? get artists {
  final value = _artists;
  if (value == null) return null;
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int offset;
@override final  int total;

/// Create a copy of ArtistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistDataCopyWith<_ArtistData> get copyWith => __$ArtistDataCopyWithImpl<_ArtistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistData&&const DeepCollectionEquality().equals(other._artists, _artists)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_artists),offset,total);

@override
String toString() {
  return 'ArtistData(artists: $artists, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ArtistDataCopyWith<$Res> implements $ArtistDataCopyWith<$Res> {
  factory _$ArtistDataCopyWith(_ArtistData value, $Res Function(_ArtistData) _then) = __$ArtistDataCopyWithImpl;
@override @useResult
$Res call({
 List<Artist>? artists, int offset, int total
});




}
/// @nodoc
class __$ArtistDataCopyWithImpl<$Res>
    implements _$ArtistDataCopyWith<$Res> {
  __$ArtistDataCopyWithImpl(this._self, this._then);

  final _ArtistData _self;
  final $Res Function(_ArtistData) _then;

/// Create a copy of ArtistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? artists = freezed,Object? offset = null,Object? total = null,}) {
  return _then(_ArtistData(
artists: freezed == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<Artist>?,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ArtistResponse {

 bool get success; ArtistData? get data; Map<String, dynamic>? get error;
/// Create a copy of ArtistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistResponseCopyWith<ArtistResponse> get copyWith => _$ArtistResponseCopyWithImpl<ArtistResponse>(this as ArtistResponse, _$identity);

  /// Serializes this ArtistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ArtistResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $ArtistResponseCopyWith<$Res>  {
  factory $ArtistResponseCopyWith(ArtistResponse value, $Res Function(ArtistResponse) _then) = _$ArtistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, ArtistData? data, Map<String, dynamic>? error
});


$ArtistDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ArtistResponseCopyWithImpl<$Res>
    implements $ArtistResponseCopyWith<$Res> {
  _$ArtistResponseCopyWithImpl(this._self, this._then);

  final ArtistResponse _self;
  final $Res Function(ArtistResponse) _then;

/// Create a copy of ArtistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ArtistData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of ArtistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ArtistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ArtistResponse].
extension ArtistResponsePatterns on ArtistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArtistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArtistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArtistResponse value)  $default,){
final _that = this;
switch (_that) {
case _ArtistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArtistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ArtistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  ArtistData? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArtistResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  ArtistData? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _ArtistResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  ArtistData? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _ArtistResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArtistResponse extends ArtistResponse {
  const _ArtistResponse({required this.success, this.data, final  Map<String, dynamic>? error}): _error = error,super._();
  factory _ArtistResponse.fromJson(Map<String, dynamic> json) => _$ArtistResponseFromJson(json);

@override final  bool success;
@override final  ArtistData? data;
 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ArtistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtistResponseCopyWith<_ArtistResponse> get copyWith => __$ArtistResponseCopyWithImpl<_ArtistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArtistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'ArtistResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ArtistResponseCopyWith<$Res> implements $ArtistResponseCopyWith<$Res> {
  factory _$ArtistResponseCopyWith(_ArtistResponse value, $Res Function(_ArtistResponse) _then) = __$ArtistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, ArtistData? data, Map<String, dynamic>? error
});


@override $ArtistDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ArtistResponseCopyWithImpl<$Res>
    implements _$ArtistResponseCopyWith<$Res> {
  __$ArtistResponseCopyWithImpl(this._self, this._then);

  final _ArtistResponse _self;
  final $Res Function(_ArtistResponse) _then;

/// Create a copy of ArtistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_ArtistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ArtistData?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of ArtistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArtistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ArtistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
