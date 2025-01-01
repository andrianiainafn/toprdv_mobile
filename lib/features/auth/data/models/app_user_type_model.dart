import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/auth/domain/entity/app_user_type.dart';

part 'app_user_type_model.freezed.dart';
part 'app_user_type_model.g.dart';

@freezed
class AppUserTypeModel extends AppUserType with _$AppUserTypeModel {
  const factory AppUserTypeModel({
    required int id,
    required String label,
    required String tvalue,
  }) = _AppUserTypeModel;

  factory AppUserTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserTypeModelFromJson(json);
}
