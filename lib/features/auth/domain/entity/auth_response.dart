
import 'package:equatable/equatable.dart';
import 'package:my_template_project/features/auth/domain/entity/app_user_type.dart';
import 'package:my_template_project/features/auth/domain/entity/user_full_name_dto.dart';

class AuthResponse extends Equatable{
  final String token;
  final int appUserId;
  final UserFullNameDTO userFullNameDTO;
  final AppUserType appUserType;
  const AuthResponse({ required this.appUserType, required this.appUserId, required this.userFullNameDTO, required this.token});
  @override
  List<Object?> get props => [token];

}