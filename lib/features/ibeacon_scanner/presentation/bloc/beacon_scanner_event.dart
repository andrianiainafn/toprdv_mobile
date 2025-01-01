part of 'beacon_scanner_bloc.dart';

sealed class BeaconScannerEvent extends Equatable {
  const BeaconScannerEvent();
}
class StartScanningEvent extends BeaconScannerEvent {
  @override
  List<Object?> get props => [];
}

class StopScanningEvent extends BeaconScannerEvent {
  @override
  List<Object?> get props => [];
}