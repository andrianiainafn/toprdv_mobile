
import 'package:equatable/equatable.dart';

class Brand extends Equatable{
  final int id;
  final String value;

  const Brand(this.id, this.value);
  @override
  List<Object?> get props => [id,value];

}