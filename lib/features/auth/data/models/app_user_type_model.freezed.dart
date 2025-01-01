// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUserTypeModel _$AppUserTypeModelFromJson(Map<String, dynamic> json) {
  return _AppUserTypeModel.fromJson(json);
}

/// @nodoc
mixin _$AppUserTypeModel {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get tvalue => throw _privateConstructorUsedError;

  /// Serializes this AppUserTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUserTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserTypeModelCopyWith<AppUserTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserTypeModelCopyWith<$Res> {
  factory $AppUserTypeModelCopyWith(
          AppUserTypeModel value, $Res Function(AppUserTypeModel) then) =
      _$AppUserTypeModelCopyWithImpl<$Res, AppUserTypeModel>;
  @useResult
  $Res call({int id, String label, String tvalue});
}

/// @nodoc
class _$AppUserTypeModelCopyWithImpl<$Res, $Val extends AppUserTypeModel>
    implements $AppUserTypeModelCopyWith<$Res> {
  _$AppUserTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUserTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? tvalue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      tvalue: null == tvalue
          ? _value.tvalue
          : tvalue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserTypeModelImplCopyWith<$Res>
    implements $AppUserTypeModelCopyWith<$Res> {
  factory _$$AppUserTypeModelImplCopyWith(_$AppUserTypeModelImpl value,
          $Res Function(_$AppUserTypeModelImpl) then) =
      __$$AppUserTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label, String tvalue});
}

/// @nodoc
class __$$AppUserTypeModelImplCopyWithImpl<$Res>
    extends _$AppUserTypeModelCopyWithImpl<$Res, _$AppUserTypeModelImpl>
    implements _$$AppUserTypeModelImplCopyWith<$Res> {
  __$$AppUserTypeModelImplCopyWithImpl(_$AppUserTypeModelImpl _value,
      $Res Function(_$AppUserTypeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUserTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? tvalue = null,
  }) {
    return _then(_$AppUserTypeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      tvalue: null == tvalue
          ? _value.tvalue
          : tvalue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserTypeModelImpl implements _AppUserTypeModel {
  const _$AppUserTypeModelImpl(
      {required this.id, required this.label, required this.tvalue});

  factory _$AppUserTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserTypeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String label;
  @override
  final String tvalue;

  /// Create a copy of AppUserTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserTypeModelImplCopyWith<_$AppUserTypeModelImpl> get copyWith =>
      __$$AppUserTypeModelImplCopyWithImpl<_$AppUserTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserTypeModelImplToJson(
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

abstract class _AppUserTypeModel implements AppUserTypeModel {
  const factory _AppUserTypeModel(
      {required final int id,
      required final String label,
      required final String tvalue}) = _$AppUserTypeModelImpl;

  factory _AppUserTypeModel.fromJson(Map<String, dynamic> json) =
      _$AppUserTypeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get label;
  @override
  String get tvalue;

  /// Create a copy of AppUserTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserTypeModelImplCopyWith<_$AppUserTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
