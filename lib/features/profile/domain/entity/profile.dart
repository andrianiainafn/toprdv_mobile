

import 'package:equatable/equatable.dart';

class Profile extends Equatable{
  final String email;
  final String personalPhoneNumber;
  final String landlinePhone;
  final String city;
  final String brandName;
  final String postalCode;
  final String firstName;
  final String lastName;
  final String manager;

  const Profile(this.email, this.personalPhoneNumber, this.landlinePhone, this.city, this.brandName, this.postalCode, this.firstName, this.lastName, this.manager);

  @override
  List<Object?> get props => [email, personalPhoneNumber,landlinePhone,city,brandName,postalCode, firstName,lastName, manager];
}