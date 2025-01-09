
import '../../domain/entity/auth_request.dart';
import 'auth_request_model.dart';

extension AuthRequestMapper on AuthRequest {
  AuthRequestModel toModel() {
    return AuthRequestModel(
      email: email,
      password: password,
      firstName:firstName,
      lastName:lastName,
      postalCode:postalCode,
      city:city,
      phoneNumber:phoneNumber
    );
  }
}