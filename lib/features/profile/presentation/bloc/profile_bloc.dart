import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/util/map_failure_message.dart';
import 'package:my_template_project/features/profile/domain/entity/profile.dart';
import 'package:my_template_project/features/profile/domain/usecases/fetch_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchProfile fetchProfile;

  ProfileBloc(this.fetchProfile) : super(ProfileInitial()) {
    on<GetProfile>(_onGetProfile);
  }

  Future<void> _onGetProfile(GetProfile event,Emitter<ProfileState> emit)async {
    print("Mandeha ve ito");
     final response = await fetchProfile(Params(event.userId));
     emit(ProfileLoading());
     response.fold((failure){
       emit(ProfileError(mapFailureToMessage(failure)));
     }, (profile){
       emit(ProfileLoaded(profile!));
     });
  }
}
