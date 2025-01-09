import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/auth/domain/entity/auth_request.dart';

part 'auth_request_model.freezed.dart';
part 'auth_request_model.g.dart';

@freezed
class AuthRequestModel extends AuthRequest with _$AuthRequestModel {
  const factory AuthRequestModel({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String postalCode,
    required String city,
    required String phoneNumber,
}) = _AuthRequestModel;
  factory AuthRequestModel.fromJson(Map<String,dynamic> json)=> _$AuthRequestModelFromJson(json);
}