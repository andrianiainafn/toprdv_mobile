import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

part 'beacon_scanner_event.dart';
part 'beacon_scanner_state.dart';

class BeaconScannerBloc extends Bloc<BeaconScannerEvent, BeaconScannerState> {
  StreamSubscription<RangingResult>? _rangingSubscription;
  bool _isScanning = false;

  BeaconScannerBloc() : super(BeaconScannerInitial()) {
    on<StartScanningEvent>(_onStartScanning);
    on<StopScanningEvent>(_onStopScanning);
  }

  Future<void> _onStartScanning(
      StartScanningEvent event, Emitter<BeaconScannerState> emit) async {
    if (_isScanning) return;

    try {
      // Initialiser le scanning
      await flutterBeacon.initializeScanning;

      final region = Region(
        identifier: Platform.isIOS ? 'Apple Airlocate' : 'com.beacon',
        proximityUUID: Platform.isIOS
            ? 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
            : null,
      );

      // Démarrer le scan
      _isScanning = true;

      // Émettre l'état Scanning démarré
      emit(BeaconScannerScanning(beacons: const []));

      // Attacher un écouteur au flux
      _rangingSubscription = flutterBeacon.ranging([region]).listen(
            (RangingResult result) {
              print(result);
          // Émettre les résultats du scan
          if (!emit.isDone) {
            emit(BeaconScannerScanning(beacons: result.beacons));
          }
        },
        onError: (Object error) {
          // Gérer les erreurs de scan
          if (!emit.isDone) {
            emit(BeaconError('Ranging error: $error'));
          }
        },
      );
    } catch (e) {
      // Gérer les exceptions lors de l'initialisation
      if (!emit.isDone) {
        emit(BeaconError('Failed to initialize beacon scanning: $e'));
      }
    }
  }

  Future<void> _onStopScanning(
      StopScanningEvent event, Emitter<BeaconScannerState> emit) async {
    await _rangingSubscription?.cancel();
    _rangingSubscription = null;
    _isScanning = false;

    if (!emit.isDone) {
      emit(BeaconScannerInitial());
    }
  }

  @override
  Future<void> close() async {
    await _rangingSubscription?.cancel();
    _rangingSubscription = null;
    return super.close();
  }
}
