
import 'package:auto_route/auto_route.dart';
import 'package:my_template_project/core/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';
import 'auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route'  )
class AppRouter extends RootStackRouter{

  @override
  List<AutoRoute> get routes => [
      AutoRoute(
          initial: true,
          path: '/login',
          page: LoginRoute.page
      ),
      AutoRoute(
          path: '/signup',
          page: SignUpRoute.page
      ),
    AutoRoute(
        page: NavigationRoute.page,
        path:'/',
        children:[
          AutoRoute(page: NotificationRoute.page),
          AutoRoute(page: UserRegistrationRoute.page),
          AutoRoute(page: BeaconScannerRoute.page),
          AutoRoute(page: BrandRoute.page),
          AutoRoute(page: InfoRoute.page)
        ],
      guards:  [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(page: ProfileRoute.page),
  ];

}