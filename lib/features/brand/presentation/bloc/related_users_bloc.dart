import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/brand/domain/entity/related_brand.dart';
import 'package:my_template_project/features/brand/domain/repositories/brand_repository.dart';
import 'package:my_template_project/features/brand/domain/usecases/fetch_related_brand.dart';
import 'package:my_template_project/features/brand/domain/usecases/update_brand.dart';

part 'related_users_event.dart';
part 'related_users_state.dart';

class RelatedUsersBloc extends Bloc<RelatedUsersEvent, RelatedUsersState> {
  final FetchRelatedBrand fetchRelatedBrand;
  final UpdateBrand updateBrand;
  RelatedUsersBloc(this.fetchRelatedBrand,this.updateBrand) : super(RelatedUsersInitial()) {
    on<GetRelatedUser>(_onFetchRelatedBrand);
    on<UpdateRelatedUserEvent>(_onUpdateRelatedBrand);
  }
  Future<void> _onFetchRelatedBrand(GetRelatedUser event, Emitter<RelatedUsersState> emit)async {
    emit(RelatedUsersLoading());
    final response = await fetchRelatedBrand(NoParams());
    response.fold((failure){
      emit(RelatedUsersError(mapFailureToMessage(failure)));
    }, (brand){
      emit(RelatedUsersLoaded(brand));
    });
  }
  Future<void> _onUpdateRelatedBrand(UpdateRelatedUserEvent  event, Emitter<RelatedUsersState> emit)async {
    emit(RelatedUsersLoading());
    final response  = await updateBrand(Params(event.relatedBrand));
    response.fold((failure){
      emit(RelatedUsersError(mapFailureToMessage(failure)));
    }, (brand){
      emit(RelatedUsersLoaded(brand!));
    });
  }
}
