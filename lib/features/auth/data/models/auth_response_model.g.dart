// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      token: json['token'] as String,
      appUserId: (json['appUserId'] as num).toInt(),
      userFullNameDTO: UserFullNameDTOModel.fromJson(
          json['userFullNameDTO'] as Map<String, dynamic>),
      appUserType: AppUserTypeModel.fromJson(
          json['appUserType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'appUserId': instance.appUserId,
      'userFullNameDTO': instance.userFullNameDTO,
      'appUserType': instance.appUserType,
    };
