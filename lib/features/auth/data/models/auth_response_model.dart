import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/auth/data/models/user_full_name_dto_model.dart';
import 'package:my_template_project/features/auth/domain/entity/app_user_type.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_response.dart';
import 'package:my_template_project/features/auth/domain/entity/user_full_name_dto.dart';
import 'app_user_type_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel extends AuthResponse with _$AuthResponseModel {
  const factory AuthResponseModel({
    required final String token,
    required final int appUserId,
    required final UserFullNameDTOModel userFullNameDTO,
    required final AppUserTypeModel appUserType
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);
}
