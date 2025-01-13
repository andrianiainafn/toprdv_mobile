import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/core/routes/app_router.gr.dart';

import '../../features/info/presentation/bloc/info_bloc.dart';
import '../../features/info/presentation/bloc/info_notification_bloc.dart';
import '../../injection_container.dart';
import '../config/ably_service.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InfoBloc>(
          create: (context) => sl<InfoBloc>(),
        ),
        BlocProvider<InfoNotificationBloc>(
          create: (context) => sl<InfoNotificationBloc>(),
        ),
      ],
      child: BlocConsumer<InfoNotificationBloc, InfoNotificationState>(
        listener: (context, state) {
          print('state actuel ${state.count}');
        },
        builder: (context, state) {
          final ablyService = AblyService();
          ablyService.initAbly();
          ablyService.newInfoAdded(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
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
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                context.router.push(
                                    ProfileRoute()); // Navigate to profile route
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: const CircleAvatar(
                                  // backgroundImage: AssetImage("assets/yor.jpg"),
                                  backgroundColor: Colors.green,
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: () {
                                context.router.push(
                                    ChooseRoute()); // Navigate to profile route
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: const CircleAvatar(
                                  // backgroundImage: AssetImage("assets/yor.jpg"),
                                  backgroundColor: Colors.grey,
                                ),
                              )
                          ),
                        ],
                      ) // ),
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
                transitionBuilder: (context, child, animation) =>
                    FadeTransition(
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
                      items:  [
                        BottomNavigationBarItem(
                          label: 'Acceuille',
                          icon: Stack(
                            children: [
                              const Icon(Icons.home_outlined),
                              if (state.count > 0)
                                Positioned(
                                  right: -2,
                                  top: -2,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 16,
                                      minHeight: 16,
                                    ),
                                    child: Text(
                                      '${state.count}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                            ],
                          ),
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
                      ]
                    )
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
