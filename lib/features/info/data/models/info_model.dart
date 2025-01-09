import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/info/data/models/info_item_model.dart';
import 'package:my_template_project/features/info/domain/entity/info.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
class InfoModel extends Info with _$InfoModel {
  const factory InfoModel({
    required List<InfoItemModel> content,
    required int totalPages,
    required int pageNumber
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json)=> _$InfoModelFromJson(json);

}