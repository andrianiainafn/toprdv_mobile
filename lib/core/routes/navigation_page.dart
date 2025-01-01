import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_template_project/core/routes/app_router.gr.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              elevation: 4,
              backgroundColor: Colors.white,
              title: const Text('TopRdv'),
              centerTitle: false,
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    context.router.push(ProfileRoute()); // Navigate to profile route
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: const CircleAvatar(
                      // backgroundImage: AssetImage("assets/yor.jpg"),
                      backgroundColor: Colors.green,
                    ),
                  )
                ), // ),
              ],
            ),
          ];
        },
        body: AutoTabsRouter(
          routes: const [
              InfoRoute(),
              UserRegistrationRoute(),
              BrandRoute(),
              NotificationRoute()
          ],
          transitionBuilder: (context, child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 24,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'Acceuille',
                    icon: Icon(Icons.home_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Inscription',
                    icon: Icon(Icons.add_circle_outline),
                  ),
                  BottomNavigationBarItem(
                    label: 'Enseigne',
                    icon: Icon(Icons.branding_watermark_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Notifications',
                    icon: Icon(Icons.notifications),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
