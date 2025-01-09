
import 'package:equatable/equatable.dart';

class Register extends Equatable{
  final String email;
  final String firstname;
  final String lastname;
  final String landlinePhone;
  final String brandId;
  final DateTime date;

  const Register(this.email,  this.firstname, this.lastname, this.landlinePhone, this.brandId, this.date);
  @override
  List<Object?> get props => [];
}