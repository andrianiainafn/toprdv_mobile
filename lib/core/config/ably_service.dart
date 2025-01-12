import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/info/presentation/bloc/info_notification_bloc.dart';

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
      name: "newAppointmentToWeb",
      data: appointmentData
    );
  }

  Future<void> newInfoAdded(BuildContext context) async {
    final isMounted = context.mounted;
    channel.subscribe(
      name: "newInfo",
    ).listen((ably.Message message){
      final bloc = BlocProvider.of<InfoNotificationBloc>(context);
      bloc.add(NewInfoAdded());
      print('Bloc state: ${bloc.state.count}');
      print(message);
    });
  }
}