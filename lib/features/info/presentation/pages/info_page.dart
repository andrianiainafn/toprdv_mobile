import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_audio_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_image_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_text_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_video_widget.dart';

import '../../../../injection_container.dart';
import '../bloc/info_bloc.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InfoBloc>(
      create: (context) => sl<InfoBloc>(),
      child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: BlocConsumer<InfoBloc, InfoState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
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
                      children: [
                        InfoItemTextWidget(brand: "Mada Explore", date: DateTime.now(), content: "Lorem ipsum dolor sit amet Lorem ipsum dolor sit Lorem ipsum dolor sit Lore Lorem ipsum dolor sit Lorem ipsum dolor sit"),
                        // InfoItemImageWidget(brand: "Bocasay", date: DateTime.now(), imageUrl: "https://nyantsa.com/images/madaexplore_logo_light_background.png"),
                        // InfoItemAudioWidget(audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', brand: 'Mada Explore', date: DateTime.now(),),
                        // InfoItemVideoWidget(brand: 'Mada Explore', videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', date: DateTime.now(),)
                      ],
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
}
