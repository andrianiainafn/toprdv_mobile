import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/info/presentation/bloc/info_notification_bloc.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_audio_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_image_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_text_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_video_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/ably_service.dart';
import '../../../../injection_container.dart';
import '../bloc/info_bloc.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  Future<bool> _isFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isFirstVisit = prefs.getBool('isFirstVisit');
    if (isFirstVisit == null || isFirstVisit) {
      // If it's the first visit, mark as visited
      await prefs.setBool('isFirstVisit', false);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider<InfoBloc>(
      create: (context) => sl<InfoBloc>(),
),
    BlocProvider(
      create: (notificationContext) => sl<InfoNotificationBloc>(),
    ),
  ],
  child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: BlocConsumer<InfoBloc, InfoState>(
            listener: (context, state) {
              BlocConsumer<InfoNotificationBloc, InfoNotificationState>(
                listener: (notificationContext, notificationState) {

                },
                builder: (notificationContext, notificationState) {
                  return SizedBox.shrink(); // Add widgets if you want to display something
                },
              );
            },
            builder: (context, state) {
              showFirstVisitToast(context);
              return BlocBuilder<InfoBloc, InfoState>(
                builder: (context, state) {
                  if(state is InfoInitial){
                    BlocProvider.of<InfoBloc>(context).add(GetInfoEvent(0, 0));
                    return Text("");
                  }
                  if(state is InfoLoading){
                    return Text("Chargment des info...");
                  }
                  if(state is InfoLoaded){
                    print('info: ${state.info.content}');
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.info.content.map((infoItem) {
                        switch (infoItem.infoFormat) {
                          case "texte":
                            return InfoItemTextWidget(
                                brand: infoItem.brandName,
                                date: infoItem.createdAt,
                                content: infoItem.text!
                            );
                          case "audio":
                            return InfoItemAudioWidget(audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', brand: 'Mada Explore', date: DateTime.now(),);
                          case "video":
                            return InfoItemVideoWidget(brand: 'Mada Explore', videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', date: DateTime.now(),);
                          case "flyer":
                            return InfoItemImageWidget(brand: "Bocasay", date: DateTime.now(), imageUrl: "https://nyantsa.com/images/madaexplore_logo_light_background.png");
                          default:
                            return const SizedBox.shrink(); // Cas par défaut
                        }
                      }).toList()
                    );
                  }if(state is InfoErrorState){
                    return Text("Erreur de chargement des infos");
                  }else{
                    return Text("");
                  }
                },
              );
            },
          ),
        ),
      ),
);
  }
  Future<void> showFirstVisitToast(BuildContext context) async {
    print("called");
    bool isFirstVisit = await _isFirstVisit();
    if (isFirstVisit) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Bienvenue !"),
            content: Text("C'est votre première visite sur cette page. Profitez de la découverte !"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the toast
                },
                child: Text("D'accord"),
              ),
            ],
          );
        },
      );
    }
  }
}
// [
// InfoItemTextWidget(brand: "Mada Explore", date: DateTime.now(), content: "Lorem ipsum dolor sit amet Lorem ipsum dolor sit Lorem ipsum dolor sit Lore Lorem ipsum dolor sit Lorem ipsum dolor sit"),
// // InfoItemImageWidget(brand: "Bocasay", date: DateTime.now(), imageUrl: "https://nyantsa.com/images/madaexplore_logo_light_background.png"),
// // InfoItemAudioWidget(audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', brand: 'Mada Explore', date: DateTime.now(),),
// // InfoItemVideoWidget(brand: 'Mada Explore', videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', date: DateTime.now(),)
// ],
