// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserTypeModelImpl _$$AppUserTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppUserTypeModelImpl(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      tvalue: json['tvalue'] as String,
    );

Map<String, dynamic> _$$AppUserTypeModelImplToJson(
        _$AppUserTypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'tvalue': instance.tvalue,
    };
