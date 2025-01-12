import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/notification/domain/usecases/change_rank.dart';

part 'change_rank_event.dart';
part 'change_rank_state.dart';

class ChangeRankBloc extends Bloc<ChangeRankEvent, ChangeRankState> {
  final ChangeRank changeRank;
  ChangeRankBloc(this.changeRank) : super(ChangeRankInitial()) {
    on<HandleChangeRank>((event, emit) async{
      emit(ChangeRankLoading());
      final response = await changeRank(Params(event.appointmentId));
      response.fold((failure){
        emit(ChangeRankError(mapFailureToMessage(failure)));
      }, (success){
        emit(ChangeRankLoaded());
      });
    });
  }
}
