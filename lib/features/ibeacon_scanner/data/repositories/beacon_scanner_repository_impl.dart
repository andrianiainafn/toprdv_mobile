import 'package:dartz/dartz.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/features/ibeacon_scanner/data/datasources/ibeacon_scanner_remote_data_source.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter.dart';
import '../../domain/repositories/beacon_scanner_repository.dart';

class BeaconScannerRepositoryImpl implements BeaconScannerRepository{
  final ScannerRemoteDatasource datasource;
  BeaconScannerRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<Transmitter>>> getTransmitters() async{
    try{
      final response = await datasource.getTransmitter();
      return Right(response);
    }on Failure{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> sendNotifications(String beaconId) async{
    try{
      final response  = await datasource.sendNotification(beaconId);
      return Right(response);
    }on Failure{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createAppointment(int brandId,DateTime date) async{
    try{
      final response = await datasource.createAppointment(brandId, date);
      return Right(response);
    }on Failure{
      return Left(ServerFailure());
    }
  }

}