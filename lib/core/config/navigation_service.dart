import 'package:auto_route/auto_route.dart';

import '../routes/app_router.gr.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  late StackRouter router;

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();



  void navigateToBeaconScanner() {
    router.replaceAll([const BeaconScannerRoute()]);
    // router.pushAndPopUntil(
    //   const NavigationRoute(children: [BeaconScannerRoute()]),
    //   predicate: (_) => false,
    // );
  }

  void setRouter(StackRouter router) {
    this.router = router;
    print("Router set: ${router.current.name}");
  }

  Future<void> navigateToNotification() async {
    try {
      print("Attempting to navigate to Notification");
      print("Current route: ${router.current.name}");
      router.replaceAll([const NotificationRoute()]);
      // await router.pushAndPopUntil(
      //   const NotificationRoute(),
      //   predicate: (_) => false,
      // );
      print("Navigation completed");
    } catch (e) {
      print("Navigation error: $e");
    }
  }

}