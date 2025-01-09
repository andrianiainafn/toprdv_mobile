part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfile extends ProfileEvent{
  final int userId;
  const GetProfile(this.userId);

  @override
  List<Object?> get props => [userId];
}