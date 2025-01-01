import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final SharedPreferences sharedPreferences;

  const AuthGuard(this.sharedPreferences);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final bool authenticate = _isAuthenticated();
    if(authenticate){
      // if user is authenticated we continue
      resolver.next(true);
    }else{
      // we redirect the user to our login page
      router.push(const LoginRoute());
    }
  }
  bool _isAuthenticated(){
    if(sharedPreferences.getString('access_token') != null){
      return true;
    }else{
      return false;
    }
  }
}