import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template_project/core/error/failure.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/repositories/beacon_scanner_repository.dart';

class SendNotification implements UseCase<bool,Params>{
  final BeaconScannerRepository repository;
  SendNotification(this.repository);
  @override
  Future<Either<Failure, bool?>> call(Params params) async{
    return await repository.sendNotifications(params.beaconId);
  }

}

class Params extends Equatable{
  final String beaconId;
  const Params(this.beaconId);
  @override
  List<Object?> get props => [];

}