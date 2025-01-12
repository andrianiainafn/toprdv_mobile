import 'package:equatable/equatable.dart';

class TransmitterBrand extends Equatable{
  final int id;
  final String brandName;

  const TransmitterBrand(this.id, this.brandName);
  @override
  List<Object?> get props => [];

}