import 'package:equatable/equatable.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter_brand.dart';

class Transmitter extends Equatable{
  final int id;
  final String reference;
  final String major;
  final String minor;
  final String model;
  final String name;
  final TransmitterBrand brand;

  const Transmitter(this.id, this.reference, this.major, this.minor, this.model, this.name, this.brand);
  @override
  List<Object?> get props => [];

}