// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  String get token => throw _privateConstructorUsedError;
  int get appUserId => throw _privateConstructorUsedError;
  UserFullNameDTOModel get userFullNameDTO =>
      throw _privateConstructorUsedError;
  AppUserTypeModel get appUserType => throw _privateConstructorUsedError;

  /// Serializes this AuthResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res, AuthResponseModel>;
  @useResult
  $Res call(
      {String token,
      int appUserId,
      UserFullNameDTOModel userFullNameDTO,
      AppUserTypeModel appUserType});

  $UserFullNameDTOModelCopyWith<$Res> get userFullNameDTO;
  $AppUserTypeModelCopyWith<$Res> get appUserType;
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res, $Val extends AuthResponseModel>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? appUserId = null,
    Object? userFullNameDTO = null,
    Object? appUserType = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      appUserId: null == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as int,
      userFullNameDTO: null == userFullNameDTO
          ? _value.userFullNameDTO
          : userFullNameDTO // ignore: cast_nullable_to_non_nullable
              as UserFullNameDTOModel,
      appUserType: null == appUserType
          ? _value.appUserType
          : appUserType // ignore: cast_nullable_to_non_nullable
              as AppUserTypeModel,
    ) as $Val);
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserFullNameDTOModelCopyWith<$Res> get userFullNameDTO {
    return $UserFullNameDTOModelCopyWith<$Res>(_value.userFullNameDTO, (value) {
      return _then(_value.copyWith(userFullNameDTO: value) as $Val);
    });
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserTypeModelCopyWith<$Res> get appUserType {
    return $AppUserTypeModelCopyWith<$Res>(_value.appUserType, (value) {
      return _then(_value.copyWith(appUserType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseModelImplCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$$AuthResponseModelImplCopyWith(_$AuthResponseModelImpl value,
          $Res Function(_$AuthResponseModelImpl) then) =
      __$$AuthResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      int appUserId,
      UserFullNameDTOModel userFullNameDTO,
      AppUserTypeModel appUserType});

  @override
  $UserFullNameDTOModelCopyWith<$Res> get userFullNameDTO;
  @override
  $AppUserTypeModelCopyWith<$Res> get appUserType;
}

/// @nodoc
class __$$AuthResponseModelImplCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res, _$AuthResponseModelImpl>
    implements _$$AuthResponseModelImplCopyWith<$Res> {
  __$$AuthResponseModelImplCopyWithImpl(_$AuthResponseModelImpl _value,
      $Res Function(_$AuthResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? appUserId = null,
    Object? userFullNameDTO = null,
    Object? appUserType = null,
  }) {
    return _then(_$AuthResponseModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      appUserId: null == appUserId
          ? _value.appUserId
          : appUserId // ignore: cast_nullable_to_non_nullable
              as int,
      userFullNameDTO: null == userFullNameDTO
          ? _value.userFullNameDTO
          : userFullNameDTO // ignore: cast_nullable_to_non_nullable
              as UserFullNameDTOModel,
      appUserType: null == appUserType
          ? _value.appUserType
          : appUserType // ignore: cast_nullable_to_non_nullable
              as AppUserTypeModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseModelImpl implements _AuthResponseModel {
  const _$AuthResponseModelImpl(
      {required this.token,
      required this.appUserId,
      required this.userFullNameDTO,
      required this.appUserType});

  factory _$AuthResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseModelImplFromJson(json);

  @override
  final String token;
  @override
  final int appUserId;
  @override
  final UserFullNameDTOModel userFullNameDTO;
  @override
  final AppUserTypeModel appUserType;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      __$$AuthResponseModelImplCopyWithImpl<_$AuthResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseModelImplToJson(
      this,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel(
      {required final String token,
      required final int appUserId,
      required final UserFullNameDTOModel userFullNameDTO,
      required final AppUserTypeModel appUserType}) = _$AuthResponseModelImpl;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$AuthResponseModelImpl.fromJson;

  @override
  String get token;
  @override
  int get appUserId;
  @override
  UserFullNameDTOModel get userFullNameDTO;
  @override
  AppUserTypeModel get appUserType;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}