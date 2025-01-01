import 'package:equatable/equatable.dart';

class UserFullNameDTO extends Equatable{
  final String firstname;
  final String lastname;
  const UserFullNameDTO(this.firstname, this.lastname);
  @override
  List<Object?> get props => [firstname,lastname];
}