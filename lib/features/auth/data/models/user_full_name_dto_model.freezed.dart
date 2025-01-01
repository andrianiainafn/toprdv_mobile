// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_full_name_dto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserFullNameDTOModel _$UserFullNameDTOModelFromJson(Map<String, dynamic> json) {
  return _UserFullNameDTOModel.fromJson(json);
}

/// @nodoc
mixin _$UserFullNameDTOModel {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;

  /// Serializes this UserFullNameDTOModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserFullNameDTOModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFullNameDTOModelCopyWith<UserFullNameDTOModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFullNameDTOModelCopyWith<$Res> {
  factory $UserFullNameDTOModelCopyWith(UserFullNameDTOModel value,
          $Res Function(UserFullNameDTOModel) then) =
      _$UserFullNameDTOModelCopyWithImpl<$Res, UserFullNameDTOModel>;
  @useResult
  $Res call({String firstname, String lastname});
}

/// @nodoc
class _$UserFullNameDTOModelCopyWithImpl<$Res,
        $Val extends UserFullNameDTOModel>
    implements $UserFullNameDTOModelCopyWith<$Res> {
  _$UserFullNameDTOModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFullNameDTOModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFullNameDTOModelImplCopyWith<$Res>
    implements $UserFullNameDTOModelCopyWith<$Res> {
  factory _$$UserFullNameDTOModelImplCopyWith(_$UserFullNameDTOModelImpl value,
          $Res Function(_$UserFullNameDTOModelImpl) then) =
      __$$UserFullNameDTOModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstname, String lastname});
}

/// @nodoc
class __$$UserFullNameDTOModelImplCopyWithImpl<$Res>
    extends _$UserFullNameDTOModelCopyWithImpl<$Res, _$UserFullNameDTOModelImpl>
    implements _$$UserFullNameDTOModelImplCopyWith<$Res> {
  __$$UserFullNameDTOModelImplCopyWithImpl(_$UserFullNameDTOModelImpl _value,
      $Res Function(_$UserFullNameDTOModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserFullNameDTOModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
  }) {
    return _then(_$UserFullNameDTOModelImpl(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFullNameDTOModelImpl implements _UserFullNameDTOModel {
  const _$UserFullNameDTOModelImpl(
      {required this.firstname, required this.lastname});

  factory _$UserFullNameDTOModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFullNameDTOModelImplFromJson(json);

  @override
  final String firstname;
  @override
  final String lastname;

  /// Create a copy of UserFullNameDTOModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFullNameDTOModelImplCopyWith<_$UserFullNameDTOModelImpl>
      get copyWith =>
          __$$UserFullNameDTOModelImplCopyWithImpl<_$UserFullNameDTOModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFullNameDTOModelImplToJson(
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

abstract class _UserFullNameDTOModel implements UserFullNameDTOModel {
  const factory _UserFullNameDTOModel(
      {required final String firstname,
      required final String lastname}) = _$UserFullNameDTOModelImpl;

  factory _UserFullNameDTOModel.fromJson(Map<String, dynamic> json) =
      _$UserFullNameDTOModelImpl.fromJson;

  @override
  String get firstname;
  @override
  String get lastname;

  /// Create a copy of UserFullNameDTOModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFullNameDTOModelImplCopyWith<_$UserFullNameDTOModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
