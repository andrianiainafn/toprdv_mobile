import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel extends Register with _$RegisterModel{
  const factory RegisterModel({
    required String email,
    required String firstname,
    required String lastname,
    required String landlinePhone,
    required String brandId,
    required DateTime date
  })= _RegisterModel;

  factory RegisterModel.fromJson(Map<String,dynamic> json)=> _$RegisterModelFromJson(json);

}