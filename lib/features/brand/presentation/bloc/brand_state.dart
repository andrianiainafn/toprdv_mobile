part of 'brand_bloc.dart';

sealed class BrandState extends Equatable {
  const BrandState();
}

final class BrandInitial extends BrandState {
  @override
  List<Object> get props => [];
}

class LoadingBrand extends BrandState {
  @override
  List<Object> get props => [];
}

class LoadedBrand extends BrandState {
  final List<Brand> brand;
  const LoadedBrand(this.brand);
  @override
  List<Object> get props => [brand];
}

class ErrorBrand extends BrandState {
  final String message;

  const ErrorBrand(this.message);
  @override
  List<Object> get props => [message];
}
