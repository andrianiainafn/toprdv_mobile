part of 'beacon_scanner_bloc.dart';

sealed class BeaconScannerState extends Equatable {
  const BeaconScannerState();
}

final class BeaconScannerInitial extends BeaconScannerState {
  @override
  List<Object> get props => [];
}

class BeaconScannerScanning extends BeaconScannerState {
  final List<Beacon> beacons;

  const BeaconScannerScanning({required this.beacons});

  @override
  List<Object?> get props => [beacons];
}

class BeaconError extends BeaconScannerState {
  final String message;

  const BeaconError(this.message);

  @override
  List<Object?> get props => [message];
}