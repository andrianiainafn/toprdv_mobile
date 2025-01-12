import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:my_template_project/core/usescases/usecases.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/entity/transmitter.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/usecases/fetch_transmitter.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/usecases/send_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'beacon_scanner_event.dart';
part 'beacon_scanner_state.dart';

class BeaconScannerBloc extends Bloc<BeaconScannerEvent, BeaconScannerState> {
  StreamSubscription<RangingResult>? _rangingSubscription;
  bool _isScanning = false;
  final FetchTransmitter fetchTransmitter;
  final SendNotification sendNotification;
  final SharedPreferences sharedPreferences;

  BeaconScannerBloc(this.fetchTransmitter,this.sendNotification, this.sharedPreferences) : super(BeaconScannerInitial()) {
    on<StartScanningEvent>(_onStartScanning);
    on<StopScanningEvent>(_onStopScanning);
  }

  Future<void> _onStartScanning(
      StartScanningEvent event, Emitter<BeaconScannerState> emit) async {
    late List<Transmitter> transmitters;
    final response= await fetchTransmitter(NoParams());
    response.fold((failure){}, (transmitter){
      transmitters = transmitter;
    });
    if (_isScanning) return;

    try {

      await flutterBeacon.initializeScanning;

      final region = Region(
        identifier: Platform.isIOS ? 'Apple Airlocate' : 'com.beacon',
        proximityUUID: Platform.isIOS
            ? 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
            : null,
      );


      _isScanning = true;


      emit(BeaconScannerScanning(beacons: const []));

      _rangingSubscription = flutterBeacon.ranging([region]).listen(
            (RangingResult result) async {
              print(result);
              for (var beacon in result.beacons) {
                for(Transmitter transmitter in transmitters){
                  print("${transmitter.model} ${transmitter.minor} ${transmitter.major} and $beacon");
                  if(beacon.proximityUUID == transmitter.model && beacon.minor.toString() == transmitter.minor && beacon.major.toString() == transmitter.major){
                    print("tafiditra ato");
                    final canSendNotification = await canSendNotificationToday(
                        beacon.proximityUUID,
                        beacon.minor.toString(),
                        beacon.major.toString()
                    );

                    if (canSendNotification) {
                      await sendNotification(Params(transmitter.brand.id.toString()));
                      await recordNotification(
                          beacon.proximityUUID,
                          beacon.minor.toString(),
                          beacon.major.toString()
                      );
                    }
                  }
                }
              }
          if (!emit.isDone) {
            emit(BeaconScannerScanning(beacons: result.beacons));
          }
        },
        onError: (Object error) {

          if (!emit.isDone) {
            emit(BeaconError('Ranging error: $error'));
          }
        },
      );
    } catch (e) {

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

  String _getBeaconKey(String uuid, String minor, String major) {
    return 'beacon_${uuid}_${minor}_${major}_last_notification';
  }
  Future<bool> canSendNotificationToday(String uuid, String minor, String major) async {
    final beaconKey = _getBeaconKey(uuid, minor, major);
    final lastNotification = sharedPreferences.getString(beaconKey);

    if (lastNotification == null) {
      return true;
    }

    final lastDate = DateTime.parse(lastNotification);
    final today = DateTime.now();

    return !_isSameDay(lastDate, today);
  }
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  Future<void> recordNotification(String uuid, String minor, String major) async {
    final beaconKey = _getBeaconKey(uuid, minor, major);
    await sharedPreferences.setString(beaconKey, DateTime.now().toIso8601String());
  }
}



