// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FolderRequest {

 String get api; String get method; int get limit; String get library; String get additional;@JsonKey(name: 'sort_by') String get sortBy;@JsonKey(name: 'sort_direction') String get sortDirection; int get offset; int get version; String? get id;
/// Create a copy of FolderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderRequestCopyWith<FolderRequest> get copyWith => _$FolderRequestCopyWithImpl<FolderRequest>(this as FolderRequest, _$identity);

  /// Serializes this FolderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.version, version) || other.version == version)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,additional,sortBy,sortDirection,offset,version,id);

@override
String toString() {
  return 'FolderRequest(api: $api, method: $method, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, version: $version, id: $id)';
}


}

/// @nodoc
abstract mixin class $FolderRequestCopyWith<$Res>  {
  factory $FolderRequestCopyWith(FolderRequest value, $Res Function(FolderRequest) _then) = _$FolderRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, int version, String? id
});




}
/// @nodoc
class _$FolderRequestCopyWithImpl<$Res>
    implements $FolderRequestCopyWith<$Res> {
  _$FolderRequestCopyWithImpl(this._self, this._then);

  final FolderRequest _self;
  final $Res Function(FolderRequest) _then;

/// Create a copy of FolderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? version = null,Object? id = freezed,}) {
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
as int,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FolderRequest].
extension FolderRequestPatterns on FolderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderRequest value)  $default,){
final _that = this;
switch (_that) {
case _FolderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FolderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version,  String? id)  $default,) {final _that = this;
switch (_that) {
case _FolderRequest():
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  int limit,  String library,  String additional, @JsonKey(name: 'sort_by')  String sortBy, @JsonKey(name: 'sort_direction')  String sortDirection,  int offset,  int version,  String? id)?  $default,) {final _that = this;
switch (_that) {
case _FolderRequest() when $default != null:
return $default(_that.api,_that.method,_that.limit,_that.library,_that.additional,_that.sortBy,_that.sortDirection,_that.offset,_that.version,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FolderRequest extends FolderRequest {
  const _FolderRequest({required this.api, required this.method, required this.limit, required this.library, required this.additional, @JsonKey(name: 'sort_by') required this.sortBy, @JsonKey(name: 'sort_direction') required this.sortDirection, required this.offset, required this.version, this.id}): super._();
  factory _FolderRequest.fromJson(Map<String, dynamic> json) => _$FolderRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  int limit;
@override final  String library;
@override final  String additional;
@override@JsonKey(name: 'sort_by') final  String sortBy;
@override@JsonKey(name: 'sort_direction') final  String sortDirection;
@override final  int offset;
@override final  int version;
@override final  String? id;

/// Create a copy of FolderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderRequestCopyWith<_FolderRequest> get copyWith => __$FolderRequestCopyWithImpl<_FolderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.library, library) || other.library == library)&&(identical(other.additional, additional) || other.additional == additional)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.version, version) || other.version == version)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,limit,library,additional,sortBy,sortDirection,offset,version,id);

@override
String toString() {
  return 'FolderRequest(api: $api, method: $method, limit: $limit, library: $library, additional: $additional, sortBy: $sortBy, sortDirection: $sortDirection, offset: $offset, version: $version, id: $id)';
}


}

/// @nodoc
abstract mixin class _$FolderRequestCopyWith<$Res> implements $FolderRequestCopyWith<$Res> {
  factory _$FolderRequestCopyWith(_FolderRequest value, $Res Function(_FolderRequest) _then) = __$FolderRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, int limit, String library, String additional,@JsonKey(name: 'sort_by') String sortBy,@JsonKey(name: 'sort_direction') String sortDirection, int offset, int version, String? id
});




}
/// @nodoc
class __$FolderRequestCopyWithImpl<$Res>
    implements _$FolderRequestCopyWith<$Res> {
  __$FolderRequestCopyWithImpl(this._self, this._then);

  final _FolderRequest _self;
  final $Res Function(_FolderRequest) _then;

/// Create a copy of FolderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? limit = null,Object? library = null,Object? additional = null,Object? sortBy = null,Object? sortDirection = null,Object? offset = null,Object? version = null,Object? id = freezed,}) {
  return _then(_FolderRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as String,additional: null == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as String,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,sortDirection: null == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as String,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FolderItem {

 String get id;@JsonKey(name: 'is_personal') bool? get isPersonal; String get path; String get title; String get type;// 暂时留空，需要根据实际的 SongAdditional 结构来定义
 SongAdditional? get additional;
/// Create a copy of FolderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderItemCopyWith<FolderItem> get copyWith => _$FolderItemCopyWithImpl<FolderItem>(this as FolderItem, _$identity);

  /// Serializes this FolderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.isPersonal, isPersonal) || other.isPersonal == isPersonal)&&(identical(other.path, path) || other.path == path)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isPersonal,path,title,type,additional);

@override
String toString() {
  return 'FolderItem(id: $id, isPersonal: $isPersonal, path: $path, title: $title, type: $type, additional: $additional)';
}


}

/// @nodoc
abstract mixin class $FolderItemCopyWith<$Res>  {
  factory $FolderItemCopyWith(FolderItem value, $Res Function(FolderItem) _then) = _$FolderItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'is_personal') bool? isPersonal, String path, String title, String type, SongAdditional? additional
});


$SongAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class _$FolderItemCopyWithImpl<$Res>
    implements $FolderItemCopyWith<$Res> {
  _$FolderItemCopyWithImpl(this._self, this._then);

  final FolderItem _self;
  final $Res Function(FolderItem) _then;

/// Create a copy of FolderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isPersonal = freezed,Object? path = null,Object? title = null,Object? type = null,Object? additional = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isPersonal: freezed == isPersonal ? _self.isPersonal : isPersonal // ignore: cast_nullable_to_non_nullable
as bool?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as SongAdditional?,
  ));
}
/// Create a copy of FolderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $SongAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// Adds pattern-matching-related methods to [FolderItem].
extension FolderItemPatterns on FolderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderItem value)  $default,){
final _that = this;
switch (_that) {
case _FolderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderItem value)?  $default,){
final _that = this;
switch (_that) {
case _FolderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'is_personal')  bool? isPersonal,  String path,  String title,  String type,  SongAdditional? additional)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderItem() when $default != null:
return $default(_that.id,_that.isPersonal,_that.path,_that.title,_that.type,_that.additional);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'is_personal')  bool? isPersonal,  String path,  String title,  String type,  SongAdditional? additional)  $default,) {final _that = this;
switch (_that) {
case _FolderItem():
return $default(_that.id,_that.isPersonal,_that.path,_that.title,_that.type,_that.additional);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'is_personal')  bool? isPersonal,  String path,  String title,  String type,  SongAdditional? additional)?  $default,) {final _that = this;
switch (_that) {
case _FolderItem() when $default != null:
return $default(_that.id,_that.isPersonal,_that.path,_that.title,_that.type,_that.additional);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FolderItem extends FolderItem {
  const _FolderItem({required this.id, @JsonKey(name: 'is_personal') this.isPersonal, required this.path, required this.title, required this.type, this.additional}): super._();
  factory _FolderItem.fromJson(Map<String, dynamic> json) => _$FolderItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'is_personal') final  bool? isPersonal;
@override final  String path;
@override final  String title;
@override final  String type;
// 暂时留空，需要根据实际的 SongAdditional 结构来定义
@override final  SongAdditional? additional;

/// Create a copy of FolderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderItemCopyWith<_FolderItem> get copyWith => __$FolderItemCopyWithImpl<_FolderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.isPersonal, isPersonal) || other.isPersonal == isPersonal)&&(identical(other.path, path) || other.path == path)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.additional, additional) || other.additional == additional));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isPersonal,path,title,type,additional);

@override
String toString() {
  return 'FolderItem(id: $id, isPersonal: $isPersonal, path: $path, title: $title, type: $type, additional: $additional)';
}


}

/// @nodoc
abstract mixin class _$FolderItemCopyWith<$Res> implements $FolderItemCopyWith<$Res> {
  factory _$FolderItemCopyWith(_FolderItem value, $Res Function(_FolderItem) _then) = __$FolderItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'is_personal') bool? isPersonal, String path, String title, String type, SongAdditional? additional
});


@override $SongAdditionalCopyWith<$Res>? get additional;

}
/// @nodoc
class __$FolderItemCopyWithImpl<$Res>
    implements _$FolderItemCopyWith<$Res> {
  __$FolderItemCopyWithImpl(this._self, this._then);

  final _FolderItem _self;
  final $Res Function(_FolderItem) _then;

/// Create a copy of FolderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isPersonal = freezed,Object? path = null,Object? title = null,Object? type = null,Object? additional = freezed,}) {
  return _then(_FolderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isPersonal: freezed == isPersonal ? _self.isPersonal : isPersonal // ignore: cast_nullable_to_non_nullable
as bool?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,additional: freezed == additional ? _self.additional : additional // ignore: cast_nullable_to_non_nullable
as SongAdditional?,
  ));
}

/// Create a copy of FolderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SongAdditionalCopyWith<$Res>? get additional {
    if (_self.additional == null) {
    return null;
  }

  return $SongAdditionalCopyWith<$Res>(_self.additional!, (value) {
    return _then(_self.copyWith(additional: value));
  });
}
}


/// @nodoc
mixin _$FolderData {

@JsonKey(name: 'folder_total') int get folderTotal; String get id; List<FolderItem> get items; int get offset; int get total;
/// Create a copy of FolderData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderDataCopyWith<FolderData> get copyWith => _$FolderDataCopyWithImpl<FolderData>(this as FolderData, _$identity);

  /// Serializes this FolderData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderData&&(identical(other.folderTotal, folderTotal) || other.folderTotal == folderTotal)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folderTotal,id,const DeepCollectionEquality().hash(items),offset,total);

@override
String toString() {
  return 'FolderData(folderTotal: $folderTotal, id: $id, items: $items, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class $FolderDataCopyWith<$Res>  {
  factory $FolderDataCopyWith(FolderData value, $Res Function(FolderData) _then) = _$FolderDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'folder_total') int folderTotal, String id, List<FolderItem> items, int offset, int total
});




}
/// @nodoc
class _$FolderDataCopyWithImpl<$Res>
    implements $FolderDataCopyWith<$Res> {
  _$FolderDataCopyWithImpl(this._self, this._then);

  final FolderData _self;
  final $Res Function(FolderData) _then;

/// Create a copy of FolderData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? folderTotal = null,Object? id = null,Object? items = null,Object? offset = null,Object? total = null,}) {
  return _then(_self.copyWith(
folderTotal: null == folderTotal ? _self.folderTotal : folderTotal // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FolderItem>,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FolderData].
extension FolderDataPatterns on FolderData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderData value)  $default,){
final _that = this;
switch (_that) {
case _FolderData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderData value)?  $default,){
final _that = this;
switch (_that) {
case _FolderData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'folder_total')  int folderTotal,  String id,  List<FolderItem> items,  int offset,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderData() when $default != null:
return $default(_that.folderTotal,_that.id,_that.items,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'folder_total')  int folderTotal,  String id,  List<FolderItem> items,  int offset,  int total)  $default,) {final _that = this;
switch (_that) {
case _FolderData():
return $default(_that.folderTotal,_that.id,_that.items,_that.offset,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'folder_total')  int folderTotal,  String id,  List<FolderItem> items,  int offset,  int total)?  $default,) {final _that = this;
switch (_that) {
case _FolderData() when $default != null:
return $default(_that.folderTotal,_that.id,_that.items,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FolderData extends FolderData {
  const _FolderData({@JsonKey(name: 'folder_total') required this.folderTotal, required this.id, required final  List<FolderItem> items, required this.offset, required this.total}): _items = items,super._();
  factory _FolderData.fromJson(Map<String, dynamic> json) => _$FolderDataFromJson(json);

@override@JsonKey(name: 'folder_total') final  int folderTotal;
@override final  String id;
 final  List<FolderItem> _items;
@override List<FolderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int offset;
@override final  int total;

/// Create a copy of FolderData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderDataCopyWith<_FolderData> get copyWith => __$FolderDataCopyWithImpl<_FolderData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderData&&(identical(other.folderTotal, folderTotal) || other.folderTotal == folderTotal)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folderTotal,id,const DeepCollectionEquality().hash(_items),offset,total);

@override
String toString() {
  return 'FolderData(folderTotal: $folderTotal, id: $id, items: $items, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$FolderDataCopyWith<$Res> implements $FolderDataCopyWith<$Res> {
  factory _$FolderDataCopyWith(_FolderData value, $Res Function(_FolderData) _then) = __$FolderDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'folder_total') int folderTotal, String id, List<FolderItem> items, int offset, int total
});




}
/// @nodoc
class __$FolderDataCopyWithImpl<$Res>
    implements _$FolderDataCopyWith<$Res> {
  __$FolderDataCopyWithImpl(this._self, this._then);

  final _FolderData _self;
  final $Res Function(_FolderData) _then;

/// Create a copy of FolderData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folderTotal = null,Object? id = null,Object? items = null,Object? offset = null,Object? total = null,}) {
  return _then(_FolderData(
folderTotal: null == folderTotal ? _self.folderTotal : folderTotal // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FolderItem>,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FolderResponse {

 bool get success; FolderData? get data; Map<String, dynamic>? get error;
/// Create a copy of FolderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderResponseCopyWith<FolderResponse> get copyWith => _$FolderResponseCopyWithImpl<FolderResponse>(this as FolderResponse, _$identity);

  /// Serializes this FolderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'FolderResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $FolderResponseCopyWith<$Res>  {
  factory $FolderResponseCopyWith(FolderResponse value, $Res Function(FolderResponse) _then) = _$FolderResponseCopyWithImpl;
@useResult
$Res call({
 bool success, FolderData? data, Map<String, dynamic>? error
});


$FolderDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$FolderResponseCopyWithImpl<$Res>
    implements $FolderResponseCopyWith<$Res> {
  _$FolderResponseCopyWithImpl(this._self, this._then);

  final FolderResponse _self;
  final $Res Function(FolderResponse) _then;

/// Create a copy of FolderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FolderData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of FolderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FolderDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $FolderDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [FolderResponse].
extension FolderResponsePatterns on FolderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderResponse value)  $default,){
final _that = this;
switch (_that) {
case _FolderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FolderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  FolderData? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  FolderData? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _FolderResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  FolderData? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _FolderResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FolderResponse extends FolderResponse {
  const _FolderResponse({required this.success, this.data, final  Map<String, dynamic>? error}): _error = error,super._();
  factory _FolderResponse.fromJson(Map<String, dynamic> json) => _$FolderResponseFromJson(json);

@override final  bool success;
@override final  FolderData? data;
 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of FolderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderResponseCopyWith<_FolderResponse> get copyWith => __$FolderResponseCopyWithImpl<_FolderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'FolderResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FolderResponseCopyWith<$Res> implements $FolderResponseCopyWith<$Res> {
  factory _$FolderResponseCopyWith(_FolderResponse value, $Res Function(_FolderResponse) _then) = __$FolderResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, FolderData? data, Map<String, dynamic>? error
});


@override $FolderDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$FolderResponseCopyWithImpl<$Res>
    implements _$FolderResponseCopyWith<$Res> {
  __$FolderResponseCopyWithImpl(this._self, this._then);

  final _FolderResponse _self;
  final $Res Function(_FolderResponse) _then;

/// Create a copy of FolderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_FolderResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FolderData?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of FolderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FolderDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $FolderDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
