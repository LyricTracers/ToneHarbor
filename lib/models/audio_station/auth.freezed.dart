// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioStationCookies {

 String get did;@JsonKey(name: 'did_expires') int get didExpires; String get id;@JsonKey(name: 'id_expires') int get idExpires;
/// Create a copy of AudioStationCookies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioStationCookiesCopyWith<AudioStationCookies> get copyWith => _$AudioStationCookiesCopyWithImpl<AudioStationCookies>(this as AudioStationCookies, _$identity);

  /// Serializes this AudioStationCookies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioStationCookies&&(identical(other.did, did) || other.did == did)&&(identical(other.didExpires, didExpires) || other.didExpires == didExpires)&&(identical(other.id, id) || other.id == id)&&(identical(other.idExpires, idExpires) || other.idExpires == idExpires));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,did,didExpires,id,idExpires);

@override
String toString() {
  return 'AudioStationCookies(did: $did, didExpires: $didExpires, id: $id, idExpires: $idExpires)';
}


}

/// @nodoc
abstract mixin class $AudioStationCookiesCopyWith<$Res>  {
  factory $AudioStationCookiesCopyWith(AudioStationCookies value, $Res Function(AudioStationCookies) _then) = _$AudioStationCookiesCopyWithImpl;
@useResult
$Res call({
 String did,@JsonKey(name: 'did_expires') int didExpires, String id,@JsonKey(name: 'id_expires') int idExpires
});




}
/// @nodoc
class _$AudioStationCookiesCopyWithImpl<$Res>
    implements $AudioStationCookiesCopyWith<$Res> {
  _$AudioStationCookiesCopyWithImpl(this._self, this._then);

  final AudioStationCookies _self;
  final $Res Function(AudioStationCookies) _then;

/// Create a copy of AudioStationCookies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? did = null,Object? didExpires = null,Object? id = null,Object? idExpires = null,}) {
  return _then(_self.copyWith(
did: null == did ? _self.did : did // ignore: cast_nullable_to_non_nullable
as String,didExpires: null == didExpires ? _self.didExpires : didExpires // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,idExpires: null == idExpires ? _self.idExpires : idExpires // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioStationCookies].
extension AudioStationCookiesPatterns on AudioStationCookies {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioStationCookies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioStationCookies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioStationCookies value)  $default,){
final _that = this;
switch (_that) {
case _AudioStationCookies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioStationCookies value)?  $default,){
final _that = this;
switch (_that) {
case _AudioStationCookies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String did, @JsonKey(name: 'did_expires')  int didExpires,  String id, @JsonKey(name: 'id_expires')  int idExpires)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioStationCookies() when $default != null:
return $default(_that.did,_that.didExpires,_that.id,_that.idExpires);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String did, @JsonKey(name: 'did_expires')  int didExpires,  String id, @JsonKey(name: 'id_expires')  int idExpires)  $default,) {final _that = this;
switch (_that) {
case _AudioStationCookies():
return $default(_that.did,_that.didExpires,_that.id,_that.idExpires);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String did, @JsonKey(name: 'did_expires')  int didExpires,  String id, @JsonKey(name: 'id_expires')  int idExpires)?  $default,) {final _that = this;
switch (_that) {
case _AudioStationCookies() when $default != null:
return $default(_that.did,_that.didExpires,_that.id,_that.idExpires);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioStationCookies extends AudioStationCookies {
  const _AudioStationCookies({required this.did, @JsonKey(name: 'did_expires') required this.didExpires, required this.id, @JsonKey(name: 'id_expires') required this.idExpires}): super._();
  factory _AudioStationCookies.fromJson(Map<String, dynamic> json) => _$AudioStationCookiesFromJson(json);

@override final  String did;
@override@JsonKey(name: 'did_expires') final  int didExpires;
@override final  String id;
@override@JsonKey(name: 'id_expires') final  int idExpires;

/// Create a copy of AudioStationCookies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioStationCookiesCopyWith<_AudioStationCookies> get copyWith => __$AudioStationCookiesCopyWithImpl<_AudioStationCookies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioStationCookiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioStationCookies&&(identical(other.did, did) || other.did == did)&&(identical(other.didExpires, didExpires) || other.didExpires == didExpires)&&(identical(other.id, id) || other.id == id)&&(identical(other.idExpires, idExpires) || other.idExpires == idExpires));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,did,didExpires,id,idExpires);

@override
String toString() {
  return 'AudioStationCookies(did: $did, didExpires: $didExpires, id: $id, idExpires: $idExpires)';
}


}

/// @nodoc
abstract mixin class _$AudioStationCookiesCopyWith<$Res> implements $AudioStationCookiesCopyWith<$Res> {
  factory _$AudioStationCookiesCopyWith(_AudioStationCookies value, $Res Function(_AudioStationCookies) _then) = __$AudioStationCookiesCopyWithImpl;
@override @useResult
$Res call({
 String did,@JsonKey(name: 'did_expires') int didExpires, String id,@JsonKey(name: 'id_expires') int idExpires
});




}
/// @nodoc
class __$AudioStationCookiesCopyWithImpl<$Res>
    implements _$AudioStationCookiesCopyWith<$Res> {
  __$AudioStationCookiesCopyWithImpl(this._self, this._then);

  final _AudioStationCookies _self;
  final $Res Function(_AudioStationCookies) _then;

/// Create a copy of AudioStationCookies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? did = null,Object? didExpires = null,Object? id = null,Object? idExpires = null,}) {
  return _then(_AudioStationCookies(
did: null == did ? _self.did : did // ignore: cast_nullable_to_non_nullable
as String,didExpires: null == didExpires ? _self.didExpires : didExpires // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,idExpires: null == idExpires ? _self.idExpires : idExpires // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Account {

 String get account; String get passwd;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.account, account) || other.account == account)&&(identical(other.passwd, passwd) || other.passwd == passwd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,passwd);

@override
String toString() {
  return 'Account(account: $account, passwd: $passwd)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String account, String passwd
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? passwd = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,passwd: null == passwd ? _self.passwd : passwd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String account,  String passwd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.account,_that.passwd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String account,  String passwd)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.account,_that.passwd);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String account,  String passwd)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.account,_that.passwd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({required this.account, required this.passwd});
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override final  String account;
@override final  String passwd;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.account, account) || other.account == account)&&(identical(other.passwd, passwd) || other.passwd == passwd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,passwd);

@override
String toString() {
  return 'Account(account: $account, passwd: $passwd)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String account, String passwd
});




}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? passwd = null,}) {
  return _then(_Account(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,passwd: null == passwd ? _self.passwd : passwd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthRequest {

 String get api; String get version; String get method; String get session; String get account; String get passwd;@JsonKey(name: 'otp_code') String? get otpCode;@JsonKey(name: 'enable_syno_token') String? get enableSynoToken;@JsonKey(name: 'ik_message') String? get ikMessage; String? get tabid; String? get logintype;@JsonKey(name: 'enable_device_token') String? get enableDeviceToken; String? get timezone; String? get rememberme; String? get client; String? get fid;
/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRequestCopyWith<AuthRequest> get copyWith => _$AuthRequestCopyWithImpl<AuthRequest>(this as AuthRequest, _$identity);

  /// Serializes this AuthRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.version, version) || other.version == version)&&(identical(other.method, method) || other.method == method)&&(identical(other.session, session) || other.session == session)&&(identical(other.account, account) || other.account == account)&&(identical(other.passwd, passwd) || other.passwd == passwd)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.enableSynoToken, enableSynoToken) || other.enableSynoToken == enableSynoToken)&&(identical(other.ikMessage, ikMessage) || other.ikMessage == ikMessage)&&(identical(other.tabid, tabid) || other.tabid == tabid)&&(identical(other.logintype, logintype) || other.logintype == logintype)&&(identical(other.enableDeviceToken, enableDeviceToken) || other.enableDeviceToken == enableDeviceToken)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.rememberme, rememberme) || other.rememberme == rememberme)&&(identical(other.client, client) || other.client == client)&&(identical(other.fid, fid) || other.fid == fid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,version,method,session,account,passwd,otpCode,enableSynoToken,ikMessage,tabid,logintype,enableDeviceToken,timezone,rememberme,client,fid);

@override
String toString() {
  return 'AuthRequest(api: $api, version: $version, method: $method, session: $session, account: $account, passwd: $passwd, otpCode: $otpCode, enableSynoToken: $enableSynoToken, ikMessage: $ikMessage, tabid: $tabid, logintype: $logintype, enableDeviceToken: $enableDeviceToken, timezone: $timezone, rememberme: $rememberme, client: $client, fid: $fid)';
}


}

/// @nodoc
abstract mixin class $AuthRequestCopyWith<$Res>  {
  factory $AuthRequestCopyWith(AuthRequest value, $Res Function(AuthRequest) _then) = _$AuthRequestCopyWithImpl;
@useResult
$Res call({
 String api, String version, String method, String session, String account, String passwd,@JsonKey(name: 'otp_code') String? otpCode,@JsonKey(name: 'enable_syno_token') String? enableSynoToken,@JsonKey(name: 'ik_message') String? ikMessage, String? tabid, String? logintype,@JsonKey(name: 'enable_device_token') String? enableDeviceToken, String? timezone, String? rememberme, String? client, String? fid
});




}
/// @nodoc
class _$AuthRequestCopyWithImpl<$Res>
    implements $AuthRequestCopyWith<$Res> {
  _$AuthRequestCopyWithImpl(this._self, this._then);

  final AuthRequest _self;
  final $Res Function(AuthRequest) _then;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? version = null,Object? method = null,Object? session = null,Object? account = null,Object? passwd = null,Object? otpCode = freezed,Object? enableSynoToken = freezed,Object? ikMessage = freezed,Object? tabid = freezed,Object? logintype = freezed,Object? enableDeviceToken = freezed,Object? timezone = freezed,Object? rememberme = freezed,Object? client = freezed,Object? fid = freezed,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,passwd: null == passwd ? _self.passwd : passwd // ignore: cast_nullable_to_non_nullable
as String,otpCode: freezed == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String?,enableSynoToken: freezed == enableSynoToken ? _self.enableSynoToken : enableSynoToken // ignore: cast_nullable_to_non_nullable
as String?,ikMessage: freezed == ikMessage ? _self.ikMessage : ikMessage // ignore: cast_nullable_to_non_nullable
as String?,tabid: freezed == tabid ? _self.tabid : tabid // ignore: cast_nullable_to_non_nullable
as String?,logintype: freezed == logintype ? _self.logintype : logintype // ignore: cast_nullable_to_non_nullable
as String?,enableDeviceToken: freezed == enableDeviceToken ? _self.enableDeviceToken : enableDeviceToken // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,rememberme: freezed == rememberme ? _self.rememberme : rememberme // ignore: cast_nullable_to_non_nullable
as String?,client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String?,fid: freezed == fid ? _self.fid : fid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthRequest].
extension AuthRequestPatterns on AuthRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthRequest value)  $default,){
final _that = this;
switch (_that) {
case _AuthRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AuthRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String version,  String method,  String session,  String account,  String passwd, @JsonKey(name: 'otp_code')  String? otpCode, @JsonKey(name: 'enable_syno_token')  String? enableSynoToken, @JsonKey(name: 'ik_message')  String? ikMessage,  String? tabid,  String? logintype, @JsonKey(name: 'enable_device_token')  String? enableDeviceToken,  String? timezone,  String? rememberme,  String? client,  String? fid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthRequest() when $default != null:
return $default(_that.api,_that.version,_that.method,_that.session,_that.account,_that.passwd,_that.otpCode,_that.enableSynoToken,_that.ikMessage,_that.tabid,_that.logintype,_that.enableDeviceToken,_that.timezone,_that.rememberme,_that.client,_that.fid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String version,  String method,  String session,  String account,  String passwd, @JsonKey(name: 'otp_code')  String? otpCode, @JsonKey(name: 'enable_syno_token')  String? enableSynoToken, @JsonKey(name: 'ik_message')  String? ikMessage,  String? tabid,  String? logintype, @JsonKey(name: 'enable_device_token')  String? enableDeviceToken,  String? timezone,  String? rememberme,  String? client,  String? fid)  $default,) {final _that = this;
switch (_that) {
case _AuthRequest():
return $default(_that.api,_that.version,_that.method,_that.session,_that.account,_that.passwd,_that.otpCode,_that.enableSynoToken,_that.ikMessage,_that.tabid,_that.logintype,_that.enableDeviceToken,_that.timezone,_that.rememberme,_that.client,_that.fid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String version,  String method,  String session,  String account,  String passwd, @JsonKey(name: 'otp_code')  String? otpCode, @JsonKey(name: 'enable_syno_token')  String? enableSynoToken, @JsonKey(name: 'ik_message')  String? ikMessage,  String? tabid,  String? logintype, @JsonKey(name: 'enable_device_token')  String? enableDeviceToken,  String? timezone,  String? rememberme,  String? client,  String? fid)?  $default,) {final _that = this;
switch (_that) {
case _AuthRequest() when $default != null:
return $default(_that.api,_that.version,_that.method,_that.session,_that.account,_that.passwd,_that.otpCode,_that.enableSynoToken,_that.ikMessage,_that.tabid,_that.logintype,_that.enableDeviceToken,_that.timezone,_that.rememberme,_that.client,_that.fid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthRequest implements AuthRequest {
  const _AuthRequest({required this.api, required this.version, required this.method, required this.session, required this.account, required this.passwd, @JsonKey(name: 'otp_code') this.otpCode, @JsonKey(name: 'enable_syno_token') this.enableSynoToken, @JsonKey(name: 'ik_message') this.ikMessage, this.tabid, this.logintype, @JsonKey(name: 'enable_device_token') this.enableDeviceToken, this.timezone, this.rememberme, this.client, this.fid});
  factory _AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);

@override final  String api;
@override final  String version;
@override final  String method;
@override final  String session;
@override final  String account;
@override final  String passwd;
@override@JsonKey(name: 'otp_code') final  String? otpCode;
@override@JsonKey(name: 'enable_syno_token') final  String? enableSynoToken;
@override@JsonKey(name: 'ik_message') final  String? ikMessage;
@override final  String? tabid;
@override final  String? logintype;
@override@JsonKey(name: 'enable_device_token') final  String? enableDeviceToken;
@override final  String? timezone;
@override final  String? rememberme;
@override final  String? client;
@override final  String? fid;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthRequestCopyWith<_AuthRequest> get copyWith => __$AuthRequestCopyWithImpl<_AuthRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.version, version) || other.version == version)&&(identical(other.method, method) || other.method == method)&&(identical(other.session, session) || other.session == session)&&(identical(other.account, account) || other.account == account)&&(identical(other.passwd, passwd) || other.passwd == passwd)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.enableSynoToken, enableSynoToken) || other.enableSynoToken == enableSynoToken)&&(identical(other.ikMessage, ikMessage) || other.ikMessage == ikMessage)&&(identical(other.tabid, tabid) || other.tabid == tabid)&&(identical(other.logintype, logintype) || other.logintype == logintype)&&(identical(other.enableDeviceToken, enableDeviceToken) || other.enableDeviceToken == enableDeviceToken)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.rememberme, rememberme) || other.rememberme == rememberme)&&(identical(other.client, client) || other.client == client)&&(identical(other.fid, fid) || other.fid == fid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,version,method,session,account,passwd,otpCode,enableSynoToken,ikMessage,tabid,logintype,enableDeviceToken,timezone,rememberme,client,fid);

@override
String toString() {
  return 'AuthRequest(api: $api, version: $version, method: $method, session: $session, account: $account, passwd: $passwd, otpCode: $otpCode, enableSynoToken: $enableSynoToken, ikMessage: $ikMessage, tabid: $tabid, logintype: $logintype, enableDeviceToken: $enableDeviceToken, timezone: $timezone, rememberme: $rememberme, client: $client, fid: $fid)';
}


}

/// @nodoc
abstract mixin class _$AuthRequestCopyWith<$Res> implements $AuthRequestCopyWith<$Res> {
  factory _$AuthRequestCopyWith(_AuthRequest value, $Res Function(_AuthRequest) _then) = __$AuthRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String version, String method, String session, String account, String passwd,@JsonKey(name: 'otp_code') String? otpCode,@JsonKey(name: 'enable_syno_token') String? enableSynoToken,@JsonKey(name: 'ik_message') String? ikMessage, String? tabid, String? logintype,@JsonKey(name: 'enable_device_token') String? enableDeviceToken, String? timezone, String? rememberme, String? client, String? fid
});




}
/// @nodoc
class __$AuthRequestCopyWithImpl<$Res>
    implements _$AuthRequestCopyWith<$Res> {
  __$AuthRequestCopyWithImpl(this._self, this._then);

  final _AuthRequest _self;
  final $Res Function(_AuthRequest) _then;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? version = null,Object? method = null,Object? session = null,Object? account = null,Object? passwd = null,Object? otpCode = freezed,Object? enableSynoToken = freezed,Object? ikMessage = freezed,Object? tabid = freezed,Object? logintype = freezed,Object? enableDeviceToken = freezed,Object? timezone = freezed,Object? rememberme = freezed,Object? client = freezed,Object? fid = freezed,}) {
  return _then(_AuthRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,passwd: null == passwd ? _self.passwd : passwd // ignore: cast_nullable_to_non_nullable
as String,otpCode: freezed == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String?,enableSynoToken: freezed == enableSynoToken ? _self.enableSynoToken : enableSynoToken // ignore: cast_nullable_to_non_nullable
as String?,ikMessage: freezed == ikMessage ? _self.ikMessage : ikMessage // ignore: cast_nullable_to_non_nullable
as String?,tabid: freezed == tabid ? _self.tabid : tabid // ignore: cast_nullable_to_non_nullable
as String?,logintype: freezed == logintype ? _self.logintype : logintype // ignore: cast_nullable_to_non_nullable
as String?,enableDeviceToken: freezed == enableDeviceToken ? _self.enableDeviceToken : enableDeviceToken // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,rememberme: freezed == rememberme ? _self.rememberme : rememberme // ignore: cast_nullable_to_non_nullable
as String?,client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String?,fid: freezed == fid ? _self.fid : fid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AuthData {

 String? get account;@JsonKey(name: 'device_id') String? get deviceId;@JsonKey(name: 'ik_message') String? get ikMessage;@JsonKey(name: 'is_portal_port') bool get isPortalPort; String? get sid; String get synotoken;
/// Create a copy of AuthData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDataCopyWith<AuthData> get copyWith => _$AuthDataCopyWithImpl<AuthData>(this as AuthData, _$identity);

  /// Serializes this AuthData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthData&&(identical(other.account, account) || other.account == account)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.ikMessage, ikMessage) || other.ikMessage == ikMessage)&&(identical(other.isPortalPort, isPortalPort) || other.isPortalPort == isPortalPort)&&(identical(other.sid, sid) || other.sid == sid)&&(identical(other.synotoken, synotoken) || other.synotoken == synotoken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,deviceId,ikMessage,isPortalPort,sid,synotoken);

@override
String toString() {
  return 'AuthData(account: $account, deviceId: $deviceId, ikMessage: $ikMessage, isPortalPort: $isPortalPort, sid: $sid, synotoken: $synotoken)';
}


}

/// @nodoc
abstract mixin class $AuthDataCopyWith<$Res>  {
  factory $AuthDataCopyWith(AuthData value, $Res Function(AuthData) _then) = _$AuthDataCopyWithImpl;
@useResult
$Res call({
 String? account,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'ik_message') String? ikMessage,@JsonKey(name: 'is_portal_port') bool isPortalPort, String? sid, String synotoken
});




}
/// @nodoc
class _$AuthDataCopyWithImpl<$Res>
    implements $AuthDataCopyWith<$Res> {
  _$AuthDataCopyWithImpl(this._self, this._then);

  final AuthData _self;
  final $Res Function(AuthData) _then;

/// Create a copy of AuthData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = freezed,Object? deviceId = freezed,Object? ikMessage = freezed,Object? isPortalPort = null,Object? sid = freezed,Object? synotoken = null,}) {
  return _then(_self.copyWith(
account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,ikMessage: freezed == ikMessage ? _self.ikMessage : ikMessage // ignore: cast_nullable_to_non_nullable
as String?,isPortalPort: null == isPortalPort ? _self.isPortalPort : isPortalPort // ignore: cast_nullable_to_non_nullable
as bool,sid: freezed == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as String?,synotoken: null == synotoken ? _self.synotoken : synotoken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthData].
extension AuthDataPatterns on AuthData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthData value)  $default,){
final _that = this;
switch (_that) {
case _AuthData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? account, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'ik_message')  String? ikMessage, @JsonKey(name: 'is_portal_port')  bool isPortalPort,  String? sid,  String synotoken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthData() when $default != null:
return $default(_that.account,_that.deviceId,_that.ikMessage,_that.isPortalPort,_that.sid,_that.synotoken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? account, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'ik_message')  String? ikMessage, @JsonKey(name: 'is_portal_port')  bool isPortalPort,  String? sid,  String synotoken)  $default,) {final _that = this;
switch (_that) {
case _AuthData():
return $default(_that.account,_that.deviceId,_that.ikMessage,_that.isPortalPort,_that.sid,_that.synotoken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? account, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'ik_message')  String? ikMessage, @JsonKey(name: 'is_portal_port')  bool isPortalPort,  String? sid,  String synotoken)?  $default,) {final _that = this;
switch (_that) {
case _AuthData() when $default != null:
return $default(_that.account,_that.deviceId,_that.ikMessage,_that.isPortalPort,_that.sid,_that.synotoken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthData implements AuthData {
  const _AuthData({this.account, @JsonKey(name: 'device_id') this.deviceId, @JsonKey(name: 'ik_message') this.ikMessage, @JsonKey(name: 'is_portal_port') required this.isPortalPort, this.sid, required this.synotoken});
  factory _AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);

@override final  String? account;
@override@JsonKey(name: 'device_id') final  String? deviceId;
@override@JsonKey(name: 'ik_message') final  String? ikMessage;
@override@JsonKey(name: 'is_portal_port') final  bool isPortalPort;
@override final  String? sid;
@override final  String synotoken;

/// Create a copy of AuthData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDataCopyWith<_AuthData> get copyWith => __$AuthDataCopyWithImpl<_AuthData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthData&&(identical(other.account, account) || other.account == account)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.ikMessage, ikMessage) || other.ikMessage == ikMessage)&&(identical(other.isPortalPort, isPortalPort) || other.isPortalPort == isPortalPort)&&(identical(other.sid, sid) || other.sid == sid)&&(identical(other.synotoken, synotoken) || other.synotoken == synotoken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,deviceId,ikMessage,isPortalPort,sid,synotoken);

@override
String toString() {
  return 'AuthData(account: $account, deviceId: $deviceId, ikMessage: $ikMessage, isPortalPort: $isPortalPort, sid: $sid, synotoken: $synotoken)';
}


}

/// @nodoc
abstract mixin class _$AuthDataCopyWith<$Res> implements $AuthDataCopyWith<$Res> {
  factory _$AuthDataCopyWith(_AuthData value, $Res Function(_AuthData) _then) = __$AuthDataCopyWithImpl;
@override @useResult
$Res call({
 String? account,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'ik_message') String? ikMessage,@JsonKey(name: 'is_portal_port') bool isPortalPort, String? sid, String synotoken
});




}
/// @nodoc
class __$AuthDataCopyWithImpl<$Res>
    implements _$AuthDataCopyWith<$Res> {
  __$AuthDataCopyWithImpl(this._self, this._then);

  final _AuthData _self;
  final $Res Function(_AuthData) _then;

/// Create a copy of AuthData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = freezed,Object? deviceId = freezed,Object? ikMessage = freezed,Object? isPortalPort = null,Object? sid = freezed,Object? synotoken = null,}) {
  return _then(_AuthData(
account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,ikMessage: freezed == ikMessage ? _self.ikMessage : ikMessage // ignore: cast_nullable_to_non_nullable
as String?,isPortalPort: null == isPortalPort ? _self.isPortalPort : isPortalPort // ignore: cast_nullable_to_non_nullable
as bool,sid: freezed == sid ? _self.sid : sid // ignore: cast_nullable_to_non_nullable
as String?,synotoken: null == synotoken ? _self.synotoken : synotoken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthResponse {

 bool get success; AuthData? get data; Map<String, dynamic>? get error;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'AuthResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
 bool success, AuthData? data, Map<String, dynamic>? error
});


$AuthDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthData?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponse].
extension AuthResponsePatterns on AuthResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  AuthData? data,  Map<String, dynamic>? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  AuthData? data,  Map<String, dynamic>? error)  $default,) {final _that = this;
switch (_that) {
case _AuthResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  AuthData? data,  Map<String, dynamic>? error)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.success,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({required this.success, this.data, final  Map<String, dynamic>? error}): _error = error;
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override final  bool success;
@override final  AuthData? data;
 final  Map<String, dynamic>? _error;
@override Map<String, dynamic>? get error {
  final value = _error;
  if (value == null) return null;
  if (_error is EqualUnmodifiableMapView) return _error;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._error, _error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,const DeepCollectionEquality().hash(_error));

@override
String toString() {
  return 'AuthResponse(success: $success, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, AuthData? data, Map<String, dynamic>? error
});


@override $AuthDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_AuthResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthData?,error: freezed == error ? _self._error : error // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LogoutRequest {

 String get api; String get method; String get version;
/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutRequestCopyWith<LogoutRequest> get copyWith => _$LogoutRequestCopyWithImpl<LogoutRequest>(this as LogoutRequest, _$identity);

  /// Serializes this LogoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version);

@override
String toString() {
  return 'LogoutRequest(api: $api, method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class $LogoutRequestCopyWith<$Res>  {
  factory $LogoutRequestCopyWith(LogoutRequest value, $Res Function(LogoutRequest) _then) = _$LogoutRequestCopyWithImpl;
@useResult
$Res call({
 String api, String method, String version
});




}
/// @nodoc
class _$LogoutRequestCopyWithImpl<$Res>
    implements $LogoutRequestCopyWith<$Res> {
  _$LogoutRequestCopyWithImpl(this._self, this._then);

  final LogoutRequest _self;
  final $Res Function(LogoutRequest) _then;

/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? api = null,Object? method = null,Object? version = null,}) {
  return _then(_self.copyWith(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutRequest].
extension LogoutRequestPatterns on LogoutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutRequest value)  $default,){
final _that = this;
switch (_that) {
case _LogoutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String api,  String method,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
return $default(_that.api,_that.method,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String api,  String method,  String version)  $default,) {final _that = this;
switch (_that) {
case _LogoutRequest():
return $default(_that.api,_that.method,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String api,  String method,  String version)?  $default,) {final _that = this;
switch (_that) {
case _LogoutRequest() when $default != null:
return $default(_that.api,_that.method,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutRequest implements LogoutRequest {
  const _LogoutRequest({required this.api, required this.method, required this.version});
  factory _LogoutRequest.fromJson(Map<String, dynamic> json) => _$LogoutRequestFromJson(json);

@override final  String api;
@override final  String method;
@override final  String version;

/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutRequestCopyWith<_LogoutRequest> get copyWith => __$LogoutRequestCopyWithImpl<_LogoutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequest&&(identical(other.api, api) || other.api == api)&&(identical(other.method, method) || other.method == method)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,api,method,version);

@override
String toString() {
  return 'LogoutRequest(api: $api, method: $method, version: $version)';
}


}

/// @nodoc
abstract mixin class _$LogoutRequestCopyWith<$Res> implements $LogoutRequestCopyWith<$Res> {
  factory _$LogoutRequestCopyWith(_LogoutRequest value, $Res Function(_LogoutRequest) _then) = __$LogoutRequestCopyWithImpl;
@override @useResult
$Res call({
 String api, String method, String version
});




}
/// @nodoc
class __$LogoutRequestCopyWithImpl<$Res>
    implements _$LogoutRequestCopyWith<$Res> {
  __$LogoutRequestCopyWithImpl(this._self, this._then);

  final _LogoutRequest _self;
  final $Res Function(_LogoutRequest) _then;

/// Create a copy of LogoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? api = null,Object? method = null,Object? version = null,}) {
  return _then(_LogoutRequest(
api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LogoutResponse {

 bool get success;
/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutResponseCopyWith<LogoutResponse> get copyWith => _$LogoutResponseCopyWithImpl<LogoutResponse>(this as LogoutResponse, _$identity);

  /// Serializes this LogoutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'LogoutResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $LogoutResponseCopyWith<$Res>  {
  factory $LogoutResponseCopyWith(LogoutResponse value, $Res Function(LogoutResponse) _then) = _$LogoutResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$LogoutResponseCopyWithImpl<$Res>
    implements $LogoutResponseCopyWith<$Res> {
  _$LogoutResponseCopyWithImpl(this._self, this._then);

  final LogoutResponse _self;
  final $Res Function(LogoutResponse) _then;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutResponse].
extension LogoutResponsePatterns on LogoutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutResponse value)  $default,){
final _that = this;
switch (_that) {
case _LogoutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _LogoutResponse():
return $default(_that.success);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutResponse implements LogoutResponse {
  const _LogoutResponse({required this.success});
  factory _LogoutResponse.fromJson(Map<String, dynamic> json) => _$LogoutResponseFromJson(json);

@override final  bool success;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutResponseCopyWith<_LogoutResponse> get copyWith => __$LogoutResponseCopyWithImpl<_LogoutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'LogoutResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$LogoutResponseCopyWith<$Res> implements $LogoutResponseCopyWith<$Res> {
  factory _$LogoutResponseCopyWith(_LogoutResponse value, $Res Function(_LogoutResponse) _then) = __$LogoutResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$LogoutResponseCopyWithImpl<$Res>
    implements _$LogoutResponseCopyWith<$Res> {
  __$LogoutResponseCopyWithImpl(this._self, this._then);

  final _LogoutResponse _self;
  final $Res Function(_LogoutResponse) _then;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_LogoutResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
