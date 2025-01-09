import 'package:my_template_project/features/register/data/models/register_model.dart';
import 'package:my_template_project/features/register/domain/entity/register.dart';

extension RegisterMapper on Register{
  RegisterModel toModel(){
    return RegisterModel(email: email, firstname: firstname, lastname: lastname, landlinePhone: landlinePhone, brandId: brandId, date: date);
  }
}