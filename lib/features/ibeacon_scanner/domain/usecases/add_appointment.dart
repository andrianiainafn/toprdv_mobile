import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/repositories/beacon_scanner_repository.dart';

class AddAppointment implements UseCase<bool,Params>{
  final BeaconScannerRepository repository;

  AddAppointment(this.repository);
  @override
  Future<Either<Failure, bool?>> call(Params params) async{
    return repository.createAppointment(params.brandId, params.date);
  }

}
class Params extends Equatable{
  final int brandId;
  final DateTime date;
  const Params(this.brandId, this.date);
  @override
  List<Object?> get props => [];

}