import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/profile.dart';
part 'profile_model.g.dart';
part 'profile_model.freezed.dart';

@freezed
class ProfileModel extends Profile  with _$ProfileModel{
  const factory ProfileModel({
    required String email,
    required String personalPhoneNumber,
    required String landlinePhone,
    required String city,
    required String brandName,
    required String postalCode,
    required String firstName,
    required String lastName,
    required String manager
}) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}