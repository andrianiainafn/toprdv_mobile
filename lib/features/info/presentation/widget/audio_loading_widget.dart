import 'package:flutter/material.dart';

class AudioLoadingWidget extends StatelessWidget {
  const AudioLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
