import 'dart:ffi';

import 'package:equatable/equatable.dart';

class AppUserType extends Equatable{
  final int id;
  final String label;
  final String tvalue;

  const AppUserType(this.id, this.label, this.tvalue);

  @override
  List<Object?> get props => [];

}