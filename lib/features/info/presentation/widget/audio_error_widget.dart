import 'package:flutter/material.dart';

class AudioErrorWidget extends StatelessWidget {
  final String errorMessage;
  const AudioErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Error: $errorMessage',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
