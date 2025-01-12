import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter_brand.dart';

part 'transmitter_brand_model.freezed.dart';
part 'transmitter_brand_model.g.dart';

@freezed
class TransmitterBrandModel extends TransmitterBrand with _$TransmitterBrandModel {
  const factory TransmitterBrandModel({
    required int id,
    required String brandName,
  }) = _TransmitterBrandModel;

  factory TransmitterBrandModel.fromJson(Map<String, dynamic> json) => _$TransmitterBrandModelFromJson(json);
}
