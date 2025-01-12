import 'package:dartz/dartz.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter.dart';

import '../../../../core/error/failure.dart';

abstract class BeaconScannerRepository {
  Future<Either<Failure,List<Transmitter>>> getTransmitters();
  Future<Either<Failure,bool>> sendNotifications(String beaconId);
  Future<Either<Failure,bool>> createAppointment(int brandId,DateTime date);
}