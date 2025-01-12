import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BackgroundBeaconService {
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    // Configure notifications
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'beacon_scanner',
      'Beacon Scanner Service',
      description: 'Background service for scanning beacons',
      importance: Importance.high,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: 'beacon_scanner',
        initialNotificationTitle: 'Beacon Scanner Service',
        initialNotificationContent: 'Running in background',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );
  }

  @pragma('vm:entry-point')
  static Future<bool> onIosBackground(ServiceInstance service) async {
    return true;
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();

    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    // Initialize beacon scanning
    try {
      await flutterBeacon.initializeScanning;

      final region = Region(
        identifier: Platform.isIOS ? 'Apple Airlocate' : 'com.beacon',
        proximityUUID: Platform.isIOS
            ? 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'
            : null,
      );

      // Start ranging beacons
      flutterBeacon.ranging([region]).listen(
            (RangingResult result) {
          // Process beacon results
          service.invoke(
            'beacons',
            {
              'beacons': result.beacons
                  .map((b) => {
                'uuid': b.proximityUUID,
                'major': b.major,
                'minor': b.minor,
                'rssi': b.rssi,
                'accuracy': b.accuracy,
              })
                  .toList(),
            },
          );
        },
        onError: (error) {
          service.invoke('error', {'message': error.toString()});
        },
      );
    } catch (e) {
      service.invoke('error', {'message': e.toString()});
    }
  }
}