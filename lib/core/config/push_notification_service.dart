// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // Absolutely minimal work in background
//   print('Background message received: ${message.messageId}');
// }
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();
//
//   bool _isInitialized = false;
//   final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
//   final AndroidNotificationChannel _channel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.max,
//   );
//
//   Future<void> initialize() async {
//     if (_isInitialized) return;
//
//     try {
//       // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//       // Initialize notification channel first
//       await _createNotificationChannel();
//
//       // Then initialize local notifications with minimal settings
//       await _localNotifications.initialize(
//         const InitializationSettings(
//           android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//           iOS: DarwinInitializationSettings(
//             requestAlertPermission: false,
//             requestBadgePermission: false,
//             requestSoundPermission: false,
//           ),
//         ),
//       );
//
//       // Request permissions last
//       await _requestPermissions();
//
//       _isInitialized = true;
//     } catch (e) {
//       print('Notification initialization error: $e');
//     }
//   }
//
//   Future<void> _createNotificationChannel() async {
//     final platform = _localNotifications
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//
//     if (platform != null) {
//       await platform.createNotificationChannel(_channel);
//     }
//   }
//
//   Future<void> _requestPermissions() async {
//     try {
//       await Future.wait([
//         FirebaseMessaging.instance.requestPermission(
//           alert: true,
//           badge: true,
//           sound: true,
//           provisional: false,
//         ),
//         FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//           alert: true,
//           badge: true,
//           sound: true,
//         ),
//       ]);
//     } catch (e) {
//       print('Error requesting permissions: $e');
//     }
//   }
//
//   Future<void> showNotification(RemoteMessage message) async {
//     try {
//       RemoteNotification? notification = message.notification;
//       if (notification == null) return;
//
//       final notificationDetails = NotificationDetails(
//         android: AndroidNotificationDetails(
//           _channel.id,
//           _channel.name,
//           channelDescription: _channel.description,
//           importance: Importance.max,
//           priority: Priority.high,
//           icon: '@mipmap/ic_launcher',
//           enableVibration: true,
//           playSound: true,
//           enableLights: true,
//         ),
//         iOS: const DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//         ),
//       );
//
//       await _localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         notificationDetails,
//       );
//     } catch (e) {
//       print('Error showing notification: $e');
//     }
//   }
// }