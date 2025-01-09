import 'package:equatable/equatable.dart';

class RelatedBrand extends Equatable{
  final int id;
  final String brandName;

  const RelatedBrand({required this.id,required this.brandName});

  @override
  List<Object?> get props => [];

}