import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'navigation_service.dart';

class NotificationHandler {
  static void handleNotificationClick(OSNotification notification) async{
    final navigationService = NavigationService();

    final additionalData = notification.additionalData;
    print("ty ve no null $additionalData");
    if (additionalData == null) return;

    final pageType = additionalData['page_type'];
    final pageId = additionalData['page_id'];
    print("appointment: ${additionalData['appointment_id']}");
    print("makato ve $pageType");
    switch (pageType) {
      case 'beacon':
        navigationService.navigateToBeaconScanner();
        break;
      case 'server':
        print("Navigating to notification page");
        await navigationService.navigateToNotification();
        print("Navigation completed in handler");
        break;
      default:
        print("makato ve 232");
        navigationService.navigateToNotification();
        print('Type de page non reconnu: $pageType');
    }
  }
}
