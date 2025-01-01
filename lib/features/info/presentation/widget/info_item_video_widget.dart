import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class InfoItemVideoWidget extends StatefulWidget {
  const InfoItemVideoWidget({super.key});

  @override
  State<InfoItemVideoWidget> createState() => _InfoItemVideoWidgetState();
}

class _InfoItemVideoWidgetState extends State<InfoItemVideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with your video URL using networkUrl
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    )..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              VideoPlayer(_controller),
              // Play/Pause button overlay
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                    _isPlaying ? _controller.play() : _controller.pause();
                  });
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black45,
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
        // Video progress indicator
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          padding: const EdgeInsets.all(16),
        ),
        // Additional controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10),
              onPressed: () {
                final position = _controller.value.position;
                final newPosition = position - const Duration(seconds: 10);
                _controller.seekTo(newPosition);
              },
            ),
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                  _isPlaying ? _controller.play() : _controller.pause();
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_10),
              onPressed: () {
                final position = _controller.value.position;
                final newPosition = position + const Duration(seconds: 10);
                _controller.seekTo(newPosition);
              },
            ),
          ],
        ),
      ],
    );
  }
}