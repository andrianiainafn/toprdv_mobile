import 'package:equatable/equatable.dart';

class AuthRequest extends Equatable{
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String postalCode;
  final String city;
  final String phoneNumber;

  const AuthRequest(this.email, this.password, this.firstName, this.lastName, this.postalCode, this.city, this.phoneNumber);
  @override
  List<Object?> get props => [email,password,firstName,lastName,postalCode,city,phoneNumber];

}