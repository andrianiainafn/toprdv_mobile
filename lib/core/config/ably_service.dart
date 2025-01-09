import 'package:ably_flutter/ably_flutter.dart' as ably;

class AblyService {
  late ably.Realtime realtimeInstance;
  late ably.RealtimeChannel channel;

  // Initialize Ably
  Future<void> initAbly() async {
    final clientOptions = ably.ClientOptions(
      key: 'Z1Wd5w.KHJZGA:yS1X3m0X_2Iseh5wyUywTPrCxEgSMT5BOFezIWW5LJY',
    );

    realtimeInstance = ably.Realtime(options: clientOptions);
    channel = realtimeInstance.channels.get('realtime-updates');
  }

  // Publish message
  Future<void> publishAppointment(Map<String, dynamic> appointmentData) async {
    await channel.publish(
      name: "newAppointment",
      data: appointmentData
    );
  }
}