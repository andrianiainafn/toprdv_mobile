import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late  List<OSNotification> _notifications = [];
  String _debugLabelString = "";

  @override
  void initState() {
    super.initState();
    _initializeOneSignal();
  }


  void _initializeOneSignal() async {
    // Configure OneSignal
    OneSignal.initialize("98a5e1a6-25f4-4d98-8995-69db1278271e");
    OneSignal.LiveActivities.setupDefault();

    OneSignal.User.pushSubscription.addObserver((state) {
      print('optedIn: ${OneSignal.User.pushSubscription.optedIn}');
      print('id ${OneSignal.User.pushSubscription.id}');
      print('token: ${OneSignal.User.pushSubscription.token}');
      print(state.current.jsonRepresentation());
    });
    await getToken();
    // Listen for received notifications
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      setState(() {
        _notifications = [..._notifications, event.notification];
      });
      print(
          'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');

      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();

      setState(() {
        _debugLabelString =
        "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.Notifications.addClickListener((event) {
      print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      this.setState(() {
        _debugLabelString =
        "Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      print(
          'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');

      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();

      this.setState(() {
        _debugLabelString =
        "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: _notifications.isEmpty
          ? const Center(child: Text('Aucune notification'))
          : ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Card(
            child: ListTile(
              title: Text(notification.title ?? 'Pas de titre'),
              subtitle: Text(notification.body ?? 'Pas de contenu'),
              trailing: Text( DateTime.now().toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<void> getToken()async{
  print('optedIn: ${OneSignal.User.pushSubscription.optedIn}');
  print('id ${OneSignal.User.pushSubscription.id}');
  print('token: ${OneSignal.User.pushSubscription.token}');
}
//os_v2_app_tcs6djrf6rgzrcmvnhnre6bhd2f4gx6kh2du4mumpsv7hzyoqvqhhxasl2cs7ybsgwkkuxjr4drhuioxxamgbkgysnye3cknd24kgxa