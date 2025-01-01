import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/auth/domain/entity/user_full_name_dto.dart';

part 'user_full_name_dto_model.freezed.dart';
part 'user_full_name_dto_model.g.dart';

@freezed
class UserFullNameDTOModel extends UserFullNameDTO with _$UserFullNameDTOModel {
  const factory UserFullNameDTOModel({
    required String firstname,
    required String lastname,
  }) = _UserFullNameDTOModel;

  // Assurez-vous que la méthode fromJson est générée correctement
  factory UserFullNameDTOModel.fromJson(Map<String, dynamic> json) => _$UserFullNameDTOModelFromJson(json);
}
