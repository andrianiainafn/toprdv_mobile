
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/brand/domain/entity/brand.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
class BrandModel extends Brand with _$BrandModel{
  const factory BrandModel({
      required int id,
      required String value
  })= _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json)=> _$BrandModelFromJson(json);
}