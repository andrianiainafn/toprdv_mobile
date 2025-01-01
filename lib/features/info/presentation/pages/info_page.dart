import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_audio_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_image_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/info_item_text_widget.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoItemTextWidget(brand: "Mada Explore", date: DateTime.now(), content: "Lorem ipsum dolor sit amet Lorem ipsum dolor sit Lorem ipsum dolor sit Lore Lorem ipsum dolor sit Lorem ipsum dolor sit"),
          InfoItemImageWidget(brand: "Bocasay", date: DateTime.now(), imageUrl: "https://nyantsa.com/images/madaexplore_logo_light_background.png"),
          InfoItemAudioWidget(audioUrl: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', brand: 'Mada Explore', date: DateTime.now(),),
        ],
      ),
    );
  }
}
