import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/repositories/beacon_scanner_repository.dart';

class FetchTransmitter implements UseCase<List<Transmitter>,NoParams>{
  final BeaconScannerRepository repository;
  FetchTransmitter(this.repository);
  @override
  Future<Either<Failure, List<Transmitter>>> call(NoParams params) async{
    return await repository.getTransmitters();
  }

}