import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/notification/presentation/bloc/change_rank_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:async';
import '../../../../core/config/notification_handler.dart';
import '../bloc/notification_confirmation_bloc.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late int appointmentId;
  @override
  void initState() {
    super.initState();
    _initializeOneSignal();
  }

  void _initializeOneSignal() async {
    OneSignal.initialize("98a5e1a6-25f4-4d98-8995-69db1278271e");
    OneSignal.LiveActivities.setupDefault();

    OneSignal.User.pushSubscription.addObserver((state) {
      print('optedIn: ${OneSignal.User.pushSubscription.optedIn}');
      print('id: ${OneSignal.User.pushSubscription.id}');
      print('token: ${OneSignal.User.pushSubscription.token}');
      print(state.current.jsonRepresentation());
    });

    await getToken();

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      print('NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');
      event.preventDefault();
      context.read<NotificationConfirmationBloc>().add(
        HandleNewNotification(event.notification),
      );
      event.notification.display();
    });

    OneSignal.Notifications.addClickListener((event) {
      NotificationHandler.handleNotificationClick(event.notification);
      print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      context.read<NotificationConfirmationBloc>().add(
        HandleNewNotification(event.notification),
      );
    });
  }
  void updateAppointmentId(int id){
    setState(() {
      appointmentId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: BlocConsumer<NotificationConfirmationBloc, NotificationConfirmationState>(
        listener: (context,state){
          if(state is NotificationConfirmationTimeOut){
            BlocProvider.of<ChangeRankBloc>(context).add(HandleChangeRank(appointmentId));
          }
        },
        builder: (context, state) {
          if (state is NotificationConfirmationLoaded) {
            updateAppointmentId(state.notification.additionalData?['appointment_id']);
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Ajout d'un padding pour plus d'espace
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligner les textes à gauche
                  children: [
                    // Première ligne : Titre et bouton
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Éléments aux extrémités
                      children: [
                        Expanded( // Pour que le titre prenne tout l'espace disponible
                          child: Text(
                            state.notification.title ?? 'Pas de titre',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, // Truncate si le titre est trop long
                          ),
                        ),
                        const SizedBox(width: 8), // Espacement entre le titre et le bouton
                        ElevatedButton(
                          onPressed: () {
                            context.read<NotificationConfirmationBloc>().add(
                              ConfirmNotification(),
                            );
                          },
                          child: const Text('Confirmer'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), // Espacement entre les lignes

                    // Deuxième ligne : Body et date/heure
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Éléments aux extrémités
                      children: [
                        Expanded( // Le body prend tout l'espace disponible
                          child: Text(
                            state.notification.body ?? 'Pas de contenu',
                            style: const TextStyle(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, // Truncate si le contenu est trop long
                          ),
                        ),
                        const SizedBox(width: 8), // Espacement entre le body et la date
                        Text(
                          DateTime.now().toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text('Aucune notification'));
        },
      ),
    );
  }
}

Future<void> getToken() async {
  print('optedIn: ${OneSignal.User.pushSubscription.optedIn}');
  print('id ${OneSignal.User.pushSubscription.id}');
  print('token: ${OneSignal.User.pushSubscription.token}');
}