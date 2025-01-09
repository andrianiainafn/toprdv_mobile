import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/brand/domain/entity/brand.dart';
import 'package:my_template_project/features/brand/domain/usecases/fetch_brand.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final FetchBrand fetchBrand;
  BrandBloc(this.fetchBrand) : super(BrandInitial()) {
    on<GetBrandEvent>(_getBrand);

  }
  Future<void> _getBrand(GetBrandEvent event,Emitter<BrandState> emit)async{
    emit(LoadingBrand());
    final response = await fetchBrand(NoParams());
    response.fold((failure){
      emit(ErrorBrand(mapFailureToMessage(failure)));
    }, (brand){
      emit(LoadedBrand(brand!));
    });
  }
}
