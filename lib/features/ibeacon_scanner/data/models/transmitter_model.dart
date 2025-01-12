import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/features/ibeacon_scanner/data/models/transmitter_brand_model.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter.dart';

part 'transmitter_model.freezed.dart';
part 'transmitter_model.g.dart';

@freezed
class TransmitterModel extends Transmitter with _$TransmitterModel {
  const factory TransmitterModel({
    required int id,
    required String reference,
    required String major,
    required String minor,
    required String model,
    required String name,
    required TransmitterBrandModel brand,
  }) = _TransmitterModel;

  factory TransmitterModel.fromJson(Map<String, dynamic> json) => _$TransmitterModelFromJson(json);
}

