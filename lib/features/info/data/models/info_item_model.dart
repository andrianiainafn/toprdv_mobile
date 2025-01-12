
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/info/domain/entity/info_item.dart';

part 'info_item_model.freezed.dart';
part 'info_item_model.g.dart';

@freezed
class InfoItemModel extends InfoItem with _$InfoItemModel{
  const factory InfoItemModel({
    required int id,
    required  String? audioLink,
    required String? videoLink,
    required String? text,
    required String? flyerLink,
    required String infoFormat,
    required DateTime createdAt,
    required String brandName,
  })= _InfoItemModel;
  factory InfoItemModel.fromJson(Map<String, dynamic> json)=> _$InfoItemModelFromJson(json);
}