import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_template_project/core/config/ably_service.dart';
import 'package:my_template_project/features/notification/presentation/bloc/change_rank_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'core/config/navigation_service.dart';
import 'core/config/notification_handler.dart';
import 'core/routes/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/ibeacon_scanner/presentation/bloc/beacon_scanner_bloc.dart';
import 'features/notification/presentation/bloc/notification_confirmation_bloc.dart';
import 'injection_container.dart' as di;

// Create a global key to access the navigator's state
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await initializeDateFormatting('fr_FR', null);
  await di.init();

  // Create a single instance of NotificationConfirmationBloc
  final notificationBloc = NotificationConfirmationBloc();
  final changeRankBLoc = ChangeRankBloc(di.sl());
  // Initialize OneSignal
  OneSignal.initialize("98a5e1a6-25f4-4d98-8995-69db1278271e");
  OneSignal.LiveActivities.setupDefault();

  // Set up notification handlers
  OneSignal.Notifications.requestPermission(true);

  OneSignal.Notifications.addClickListener((event) {
    print("clicked ");
    notificationBloc.add(HandleNewNotification(event.notification));
    NotificationHandler.handleNotificationClick(event.notification);
    print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
  });

  OneSignal.Notifications.addForegroundWillDisplayListener((event) {
    print("Received in foreground");
    notificationBloc.add(HandleNewNotification(event.notification));
    event.preventDefault();
    event.notification.display();
  });

  AblyService ablyService = AblyService();
  ablyService.initAbly();

  final beaconScannerBloc = BeaconScannerBloc(di.sl(),di.sl(),di.sl());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => beaconScannerBloc),
        BlocProvider.value(
          value: notificationBloc,  // Use the existing instance
        ),
        BlocProvider.value(
          value: changeRankBLoc,  // Use the existing instance
        ),
      ],
      child: MyApp(navigatorKey: navigatorKey),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final _appRouter = AppRouter();

  MyApp({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    NavigationService().setRouter(_appRouter);
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
  // beaconScannerBloc.add(StartScanningEvent());
