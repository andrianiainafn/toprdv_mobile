part of 'brand_bloc.dart';

sealed class BrandEvent extends Equatable {
  const BrandEvent();
}

class GetBrandEvent extends BrandEvent{

  @override
  List<Object?> get props => [];
}