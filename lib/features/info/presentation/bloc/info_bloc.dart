import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/info/domain/entity/info.dart';
import 'package:my_template_project/features/info/domain/usecases/get_info.dart';

import '../../domain/entity/info_item.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetInfo fetchInfo;
  InfoBloc(this.fetchInfo) : super(InfoInitial()) {
   on<GetInfoEvent>(_getInfo);
   on<NewInfoEvent>(_addNewInfo);
  }
  Future<void> _getInfo(GetInfoEvent event,Emitter<InfoState> emit) async{
    emit(InfoLoading());
    final response = await fetchInfo(Params(event.userId, event.pageNumber));
    response.fold((failure){
      emit(InfoErrorState(mapFailureToMessage(failure)));
    },(info){
      emit(InfoLoaded(info!));
    });
  }

  Future<void> _addNewInfo(NewInfoEvent event, Emitter<InfoState> emit)async{
    Info info = event.info;
    List<InfoItem> newItem= [...info.content,event.infoItem];
    info.content.add(event.infoItem);
    emit(InfoLoaded(info));
  }
}
